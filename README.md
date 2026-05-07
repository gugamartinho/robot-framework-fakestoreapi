# Robot Framework API Automation — FakeStoreAPI

This project is a Robot Framework API automation suite for the FakeStoreAPI.
It includes:

- Robot Framework test suites
- RequestsLibrary HTTP automation
- Python variable files for environment configuration
- Environment-specific settings support
- Reusable keyword libraries
- Session management and authentication flows
- GitHub Actions CI workflow
- HTML reports and logs

## Installation

Create a Python virtual environment:

```bash
python -m venv venv
```

### Activate the environment

Windows:

```bash
venv\Scripts\activate
```

Linux/Mac:

```bash
source venv/bin/activate
```

## Install dependencies

```bash
pip install -r requirements.txt
```

## Configuration

Copy the example environment file and set your values:

```bash
copy .env.example .env
```

Edit `.env` and configure:

```env
BASE_URL=https://fakestoreapi.com
API_USERNAME=mor_2314
API_PASSWORD=83r5^_
```

Do not commit `.env` to version control.

## Running tests

Run all Robot tests:

```bash
robot tests/
```

Run only smoke tests:

```bash
robot -i smoke tests/
```

Run tests for a specific environment variable:

```bash
robot --variable ENV:qa tests/
```

Validate the test syntax without executing API calls:

```bash
robot --dryrun tests/
```

## Project structure

- `tests/` — Robot test suites grouped by feature
- `resources/keywords/common/` — shared reusable keywords
- `resources/keywords/auth/` — authentication-specific keywords
- `resources/keywords/products/` — product-specific validation keywords
- `resources/config/` — environment and variable configuration
- `resources/payloads/` — reusable JSON payload templates
- `.github/workflows/` — GitHub Actions CI workflow

## Recommended GitHub workflow

The current workflow is defined in `.github/workflows/robot-api-tests.yml`.
It checks out code, installs dependencies, runs the Robot test suite, and uploads the generated artifacts:

- `report.html`
- `log.html`
- `output.xml`

## Notes

- Keep `venv/` and generated report files out of version control.
- Use `.env.example` as a template for your own `.env` file.
- Add new keyword libraries under the appropriate domain folder when extending the suite.
