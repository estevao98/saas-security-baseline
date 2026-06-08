import frappe


def synthetic_note_has_permission(doc, user=None, permission_type=None):
    """Fixture positiva: exemplo minimo de decisao server-side revisavel."""
    active_user = user or frappe.session.user
    if permission_type in {"read", "write"} and doc.owner == active_user:
        return True
    return None


def synthetic_note_query(user=None):
    """Fixture positiva: condicao sintetica para listagem, sem dado real."""
    active_user = user or frappe.session.user
    return "`tabSynthetic Audit Note`.owner = {owner}".format(
        owner=frappe.db.escape(active_user)
    )
