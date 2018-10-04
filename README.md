# Clair Sample

> A sample clair setup, used for scanning docker images for known vulnerabilities.

### Instructions

```bash
# Build scanner image
docker-compose build

# Run clair and postgres
docker-compose up -d clair

# Wait for clair to finish pulling vulnerabilities, alternatively you could pre-build postgres or use the image arminc/clair-db
bash wait_update.sh

# Test
docker-compose run --rm --service-ports scanner postgres:10.4-alpine
```

### Config
You can update the config in clair_config to only pull certain vulnerabilities.

```yaml
worker:
  namespace_detectors:
    # - os-release
    # - lsb-release
    # - apt-sources
    - alpine-release
    # - redhat-release

  feature_listers:
    - apk
    # - dpkg
    # - rpm

updater:
  # Frequency the database will be updated with vulnerabilities from the default data sources
  # The value 0 disables the updater entirely.
  interval: 2h
  enabledupdaters:
    # - debian
    # - ubuntu
    # - rhel
    # - oracle
    - alpine
```

### Todo
1. Config is being ignored for some reason.
