# Changelog

Each entry is one version of this template. Breaking changes are listed first.

## 2026.10.1 README update (2026-11-16)

- README: add the Deploy on Railway button for the published template `waha-1`. No change to the deployed service.

## 2026.10.1 (2026-11-16)

- First release: WAHA Core 2026.10.1, GOWS engine (`devlikeapro/waha:gows-2026.10.1`, pinned by digest `sha256:1f7faeb0227ad5edb5711f7058bfce807ea65e5f92234af0778e4db140f6eb46`).
- Sessions and media on one Railway volume at `/app/data`; sessions restart on their own after a redeploy.
- API key, dashboard password and Swagger password generated per deploy.
