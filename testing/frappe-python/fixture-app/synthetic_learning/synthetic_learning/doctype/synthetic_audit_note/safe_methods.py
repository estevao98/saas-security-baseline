import frappe


@frappe.whitelist()
def get_synthetic_status(note_name):
    """Fixture positiva: metodo autenticado com validacao e permissao."""
    if not isinstance(note_name, str) or len(note_name) > 80:
        frappe.throw("Invalid synthetic note identifier.")

    doc = frappe.get_doc("Synthetic Audit Note", note_name)
    if not doc.has_permission("read"):
        frappe.throw("Synthetic permission check failed.")

    return {"name": doc.name, "status": doc.status}


def list_synthetic_notes_by_owner(owner):
    """Fixture positiva: SQL parametrizado ainda exige revisao de autorizacao."""
    if owner != frappe.session.user:
        frappe.throw("Synthetic owner scope mismatch.")

    return frappe.db.sql(
        "select name, status from `tabSynthetic Audit Note` where owner = %s",
        (owner,),
        as_dict=True,
    )
