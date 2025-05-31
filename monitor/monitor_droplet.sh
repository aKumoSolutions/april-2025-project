#!/bin/bash


server_health=$(curl -s -X GET "https://api.digitalocean.com/v2/droplets/499130918" \
  -H "Authorization: Bearer $drop_token" | \
  jq -r '.droplet |
    "id: \(.id)
name: \(.name)
status: \(.status)
locked: \(.locked)
created_at: \(.created_at)
region: \(.region.slug)
public_ip: \((.networks.v4[] | select(.type == "public") | .ip_address))
private_ip: \((.networks.v4[] | select(.type == "private") | .ip_address))
memory_mb: \(.memory)"'
)

url="https://hooks.slack.com/services/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"
data=$(cat << EOF
{
  "channel": "#apr2025",
  "username": "AbdulBot",
  "text": "$server_health",
  "icon_emoji": ":akumo_abdul:"
}
EOF
)
curl -X POST -d "$data" "$url"