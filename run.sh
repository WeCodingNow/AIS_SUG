DB_VOLUME='aissug_postgres-data'

PARAMS=""
CLEAN_DB=
BUILD_BACK=
while (( "$#" )); do
  case "$1" in
    --clean)
      CLEAN_DB="true"
      shift
      ;;
    --build)
      BUILD_BACK="true"
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

if [[ "$BUILD_BACK" ]]; then
  cd backend && make image && cd ..
fi

if [[ "PARAMS" ]]; then
    docker-compose up $PARAMS
else
    docker-compose up
fi

docker-compose down

if [[ "$CLEAN_DB" ]]; then
    docker volume rm "$DB_VOLUME"
fi

