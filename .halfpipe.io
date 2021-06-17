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
- type: deploy-cf
  name: deploy-cf
  api: ((cloudfoundry.api-snpaas))
  space: dev
  manifest: manifest.yml
