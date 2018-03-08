#!/usr/bin/env bash

set -e

DIR_NAME=jenkins_build_number

#gsutil cp gs://coverage_reports/flank.tests .

sed -i.bak '/gcloud-bucket/d' config.properties
echo "gcloud-bucket: coverage_reports/${DIR_NAME}" >> config.properties

gsutil cp config.properties  gs://coverage_reports/${DIR_NAME}/

java -jar Flank-2.0.1.jar -a app/build/outputs/apk/debug/app-debug.apk -t app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk

REPORT_COUNT=$(gsutil ls gs://coverage_reports/${DIR_NAME}/ | wc -l)

for number in `seq 0 ${REPORT_COUNT}`
do
    gsutil mv gs://coverage_reports/${DIR_NAME}/${number}/Nexus6P-25-en-portrait/artifacts/coverage.ec gs://coverage_reports/${DIR_NAME}/${number}/Nexus6P-25-en-portrait/artifacts/${number}.ec
    gsutil cp gs://coverage_reports/${DIR_NAME}/${number}/Nexus6P-25-en-portrait/artifacts/${number}.ec ./results
done

gsutil mv gs://coverage_reports/${DIR_NAME}/flank.tests gs://coverage_reports/

gsutil -m rm -r gs://coverage_reports/${DIR_NAME}/

rm flank.tests