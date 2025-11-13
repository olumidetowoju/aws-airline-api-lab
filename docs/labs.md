# Labs & Endpoints

This project is designed as a hands-on lab for building and securing an airline API platform on AWS Free Tier.

## Core Endpoints

- `GET /flight` – Flight status API
- `POST /ticket` – Issue passenger ticket
- `POST /checkin` – Mark passenger as checked-in
- `POST /baggage` – Baggage lifecycle events
- `POST /booking` – Partner booking API (hardened)
- `POST /loyalty` – Loyalty points API (hardened)

## Lab Structure

- **`modules/`** – Textbook-style theory + labs (Day 1–10)
- **`labs/`** – Supporting scripts, sample payloads, etc.
- **`scripts/`** – Helper scripts (cleanup, PDF generation)

## How to Use

1. Clone the repo
2. Follow Day 1 → Day 10 in `modules/`
3. Use your real AWS Free Tier account (`us-east-2`)
4. Observe how each concept is implemented live

For deeper security and architecture details, see:

- [Security Hardening](security.md)
- [Architecture](architecture.md)
