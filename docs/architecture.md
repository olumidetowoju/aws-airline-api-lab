# Architecture Overview

This document describes the architecture of the **SkyBridge Airline API Platform**.

## High-Level Architecture

The platform is built as a serverless, secure API surface:

- WAFv2 in front of the REST API
- API Gateway (REST + HTTP)
- Cognito (JWT authentication)
- API Keys & Usage Plans (partner control)
- Lambda functions per domain
- DynamoDB tables for persistence
- SNS for baggage events
- CloudWatch Logs, AWS Config, AWS Budgets

For detailed diagrams, see the Mermaid sections in the main `README.md`:

- **Secure Airline API Architecture (SkyBridge)**
- **Secure Booking Flow (Sequence Diagram)**

If you have placed the PDF in `docs/architecture/`, you can also refer to:

- `SkyBridge_Secure_Architecture_Overview.pdf`
