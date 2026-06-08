import frappe


def review_synthetic_audit_queue():
    """Fixture positiva: job ficticio que revalida escopo antes de atuar."""
    records = frappe.get_list(
        "Synthetic Audit Note",
        filters={"status": "Pending Review"},
        fields=["name"],
        limit_page_length=10,
    )
    for record in records:
        doc = frappe.get_doc("Synthetic Audit Note", record.name)
        if doc.has_permission("write"):
            doc.status = "Queued For Manual Review"
            doc.save()
