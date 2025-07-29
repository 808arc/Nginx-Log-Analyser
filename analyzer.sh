#!/bin/bash
path=${1:-"nginx-access.log"}

top5_ips() {
  awk '{print $1}' "$path" | sort | uniq -c | sort -nr | head -n 5
}

top5_requested_paths() {
  awk -F'"' '{print $2}' "$path" | awk '{print $2}' | sort | uniq -c | sort -nr | head -n 5
}

top5_response_statuses() {
  awk -F'"' '{print $3}' "$path" | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 5
}

top5_user_agents() {
  awk -F'"' '{print $6}' "$path" | sort | uniq -c | sort -nr | head -n 5
}

{
  echo -e "Analyzing file: \n $path \n"
  echo -e "Top 5 IP addresses with the most requests: \n$(top5_ips)"
  echo -e "Top 5 most requested paths: \n$(top5_requested_paths)"
  echo -e "Top 5 response status: \n$(top5_response_statuses)"
  echo -e "Top 5 user agents: \n$(top5_user_agents)"
} | tee -a "stats.txt"
