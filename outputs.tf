output "oncall_integrations_id" {
  description = "Map of id values across all oncall_integrations, keyed the same as var.oncall_integrations except keys with no id are omitted"
  value       = { for k, v in grafana_oncall_integration.oncall_integrations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "oncall_integrations_default_route" {
  description = "Map of default_route values across all oncall_integrations, keyed the same as var.oncall_integrations except keys with no default_route are omitted"
  value       = { for k, v in grafana_oncall_integration.oncall_integrations : k => one(v.default_route) if v.default_route != null && length(v.default_route) > 0 }
}
output "oncall_integrations_dynamic_labels" {
  description = "Map of dynamic_labels values across all oncall_integrations, keyed the same as var.oncall_integrations except keys with no dynamic_labels are omitted"
  value       = { for k, v in grafana_oncall_integration.oncall_integrations : k => v.dynamic_labels if v.dynamic_labels != null && length(v.dynamic_labels) > 0 }
}
output "oncall_integrations_inbound_email" {
  description = "Map of inbound_email values across all oncall_integrations, keyed the same as var.oncall_integrations except keys with no inbound_email are omitted"
  value       = { for k, v in grafana_oncall_integration.oncall_integrations : k => v.inbound_email if v.inbound_email != null && length(v.inbound_email) > 0 }
}
output "oncall_integrations_labels" {
  description = "Map of labels values across all oncall_integrations, keyed the same as var.oncall_integrations except keys with no labels are omitted"
  value       = { for k, v in grafana_oncall_integration.oncall_integrations : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "oncall_integrations_link" {
  description = "Map of link values across all oncall_integrations, keyed the same as var.oncall_integrations except keys with no link are omitted"
  value       = { for k, v in grafana_oncall_integration.oncall_integrations : k => v.link if v.link != null && length(v.link) > 0 }
}
output "oncall_integrations_name" {
  description = "Map of name values across all oncall_integrations, keyed the same as var.oncall_integrations except keys with no name are omitted"
  value       = { for k, v in grafana_oncall_integration.oncall_integrations : k => v.name if v.name != null && length(v.name) > 0 }
}
output "oncall_integrations_team_id" {
  description = "Map of team_id values across all oncall_integrations, keyed the same as var.oncall_integrations except keys with no team_id are omitted"
  value       = { for k, v in grafana_oncall_integration.oncall_integrations : k => v.team_id if v.team_id != null && length(v.team_id) > 0 }
}
output "oncall_integrations_templates" {
  description = "Map of templates values across all oncall_integrations, keyed the same as var.oncall_integrations except keys with no templates are omitted"
  value       = { for k, v in grafana_oncall_integration.oncall_integrations : k => one(v.templates) if v.templates != null && length(v.templates) > 0 }
}
output "oncall_integrations_type" {
  description = "Map of type values across all oncall_integrations, keyed the same as var.oncall_integrations except keys with no type are omitted"
  value       = { for k, v in grafana_oncall_integration.oncall_integrations : k => v.type if v.type != null && length(v.type) > 0 }
}

