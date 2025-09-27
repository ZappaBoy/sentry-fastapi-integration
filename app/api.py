import os

import sentry_sdk
from fastapi import APIRouter, FastAPI

from services.core import Core
from utils.logger import Logger

sentry_sdk.init(
    # e.g. "http://your_dsn@your_sentry_server/your_project_id"
    dsn=os.environ['SENTRY_DSN'],
    send_default_pii=True,
    # traces_sample_rate=0.5,
    # # enable or disable profiling or logs if desired
    # integrations=[
    #     FastApiIntegration(
    #         transaction_style="endpoint",
    #         failed_request_status_codes={403, *range(500, 600)},
    #         http_methods_to_capture=("GET", "POST", "PUT"),
    #     ),
    #     StarletteIntegration(
    #         transaction_style="endpoint",
    #         failed_request_status_codes={403, *range(500, 600)},
    #         http_methods_to_capture=("GET", "POST", "PUT"),
    #     ),
    # ],
)

app = FastAPI()


@app.get("/ping")
async def ping():
    return {"status": "ok"}

router = APIRouter()
core = Core()
logger = Logger('Api')


@router.get("/healthcheck")
def healthcheck():
    return {"Status": "Alive"}


@router.get("/sentry-debug")
async def trigger_error():
    division_by_zero = 1 / 0
