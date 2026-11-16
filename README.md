[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/waha-1?utm_medium=integration&utm_source=button&utm_campaign=waha)

# WAHA on Railway

One-click Railway template for [WAHA](https://github.com/devlikeapro/waha) (WhatsApp HTTP API), the self-hosted REST API for WhatsApp. This repo holds the Dockerfile Railway builds; it pins the official image and adds Railway defaults.

## What it deploys

- **WAHA Core 2026.10.1** with the **GOWS** engine (Go, no browser): `devlikeapro/waha:gows-2026.10.1@sha256:1f7faeb0227ad5edb5711f7058bfce807ea65e5f92234af0778e4db140f6eb46`.
- One service with a public Railway domain and one volume at `/app/data` (`sessions/` for WhatsApp logins, `media/` for downloaded files). Logins survive redeploys and restart on their own.
- Health check: `GET /ping` (no auth).

## After deploy

1. Open `https://YOUR-DOMAIN/dashboard` and sign in with `WAHA_DASHBOARD_USERNAME` (`admin`) and `WAHA_DASHBOARD_PASSWORD` (see the service's Variables tab).
2. Add the server in the dashboard with the URL `https://YOUR-DOMAIN` and the `WAHA_API_KEY` value.
3. Start the `default` session and scan the QR code with WhatsApp (Linked devices). WAHA Core runs one session, named `default`.
4. API docs: `https://YOUR-DOMAIN/` (Swagger, same login as the dashboard). Every API call needs the header `X-Api-Key: <WAHA_API_KEY>`.

## Variables

| Variable | Default | Notes |
|---|---|---|
| `PORT` | `3000` | Port WAHA listens on |
| `WAHA_API_KEY` | generated secret | Required in the `X-Api-Key` header of every API call |
| `WAHA_DASHBOARD_USERNAME` | `admin` | Dashboard login |
| `WAHA_DASHBOARD_PASSWORD` | generated secret | Dashboard login |
| `WHATSAPP_SWAGGER_USERNAME` | same as dashboard | Swagger UI login |
| `WHATSAPP_SWAGGER_PASSWORD` | same as dashboard | Swagger UI login |
| `WAHA_BASE_URL` | `https://${{RAILWAY_PUBLIC_DOMAIN}}` | Used in media file links sent to webhooks |

Optional settings (webhooks with `WHATSAPP_HOOK_URL` and `WHATSAPP_HOOK_EVENTS`, `WHATSAPP_FILES_LIFETIME`, proxy, S3 or Postgres storage, the WEBJS or NOWEB engine) are documented in [WAHA's configuration docs](https://waha.devlike.pro/docs/how-to/config/). Add them as service variables; the defaults in the `Dockerfile` can be overridden the same way.

## Updates

Each new WAHA release is a pull request here that bumps the pinned image and adds a `CHANGELOG.md` entry. When it is merged to `main`, Railway shows "update available" on every project deployed from this template, and you choose when to apply it. Read the changelog first.

## License

WAHA is Apache-2.0, by devlike.pro. WhatsApp is a trademark of Meta; WAHA is not affiliated with it, and unofficial clients can get numbers banned, so follow WhatsApp's terms.
