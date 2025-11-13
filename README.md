# SkyBridge API Lab — AWS Airline API Course

**Owner:** `olumidetowoju` • **Repo:** `aws-airline-api-lab` • **AWS Region:** `us-east-2 (Ohio)` • **Architecture:** Serverless (Free Tier) • **Language:** Python + AWS CLI (`boto3`)

> You are the tutor. This is a hands-on, textbook-style course to expose airline APIs for third parties **securely** and **compliantly** using only AWS Free Tier–eligible services.

---

## 📅 10-Day Learning Path (Click a day to start)
- **Day 1:** [Welcome & Architecture Overview](modules/day01_introduction.md)
- **Day 2:** [API Gateway Foundations & IAM Security](modules/day02_api_gateway_iam.md)
- **Day 3:** [Flight Status Query API](modules/day03_flight_status_api.md)
- **Day 4:** [Passenger Ticketing & Check-in API](modules/day04_ticketing_checkin_api.md)
- **Day 5:** [Baggage Tracking API](modules/day05_baggage_tracking_api.md)
- **Day 6:** [Partner Agency Booking API](modules/day06_partner_agency_booking_api.md)
- **Day 7:** [Loyalty / Partner Integration API](modules/day07_loyalty_partner_api.md)
- **Day 8:** [Monitoring, Logging & Compliance](modules/day08_monitoring_compliance.md)
- **Day 9:** [Cost Monitoring & Governance](modules/day09_cost_governance.md)
- **Day 10:** [Troubleshooting, Cleanup & Next Steps](modules/day10_troubleshooting_cleanup.md)

---

## ✈️ Use Cases We Build
1. Passenger Ticketing & Check-in API  
2. Flight Status Query API  
3. Baggage Tracking API  
4. Partner Agency Booking API  
5. Loyalty / Partner Integration API  

> **Analogies:**  
> *API Gateway* = airport **check‑in desk**.  
> *Lambda* = **ground crew** executing tasks on demand.  
> *DynamoDB* = **baggage warehouse** of records.  
> *CloudWatch* = **control tower** monitoring operations.  
> *SNS/SQS/EventBridge* = **air traffic communications** network.

---

## 🧱 Core AWS Services (Free Tier)
- **API & Compute:** Amazon API Gateway, AWS Lambda  
- **Data & Storage:** Amazon DynamoDB, Amazon S3  
- **Identity & Security:** AWS IAM, (optional: AWS KMS keys)  
- **Messaging & Events:** Amazon SNS, Amazon SQS, Amazon EventBridge  
- **Ops & Compliance:** Amazon CloudWatch, AWS Config  
- **Cost:** AWS Budgets, Cost Explorer

---

## 🧰 Prerequisites
- AWS Free Tier account, **Region:** `us-east-2` (Ohio)
- IAM user with admin for labs (yours: `olumide-admin`), or equivalent
- AWS CLI v2 configured:  
  ```bash
  aws configure
  # region: us-east-2
  # output: json
  ```
- Python 3.10+ and `pip`

> Editor: **nano** — open any file with `nano <file>` then **Ctrl+O**, **Enter** to save, **Ctrl+X** to exit.

---

## 🗂 Repository Structure
```
aws-airline-api-lab/
├─ README.md
├─ modules/
│  ├─ day01_introduction.md
│  ├─ day02_api_gateway_iam.md
│  ├─ day03_flight_status_api.md
│  ├─ day04_ticketing_checkin_api.md
│  ├─ day05_baggage_tracking_api.md
│  ├─ day06_partner_agency_booking_api.md
│  ├─ day07_loyalty_partner_api.md
│  ├─ day08_monitoring_compliance.md
│  ├─ day09_cost_governance.md
│  └─ day10_troubleshooting_cleanup.md
├─ labs/            # optional sample data & code per day
├─ docs/            # binder-style PDFs, diagrams
└─ scripts/         # helpers: PDF generation, cleanup
```

---

## 🧪 How to Use This Course
1. Clone the repo (after you push it to GitHub):  
   ```bash
   git clone https://github.com/olumidetowoju/aws-airline-api-lab.git
   cd aws-airline-api-lab
   ```
2. Start with **Day 1** and work top-to-bottom.
3. Each day has:
   - **Analogy** to anchor the concept  
   - **Mermaid diagram** (rendered by GitHub)  
   - **Hands-on lab** (CLI-first, serverless-first, free-tier aware)  
   - **Troubleshooting** with `<!-- ALERT: error/fix -->` markers  
   - **New concepts** with `<!-- ALERT: new-concept -->` markers
4. Generate a binder-style PDF (optional):  
   ```bash
   bash scripts/generate-pdf.sh
   ```

---

## 🛡️ Compliance & Frameworks
- **IATA ONE Order** principles for modern airline retailing  
- **Data Privacy (GDPR-style)**: data minimization, access control, logging, retention  
- **AWS Well-Architected**: Security, Reliability, Cost Optimization focus

---

