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


### Running with Docker

1. **Build the Docker image**  
To create a reproducible environment for running Robot Framework API tests, build the Docker image using the provided Dockerfile:

```bash
docker build -t robot-api-tests .
```

This installs Python, Robot Framework, and all dependencies listed in requirements.txt.

2. Run tests inside Docker
After building the image, you can execute the full test suite
```bash
docker run --rm robot-api-tests
```
This runs:
- all .robot files inside the tests/ directory
- sequentially (no parallel execution)
- generating output inside pabot_results/

3. Accessing the Robot Framework reports
Robot Framework generates:

- log.html
- report.html
- output.xml

To make these files available outside the container, mount the results directory:
```bash
docker run --rm -u root -v ${PWD}/results:/app/results robot-api-tests
```
After the container finishes, you can open the reports locally:
- results/log.html
- results/report.html