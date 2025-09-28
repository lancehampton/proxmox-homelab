---
description: 'OpenTofu Conventions and Guidelines'
applyTo: '**/*.tf'
---

# OpenTofu Conventions

## General Instructions

- Use OpenTofu to provision and manage infrastructure.
- Use version control for your OpenTofu configurations.

## Security

- Always use the latest stable version of OpenTofu and its providers.
  - Regularly update your OpenTofu configurations to incorporate security patches and improvements.
- Store sensitive information in a secure manner, such as using AWS Secrets Manager or SSM Parameter Store.
  - Regularly rotate credentials and secrets.
  - Automate the rotation of secrets, where possible.
- Use AWS environment variables to reference values stored in AWS Secrets Manager or SSM Parameter Store.
  - This keeps sensitive values out of your OpenTofu state files.
- Never commit sensitive information such as AWS credentials, API keys, passwords, certificates, or OpenTofu state to version control.
  - Use `.gitignore` to exclude files containing sensitive information from version control.
- Always mark sensitive variables as `sensitive = true` in your OpenTofu configurations.
  - This prevents sensitive values from being displayed in the OpenTofu plan or apply output.
- Use IAM roles and policies to control access to resources.
  - Follow the principle of least privilege when assigning permissions.
- Use security groups and network ACLs to control network access to resources.
- Deploy resources in private subnets whenever possible.
  - Use public subnets only for resources that require direct internet access, such as load balancers or NAT gateways.
- Use encryption for sensitive data at rest and in transit.
  - Enable encryption for EBS volumes, S3 buckets, and RDS instances.
  - Use TLS for communication between services.
- Regularly review and audit your OpenTofu configurations for security vulnerabilities.

## Modularity

- Use separate projects for each major component of the infrastructure; this:
  - Reduces complexity
  - Makes it easier to manage and maintain configurations
  - Speeds up `plan` and `apply` operations
  - Allows for independent development and deployment of components
  - Reduces the risk of accidental changes to unrelated resources
- Use modules to avoid duplication of configurations.
  - Use modules to encapsulate related resources and configurations.
  - Use modules to simplify complex configurations and improve readability.
  - Avoid circular dependencies between modules.
  - Avoid unnecessary layers of abstraction; use modules only when they add value.
    - Avoid using modules for single resources; only use them for groups of related resources.
    - Avoid excessive nesting of modules; keep the module hierarchy shallow.
- Use `output` blocks to expose important information about your infrastructure.
  - Use outputs to provide information that is useful for other modules or for users of the configuration.
  - Avoid exposing sensitive information in outputs; mark outputs as `sensitive = true` if they contain sensitive data.

## Maintainability

- Prioritize readability, clarity, and maintainability.
- Use comments to explain complex configurations and why certain design decisions were made.
- Write concise, efficient, and idiomatic configs that are easy to understand.
- Avoid using hard-coded values; use variables for configuration instead.
  - Set default values for variables, where appropriate.
- Use data sources to retrieve information about existing resources instead of requiring manual configuration.
# OpenTofu / Proxmox guidance (concise)

- Use OpenTofu for infra; keep configs in VCS and keep modules small and readable.
- Run `tofu fmt` and `tofu validate` before commits.

- Security: never commit secrets or state; mark sensitive variables `sensitive = true`.
- Use SSH keys, least-privilege API tokens, private subnets, and TLS where practical.

- Modularity: use modules for related resources, sensible defaults for homelab use, outputs for important values, and `locals` for repeated values.

- Style: 2-space indent; group logical files (providers, vars, network, workloads); place `depends_on`/`count`/`for_each` near the top of a resource and `lifecycle` at the end.

- Defer to official docs (source-of-truth):
  - Proxmox VE Admin Guide: https://pve.proxmox.com/pve-docs/pve-admin-guide.html
  - Proxmox Terraform provider: https://registry.terraform.io/providers/bpg/proxmox/latest/docs
  - Proxmox provider source / issues: https://github.com/bpg/terraform-provider-proxmox

- Audience: familiar with Kubernetes/Docker; new to Type‑1 hypervisors and LXC.

- Priorities: prefer canonical, well-documented patterns that are easy to read and change; prefer secure sensible defaults but keep things experiment-friendly for a homelab.

- LXC: treat as different from Docker — be explicit about resources, networking, and templates; prefer clear, commented definitions.

- Containers: prefer minimal base images (e.g., `alpine`) and minimal runtime stacks; add packages only when justified.

- Community scripts: ok for experimentation, but prefer reimplementing them as OpenTofu modules with clear inputs/outputs, idempotency, docs, and a small smoke test.

- Docs: include `description`/`type` for variables/outputs and a README for each module; use `terraform-docs` to generate lightweight docs.
- Use `tofu validate` to check for syntax errors and ensure configurations are valid.
