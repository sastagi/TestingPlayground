#!/usr/bin/env bash


test_report_directory_path_all_devices=$(gsutil ls gs://coverage_reports/jenkins_build_number/0/* | grep -e "/$")
test_report_directory_path_single_device=(${testreport_directory_path_all_devices})
download_path_for_coverage_report=${testreport_directory_path_single_device[0]}coverage.ec
echo "Downloading coverage reports from from: ${download_path_for_coverage_report}"
gsutil cp ${path} ./app/coverage_reports/0.ec
