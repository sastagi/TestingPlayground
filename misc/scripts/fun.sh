#!/usr/bin/env bash

DIR_NAME=jenkins_build_number

#sed '/gcloud-bucket/d' config.properties
#echo "gcloud-bucket: coverage_reports/${DIR_NAME}" >> config.properties
#sed -i.bak '/gcloud-bucket/d' config.properties
#REPORT_COUNT=$(gsutil ls gs://coverage_reports/codecoverage/ | wc -l)

#echo "The number of files is"
#echo ${REPORT_COUNT}


#for number in `seq 0 ${REPORT_COUNT}`
#do
    #gsutil mv gs://coverage_reports/codecoverage/${number}/Nexus6P-25-en-portrait/artifacts/coverage.ec gs://coverage_reports/codecoverage/${number}/Nexus6P-25-en-portrait/artifacts/${number}.ec
    #gsutil cp gs://coverage_reports/codecoverage/${number}/Nexus6P-25-en-portrait/artifacts/${number}.ec .
#done

gsutil rm -r gs://coverage_reports/jenkins_build_number/
