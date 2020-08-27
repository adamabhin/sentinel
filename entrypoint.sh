#!/bin/sh -l

echo "Start"
SRC_DIR="$1"
DEST_GITHUB_USERNAME="$2"
DEST_GITHUB_REPO="$3"
USER_EMAIL="$4"
DEST_BRANCH="$5"
INITIATIVE_NAME="$6"
SYSTEM_NAME="$7"

CLONE_DIR=$(mktemp -d)

# Setup git
git config --global user.email "$USER_EMAIL"
git config --global user.name "$DEST_GITHUB_USERNAME"
git clone --single-branch -b $DEST_BRANCH "https://$API_TOKEN_GITHUB@github.com/$DEST_GITHUB_USERNAME/$DEST_GITHUB_REPO.git" "$CLONE_DIR"

echo 'Copying from '"$SRC_DIR"'/*' "to $CLONE_DIR/$INITIATIVE_NAME/$SYSTEM_NAME"
mkdir -p "$CLONE_DIR/$INITIATIVE_NAME/$SYSTEM_NAME"
cp -R "$SRC_DIR"/* "$CLONE_DIR/$INITIATIVE_NAME/$SYSTEM_NAME" || (rm -Rf "$CLONE_DIR" && exit 1)
cp readme.adoc "$CLONE_DIR/$INITIATIVE_NAME/$SYSTEM_NAME.adoc" || (rm -Rf "$CLONE_DIR" && exit 1)

cd "$CLONE_DIR"
git add .
git commit --message "Update from https://github.com/$GITHUB_REPOSITORY/commit/$GITHUB_SHA"
git push origin $DEST_BRANCH
POST /https://github.com/rochmadnurdin/kb/{rochmadnurdin}/{https://github.com/rochmadnurdin/kb}/pulls
curl --location --request POST 'https://api.github.com/repos/rochmadnurdin/knowledgebase/pulls?access_token=$API_TOKEN_GITHUB' \
--header 'Accept: application/vnd.github.v3+json' \
--header 'Content-Type: application/json' \
--data-raw '{
    "title": "Message Title",
    "head": "$DEST_GITHUB_REPO",
    "base": "BPA"
}'
