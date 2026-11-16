# WAHA (WhatsApp HTTP API) Core, GOWS engine, for Railway.
# Upstream: https://github.com/devlikeapro/waha (Apache-2.0)
FROM devlikeapro/waha:gows-2026.10.1@sha256:1f7faeb0227ad5edb5711f7058bfce807ea65e5f92234af0778e4db140f6eb46

# Defaults for Railway. Every one can be overridden with a service variable.
# All state lives on the Railway volume mounted at /app/data.
ENV WHATSAPP_DEFAULT_ENGINE=GOWS \
    WAHA_LOCAL_STORE_BASE_DIR=/app/data/sessions \
    WAHA_MEDIA_STORAGE=LOCAL \
    WHATSAPP_FILES_FOLDER=/app/data/media \
    WHATSAPP_RESTART_ALL_SESSIONS=True \
    WAHA_DASHBOARD_ENABLED=True \
    WHATSAPP_SWAGGER_ENABLED=True \
    WAHA_PRINT_QR=False \
    WAHA_LOG_FORMAT=JSON \
    WAHA_LOG_LEVEL=info

# Railway sets PORT; WAHA listens on it (falls back to 3000).
EXPOSE 3000

# Upstream entrypoint: tini + /entrypoint.sh (hashes WAHA_API_KEY, starts node).
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/entrypoint.sh"]
