#!/usr/bin/env bash

DIR_NAME=jenkins_build_number

## Fetch flankt.test
gsutil -q stat gs://coverage_reports/flank.tests/

return_value=$?

if [ ${return_value} != 0 ]; then
    echo "flank.tests found"
    gsutil cp gs://coverage_reports/flank.tests .
else
    echo "flank.tests not found"
fi

## Update config.properties with the jenkins build number
sed -i.bak '/gcloud-bucket/d' config.properties
echo "gcloud-bucket: coverage_reports/${DIR_NAME}" >> config.properties
rm config.properties.bak

## Remove old coverage reports
rm -r ./app/coverage_reports/

gsutil cp config.properties  gs://coverage_reports/${DIR_NAME}/

java -jar Flank-2.0.1.jar -a app/build/outputs/apk/debug/app-debug.apk -t app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk

REPORT_COUNT=$(gsutil ls gs://coverage_reports/${DIR_NAME}/ | wc -l)

for number in `seq 0 ${REPORT_COUNT}`
do
    test_report_directory_path_all_devices=$(gsutil ls gs://coverage_reports/jenkins_build_number/${number}/* | grep -e "/$")
    test_report_directory_path_single_device=(${test_report_directory_path_all_devices})
    download_path_for_coverage_report=${test_report_directory_path_single_device[0]}coverage.ec
    echo "Downloading coverage reports from from: ${download_path_for_coverage_report}"
    gsutil cp ${download_path_for_coverage_report} ./app/coverage_reports/${number}.exec
done

gsutil mv gs://coverage_reports/${DIR_NAME}/flank.tests gs://coverage_reports/

gsutil -m rm -r gs://coverage_reports/${DIR_NAME}/

rm flank.tests