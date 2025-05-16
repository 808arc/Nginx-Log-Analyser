#!/bin/bash

top5_ips(){
    :
}

top5_requested_paths(){
    :
}

top5_response_statuses(){
    :
}

top5_user_agents(){
    :
}

{
    echo -e "Top 5 IP addresses with the most requests: $(top5_ips)\n"
    echo -e "Top 5 most requested paths: $(top5_requested_paths)\n"
    echo -e "Top 5 response status codes: $(top5_response_statuses)\n"
    echo -e "Top 5 user agents: $(top5_user_agents)\n"
} >> stats.txt
