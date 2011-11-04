(if window-system (progn
	;;ウィンドウ初期設定
	(setq initial-frame-alist '((width . 96)(height . 32)
				    (top . 0)(left . 48)))
	(set-background-color "Black")
	(set-foreground-color "white")
;;	(set-cursor-color "Gray")

	;; ウィンドウを半透明にする
	(set-frame-parameter nil 'alpha 85)

	;; Macのキーバインドを使う。optionをメタキーにする。
	(mac-key-mode 1)
	(setq mac-option-modifier 'meta)

	;; シフト + 矢印で範囲選択
	(setq pc-select-selection-keys-only t)
	(pc-selection-mode 1)

	;; フォント設定
	(if (eq window-system 'mac) (require 'carbon-font))
	(fixed-width-set-fontset "hirakaku_w3" 12)
	(setq fixed-width-rescale nil)
	;; --ここまで--
))

;; 起動時の画面はいらない
(setq inhibit-startup-message t)

;; バックアップファイルを作らない
(setq backup-inhibited t)
(setq make-bakup-files nil)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;; ロードパスの追加
(setq load-path (append
                 '("~/.emacs.d"
                   "~/.emacs.d/packages")
                 load-path))

;;; Localeに合わせた環境の設定
(set-locale-environment nil)

;;; キーバインド
(define-key global-map (kbd "C-h") 'delete-backward-char) ; 削除
(define-key global-map (kbd "M-?") 'help-for-help)        ; ヘルプ
(define-key global-map (kbd "C-z") 'undo)                 ; undo
(define-key global-map (kbd "C-c i") 'indent-region)      ; インデント
(define-key global-map (kbd "C-c C-i") 'hippie-expand)    ; 補完
(define-key global-map (kbd "C-c ;") 'comment-dwim)       ; コメントアウト
(define-key global-map (kbd "C-o") 'toggle-input-method)  ; 日本語入力切替
(define-key global-map (kbd "M-C-g") 'grep)               ; grep
(define-key global-map (kbd "C-[ M-C-g") 'goto-line)      ; 指定行へ移動

;;
;; display linum
;;
(require 'linum)
(setq linum-format "%5d")
(global-linum-mode t)
(setq line-number-mode t)

;; タブキー
(setq default-tab-width 4)
(setq indent-line-function 'indent-relative-maybe)

;;; 対応する括弧を光らせる。
(show-paren-mode 1)
;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)

;;; 行末の空白を表示
(setq-default show-trailing-whitespace t)

;;; 現在行を目立たせる
(defface hlline-face
  '((((class color)
      (background dark))
     ;;(:background "dark state gray"))
     (:background "gray10"
                  :underline "gray24"))
    (((class color)
      (background light))
     (:background "gray10"
                  :underline "gray24"))
    (t ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
;;(setq hl-line-face 'underline)
(global-hl-line-mode)

;;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;;; カーソルの場所を保存する
(require 'saveplace)
(setq-default save-place t)

;;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq next-line-add-newlines nil)

;;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;;; 部分一致の補完機能を使う
;;; p-bでprint-bufferとか
(partial-completion-mode t)

;;; 補完可能なものを随時表示
;;; 少しうるさい
(icomplete-mode 1)

;;(defface my-face-r-1 '((t (:background "gray15"))) nil)
(defface my-face-b-1 '((t (:background "gray"))) nil)
(defface my-face-b-2 '((t (:background "gray26"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
;;(defvar my-face-r-1 'my-face-r-1)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("　" 0 my-face-b-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     ;;("[\r]*\n" 0 my-face-r-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;;(setq hl-line-face 'underline)
;;(global-hl-line-mode)

