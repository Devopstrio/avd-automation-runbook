import pytest
from fastapi.testclient import TestClient
from backend.src.main import app

# Devopstrio AVD Automation Platform
# Unified Integration Tests for API & Orchestration Logic

client = TestClient(app)

def test_health_check_endpoint():
    """Verify that the platform services are reportable and live."""
    response = client.get("/health")
    assert response.status_code == 200
    data = response.json()
    assert data["status"] == "operational"
    assert "runbook" in data["engines"]

def test_runbook_library_retrieval():
    """Ensure the static runbook library is exposed to operators."""
    response = client.get("/runbooks")
    assert response.status_code == 200
    assert len(response.json()) > 0
    assert response.json()[0]["name"] == "Drain Session Hosts"

def test_job_submission_flow():
    """Verify that a runbook request is correctly queued into the async task broker."""
    payload = {
        "runbook_id": "rb-001",
        "target_host_pool": "UK-SALES-PRD",
        "parameters": {"force_logoff": True},
        "triggered_by": "automation-admin@devopstrio.com"
    }
    response = client.post("/runbooks/execute", json=payload)
    assert response.status_code == 202
    assert "job_id" in response.json()
    assert response.json()["status"] == "Submitted"

def test_analytics_aggregation():
    """Confirm the reporting engine provides validated cost and efficiency stats."""
    response = client.get("/analytics/summary")
    assert response.status_code == 200
    data = response.json()
    assert "cost_saved_usd" in data
    assert float(data["cost_saved_usd"]) > 0

def test_manual_scaling_override():
    """Ensure manual overrides pass validation checks for node limits."""
    payload = {
        "pool_id": "US-ENG-DEV",
        "min_hosts": 1,
        "max_hosts": 10,
        "scaling_type": "Breadth"
    }
    response = client.post("/hostpools/scale", json=payload)
    assert response.status_code == 200
    assert "request_id" in response.json()
