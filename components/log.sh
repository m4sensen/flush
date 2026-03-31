# -------------------------
# Standard Logs
# -------------------------

log() {
  printf "%b\n" "$(toggle --color white)${BOLD}[LOG] $(toggle --date) $*${RESET}"
}

logDebug() {
  printf "%b\n" "$(toggle --color gray)${BOLD}$(toggle --emoji bug) [DEBUG] $(toggle --date) $*${RESET}"
}

logSuccess() {
  printf "%b\n" "$(toggle --color emerald)${BOLD}$(toggle --emoji check_mark_button) [SUCCESS] $(toggle --date) $*${RESET}"
}

logWarn() {
  printf "%b\n" "$(toggle --color orange)${BOLD}$(toggle --emoji warning) [WARN] $(toggle --date) $*${RESET}"
}

logError() {
  printf "%b\n" "$(toggle --color pink)${BOLD}$(toggle --emoji cross_mark) [ERROR] $(toggle --date) $*${RESET}"
}

logFatal() {
  printf "%b\n" "$(toggle --color red)${BOLD}$(toggle --emoji radioactive) [FATAL] $(toggle --date) $*${RESET}"
}

# -------------------------
# Contextual Logs
# -------------------------

logQuestion() {
  printf "%b\n" "$(toggle --color blue)${BOLD}$(toggle --emoji red_question_mark) [QUESTION] $(toggle --date) $*${RESET}"
}

logRequest() {
  printf "%b\n" "$(toggle --color blue)${BOLD}$(toggle --emoji satellite_antenna) [REQUEST] $(toggle --date) Please $*${RESET}"
}

logUpload() {
  printf "%b\n" "$(toggle --color blue)${BOLD}$(toggle --emoji outbox_tray) [UPLOAD] $(toggle --date) $*${RESET}"
}

logDownload() {
  printf "%b\n" "$(toggle --color blue)${BOLD}$(toggle --emoji inbox_tray) [DOWNLOAD] $(toggle --date) $*${RESET}"
}

logWait() {
  printf "%b\n" "$(toggle --color purple)${BOLD}$(toggle --emoji hourglass_not_done) [WAIT] $(toggle --date) $*${RESET}"
}

logAttempt() {
  printf "%b\n" "$(toggle --color purple)${BOLD}$(toggle --emoji bullseye) [ATTEMPT] $(toggle --date) Attempt to $*${RESET}"
}

logChoice() {
  printf "%b\n" "$(toggle --color yellow)${BOLD}$(toggle --emoji game_die) [CHOICE] $(toggle --date) $*${RESET}"
}

logGreetings() {
  printf "%b\n" "$(toggle --color violet)${BOLD}$(toggle --emoji wave) [GREETINGS] $(toggle --date) $* $(toggle --emoji sparkles)${RESET}"
}

# -------------------------
# Structural Logs
# -------------------------

logLogo() {
  printf "%b" "$(toggle --color violet)"
  center_text <<< "$1"
  printf "%b\n" "${RESET}"
}

logTitle() {
  printf "\n%b\n\n" "$(toggle --color stone)${BOLD}${UNDERLINE}# $*${RESET}"
}

logHeading() {
  printf "\n%b\n" "$(toggle --color white)${BOLD}== $* ==${RESET}"
}

logParagraph() {
  printf "%b\n" "$(toggle --color neutral)$*${RESET}"
}

logLink() {
  printf "%b\n" "$(toggle --color cyan)$(toggle --emoji pushpin) ${BOLD}[LINK] ${UNDERLINE}${ITALIC}$*${RESET}"
}

logCopyright() {
  local colored_text="$(toggle --color lime)$(toggle --emoji copyright) ${ITALIC}$*${RESET}"
  center_text "$colored_text"
}

logSeparator() {
  local pattern="${1:--}"
  local cols
  cols=$(tput cols 2>/dev/null || echo 80)

  local line
  line=$(printf "%${cols}s" "" | tr ' ' "$pattern")
  
  printf "%b\n" "$(toggle --color white)${line:0:cols}${RESET}"
}

logBreak() {
  echo ""
}

logReturn() {

  local msg="${1:-Press Enter to return to the menu...}"
  
  # Construct the prompt string
  local prompt_msg="$(toggle --color yellow)${BOLD}$(toggle --emoji return) [MENU] $(toggle --date) $msg${RESET}"
  
  # Use read -p to display our formatted prompt
  read -p "$prompt_msg"
}