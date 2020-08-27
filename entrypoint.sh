#!/bin/sh -l

echo "Start"

CLONE_DIR=$(mktemp -d)

# Setup git
git config --global user.email "$USER_EMAIL"
git config --global user.name "$DEST_GITHUB_USERNAME"
git clone --single-branch -b $SYSTEM_NAME "https://$API_TOKEN_GITHUB@github.com/$DEST_GITHUB_USERNAME/$DEST_GITHUB_REPO.git" "$CLONE_DIR"
git pull origin $DEST_BRANCH

echo 'Copying from '"$SRC_DIR"'/*' "to $CLONE_DIR/$INITIATIVE_NAME/$SYSTEM_NAME"
mkdir -p "$CLONE_DIR/$INITIATIVE_NAME/$SYSTEM_NAME"
cp -R "$SRC_DIR"/* "$CLONE_DIR/$INITIATIVE_NAME/$SYSTEM_NAME" || (rm -Rf "$CLONE_DIR" && exit 1)
cp readme.adoc "$CLONE_DIR/$INITIATIVE_NAME/$SYSTEM_NAME.adoc" || (rm -Rf "$CLONE_DIR" && exit 1)

echo "Push to $DEST_GITHUB_USERNAME/$DEST_GITHUB_REPO in branch $INITIATIVE_NAME"
cd "$CLONE_DIR"
git add .
git commit --message "Update from https://github.com/$GITHUB_REPOSITORY/commit/$GITHUB_SHA"
git push origin "$SYSTEM_NAME"  || (echo "push to $DEST_GITHUB_USERNAME/$DEST_GITHUB_REPO failed" && exit 1)

echo "Create Pull Request"
curl --location -s --request POST "https://api.github.com/repos/$DEST_GITHUB_USERNAME/$DEST_GITHUB_REPO/pulls?access_token=$API_TOKEN_GITHUB" \
--header 'Accept: application/vnd.github.v3+json' \
--header 'Content-Type: application/json' \
--data-raw "{
    \"title\": \"$SYSTEM_NAME at $(date)\",
    \"head\": \"$SYSTEM_NAME\",
    \"base\": \"$DEST_BRANCH\"
}" || (echo "Creating pull request failed" && exit 1)

echo "Done, thank you"