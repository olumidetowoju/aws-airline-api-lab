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
