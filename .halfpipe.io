team: engineering-enablement
pipeline: juice-shop-waf-test
slack_channel: '#cdn-waf-evaluation'

feature_toggles:
- update-pipeline

triggers:
- type: git
  watched_paths:
  - .

tasks:
- type: run
  name: test
  script: ./test.sh
  docker:
    image: node:16-alpine3.11
  save_artifacts:
  - .

- type: deploy-cf
  name: deploy-cf
  api: ((cloudfoundry.api-snpaas))
  space: dev
  manifest: manifest.yml
  deploy_artifact: .
