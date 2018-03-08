#!/bin/bash

gcloud firebase test android run   --type instrumentation   --app app/build/outputs/apk/debug/app-debug.apk   --test app/build/outputs/apk/androidTest/debug/app-debug-androidTest.apk --device-ids SamsungS7  --os-version-ids 23   --locales en   --orientations portrait   --environment-variables coverage=true,coverageFile="/sdcard/coverage.ec" --directories-to-pull=/sdcard --results-bucket testingplaygroundresults

gsutil cp gs://testingplaygroundresults/*/*/artifacts/coverage.ec .

gsutil rm -r gs://testingplaygroundresults/*