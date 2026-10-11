variable "oncall_integrations" {
  description = <<EOT
Map of oncall_integrations, attributes below
Required:
    - name
    - type
    - default_route (block):
        - escalation_chain_id (optional)
        - msteams (optional, block):
            - enabled (optional)
            - id (optional)
        - slack (optional, block):
            - channel_id (optional)
            - enabled (optional)
        - telegram (optional, block):
            - enabled (optional)
            - id (optional)
Optional:
    - dynamic_labels
    - labels
    - team_id
    - templates (block):
        - acknowledge_signal (optional)
        - email (optional, block):
            - message (optional)
            - title (optional)
        - grouping_key (optional)
        - microsoft_teams (optional, block):
            - image_url (optional)
            - message (optional)
            - title (optional)
        - mobile_app (optional, block):
            - message (optional)
            - title (optional)
        - phone_call (optional, block):
            - title (optional)
        - resolve_signal (optional)
        - slack (optional, block):
            - image_url (optional)
            - message (optional)
            - title (optional)
        - sms (optional, block):
            - title (optional)
        - source_link (optional)
        - telegram (optional, block):
            - image_url (optional)
            - message (optional)
            - title (optional)
        - web (optional, block):
            - image_url (optional)
            - message (optional)
            - title (optional)
EOT

  type = map(object({
    name           = string
    type           = string
    dynamic_labels = optional(list(any))
    labels         = optional(list(any))
    team_id        = optional(string)
    default_route = object({
      escalation_chain_id = optional(string)
      msteams = optional(object({
        enabled = optional(bool)
        id      = optional(string)
      }))
      slack = optional(object({
        channel_id = optional(string)
        enabled    = optional(bool)
      }))
      telegram = optional(object({
        enabled = optional(bool)
        id      = optional(string)
      }))
    })
    templates = optional(object({
      acknowledge_signal = optional(string)
      email = optional(object({
        message = optional(string)
        title   = optional(string)
      }))
      grouping_key = optional(string)
      microsoft_teams = optional(object({
        image_url = optional(string)
        message   = optional(string)
        title     = optional(string)
      }))
      mobile_app = optional(object({
        message = optional(string)
        title   = optional(string)
      }))
      phone_call = optional(object({
        title = optional(string)
      }))
      resolve_signal = optional(string)
      slack = optional(object({
        image_url = optional(string)
        message   = optional(string)
        title     = optional(string)
      }))
      sms = optional(object({
        title = optional(string)
      }))
      source_link = optional(string)
      telegram = optional(object({
        image_url = optional(string)
        message   = optional(string)
        title     = optional(string)
      }))
      web = optional(object({
        image_url = optional(string)
        message   = optional(string)
        title     = optional(string)
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.oncall_integrations : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

