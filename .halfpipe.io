team: engineering-enablement
pipeline: juice-shop-waf-test

feature_toggles:
- update-pipeline

triggers:
- type: git
  watched_paths:
  - .

tasks:
- type: run
  name: build
  script: ./build.sh
  docker:
    image: node:15.14.0
  save_artifacts:
  - .

- type: deploy-cf
  name: deploy-juice
  api: ((cloudfoundry.api-snpaas))
  space: dev
  manifest: manifest.yml
  deploy_artifact: .

- type: deploy-cf
  name: deploy-juice-waf
  api: ((cloudfoundry.api-snpaas))
  space: dev
  manifest: manifest-waf.yml
  deploy_artifact: .
  vars:
    SIGSCI_ACCESSKEYID: ((ee-signalsciences-test.sigsci-access-key))
    SIGSCI_SECRETACCESSKEY: ((ee-signalsciences-test.sigsci-secret-access-key))
