DB_VOLUME='aissug_database-data'

PARAMS=""
CLEAN_DB=
while (( "$#" )); do
  case "$1" in
    --clean)
      CLEAN_DB="true"
      shift
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done

# cd backend && make image
if [[ "PARAMS" ]]; then
    docker-compose up $PARAMS
else
    docker-compose up
fi

docker-compose down

if [[ "$CLEAN_DB" ]]; then
    docker volume rm "$DB_VOLUME"
fi

