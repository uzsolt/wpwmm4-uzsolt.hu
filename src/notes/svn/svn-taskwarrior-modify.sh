#!/bin/sh


read old_task
read new_task

COMMIT_MSG=~/.task/commit_msg

status="$(echo "${new_task}" | jq -rM ".status")"
: > ${COMMIT_MSG}

if [ "${status}" == "deleted" ]; then
  echo ${new_task} | jq -rM '"Törlés: "+.description' >> ${COMMIT_MSG}
elif [ "${status}" == "completed" ]; then
  echo ${new_task} | jq -rM '"Teljesítve: "+.description' >> ${COMMIT_MSG}
else
  printf "Módosítás: " >> ${COMMIT_MSG}
  differfields=""
  for field in description due project; do
    old=$(echo ${old_task} | jq ".${field}")
    new=$(echo ${new_task} | jq ".${field}")
    differ=$(printf "%s\n%s\n" "${old}" "${new}" | uniq | wc -l)
    [ "${differ}" -ne 1 ] && differfields="${differfields} ${field}"
  done
  echo "${differfields}" >> ${COMMIT_MSG}
fi

echo ${new_task} | jq -rM '"UUID: "+.uuid' >> ${COMMIT_MSG}

echo ${new_task}
