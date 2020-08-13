#!/bin/sh

mkdir output
mkdir output/docs
mkdir output/docs/Silo-V2
mkdir output/docs/images



# pandoc -s architecture.asciidoc -o output/architecture.asciidoc


# cp docs/architecture.adoc output/docs/
# cp docs/database-documentation.adoc output/docs/
# cp docs/developer-onboarding.adoc output/docs/
# cp docs/development.adoc output/docs/
# cp docs/environment.adoc output/docs/
# cp docs/feature-flow.adoc output/docs/
# cp docs/naming-convention.adoc output/docs/docs/
# cp docs/release-deployment.adoc output/docs/
# cp docs/technology.adoc output/docs/
# cp docs/url.adoc output/docs/
# cp README.adoc output/

cp docs/Silo-V2.adoc output/docs/

cp docs/Silo-V2/arsitektur-silov2.adoc output/docs/Silo-V2
cp docs/Silo-V2/convention-silov2.adoc output/docs/Silo-V2
cp docs/Silo-V2/database-documentation-silov2.adoc output/docs/Silo-V2
cp docs/Silo-V2/developer-onboarding-silov2.adoc output/docs/Silo-V2
cp docs/Silo-V2/development-silov2.adoc output/docs/Silo-V2
cp docs/Silo-V2/environment-silov2.adoc output/docs/Silo-V2
cp docs/Silo-V2/problem-and-troubleshoot-silov2.adoc output/docs/Silo-V2
cp docs/Silo-V2/release-deployment-silov2.adoc output/docs/Silo-V2
cp docs/Silo-V2/system-url-silov2.adoc output/docs/Silo-V2
cp docs/Silo-V2/technology-silov2.adoc output/docs/Silo-V2

cp docs/images/silov2-erd.png output/docs/images
cp docs/images/silov2-gitflow.png output/docs/images
cp docs/images/silov2-hla.png output/docs/images









