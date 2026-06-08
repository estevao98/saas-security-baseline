import frappe


def validate_synthetic_note(doc, method=None):
    """Fixture positiva: validacao simples sem dado real."""
    if not doc.summary or len(doc.summary) > 120:
        frappe.throw("Synthetic summary must be present and short.")


def get_synthetic_note_for_current_user(note_name):
    """Fixture positiva: leitura com permissao explicita no documento."""
    doc = frappe.get_doc("Synthetic Audit Note", note_name)
    if not doc.has_permission("read"):
        frappe.throw("Synthetic permission check failed.")
    return {"name": doc.name, "status": doc.status}
