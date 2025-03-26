S="$(bash --norc -ec 'IFS=:; paths=($PATH);
for i in ${!paths[@]}; do
if [[ ${paths[i]} == "''/home/jaco/.pyenv/shims''" ]]; then unset '\''paths[i]'\'';
fi; done;
echo "${paths[*]}"')"
   
   echo $S
