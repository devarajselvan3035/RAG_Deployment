FROM python:3.9

# Copy the uv binary from the official image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/ 

# Set a working dir
WORKDIR /app 

COPY pyproject.toml uv.lock ./

RUN uv sync --frozen --no-install-project

COPY main.py .

RUN uv sync --frozen

ENV PATH="/app/.venv/bin:$PATH"

CMD [ "python", "main.py" ]

