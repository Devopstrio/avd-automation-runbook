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
flowchart TD
    User["IT Ops Admin"] --> Portal["Next.js Command Center"]
    Portal["Next.js Command Center"] --> API["FastAPI Gateway"]
    API["FastAPI Gateway"] --> Engine["Runbook Orchestrator"]
    Engine["Runbook Orchestrator"] --> Redis["Distributed Task Queue"]
    Redis["Distributed Task Queue"] --> Worker["Compute Workers"]
    Worker["Compute Workers"] --> Azure["Azure Resource Manager / AVD"]
    
    subgraph IntelligentLogic["Intelligent Logic"]
        Auto["Autoscale Engine"]
        Inc["Incident Remediation"]
        Comp["Compliance Guardrails"]
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
flowchart TD
    Monitor["Metrics Collector"] --> Load["Analyze Session Density"]
    Load["Analyze Session Density"] -->|Threshold High| ScaleUp["Provision New Hosts"]
    Load["Analyze Session Density"] -->|Threshold Low| ScaleDown["Drain & Shutdown"]
    ScaleUp["Provision New Hosts"] --> Register["Register to Host Pool"]
    ScaleDown["Drain & Shutdown"] --> Deallocate["Stop VM (Cost Savings)"]
```

### 4. Image Patch Pipeline
```mermaid
flowchart LR
    Master["Master Image"] --> Backup["Backup Snapshot"]
    Backup["Backup Snapshot"] --> Patch["Automated Update Cluster"]
    Patch["Automated Update Cluster"] --> App["Software Updates"]
    App["Software Updates"] --> Sysprep["Capture & Sysprep"]
    Sysprep["Capture & Sysprep"] --> Test["Validation Pool"]
    Test["Validation Pool"] --> Prod["Promote to Production Gallery"]
```

### 5. Incident Remediation Flow (Self-Healing)
```mermaid
flowchart TD
    Alert["Session Stuck Detected"] --> Rule["Match Remediation Policy"]
    Rule["Match Remediation Policy"] --> Drain["Set VM to Drain"]
    Drain["Set VM to Drain"] --> Kill["Reset User Process"]
    Kill["Reset User Process"] --> Verify["Check Session Health"]
    Verify["Check Session Health"] -->|Fixed| Restore["Make Available"]
    Verify["Check Session Health"] -->|Failed| Restart["Hard Reboot VM"]
```

### 6. Security Trust Boundary
```mermaid
flowchart TD
    Request["API Request"] --> WAF["Azure WAF"]
    WAF["Azure WAF"] --> Gateway["API Management"]
    Gateway["API Management"] --> RBAC["Role-Based Access Check"]
    RBAC["Role-Based Access Check"] --> KeyVault["Fetch Secrets/Tokens"]
    KeyVault["Fetch Secrets/Tokens"] --> Target["Execute Automation"]
```

### 7. Global Region Topology
```mermaid
flowchart LR
    HQ["Global Control Plane"] --> Region1["UK South Pool"]
    HQ["Global Control Plane"] --> Region2["US East Pool"]
    HQ["Global Control Plane"] --> Region3["Asia East Pool"]
    Region1["UK South Pool"] --> Policy["Regional Governance"]
```

### 8. API Request Lifecycle
```mermaid
flowchart LR
    UI["Frontend"] --> Auth["OIDC/JWT Challenge"]
    Auth["OIDC/JWT Challenge"] --> APIGateway["FastAPI Entry"]
    APIGateway["FastAPI Entry"] --> Service["Domain Logic"]
    Service["Domain Logic"] --> DB[("Audit Ledger")]
```

### 9. Multi-Tenant Model
```mermaid
flowchart TD
    Root["Platform Root"]
    Root["Platform Root"] --> TenantA["Business Unit A"]
    Root["Platform Root"] --> TenantB["Business Unit B"]
    TenantA["Business Unit A"] --> RPs["Host Pool A1/A2"]
    TenantB["Business Unit B"] --> RPsB["Host Pool B1"]
```

### 10. Monitoring & Telemetry Flow
```mermaid
flowchart LR
    Logs["AVD Diagnostics"] --> LAW["Log Analytics Workspace"]
    LAW["Log Analytics Workspace"] --> Engine["Compliance Engine"]
    Engine["Compliance Engine"] --> Alert["Dashboard Alert"]
    Alert["Dashboard Alert"] --> Remediation["Auto-Runbook"]
```

### 11. Disaster Recovery Topology
```mermaid
flowchart TD
    Primary["Active Region"] --> Replication["Image Replication"]
    Replication["Image Replication"] --> Failover["Standby Region"]
    Failover["Standby Region"] --> Sync["Workspace Membership Sync"]
```

### 12. User Onboarding Flow
```mermaid
flowchart TD
    HR["HR System Entry"] --> Webhook["Onboarding API"]
    Webhook["Onboarding API"] --> Group["Assign Entra Group"]
    Group["Assign Entra Group"] --> App["Assign RemoteApps"]
    App["Assign RemoteApps"] --> Welcome["Send Access Mail"]
```

### 13. Cost Shutdown Workflow
```mermaid
flowchart LR
    Check["Check Business Hours"] --> BusinessEnd["Evening Threshold"]
    BusinessEnd["Evening Threshold"] --> Scan["Scan Idle Hosts"]
    Scan["Scan Idle Hosts"] --> Stop["Stop & Deallocate"]
```

### 14. CI/CD Operations Pipeline
```mermaid
flowchart LR
    Code["Runbook Update"] --> Lint["PSScriptAnalyzer"]
    Lint["PSScriptAnalyzer"] --> Lab["Deployment to Lab"]
    Lab["Deployment to Lab"] --> Cert["Compliance Signature"]
    Cert["Compliance Signature"] --> Prod["Global Distribution"]
```

### 15. Executive Governance Workflow
```mermaid
flowchart TD
    KPI["Cost/Uptime KPI"] --> Report["Quarterly Review"]
    Report["Quarterly Review"] --> Tuning["Adjust Scaling Rules"]
```

### 16. Session Host Lifecycle
```mermaid
flowchart TD
    New["Provisioned"] --> Operational["Available"]
    Operational["Available"] --> Maintenance["Draining"]
    Maintenance["Draining"] --> Patched["Updated"]
    Patched["Updated"] --> Operational["Available"]
```

### 17. Identity Federation Model
```mermaid
flowchart LR
    OnPrem["Local AD"] --> Sync["Entra Connect"]
    Sync["Entra Connect"] --> Entra["Entra ID"]
    Entra["Entra ID"] --> AVD["AVD Sso"]
```

### 18. Approval Workflow
```mermaid
flowchart LR
    Request["Sensitive Runbook"] --> Gate["Manager Approval"]
    Gate["Manager Approval"] -->|Approve| Execute["Run Job"]
    Gate["Manager Approval"] -->|Deny| Reject["Log Audit"]
```

### 19. Disaster Recovery Failover Pipeline
```mermaid
flowchart TD
    Detect["Region Outage"] --> Switch["Update Traffic Manager"]
    Switch["Update Traffic Manager"] --> Spin["Provision Emergency Hosts"]
    Spin["Provision Emergency Hosts"] --> Resume["Service Restored"]
```

### 20. Compliance Drift Workflow
```mermaid
flowchart LR
    Audit["Schedule Check"] --> Diff["Detect Drift"]
    Diff["Detect Drift"] --> Heal["Auto-Enforce Configuration"]
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
