if [ -z $1 ]; then
    echo "Please specify a bucket to backup to"
    exit 1
fi

DIR=$(cd ~/Sites && echo $PWD)
FILES=$(find "$DIR" -type f -name "*.env" -maxdepth 2)
TEMP_NAME="envs-$(date +%Y-%m-%d)"

[ -d "$TEMP_NAME" ] && exit

mkdir $TEMP_NAME

TEMP_DIR=$(cd $TEMP_NAME && echo $PWD)

for env in $FILES; do
    [ -f "$env" ] || break
    RELATIVE=${env#"$DIR"}
    DEST="${TEMP_DIR}${RELATIVE}"
    mkdir -p $(dirname "${DEST}")
    cp $env $DEST
done

zip -r "$TEMP_NAME.zip" $TEMP_NAME &> /dev/null
CMD="aws s3 cp ${TEMP_NAME}.zip s3://${1}/envs/${TEMP_NAME}.zip"

if [[ -n $2 ]]; then
    CMD="${CMD} --profile ${2}"
fi

eval $CMD
rm -rf $TEMP_DIR
