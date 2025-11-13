# Security Hardening (Phase 2)

Phase 2 describes how SkyBridge evolved from a basic serverless API into a **hardened airline partner platform**.

## Hardened Endpoints

- **`/booking`**
  - API Key (partner-level access)
  - Cognito JWT (user/service identity)
  - JSON Schema validation (request body)
  - WAF protection (CommonRuleSet)
  - DynamoDB-backed booking records

- **`/loyalty`**
  - API Key + Cognito JWT
  - Business rule validation in Lambda:
    - `member_id` required
    - `delta` must be integer
  - DynamoDB-backed loyalty ledger

## Layers

1. **Identity & Access**
   - Cognito User Pool (`SkyBridgePartnerPool`)
   - API Keys (`SkyBridgePartnerKey`)
   - Usage Plan (`SkyBridgePartnerPlan`)

2. **Edge Controls**
   - WAF (`SkyBridgeAPIGuard`)
   - API Gateway authorizers and schema validators

3. **Data Integrity**
   - DynamoDB tables per domain:
     - `skybridge-bookings`, `skybridge-loyalty`, `skybridge-orders`, `skybridge-baggage`, `skybridge-flights`

4. **Governance**
   - AWS Config
   - AWS Budgets (`SkyBridge-FreeTier-Guard`)

See the main README's **Phase 2 – Security Hardening Journey** for the full story.
