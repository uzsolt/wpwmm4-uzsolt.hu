#!/bin/sh

IFS="|"
cat data/${1}.psv | while read txt path tooltip; do
  echo "_own_pdf(\`${txt}',\`${path}',\`${tooltip}')"
done

