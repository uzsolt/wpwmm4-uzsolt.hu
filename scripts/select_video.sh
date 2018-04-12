#!/bin/sh

. scripts/functions

process() {
  printf "_csoportositas(\`%s\',\`%s\',\`%s\')\n" "${url}" "${name}" "${descr}"
}

cat data/video_lists.psv | read_data_stdin process url name descr
