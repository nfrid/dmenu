static int topbar = 1;
static int fuzzy  = 1;
static const char* fonts[] = {
  "Iosevka nf:size=12",
  "Noto Color Emoji"
};
static const char* prompt                = NULL;
static const char* colors[SchemeLast][2] = {
  [SchemeNorm]          = { "#f8f8f2", "#282a36" },
  [SchemeSel]           = { "#f8f8f2", "#44475a" },
  [SchemeSelHighlight]  = { "#5af78e", "#44475a" },
  [SchemeNormHighlight] = { "#5af78e", "#282a36" },
  [SchemeOut]           = { "#6272a4", "#5af78e" },
};
static unsigned int lines = 0;
static unsigned int lineheight     = 23;
static unsigned int min_lineheight = 8;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
