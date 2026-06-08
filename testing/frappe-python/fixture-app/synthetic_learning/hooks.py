app_name = "synthetic_learning"
app_title = "Synthetic Learning Fixture"
app_publisher = "Fixture Maintainer"
app_description = "Fixture ficticia para auditoria documental Frappe/Python."
app_license = "MIT"

doc_events = {
    "Synthetic Audit Note": {
        "validate": "synthetic_learning.synthetic_learning.doctype.synthetic_audit_note.synthetic_audit_note.validate_synthetic_note"
    }
}

has_permission = {
    "Synthetic Audit Note": "synthetic_learning.permissions.synthetic_note_has_permission"
}

permission_query_conditions = {
    "Synthetic Audit Note": "synthetic_learning.permissions.synthetic_note_query"
}

scheduler_events = {
    "daily": ["synthetic_learning.tasks.review_synthetic_audit_queue"]
}
