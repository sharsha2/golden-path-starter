# Security Policy

## Supported versions

`golden-path-starter` is a reference template rather than a released product. Only the
tip of the `main` branch is maintained; fixes are not backported to older commits.

| Version | Supported |
| --- | --- |
| `main` (latest commit) | Yes |
| Any earlier commit or fork | No |

## Reporting a vulnerability

**Please do not open a public issue for a security problem.**

Report it privately through GitHub's private vulnerability reporting:

1. Go to the [Security tab](https://github.com/sharsha2/golden-path-starter/security)
   of this repository.
2. Click **Report a vulnerability**.
3. Describe the issue, the affected file or workflow, and the impact you expect.

A working proof of concept, the commit SHA you tested against, and any suggested
patch all help, but none of them are required to file a report.

## What to expect

| Stage | Target |
| --- | --- |
| Acknowledgement of your report | 3 business days |
| Initial assessment and severity | 10 business days |
| Fix merged to `main`, or a documented decision not to fix | 90 days |

We will keep you updated through the private advisory thread and will credit you in
the published advisory unless you ask us not to.

## Scope

In scope:

- The container build (`Dockerfile`), the Kubernetes manifests under `k8s/`, and the
  application code under `src/`.
- The GitHub Actions workflows under `.github/workflows/` — in particular anything
  that could allow code or secret exfiltration from a pipeline run.

Out of scope:

- `Dockerfile.bad`. It is deliberately insecure and kept only as a teaching contrast
  to `Dockerfile`; findings against it are expected, not vulnerabilities.
- Findings in upstream dependencies with no exploitable path in this repository.
  Report those to the upstream project.
- Results from automated scanners submitted without any analysis of impact.

## Disclosure

We follow coordinated disclosure. Please give us the 90-day window above before
publishing details. If a vulnerability is already being exploited in the wild, tell
us in the report and we will move faster.
