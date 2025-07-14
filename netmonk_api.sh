ENV_FILE="./config.env"

if [[ -f "$ENV_FILE" ]]; then
  export $(grep -v '^#' "$ENV_FILE" | xargs)
else
  echo "File $ENV_FILE tidak ditemukan. Pastikan sudah buat ya say."
  exit 1
fi

clear
echo "███╗   ██╗███████╗████████╗███╗   ███╗ ██████╗ ███╗   ██╗██╗  ██╗     █████╗ ██████╗ ██╗"
echo "████╗  ██║██╔════╝╚══██╔══╝████╗ ████║██╔═══██╗████╗  ██║██║ ██╔╝    ██╔══██╗██╔══██╗██║"
echo "██╔██╗ ██║█████╗     ██║   ██╔████╔██║██║   ██║██╔██╗ ██║█████╔╝     ███████║██████╔╝██║"
echo "██║╚██╗██║██╔══╝     ██║   ██║╚██╔╝██║██║   ██║██║╚██╗██║██╔═██╗     ██╔══██║██╔═══╝ ██║"
echo "██║ ╚████║███████╗   ██║   ██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║  ██╗    ██║  ██║██║     ██║"
echo "╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝     ╚═╝"
echo ""
echo "Pilih report yang mau dijalankan ya say:"
echo "nb: Ketikin aja ya, atau pilih pake arrow keys say"

REPORT_NAME=$(FZF_DEFAULT_OPTS="--layout=reverse --info=inline --border=rounded --height=30%" \
  fzf --prompt="PILIH REPORT: " <<< $'PRIME\nHI\nPORTAL')

tput cuu1 && tput el

if [[ -z "$REPORT_NAME" ]]; then
  echo "Gak ada yang dipilih. Batal say."
  exit 1
fi

case "$REPORT_NAME" in
  "HI") COLLECTION_ID=$HI_COLLECTION_ID; ENVIRONMENT_ID=$HI_ENVIRONMENT_ID ;;
  "PRIME") COLLECTION_ID=$PRIME_COLLECTION_ID; ENVIRONMENT_ID=$PRIME_ENVIRONMENT_ID ;;
  "PORTAL") COLLECTION_ID=$PORTAL_COLLECTION_ID; ENVIRONMENT_ID=$PORTAL_ENVIRONMENT_ID ;;
  *) echo "Pilihan tidak valid say."; exit 1 ;;
esac

TARGET_DIR=~/Documents/postman_newman
mkdir -p "$TARGET_DIR"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
FILENAME="${REPORT_NAME}_Report_${TIMESTAMP}.html"
FULL_PATH="${TARGET_DIR}/${FILENAME}"

echo "Jalanin tes untuk: $REPORT_NAME..."
newman run "https://api.getpostman.com/collections/${COLLECTION_ID}?apikey=${POSTMAN_API_KEY}" \
  --environment "https://api.getpostman.com/environments/${ENVIRONMENT_ID}?apikey=${POSTMAN_API_KEY}" \
  -r htmlextra \
  --reporter-htmlextra-title "${REPORT_NAME} Netmonk" \
  --reporter-htmlextra-displayProgressBar true \
  --reporter-htmlextra-export "${FULL_PATH}"

echo "Done say!"
echo "Report disimpan di: ${FULL_PATH}"
echo ""

echo "Mau langsung buka report-nya sekarang say?"
OPEN_CHOICE=$(FZF_DEFAULT_OPTS="--layout=reverse --info=inline --border=rounded --height=30%" \
  fzf --prompt="MAU BUKA SEKARANG?: " <<< $'YA\nTIDAK')

tput cuu1 && tput el

if [[ "$OPEN_CHOICE" == "YA" ]]; then
  echo "Membuka report say..."
  open "${FULL_PATH}"
else
  echo "Siap, report-nya disimpan aja ya say."
fi
