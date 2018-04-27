#!/usr/bin/env bash

REPORT_COUNT=5

sed -i  '' -e "s/coverage_reports\/.*/coverage_reports\/${REPORT_COUNT}/g" config.properties