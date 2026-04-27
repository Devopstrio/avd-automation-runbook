<div align="center">

<img src="https://raw.githubusercontent.com/Devopstrio/.github/main/assets/Browser_logo.png" height="90" alt="Devopstrio Logo" />

<h1>Azure Virtual Desktop (AVD) Automation Runbook Platform</h1>

<p><strong>Cloud-Native Intelligent Operations & Governance for Enterprise End-User Computing</strong></p>

[![Automation](https://img.shields.io/badge/Ops-Runbook_Engine-522c72?style=for-the-badge&labelColor=000000)](/apps/runbook-engine)
[![Compute](https://img.shields.io/badge/Platform-Azure_Virtual_Desktop-0078d4?style=for-the-badge&logo=microsoftazure&labelColor=000000)](https://devopstrio.co.uk/)
[![Security](https://img.shields.io/badge/Security-Zero_Trust_Governance-962964?style=for-the-badge&labelColor=000000)](/security)
[![Optimization](https://img.shields.io/badge/Savings-Auto_Scale_Cost_Control-success?style=for-the-badge&labelColor=000000)](/apps/autoscale-engine)

</div>

---

## 🏛️ Executive Summary

The **AVD Automation Runbook Platform** is a flagship enterprise solution architected to eliminate manual overhead in the management of massive Azure Virtual Desktop estates. By codifying Day-2 operations into intelligent, event-driven runbooks, organizations can achieve true hyperscale with minimal administrative friction.

The platform bridges the gap between raw infrastructure and product operations, providing a centralized control plane for **automated scaling**, **self-healing incident remediation**, **golden image lifecycle management**, and **governance-as-code**.

### Strategic Business Outcomes
- **Operational Excellence**: Automate 80% of routine VDI management tasks, from session host patching to user onboarding.
- **Hyperscale Cost Efficiency**: Save millions in cloud compute through AI-driven host pool scaling that aggressively deallocates idle resources during off-peak windows.
- **Hardened Compliance**: Maintain a perpetual state of "clean" through automated drift detection and remediation of security baselines.
- **Incident Resilience**: Reduce MTTR by 60% using self-healing workflows that detect and resolve "Stuck Sessions" and "FSLogix mount failures" before users report them.

---

## 🏗️ Technical Architecture Details

### 1. High-Level Automation Architecture
```mermaid
graph TD
    User[IT Ops Admin] --> Portal[Next.js Command Center]
    Portal --> API[FastAPI Gateway]
    API --> Engine[Runbook Orchestrator]
    Engine --> Redis[Distributed Task Queue]
    Redis --> Worker[Compute Workers]
    Worker --> Azure[Azure Resource Manager / AVD]
    
    subgraph "Intelligent Logic"
        Auto[Autoscale Engine]
        Inc[Incident Remediation]
        Comp[Compliance Guardrails]
    end
    
    Auto --> API
    Inc --> API
    Comp --> API
```

### 2. Runbook Execution Lifecycle
```mermaid
sequenceDiagram
    participant Admin as IT Administrator
    participant Portal as Automation Portal
    participant Job as Runbook Broker
    participant Script as PS/Python Worker
    participant AVD as Azure Virtual Desktop

    Admin->>Portal: Trigger Runbook (e.g., Drain Host)
    Portal->>Job: Create Job + Parameters
    Job->>Job: Check Approval Gate
    Job->>Script: Dispatch Script Execution
    Script->>AVD: Set Drain Mode & Notify Users
    AVD-->>Script: Success Acknowledgement
    Script-->>Job: Task Completed
    Job-->>Portal: Update Status Dashboard
```

### 3. Host Pool Autoscale Lifecycle
```mermaid
graph TD
    Monitor[Metrics Collector] --> Load[Analyze Session Density]
    Load -->|Threshold High| ScaleUp[Provision New Hosts]
    Load -->|Threshold Low| ScaleDown[Drain & Shutdown]
    ScaleUp --> Register[Register to Host Pool]
    ScaleDown --> Deallocate[Stop VM (Cost Savings)]
```

### 4. Image Patch Pipeline
```mermaid
graph LR
    Master[Master Image] --> Backup[Backup Snapshot]
    Backup --> Patch[Automated Update Cluster]
    Patch --> App[Software Updates]
    App --> Sysprep[Capture & Sysprep]
    Sysprep --> Test[Validation Pool]
    Test --> Prod[Promote to Production Gallery]
```

### 5. Incident Remediation Flow (Self-Healing)
```mermaid
graph TD
    Alert[Session Stuck Detected] --> Rule[Match Remediation Policy]
    Rule --> Drain[Set VM to Drain]
    Drain --> Kill[Reset User Process]
    Kill --> Verify[Check Session Health]
    Verify -->|Fixed| Restore[Make Available]
    Verify -->|Failed| Restart[Hard Reboot VM]
```

### 6. Security Trust Boundary
```mermaid
graph TD
    Request[API Request] --> WAF[Azure WAF]
    WAF --> Gateway[API Management]
    Gateway --> RBAC[Role-Based Access Check]
    RBAC --> KeyVault[Fetch Secrets/Tokens]
    KeyVault --> Target[Execute Automation]
```

### 7. Global Region Topology
```mermaid
graph LR
    HQ[Global Control Plane] --> Region1[UK South Pool]
    HQ --> Region2[US East Pool]
    HQ --> Region3[Asia East Pool]
    Region1 --> Policy[Regional Governance]
```

### 8. API Request Lifecycle
```mermaid
graph LR
    UI[Frontend] --> Auth[OIDC/JWT Challenge]
    Auth --> APIGateway[FastAPI Entry]
    APIGateway --> Service[Domain Logic]
    Service --> DB[(Audit Ledger)]
```

### 9. Multi-Tenant Model
```mermaid
graph TD
    Root[Platform Root]
    Root --> TenantA[Business Unit A]
    Root --> TenantB[Business Unit B]
    TenantA --> RPs[Host Pool A1/A2]
    TenantB --> RPsB[Host Pool B1]
```

### 10. Monitoring & Telemetry Flow
```mermaid
graph LR
    Logs[AVD Diagnostics] --> LAW[Log Analytics Workspace]
    LAW --> Engine[Compliance Engine]
    Engine --> Alert[Dashboard Alert]
    Alert --> Remediation[Auto-Runbook]
```

### 11. Disaster Recovery Topology
```mermaid
graph TD
    Primary[Active Region] --> Replication[Image Replication]
    Replication --> Failover[Standby Region]
    Failover --> Sync[Workspace Membership Sync]
```

### 12. User Onboarding Flow
```mermaid
graph TD
    HR[HR System Event] --> Webhook[Onboarding API]
    Webhook --> Group[Assign Entra Group]
    Group --> App[Assign RemoteApps]
    App --> Welcome[Send Access Mail]
```

### 13. Cost Shutdown Workflow
```mermaid
graph LR
    Check[Check Business Hours] --> BusinessEnd[Evening Threshold]
    BusinessEnd --> Scan[Scan Idle Hosts]
    Scan --> Stop[Stop & Deallocate]
```

### 14. CI/CD Operations Pipeline
```mermaid
graph LR
    Code[Runbook Update] --> Lint[PSScriptAnalyzer]
    Lint --> Lab[Deployment to Lab]
    Lab --> Cert[Compliance Signature]
    Cert --> Prod[Global Distribution]
```

### 15. Executive Governance Workflow
```mermaid
graph TD
    KPI[Cost/Uptime KPI] --> Report[Quarterly Review]
    Report --> Tuning[Adjust Scaling Rules]
```

### 16. Session Host Lifecycle
```mermaid
graph TD
    New[Provisioned] --> Operational[Available]
    Operational --> Maintenance[Draining]
    Maintenance --> Patched[Updated]
    Patched --> Operational
```

### 17. Identity Federation Model
```mermaid
graph LR
    OnPrem[Local AD] --> Sync[Entra Connect]
    Sync --> Entra[Entra ID]
    Entra --> AVD[AVD Sso]
```

### 18. Approval Workflow
```mermaid
graph LR
    Request[Sensitive Runbook] --> Gate[Manager Approval]
    Gate -->|Approve| Execute[Run Job]
    Gate -->|Deny| Reject[Log Audit]
```

### 19. Disaster Recovery Failover Pipeline
```mermaid
graph TD
    Detect[Region Outage] --> Switch[Update Traffic Manager]
    Switch --> Spin[Provision Emergency Hosts]
    Spin --> Resume[Service Restored]
```

### 20. Compliance Drift Workflow
```mermaid
graph LR
    Audit[Schedule Check] --> Diff[Detect Drift]
    Diff --> Heal[Auto-Enforce Configuration]
```

---

## 🚀 Environment Deployment

### Terraform Orchestration
```bash
cd terraform/environments/prd
terraform init
terraform apply -auto-approve
```

---
<sub>&copy; 2026 Devopstrio &mdash; Engineering the Autonomous Workspace.</sub>
