#!/bin/sh

read new_task
echo ${new_task} | jq -rM '"Hozzáadás: "+.description' > ~/.task/commit_msg
echo ${new_task} | jq -rM '"UUID: "+.uuid' >> ~/.task/commit_msg

echo ${new_task}
