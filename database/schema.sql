-- Devopstrio AVD Automation Runbook Platform
-- Core Operational Database Schema
-- Target: PostgreSQL 15+

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 1. Identity & Tenancy
CREATE TABLE IF NOT EXISTS tenants (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    azure_tenant_id VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id UUID REFERENCES tenants(id),
    email VARCHAR(255) UNIQUE NOT NULL,
    role VARCHAR(50) DEFAULT 'Operator', -- Admin, Operator, Viewer
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 2. Infrastructure Inventory
CREATE TABLE IF NOT EXISTS host_pools (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id UUID REFERENCES tenants(id),
    pool_name VARCHAR(255) NOT NULL,
    resource_group VARCHAR(255) NOT NULL,
    subscription_id VARCHAR(100) NOT NULL,
    pool_type VARCHAR(50) DEFAULT 'Pooled',
    load_balancer_type VARCHAR(50) DEFAULT 'BreadthFirst',
    status VARCHAR(50) DEFAULT 'Available',
    metadata JSONB DEFAULT '{}'
);

CREATE TABLE IF NOT EXISTS session_hosts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    host_pool_id UUID REFERENCES host_pools(id) ON DELETE CASCADE,
    vm_name VARCHAR(255) NOT NULL,
    vm_resource_id TEXT NOT NULL,
    power_state VARCHAR(50) DEFAULT 'Running',
    status VARCHAR(50) DEFAULT 'Available',
    session_count INT DEFAULT 0,
    last_heartbeat TIMESTAMP WITH TIME ZONE
);

-- 3. Automation Library
CREATE TABLE IF NOT EXISTS runbooks (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    script_path TEXT NOT NULL,
    parameters_schema JSONB DEFAULT '{}',
    is_critical BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS runbook_jobs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    runbook_id UUID REFERENCES runbooks(id),
    tenant_id UUID REFERENCES tenants(id),
    initiated_by UUID REFERENCES users(id),
    target_resource_id TEXT,
    parameters JSONB DEFAULT '{}',
    status VARCHAR(50) DEFAULT 'Pending', -- Pending, Running, Success, Failed, Cancelled
    logs TEXT,
    started_at TIMESTAMP WITH TIME ZONE,
    completed_at TIMESTAMP WITH TIME ZONE
);

-- 4. Incidents & Remediation
CREATE TABLE IF NOT EXISTS incidents (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id UUID REFERENCES tenants(id),
    title VARCHAR(255) NOT NULL,
    severity VARCHAR(20) DEFAULT 'Medium', -- Low, Medium, High, Critical
    source VARCHAR(50) DEFAULT 'Monitoring', -- Monitoring, User, Manual
    status VARCHAR(50) DEFAULT 'Open', -- Open, Investigating, Remediating, Resolved, Closed
    remediation_job_id UUID REFERENCES runbook_jobs(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    resolved_at TIMESTAMP WITH TIME ZONE
);

-- 5. Images & Versioning
CREATE TABLE IF NOT EXISTS images (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id UUID REFERENCES tenants(id),
    name VARCHAR(255) NOT NULL,
    version VARCHAR(50) NOT NULL,
    gallery_id TEXT NOT NULL,
    status VARCHAR(50) DEFAULT 'Published',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 6. Performance & Cost Metrics
CREATE TABLE IF NOT EXISTS platform_metrics (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    resource_id TEXT NOT NULL,
    metric_name VARCHAR(100) NOT NULL,
    metric_value FLOAT NOT NULL,
    timestamp TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- 7. Audit Logging
CREATE TABLE IF NOT EXISTS audit_logs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id UUID REFERENCES tenants(id),
    user_id UUID REFERENCES users(id),
    action VARCHAR(255) NOT NULL,
    resource_type VARCHAR(100),
    resource_id VARCHAR(255),
    details JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Optimization Indexes
CREATE INDEX idx_jobs_status ON runbook_jobs(status);
CREATE INDEX idx_session_hosts_pool ON session_hosts(host_pool_id);
CREATE INDEX idx_incidents_status ON incidents(status);
CREATE INDEX idx_metrics_timestamp ON platform_metrics(timestamp);
