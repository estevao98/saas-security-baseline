import frappe


@frappe.whitelist(allow_guest=True)
def synthetic_guest_marker():
    """Marcador negativo: metodo Guest ficticio para triagem documental."""
    return {"status": "fixture-only"}


def synthetic_permission_bypass_marker():
    """Marcador negativo: bypass ficticio que exige justificativa humana."""
    doc = frappe.new_doc("Synthetic Audit Note")
    doc.summary = "Synthetic fixture marker"
    doc.insert(ignore_permissions=True)
    return doc.name


def synthetic_get_all_marker():
    """Marcador negativo: leitura sem permissao aplicada precisa de revisao."""
    return frappe.get_all("Synthetic Audit Note", fields=["name", "status"])


def synthetic_set_value_marker(note_name):
    """Marcador negativo: atualizacao direta precisa de revisao de ciclo e permissao."""
    frappe.db.set_value("Synthetic Audit Note", note_name, "status", "Closed")
