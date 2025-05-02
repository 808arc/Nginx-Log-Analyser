#!/bin/bash
#cat | grep | | cut | sort | uniq | wc 

#171.79.28.149 - - [04/Oct/2024:18:07:00 +0000] "GET /v1-list-previous-pending-tasks/66fc0d5a65c85844abd18f26?date=2024-10-04 HTTP/1.1" 304 0 "https://time.fyi/" "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/53


# file(){
#     #path=$1
#     path=${1:-"nginx-access.log"}
#     find "$path" -type d

#     if [ ! -f "$path" ]; then
#         echo "Error: $path does not exist"
#         exit
#     fi
# }


path=${1:-"nginx-access.log"}


top5_ips(){
    awk '{print $1}' $path | uniq -c | sort -nr | head -n 5
}

top5_requested_paths(){
    awk '{print $2}' $path | uniq -c | sort -nr | head -n 5
}

top5_response_statuses(){
    :
}

top5_user_agents(){
    :
}

{
    echo -e "Top 5 IP addresses with the most requests:\n$(top5_ips)"
    echo -e "Top 5 most requested paths:\n$(top5_requested_paths)"
    # echo -e "Top 5 response status codes: $(top5_response_statuses)\n"
    # echo -e "Top 5 user agents: $(top5_user_agents)\n"
} >> stats.txt