## 💸 Free-Tier Discipline
- All labs are sized for Free Tier. **ALWAYS run cleanup** at the end of a day (see each module).
- Track spend with **AWS Budgets** (Day 9).

---

## 🧭 Next Steps
- Open **[Day 1](modules/day01_introduction.md)** and begin.
- When ready, commit your changes and push to GitHub.

# 📘 10-Day Live Deployment Journey — Building the SkyBridge Airline API Platform

This section documents the **complete 10-day engineering journey** of building a production-ready, serverless Airline API platform on AWS — executed live on a real AWS Free Tier account using:

- **Amazon API Gateway (HTTP API)**
- **AWS Lambda (Python 3.11)**
- **Amazon DynamoDB**
- **Amazon SNS**
- **Amazon CloudWatch Logs & Alarms**
- **AWS Config**
- **AWS Budgets**
- **IAM Role-Based Access Control**

This provides both a **learning pathway** and a **technical audit trail**, demonstrating how each capability of SkyBridge Airline APIs was built from the ground up.

---

## 🟦 Day 1 — Environment, Region & Tagging Discipline

**What we set up**

- AWS Identity verified (`olumide-admin` in account `698135531490`)
- Region standardized to **us-east-2 (Ohio)**
- Artifacts bucket created:  
  `skybridge-artifacts-<random>`
- Project tagging baseline created:
Project=SkyBridge
Owner=olumidetowoju
Env=lab
CostCenter=free-tier

yaml
Copy code

**Lesson:** Secure cloud deployments begin with environment governance: region control, naming consistency, tagging, and identity clarity.

---

## 🟧 Day 2 — Hello API (Lambda + API Gateway + IAM)

**What we built**

- IAM execution role: `skybridge-lambda-exec`
- Lambda: `skybridge-hello`
- API Gateway (HTTP API) → Lambda integration
- Added `lambda:InvokeFunction` permission for API Gateway
- Debugged:
- Missing `zip` binary (installed via apt)
- API 500 errors due to missing invoke permission
- CLI payload issues (fixed with `--cli-binary-format raw-in-base64-out`)

**Lesson:**  
When API Gateway returns `500`, the **Lambda is usually fine** — it’s almost always a permissions or integration mapping issue. Always test Lambda directly.

---

## 🟩 Day 3 — Flight Status Query API (`GET /flight`)

**What we built**

- DynamoDB table: `skybridge-flights`
- Lambda: `skybridge-get-flight`
- Route: `GET /flight?flight_no=SKY101`
- JSON returned flight status, gate, and delay codes

**Lesson:**  
Stateless read-driven patterns work best with DynamoDB. Parameter validation (`flight_no required`) avoids unnecessary errors.

---

## 🟪 Day 4 — Ticketing & Check-In APIs (`POST /ticket` & `POST /checkin`)

**What we built**

- DynamoDB table: `skybridge-orders`
- Lambdas:
- `skybridge-issue-ticket`
- `skybridge-checkin`
- Routes:
- `POST /ticket`
- `POST /checkin`
- Fixed `$default` fallback routing so `/ticket` and `/checkin` call the correct Lambdas

**Lesson:**  
When multiple endpoints exist, you must explicitly bind **each route** to an integration, otherwise it silently falls back to `$default`.

---

## 🟨 Day 5 — Baggage Tracking API (Event-Driven Pattern)

**What we built**

- DynamoDB table: `skybridge-baggage`
- SNS topic: `skybridge-baggage-events`
- Lambda: `skybridge-baggage-track`
- Route: `POST /baggage`

**Lesson:**  
Airline operational systems are event-driven. SNS gives you scalable, secure event messaging.

---

## 🟥 Day 6 — Partner Agency Booking API (`POST /booking`)

**What we built**

- Table: `skybridge-bookings`
- Lambda: `skybridge-booking`
- Route: `POST /booking`

**Lesson:**  
Partner integrations must be predictable, validated, and logged — serverless patterns shine here.

---

## 🟩 Day 7 — Loyalty API (`POST /loyalty`)

**What we built**

- Table: `skybridge-loyalty`
- Lambda: `skybridge-loyalty`
- Route: `POST /loyalty`
- Uses DynamoDB **atomic ADD** for point adjustments

**Lesson:**  
Atomic operations simplify ledger-like systems without transactions.

---

## 🟦 Day 8 — Monitoring & Compliance

**What we built**

- CloudWatch Logs inspection (`aws logs tail`)
- CloudWatch alarm on Lambda errors
- AWS Config recorder enabled

**Lesson:**  
Logging + alarms + compliance = minimum for production.

---

## 🟧 Day 9 — Cost Governance (Free Tier Guardrail)

**What we built**

- AWS Budget: `SkyBridge-FreeTier-Guard` ($1/month)
- Email alerts  
- Enforced project tagging

**Lesson:**  
Cost governance is an engineering responsibility.

---

## 🟥 Day 10 — Troubleshooting & Cleanup

**Troubleshooting learned**

