resource "grafana_oncall_integration" "oncall_integrations" {
  for_each = var.oncall_integrations

  name           = each.value.name
  type           = each.value.type
  dynamic_labels = each.value.dynamic_labels
  labels         = each.value.labels
  team_id        = each.value.team_id

  default_route {
    escalation_chain_id = each.value.default_route.escalation_chain_id
    dynamic "msteams" {
      for_each = each.value.default_route.msteams != null ? [each.value.default_route.msteams] : []
      content {
        enabled = msteams.value.enabled
        id      = msteams.value.id
      }
    }
    dynamic "slack" {
      for_each = each.value.default_route.slack != null ? [each.value.default_route.slack] : []
      content {
        channel_id = slack.value.channel_id
        enabled    = slack.value.enabled
      }
    }
    dynamic "telegram" {
      for_each = each.value.default_route.telegram != null ? [each.value.default_route.telegram] : []
      content {
        enabled = telegram.value.enabled
        id      = telegram.value.id
      }
    }
  }

  dynamic "templates" {
    for_each = each.value.templates != null ? [each.value.templates] : []
    content {
      acknowledge_signal = templates.value.acknowledge_signal
      dynamic "email" {
        for_each = templates.value.email != null ? [templates.value.email] : []
        content {
          message = email.value.message
          title   = email.value.title
        }
      }
      grouping_key = templates.value.grouping_key
      dynamic "microsoft_teams" {
        for_each = templates.value.microsoft_teams != null ? [templates.value.microsoft_teams] : []
        content {
          image_url = microsoft_teams.value.image_url
          message   = microsoft_teams.value.message
          title     = microsoft_teams.value.title
        }
      }
      dynamic "mobile_app" {
        for_each = templates.value.mobile_app != null ? [templates.value.mobile_app] : []
        content {
          message = mobile_app.value.message
          title   = mobile_app.value.title
        }
      }
      dynamic "phone_call" {
        for_each = templates.value.phone_call != null ? [templates.value.phone_call] : []
        content {
          title = phone_call.value.title
        }
      }
      resolve_signal = templates.value.resolve_signal
      dynamic "slack" {
        for_each = templates.value.slack != null ? [templates.value.slack] : []
        content {
          image_url = slack.value.image_url
          message   = slack.value.message
          title     = slack.value.title
        }
      }
      dynamic "sms" {
        for_each = templates.value.sms != null ? [templates.value.sms] : []
        content {
          title = sms.value.title
        }
      }
      source_link = templates.value.source_link
      dynamic "telegram" {
        for_each = templates.value.telegram != null ? [templates.value.telegram] : []
        content {
          image_url = telegram.value.image_url
          message   = telegram.value.message
          title     = telegram.value.title
        }
      }
      dynamic "web" {
        for_each = templates.value.web != null ? [templates.value.web] : []
        content {
          image_url = web.value.image_url
          message   = web.value.message
          title     = web.value.title
        }
      }
    }
  }
}

