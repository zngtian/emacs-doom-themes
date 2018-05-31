;;; doom-seti-theme.el --- inspired by Atom One Dark
(require 'doom-themes)

;;
(defgroup doom-seti-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-seti-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-seti-theme
  :type 'boolean)

(defcustom doom-seti-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-seti-theme
  :type 'boolean)

(defcustom doom-seti-comment-bg doom-seti-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-seti-theme
  :type 'boolean)

(defcustom doom-seti-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-seti-theme
  :type '(or integer boolean))

;;
(def-doom-theme doom-seti
  "A dark theme inspired by Atom One Dark"

  ;; name        default   256       16
  ((bg         '("#151718" nil       nil            ))
   (bg-alt     '("#1E2326" nil       nil            ))
   (base0      '("#0D1011" "black"   "black"        ))
   (base1      '("#171717" "#1e1e1e" "brightblack"  ))
   (base2      '("#26292A" "#2e2e2e" "brightblack"  ))
   (base3      '("#313536" "#262626" "brightblack"  ))
   (base4      '("#2F3C42" "#3f3f3f" "brightblack"  ))
   (base5      '("#41535B" "#525252" "brightblack"  ))
   (base6      '("#858D8A" "#6b6b6b" "brightblack"  ))
   (base7      '("#d4d7d6" "#979797" "brightblack"  ))
   (base8      '("#FFFFFF" "#dfdfdf" "white"        ))
   (fg         '("#d4d7d6" "#2d2d2d" "white" "#bfbfbf" "brightwhite"  ))
   (fg-alt     '("#d4d7d6" "#2d2d2d" "white"        ))

   (grey       base4)
   (red        '("#CE4045" "#ff6655" "red"          ))
   (orange     '("#D98E48" "#dd8844" "brightred"    ))
   (green      '("#9FCA56" "#99bb66" "green"        ))
   (teal       '("#7494a3" "#44b9b1" "brightgreen"  ))
   (yellow     '("#DCCD69" "#ECBE7B" "yellow"       ))
   (blue       '("#55B5DB" "#51afef" "brightblue"   ))
   (dark-blue  '("#4F99D3" "#2257A0" "blue"         ))
   (magenta    '("#f55385" "#c678dd" "magenta"      ))
   (violet     '("#A074C4" "#a9a1e1" "brightmagenta"))
   (cyan       '("#75E5F4" "#46D9FF" "brightcyan"   ))
   (dark-cyan '("#75E5F4" "#5699AF" "cyan"))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   (doom-darken base1 0.2))
   (selection      dark-blue)
   (builtin        blue)
   (comments       (if doom-seti-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if doom-seti-brighter-comments dark-cyan base5) 0.25))
   (constants      red)
   (functions      teal)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        base7)
   (variables      base8)
   (numbers        magenta)
   (region         base2)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-seti-brighter-modeline)
   (-modeline-pad
    (when doom-seti-padded-modeline
      (if (integerp doom-seti-padded-modeline) doom-seti-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        (doom-darken blue 0.475)
      `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken blue 0.45)
      `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg-alt 0.1))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-seti-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-code-face :background (doom-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden))


  ;; --- extra variables ---------------------
  ;; ()
  )

;;; doom-seti-theme.el ends here