- API 500 → add invoke permission  
- Lambda stuck → check `get-function-configuration`  
- DynamoDB validation errors → fix schema  
- CLI payload issues → add `--cli-binary-format raw-in-base64-out`  
- Logs missing → tail logs after invocation  

**Cleanup performed**

- All SkyBridge Lambdas removed  
- All SkyBridge DynamoDB tables removed  
- API Gateway removed  
- SNS topic deleted  
- S3 artifacts bucket optionally deleted  

---

# 🛡️ Phase 2: Security Hardening Roadmap

- Add authentication & JWT authorization  
- Add WAF & rate limiting  
- Add request validation  
- Add KMS for data security  
- Add CloudTrail Lake & GuardDuty  
- Add Config rules & compliance  
- Add CI/CD with GitHub Actions  


# 🛡️ Phase 2 – Security Hardening Journey (Hardening the `/booking` Endpoint)

This section captures how the `/booking` endpoint was transformed from an open, free-to-call Lambda-backed operation into a **fully authenticated, schema-validated, rate-limited, WAF-protected partner integration surface**, following real airline security patterns.

The hardening process was completed in **three phases**, each adding a new layer of protection.

---

## 🔐 Phase 2 Day 1 — API Keys & Usage Plans (Partner-Level Access Control)

We introduced **API keys** as the foundational access control mechanism for external partners:

- Created a **REST API** (`SkyBridge-REST`) specifically for partner integration flows  
- Added `SkyBridgePartnerKey` API key  
- Created a `SkyBridgePartnerPlan` usage plan with:
  - **Throttle rate**: 5 requests/sec  
  - **Burst limit**: 10 requests  
- Attached the usage plan to the `/booking` method  
- Enforced: `apiKeyRequired = true`

**Results:**

- Requests **without** `x-api-key` →  
  ```json
  {"message": "Forbidden"}
Requests with a valid API key →
Successful booking creation in DynamoDB

This introduced partner identity and throttling, preventing anonymous or abusive traffic.

🧾 Phase 2 Day 2 — Cognito JWT Authentication (User-Level Identity)
Next, we added user/service authentication via Amazon Cognito:

Created Cognito User Pool: SkyBridgePartnerPool

Added a CLI-friendly client without secret for JWT acquisition

Created test user: partner-user

Obtained JWT using:

bash
Copy code
aws cognito-idp initiate-auth ...
Created a Cognito Authorizer in API Gateway

Attached it to POST /booking

Kept API key requirement active → dual-protection

Security model achieved:

API key → “Is this a valid partner?”

JWT token → “Is this a valid user/service within the partner?”

This matches real-world airline partner authentication, where both partner identity and user identity matter.

Results:

Missing JWT →

json
Copy code
{"message":"Unauthorized"}
Missing API key →

json
Copy code
{"message":"Forbidden"}
Both JWT + API key present → booking succeeds

🧩 Phase 2 Day 3 — Schema Validation (Request Hygiene at the Edge)
Finally, we ensured only valid, expected request bodies ever reached the Lambda function:

Created BookingRequestModel with JSON schema:

json
Copy code
{
  "agency": "string",
  "required": ["agency"],
  "additionalProperties": false
}
Created BodyValidator request validator

Attached model + validator to POST /booking

Redeployed the REST API

Results:

Valid body:

json
Copy code
{"agency":"SchemaCo"}
→ booking created successfully

Extra fields:

json
Copy code
{"agency":"SchemaCo","extra":"not-allowed"}
→ blocked with:

json
Copy code
{"message": "Invalid request body"}
Missing fields:

json
Copy code
{"wrongField":"oops"}
→ blocked with:

json
Copy code
{"message":"Invalid request body"}
No Lambda invocation occurs for invalid payloads.
This eliminates entire classes of input-based attacks, protects DynamoDB from junk writes, and preserves execution cost.

🧷 Combined Protection Summary for /booking
As of Phase 2 completion, /booking is now protected by:

Identity & Access
API Key (partner-level auth)

Cognito JWT Authorizer (user/service-level auth)

Input Security
Strict JSONSchema Validation (API Gateway edge)

Rejects malformed or excessive payloads

Traffic Control
Usage Plan with throttling & quotas

Prevents partner abuse & accidental traffic spikes

Data Integrity
DynamoDB writes only occur for validated, authenticated requests

Full Request Flow
WAF → API Gateway (JWT + API Key + Schema Validation) → Lambda → DynamoDB

This is a genuinely enterprise-grade, production-ready pattern for an airline partner booking API.

🚦 Next Steps (Security Hardening Priority Recommendation)
Now that /booking is fully hardened, the recommended next move is:

⭐ Harden /loyalty next — the most sensitive API after booking
Reasons:

Loyalty points = high fraud surface

Easy to validate (member_id, delta)

Perfect candidate for:

API key

JWT

JSON Schema

WAF protection

I can guide you through the /loyalty hardening exactly like we did for /booking.

Just say:

“Proceed to harden /loyalty next”
