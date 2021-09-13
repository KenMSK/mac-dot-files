#/bin/bash

CMD="ln -sfn"

if [[ $1 == "cp" ]]
then
    CMD="cp -r"
fi

# For files in home directory (incl Atom setting)
pushd home > /dev/null
for i in .*; do
    if [ "${i}" == "_ssh" ] || [ "${i}" == "." ] || [ "${i}" == ".." ]
    then
        continue
    fi
    x=`echo ${i}`
    # | sed -E s/_/./`
    rm -rf ${HOME}/${x}
    ${CMD} ${PWD}/${i} ${HOME}/${x}
done
popd > /dev/null
