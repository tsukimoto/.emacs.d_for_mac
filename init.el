;; Command-Key and Option-Key
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

; 言語を日本語にする
(set-language-environment 'Japanese)
; 極力UTF-8とする
(prefer-coding-system 'utf-8)

;;; [-1]メモ
;; windows版のEmacsを使う場合はcygwinを使う。
;; emacs-twitter-modeはインストールしていない。
;; ネット系は省いている。
(define-key global-map "\C-o" 'toggle-input-method)

;;; [0].emacsをアップデート用
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (define-key emacs-lisp-mode-map (kbd "C-c c") 
	      'eval-current-buffer)))
(add-hook 'c-mode-common-hook
	  (lambda ()
	    (define-key c-mode-map (kbd "C-c c")
	      'compile)))
(add-hook 'org-mode-hook
	  (lambda ()
	    (define-key org-mode-map (kbd "C-j")
	      'org-return)))
(add-hook 'ruby-mode-hook
	  (lambda ()
	    (define-key ruby-mode-map "\C-cc"
	      'executable-interpret)))


;;; [1]elispアップデート用

;; 有効なもの(初期はauto-install.elをインストールする必要がある)
;; auto-installの初期のインストール
;; $ mkdir -p ~/.emacs.d/auto-install
;; $ cd ~/.emacs.d/auto-install
;; $ wget http://www.emacswiki.org/emacs/download/auto-install.el
;; $ emacs --batch -Q -f batch-byte-compile auto-install.el

;; $ mkdir ~/.emacs.d/insert
;; $ mkdir ~/.emacs.d/umemo
;; $ mkdir ~/.emacs.d/plugins
;; $ mkdir ~/.emacs.d/auto-save-list

;; 日本語infoの導入
;; $ cd
;; $ wget -O- http://www.rubyist.net/~rubikitch/archive/emacs-elisp-info-ja.tgz | tar xzvf -
;; $ sudo emacs /usr/share/info/dir
;; * Elisp-ja: (elisp-ja).        Emacs Lisp Refernce Manual(Japanese).
;; * Emacs-ja: (emacs-ja).        The extensible self-documenting text editor(Japanese).

;; 以下、インストールするelispの行で C-e C-x C-eでダウンロード
;; →C-c C-cでインストールしていく。
;; <i> 「emacsテクニックバイブル」でインストールしたもの
;; (install-elisp-from-emacswiki "auto-install.el")
;; (install-elisp-from-emacswiki "install-elisp.el")
;; (install-elisp-from-emacswiki "auto-async-byte-compile.el")
;; (install-elisp "http://tromey.com/elpa/package-install.el")
;; (install-elisp-from-emacswiki "sticky.el")
;; (install-elisp-from-emacswiki "key-chord.el") 
;; (install-elisp "https://raw.github.com/imakado/emacs-smartchr/master/smartchr.el")
;; or smartchr.elを直接インストール
;; (install-elisp-from-emacswiki "recentf-ext.el")
;; (install-elisp-from-emacswiki "tempbuf.el")
;; (install-elisp "http://homepage3.nifty.com/oatu/emacs/archives/auto-save-buffers.el")
;; (install-elisp "http://homepage1.nifty.com/bmonkey/emacs/elisp/screen-lines.el")

;; About migemo.el
;; http://www.ruby-lang.org/からrubyをインストール
;; http://0xcc.net/migemo/からmigemoをダウンロード
;; サイトの情報からmigemoをインストールする

;; (install-elisp-from-emacswiki "point-undo.el") 
;; (install-elisp "http://cvs.savannah.gnu.org/viewvc/*checkout*/bm/bm/bm.el")
;; (install-elisp-from-emacswiki "goto-chg.el")
;; (install-elisp-from-emacswiki "redo+.el")
;; (install-elisp "http://taiyaki.org/elisp/sense-region/src/sense-region.el")

;; About yasnippet.el
;; http://code.google.com/p/yasnippet/からyasnippet-0.6.1c.tar.bz2をダウンロードする
;; 展開し、yasnippet-0.6.cディレクトリを~/.emacs.d/plugins以下に移動する
;; (install-elisp-from-emacswiki "yasnippet-config.el")

;; About auto-complete.el関連
;; M-x auto-install-batch auto-complete TAB

;; (install-elisp-from-emacswiki "occur-schroeder.el")
;; (install-elisp-from-emacswiki "color-moccur.el")
;; (install-elisp-from-emacswiki "moccur-edit.el")
;; (install-elisp-from-emacswiki "igrep.el")
;; (install-elisp-from-emacswiki "grep-a-lot.el")
;; (install-elisp-from-emacswiki "grep-edit.el")
;; (auto-install-batch "col-highlight")
;; (auto-install-batch "crosshairs")
;; (install-elisp-from-emacswiki "shell-pop.el")
;; (install-elisp "http://namazu.org/~tsuchiya/elisp/shell-command.el")
;; (install-elisp-from-emacswiki "multi-shell.el")
;; (install-elisp-from-emacswiki "shell-history.el")
;; (install-elisp-from-emacswiki "multi-term.el")
;; (install-elisp "http://taiyaki.org/elisp/mell/src/mell.el")
;; (install-elisp "http://taiyaki.org/elisp/text-adjust/src/text-adjust.el")
;; (install-elisp-from-emacswiki "viewer.el")
;; (install-elisp "http://mumble.net/~campbell/emacs/paredit.el")
;; (install-elisp-from-emacswiki "eldoc-extension.el")
;; (install-elisp-from-emacswiki "c-eldoc.el")
;; (install-elisp-from-emacswiki "usage-memo.el")
;; (install-elisp-from-emacswiki "lispxmp.el")
;; (install-elisp "http://mwolson.org/static/dist/elisp/edit-list.el")
;; (auto-install-batch "el-expectations")
;; (install-elisp-from-emacswiki "open-junk-file.el")
;; (install-elisp-from-emacswiki "summarye.el")
;; (auto-install-batch "text translator")
;; (install-elisp "https://github.com/ataka/html-fold/raw/master/html-fold.el")
;; (install-elisp "http://www.dur.ac.uk/p.j.heslin/Software/Emacs/Download/fold-dwim.el")
;; (install-elisp-from-emacswiki "ipa.el")
;; (install-elisp-from-emacswiki "multiverse.el")

;; orgモードを有効にするために
;; $ mkdir ~/memo/しておく。

;; (auto-install-batch "anything")
;; (install-elisp "http://svn.coderepos.org/share/lang/elisp/anything-c-moccur/trunk/anything-c-moccur.el")
;; (install-elisp "http://nschum.de/src/emacs/split-root/split-root.el")

;;; お気に入りEmacsLisp(Emacsテクニックバイブル外)
;; (install-elisp "http://www.gentei.org/~yuuji/software/windows.el")
;; (install-elisp "http://www.gentei.org/~yuuji/software/revive.el")
;; (install-elisp "http://www.bookshelf.jp/pukiwiki/pukiwiki.php?plugin=attach&refer=%A5%A2%A5%A4%A5%C7%A5%A2%BD%B8%2Fpukiwiki-mode&openfile=pukiwiki-mode.el")
;; (install-elisp "http://www.bookshelf.jp/elc/http.el")
;; (install-elisp-from-emacswiki "hideshowvis.el")
;; (install-elisp-from-emacswiki "mic-paren.el")

;;; [2]emacsのデフォルト分割ウインドウをなくす
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;;; [3]コマンドキーを編集
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map "\C-z" 'undo)
;(define-key global-map "\M-N" 'other-window)
;(define-key global-map "\M-P" 'other-window)
;(define-key global-map (kbd "C-S-n") 'other-window)
;(define-key global-map (kbd "C-S-p") 'other-window)
(defun other-window-backward ()
  "Select the fprevious window."
  (interactive)
  (other-window -1))
(defun split-window-vertically-and-other-window ()
  (interactive)
  (split-window-vertically)
  (other-window 1))
(defun split-window-horizontally-and-other-window ()
  (interactive)
  (split-window-horizontally)
  (other-window 1))
(define-key global-map (kbd "C-S-o") 'split-window-vertically-and-other-window)
(define-key global-map (kbd "C-S-e") 'split-window-horizontally-and-other-window)
(define-key global-map (kbd "C-S-n") 'other-window)
(define-key global-map (kbd "C-S-p") 'other-window-backward)
(define-key global-map (kbd "C-S-d") 'delete-window)
;; (windmove-default-keybindings)
;; (global-set-key (kbd "C-S-p") (quote windmove-up))
;; (global-set-key (kbd "C-S-n") (quote windmove-down))
;; (global-set-key (kbd "C-S-f") (quote windmove-right))
;; (global-set-key (kbd "C-S-b") (quote windmove-left))
;; VNC+Xkeymacs用のelisp
;(define-key global-map [(control x) (right)] 'find-file)
;; ウインドウ移動用
;; (defun other-window-or-split ()
;;   (interactive)
;;   (when (one-window-p) (split-window-vertically))
;;   (other-window 1))
;; (global-set-key (kbd "C-t") 'other-window-or-split)
;; バッファ一覧移動用
(defun list-buffers-and-other-window ()
  (interactive)
  (list-buffers)
  (other-window 1))
(global-set-key "\C-x\C-b" 'list-buffers-and-other-window)
;; コメント
(define-key global-map "\C-c;" 'uncomment-region)


;;; [4]emacsに存在する各種モード選択
;; C-kで改行を含めた行全体を切り取り
(setq kill-whole-line t)
;; クリップボードにコピー
(cond (window-system
       (setq x-select-enable-clipboard t)
       ))
;; 現在行に色を付ける
;; (global-hl-line-mode 1)
;; 色
;; (set-face-background 'hl-line "darkolivegreen")
;; 履歴を次回Emacs起動時にも保存する
(savehist-mode 1)
;; ファイル内のカーソル位置を記憶するn
(setq-default save-place t)
(require 'saveplace)
;; 対応するカッコを表示させる
(show-paren-mode 1)
;; モードラインに時刻を表示する
(display-time)
;; 行番号・桁番号を表示する
(line-number-mode 1)
(column-number-mode 1)
;; リージョンに色をつける
(transient-mark-mode t)
;; GCを減らして軽くする(デフォルトの10倍)
;; 現在のマシンパワーではもっと大きくしてもよい
;(setq gc-cons-threshold (* 10 gc-cons-threshold))
(setq gc-cons-threshold '4000000)
;(+ 0 gc-cons-threshold)
;; ログの記録行数を増やす
(setq message-log-max 10000)
;; ミニバッファを再帰的に呼び出せるようにする
(setq enable-recursive-minibuffers t)
;; ダイアログをボックスを使わないようにする
(setq use-dialog-box nil)
(defalias 'message-box 'message)
;; 履歴をたくさん保存する
(setq history-length 1000)
;; キーストロークをエコーエリアに早く表示する
(setq echo-keystrokes 0.1)
;; 大きいファイルを開こうとしたときに警告を発生させる
;; デフォルトは10MBなので25MBに拡張する
;(setq large-file-warning-threshold (* 25 1024 1024))
;; ミニバッファで入力を取り消しても履歴に残す
;; 誤って取り消して入力が失われるのを防ぐため
(defadvice abort-recursive-edit (before minibuffer-save activate)
  (when (eq (selected-window) (active-minibuffer-window))
    (add-to-history minibuffer-history-variable (minibuffer-contents))))
;; yesと入力するのは面倒なのでyで十分
(defalias 'yes-or-no-p 'y-or-n-p)
;; ツールバーとスクロールバーを消す
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; ミニバッファのコマンドを補完する
(icomplete-mode 1)


;;; [5]emacs見栄え
(add-to-list 'default-frame-alist '(foreground-color . "White"))
(add-to-list 'default-frame-alist '(background-color . "Black"))
(add-to-list 'default-frame-alist '(cursor-color . "Green"))


;; ;;; [6]elispを導入
(add-to-list 'load-path "~/.emacs.d/")
(require 'install-elisp)
;(require 'auto-async-byte-compile)
;; 自動バイトコンパイルを無効にするファイル名の正規表現
;(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
;(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
;(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)


;;; [7]auto-install関連
;; auto-installによってインストールされるEmacs Lispをロードパスに加える
;; デフォルトは ~/.emacs.d/auto-install/
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(require 'auto-install)
;; 起動時にEmacsWikiのページ名を補完候補に加える
(auto-install-update-emacswiki-package-name t)
;; install-elisp.el互換モードにする
(auto-install-compatibility-setup)
;; ediff関連のバッファを１つのフレームにまとめる
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;; [8]This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

; (require 'sticky)
; (use-sticky-key ";" sticky-alist:ja)

;; (add-to-list 'Info-directory-list "~/info")

;; smartchr.elの設定
(require 'smartchr)
(global-set-key (kbd "{")(smartchr '("{`!!'}" "{")))
(global-set-key (kbd "(")(smartchr '("(`!!')" "(")))
(global-set-key (kbd "[")(smartchr '("[`!!']" "[")))
(global-set-key (kbd "\"")(smartchr '("\"`!!'\"" "\"")))
(global-set-key (kbd "\'")(smartchr '("\'`!!'\'" "\'")))
(defun my-smartchr-setting ()
  (local-set-key (kbd "\"") (smartchr '("\"`!!'\"" "\"")))
  (local-set-key (kbd "'") (smartchr '("'`!!''" "'")))
  (local-set-key (kbd "(") (smartchr '("(`!!')" "(")))
  (local-set-key (kbd "{") (smartchr '("{ `!!' }" "{\n`!!'\n}" "{")))
  (local-set-key (kbd "[") (smartchr '("[`!!']" "[")))
  )
(add-hook 'c-mode-hook 'my-smartchr-setting)
(add-hook 'c++-mode-hook 'my-smartchr-setting)


;;; [9]Chapter4ファイル・バッファ関連

;;; 現在位置のファイル・URLを開く[4.1]
(ffap-bindings)

;;; ファイル名がかぶった場合にバッファ名をわかり易くする[4.2]
(require 'uniquify)
;; filename<dir> 形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; *で囲まれたバッファ名は対象外にする
(setq uniquify-ignore-buffers-re "[^*]+*")

;;;バッファ切り替えを強化する[4.3]
(iswitchb-mode 1)
;; バッファ読み取り関数を iswitchb にする
(setq read-buffer-function 'iswitchb-read-buffer)
;; 部分文字列の代わりに正規表現を使う場合は t に設定する
(setq iswitchb-regexp nil)
;; 新しいバッファを作成するときにいちいち効いてこない
(setq iswitchb-prompt-newbuffer nil)
(ido-mode 1)
(ido-everywhere 1)

;;; 最近使ったファイルを開く[4.4]
;; 最近のファイル500個を保存する
(setq recentf-max-saved-items 500)
;; 最近使ったファイルに加えないファイルを正規表現で指定する
(setq recentf-exclude '("/TAGS$" "/var/tmp/"))
(require 'recentf-ext)

;;; ファイル内の特定の位置をブックマークする[4.5]
;; ブックマークを変更したら即保存する
(setq bookmark-save-flag 1)
;; 超整理法(好みに応じて)
(progn
  (setq bookmark-sort-flag nil)
  (defun bookmark-arrange-latest-top ()
    (let ((latest (bookmark-get-bookmark bookmark)))
     (setq bookmark-alist (cons latest (delq latest bookmark-alist))))
    (bookmark-save))
  (add-hook 'bookmark-after-jump-hook 'bookmark-arrange-latest-top))

;;; シェルから現在のEmacsにアクセスする[4.6]
;; emacsclient
;; (server-start)
;; (defun iconify-emacs-when-server-is-done ()
;;   (unless server-clients (iconify-frame)))
;; ;; 編集が終了したらEmacsをアイコン化する(好みに応じて)
;; (add-hook 'server-done-hook 'iconify-emacs-when-server-is-done)
;; ;; C-x C-cに割り当てる(好みに応じて)
;; (global-set-key (kbd "C-x C-c") 'server-edit)
;; ;; M-x exitでEmacsを終了できるようにする
;; (defalias 'exit 'save-buffers-kill-emacs)

;;; 使わないバッファを自動的に消す[4.7]
(require 'tempbuf)
;; ファイルを開いたら自動的にtempbufを有効にする
(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
;; diredバッファに対してtempbufを有効にする
;(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)

;; ;;; ファイルを自動保存する[4.8]
;; (require 'auto-save-buffers)
;; (run-with-idle-timer 2 t 'auto-save-buffers) ;アイドル2秒で保存

;;; magit.el[4.11]
;; (add-to-list 'load-path "~/gittest/magit") ;magit.elが存在するディレクトリを指定する
;; (require 'magit)

;;; ディレクトリ内のファイル名を自由自在に編集する
;(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)


;;; [10]Chapter5カーソル移動

;;; 見かけの行でカーソルを移動する[5.3]
(require 'screen-lines)
;; text-modeかそれを継承したメジャーモードで自動的に有効にする
(add-hook 'text-mode-hook 'turn-on-screen-lines-mode)

;;; ローマ字のまま日本語をインクリメンタルサーチする[5.5]
;; http://www.ruby-lag.org/からrubyをインストール
;; http://0xcc.net/migemo/からmigemoをダウンロード
;; サイトの情報からmigemoをインストールする
;; (require 'migemo)
;; (setq migemo-command "cmigemo")
;; (setq migemo-options '("-q" "--emacs"))
;; ;; migemo-dict のパスを指定
;; (setq migemo-dictionary "/usr/local/share/migemo/euc-jp/migemo-dict")
;; (setq migemo-user-dictionary nil)
;; (setq migemo-regex-dictionary nil)

;;; カーソル位置を戻す[5.6]
(require 'point-undo)
(define-key global-map (kbd "<f7>") 'point-undo)
(define-key global-map (kbd "S-<f7>") 'point-redo)

;;; カーソルに目に見える印をつける[5.7]
;; (setq-default bm-buffer-persistence nil)
;; (setq bm-restore-repository-on-load t)
;; (require 'bm)
;; (add-hook 'find-file-hooks 'bm-buffer-restore)
;; (add-hook 'kill-buffer-hook 'bm-buffer-save)
;; (add-hook 'after-save-hook 'bm-buffer-save)
;; (add-hook 'after-revert-hook 'bm-buffer-restore)
;; (add-hook 'vc-before-checkin-hook 'bm-buffer-save)
;; (global-set-key (kbd "S-SPC") 'bm-toggle)
;; (global-set-key (kbd "M-[") 'bm-previous)
;; (global-set-key (kbd "M-]") 'bm-next)

;;; 最後の変更箇所にジャンプする[5.8]
(require 'goto-chg)
(define-key global-map (kbd "<f8>") 'goto-last-change)
(define-key global-map (kbd "S-<f8>") 'goto-last-change-reverse)


;;; [11]Chapter6入力支援

;;; ファイル作成時にテンプレートを挿入する[6.1]
(auto-insert-mode)
;; 最後の / は必須
(setq auto-insert-directory "~/.emacs.d/insert/")
(define-auto-insert "\\.rb$" "ruby-template.rb")
(define-auto-insert "\\.cpp$" "cpp-template.cpp")

;;; 「やり直し」をカイゼンする[6.2]
;; (require 'redo+)
;; (global-set-key (kbd "M-z") 'redo)
;; (setq undo-no-redo t) ; 過去のundoがredoされないようにする
;; ;; 大量のundoに耐えられるようにする
;; (setq undo-limit 600000)
;; (setq undo-strong-limit 900000)

;; ;;; 矩形を選択しやすくする[6.3]
;; (require 'sense-region)
;; (sense-region-on)

;; 略語から定型文を入力する[6.5]
;; http://code.google.com/p/yasnippet/からyasnippet-0.6.1c.tar.bz2をダウンロードする
;; tar lxvf yasnippet-0.6.1.tar.bz2で展開
;; yasnippet-0.6.cディレクトリを~/.emacs.d/plugins以下に移動する
;; M-x install-elisp-from-emacswiki yasnippet-config.el

;; <emacsテクニックバイブルの設定>
;; (require 'yasnippet-config)		
;; ;; 推奨設定は長いのでyas / setup関数にまとめている
;; (yas/setup "/home/robotics/.emacs.d/plugins/yasnippet-0.6.1c/")

;; <ネットで見つけた設定>
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet/")
;; (require 'yasnippet)
;; (yas/initialize)
;; (yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets/")

;; ;;; 新規作成ファイルに自動でスニペットを展開する[6.8]
(require 'yasnippet-config)
;; (yas/setup "~/.emacs.d/plugins/yasnippet")
;; (auto-insert-mode)
;; (setq auto-insert-directory "~/.emacs.d/insert/")
;; (defun insert-c-header-template ()
;;   (interactive)
;;   (yas/expand-snippet (point) (point)
;;    "#ifndef ${1:_`(upcase (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))`_H_}
;; #define $1

;; $0

;; #endif /* $1 */"))
;; ;; 関数名(コマンド名)を指定する
;; (define-auto-insert "\\.h$" 'insert-c-header-template)
(define-auto-insert "\\.h$" (lambda () (insert "once")(yas/expand)))

;;; スニペットをその場で定義して使う[6.9]
;; (require 'yasnippet-config)
;; (yas/setup "~/.emacs.d/plugins/yasnippet-0.6.1c")
(global-set-key (kbd "C-x y") 'yas/register-oneshot-snippet)
(global-set-key (kbd "C-x C-y") 'yas/expand-oneshot-snippet)

;;; 略語展開・補完を行うコマンドをまとめる
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially      ;ファイル名の一部
        try-complete-file-name	              ;ファイル名全体
        try-expand-all-abbrevs	              ;静的略語展開
        try-expand-dabbrev                    ;動的略語展開(カレントバッファ)
        try-expand-dabbrev-all-buffers        ;動的略語展開(全バッファ)
        try-expand-dabbrev-from-kill　　　　　;動的略語展開(キルリング)
        try-complete-lisp-symbol-partially    ;Lispシンボル名の一部
        try-complete-lisp-symbol              ;Lispシンボル名全体
        ))
(global-set-key (kbd "M-\\") 'hippie-expand)

;;; キーボードマクロをコマンド化する[6.12]
(defvar kmacro-save-file "~/.emacs"
  "キーボードマクロを保存するファイル。
~/.emacs.elや~/.emacs.d/init.elを使っている場合は書き換える。")
(defun kmacro-save (symbol)
  (interactive "SName for last kbd macro: ") ;定義するコマンド名を入力
  (name-last-kbd-macro symbol)		     ;最後に定義したマクロに名前をつける。
  (with-current-buffer (find-file-noselect kmacro-save-file)
    (goto-char (point-max))		;.emacsの末尾に
    (insert-kbd-macro symbol)		;保存する
    (basic-save-buffer)))

;; 現在行を削除するマクロ
(fset 'kill-this-line
   "\C-a\C-k")
(global-set-key (kbd "M-K") 'kill-this-line)

;;; IDEのような入力支援をする[6.14]
(require 'auto-complete-config)
(global-auto-complete-mode 1)
;; elisp編集時のauto-completeの設定
(defun emacs-lisp-ac-setup ()
  (setq ac-sources '(ac-source-words-in-same-mode-buffers ac-source-symbols)))
(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-ac-setup)
(defun c++-ac-setup ()
  (setq ac-sources '(ac-source-words-in-same-mode-buffers)))
;; 参考(http://cx4a.org/software/auto-complete/manual.ja.html)


;;; [12]Chapter7検索置換

;;; インクリメンタルサーチからマッチ行一覧を作成する[7.3]
(require 'occur-schroeder)
(define-key isearch-mode-map (kbd "M-s o") 'isearch-occur)

;;; 文字列を置換する[7.4]
;; \C-u \M-% と押すと、単語ごとの変換になる
(global-set-key (kbd "C-c r") 'query-replace)

;;; 正規表現置換をする[7.5]
(defalias 'qrr 'query-replace-regexp)

;;; バッファ内(複数可)を検索する[7.6]
(require 'color-moccur)
(setq moccur-split-word t)  ; スペースで区切られた複数の単語にマッチさせる

;;; color-moccur.elの結果を編集する
(require 'moccur-edit)
;; その他color-moccur.elの設定を

;;; grepのコマンドラインを打たずにgrep検索する[7.9]
(require 'igrep)
;; lgrepに-0u8オプションをつけると出力がUTF-8になる
(igrep-define lgrep (igrep-use-zgrep nil) (igrep-regex-option "-n -Ou8"))
(igrep-find-define lgrep (igrep-use-zgrep nil) (igrep-regex-option "-n -Ou8"))

;;; 複数の*grep*バッファを使う[7.10]
(require 'grep-a-lot)
(grep-a-lot-setup-keys)
;; igrepを使う人向け
(grep-a-lot-advise igrep)

;;; grep検索結果を編集する[7.11]
(require 'grep-edit)


;;; [13]Chapter8Emacsをもっと便利に

;;; 現在桁をハイライトする[8.1]
;(require 'col-highlight)
;;; 1、2のうちのとれかを選ぶ
;; 1: 常にハイライトする場合
;(column-highlight-mode 1)
;; 2:何もしないでいるとハイライトを始めるようにする場合
;; (toggle-highlight-column-when-idle 1)
;; (col-highlight-set-interval 3)
;(require 'crosshairs)
;(crosshairs-mode 1) ;常に有効にする
;(crosshairs-toggle-when-idle 1)
;(crosshairs-flash 2)

;;; 正規表現にマッチした部分を自動ハイライトする[8.2]
;; \M-x highlight-regexp

;;; Webブラウザとして利用する[8.4]
;; (require 'w3m-load)


;;; [14]Chapter9外部プログラム

;;; Emacsでシェルを動かす[9.1]
;; エスケープシーケンスによる色がつくようになる
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; パスワードのプロンプトを認識し、入力時はミニバッファで伏せ字になる。
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

(require 'shell-pop)
(shell-pop-set-internal-mode "shell") ; "terminal","ansi-term","eshell"も可
(shell-pop-set-internal-mode-shell "/bin/zsh")
(global-set-key [f8] 'shell-pop)

;; emacs22用の設定
;(require 'shell-command)
;(shell-command-completion-mode)

;;; 複数のshellバッファを利用する[9.4]
(require 'multi-shell)
;; 指定しないと環境変数SHELLのシェルが使われる
(setq multi-shell-command "/bin/zsh")

(setq diff-switches "-u")

;;; Emacs内のシェルコマンド実行履歴を保存する[9.8]
(require 'shell-history)

;;; Emacs内で端末エミュレータを利用する[9.9]
(require 'multi-term)
;;; 快適に使うためには、以下の2変数を調整する必要がある
(setq term-unbind-key-list '("C-x" "C-c" "<ESC>"))
;; 以下のコマンドを使えるようにする。
(setq term-bind-key-alist
      '(("C-c C-c" . term-interrupt-subjob)
	("C-m" . term-send-raw)
	("M-f" . term-send-forward-word)
	("M-b" . term-send-backward-word)
	("M-o" . term-send-back)
	("M-p" . term-send-up)
	("M-n" . term-send-down)
	("M-M" . term-send-forward-kill-word)
	("M-N" . term-send-backward-kill-word)
	("M-r" . term-send-reverse-search-history)
	("M-," . term-send-input)
	("M-." . comint-dynamic-complete)))

;;; [15]Chapter10テキスト整形／テキスト処理

;;; 日本語の文章を整形する[10.1]
;;(require 'text-adjust)

;;; 矩形コマンド[10.3]
;; C-x r t, C-x r k, C-x r d, C-x r y

;;; [16]Chapter11 view-modeを徹底活用

;;; view-modeでファイルを開く[11.1]
(setq view-read-only t)

;;; view-modeを有効・無効にする
;(define-key global-map  'view-mode)
(defun view-mode-start ()
  (interactive)
  (view-mode 1))
(defun view-mode-end ()
  (interactive)
  (view-mode nil))
(define-key global-map [(escape)] 'view-mode-start)

;;; view-modeのキー割り当てを変更する[11.3]
(require 'view)
(defun View-goto-line-last (&optional line)
  "goto last line"
  (interactive "P")
  (goto-line (line-number-at-pos (point-max))))
(defun View-goto-line-first (&optional line)
  "goto first line"
  (interactive "P")
  (goto-line (line-number-at-pos (point-min))))
(fset 'open-line-and-viem-mode-end
   "\C-g\C-e\C-j")
;; less 感覚の操作
(define-key view-mode-map (kbd "N") 'View-search-last-regexp-backward)
(define-key view-mode-map (kbd "?") 'View-search-regexp-backward )
(define-key view-mode-map (kbd "G") 'View-goto-line-last)
(define-key view-mode-map (kbd "g") 'View-goto-line-first)
(define-key view-mode-map (kbd "b") 'View-scroll-page-backward)
(define-key view-mode-map (kbd "f") 'View-scroll-page-forward)
;; vi/w3m 感覚の操作
(define-key view-mode-map (kbd "h") 'backward-char)
(define-key view-mode-map (kbd "j") 'next-line)
(define-key view-mode-map (kbd "k") 'previous-line)
(define-key view-mode-map (kbd "l") 'forward-char)
(define-key view-mode-map (kbd "J") 'View-scroll-line-forward)
(define-key view-mode-map (kbd "K") 'View-scroll-line-backward)
(define-key view-mode-map (kbd "i") 'view-mode-end)
(define-key view-mode-map (kbd "a") 'view-mode-end)
(define-key view-mode-map (kbd "C-g") 'view-mode-end)
(define-key view-mode-map (kbd "o") 'open-line-and-viem-mode-end)
(define-key view-mode-map (kbd "w") 'forward-word)
(define-key view-mode-map (kbd "b") 'backward-word)

;; bm.elの設定
;; (require 'bm)
;; (define-key view-mode-map (kbd "m") 'bm-toggle)
;; (define-key view-mode-map (kbd "[") 'bm-previous)
;; (define-key view-mode-map (kbd "]") 'bm-next)

;;; 書き込み不能なファイルでview-modeから抜けないようにする[11.4]
(require 'viewer)
;; 書き込み不能ファイルでview-modeから抜けなくなる
(viewer-stay-in-setup)

;;; view-modeのときにmode-lineに色をつける[11.5]
(setq viewer-modeline-color-unwritable "tomato")
(setq viewer-modeline-color-view "orange")
(viewer-change-modeline-color-setup)

;;; メジャーモードに合わせてview-modeのキーバインドを設定する[11.6]
(define-overriding-view-mode-map c-mode
  ("RET" . gtags-find-tag-from-here))
(define-overriding-view-mode-map emacs-lisp-mode
  ("RET" . find-function-at-point))

;;; 特定のファイル・すべてのファイルをview-modeで開く
(setq view-mode-by-default-regexp "\\.log$")

;;; [17]Chapter12 Emacs Lispプログラミング支援
;;; カッコの対応を取りながらS式を編集する[12.3]
;; (require 'paredit)
;; (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
;; (add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook 'enable-paredit-mode)
;; (add-hook 'ielm-mode-hook 'enable-paredit-mode)

;;; Emacs Lisp関数・変数のヘルプをエコーエリアに表示する[12.4]
;; (require 'eldoc-extension)		;拡張版
;; (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
;; (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
;; (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
;; (setq eldoc-idle-delay 0.2)		;すぐに表示したい
;; (setq eldoc-minor-mode-string "")	;モードラインにElDocと表示しない

;; (require 'c-eldoc)
;; (add-hook 'c-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'eldoc-idle-delay) 0.20)
;;             (c-turn-on-eldoc-mode)
;;             ))
;; (add-hook 'c++-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'eldoc-idle-delay) 0.20)
;;             (c-turn-on-eldoc-mode)
;;             ))

;;; 関数定義へジャンプする[12.5]
(find-function-setup-keys)

;;; *Help*バッファにメモを書き込めるようにする[12.6]
(require 'usage-memo)
(setq umemo-base-directory "~/.emacs.d/umemo") ;メモを保存するディレクトリ
(umemo-initialize)

;; Emacs Lisp式の値をコメントで注釈する[12.11]
(require 'lispxmp)

;;; リスト変数の内容を編集する
(require 'edit-list)

;; ユニットテストを書く
;; (require 'el-expectations)

(defun screen-paste ()
  (interactive)
  (call-process "screen" nil nil nil "-X" "writebuf" "/tmp/screen-exchange")
  (sleep-for 0.05) ; /tmp/screen-exchangeに書き込まれるまで待ち
  (insert-file "/tmp/screen-exchange")
  (exchange-point-and-mark))

;;; [18]Chapter13プログラミング／文書作成支援

;;; 使い捨てのファイルを開く[13.1]
(require 'open-junk-file)
;; ファイル名入力時に ~/junk/年-月-日-時分秒. が出てくる
(setq open-junk-file-format "~/junk/%Y/%m-%d-%H%M%S.")

;;; バッファのサマリを表示する[13.2]
(require 'summarye)

;;; 言語を自動判別して複数のWeb翻訳サービスを同時に使う[13.3]
;;(require 'text-translator)
;;(setq text-translator-auto-selection-func
;;      'text-translator-translate-by-auto-selection-enja)

;;; HTML・XMLの要素を隠して見栄えをよくする[13.4]
;(require 'html-fold)
;; 隠すインライン要素
;(setq html-fold-inline-list
;      '(
;	("[a:" ("a"))
;	("[c:" ("code"))
;	("[k:" ("kbd"))
;	("[v:" ("var"))
;	("[s:" ("samp"))
;	("[ab:" ("abbr" "acronym"))
;	("[lab:" ("label"))
;	("[opt:" ("option"))
	;; RSSの設定
;	("[rss:" ("rss"))
;	("[link:" ("link"))
;	))
;; 隠すブロック要素
;(setq html-fold-block-list
;      '("script" "style" "table"
	;; RSSの設定
;	"description" "content" ))
;; html-modeにしたらhtml-fold-modeを有効にする
;(add-hook 'html-mode-hook 'html-fold-mode)

;;; ２つのファイルの相違点をハイライトする[13.5]
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;; C言語のプリプロセッサを隠す[13.7]
(require 'hideif)
(add-hook 'c-mode-common-hook 'hide-ifdef-mode)

;;; ブロックを折畳む[13.8]
(require 'hideshow)
;(require 'fold-dwim)

;;; 現在の関数名を常に表示する[13.10]
(which-func-mode 1)
;; すべてのメジャーモードに対してwhich-func-modeを適用する
(setq which-func-mode t)
;; 画面上部に表示する場合は下の2行が必要
(delete (assoc 'which-func-mode mode-line-format) mode-line-format)
(setq-default header-line-format '(which-func-mode ("" which-func-format)))

;;; リアルタイムにプログラミング言語の文法チェックをする[13.11]
(add-hook 'c-mode-common-hook (lambda () (flymake-mode t)))

;;; ファイルに直接書き込まずにメモをする[13.12]
(require 'ipa)

;;; ファイルのスナップショットを取る[13.13]
(require 'multiverse)

;;; GNU GLOBALでソースコード解析を楽にする[13.15]
;; (require 'gtags)
;; (add-hook 'c-mode-common-hook 'gtags-mode)
;; (add-hook 'c++-mode-hook 'gtags-mode)
;; (add-hook 'java-mode-hook 'gtags-mode)
;; (setq gtags-path-style 'relative) ; ファイル名の部分を短くしたい人は相対パスがおすすめ
;; (setq view-read-only t)           ; 読み込み専用バッファを自動的にview-modeにする
;; (setq gtags-read-only t)	  ; 上と合わせることで、タグジャンプ先をview-modeにする。

;;; [19]Chapter14 org-mode〜統合文書作成環境

;;; 1階層下・上の見出し・項目を入力する[14.2]
(require 'org)
(defun org-insert-upheading (arg)
  "1レベル上の見出しを入力する。"
  (interactive "P")
  (org-insert-heading arg)
  (cond ((org-on-heading-p) (org-do-promote))
	((org-at-item-p) (org-indent-item -1))))
(defun org-insert-heading-dwim (arg)
  "現在と同じレベルの見出しを入力する。
C-uをつけると1レベル上、C-u C-uをつけると1レベル下の見出しを入力する。"
  (interactive "P")
  (case arg
    (4 (org-insert-subheading nil))	;C-u
    (16 (org-insert-upheading nil))	;C-u C-u
    (t (org-insert-heading nil))))
(define-key org-mode-map (kbd "<C-return>") 'org-insert-heading-dwim)

;;; 瞬時にメモを取る[14.4]
(org-remember-insinuate)		;org-rememberの初期化
;; メモを格納するorgファイルの設定
(setq org-directory "~/memo/")
(setq org-default-notes-file (expand-file-name "memo.org" org-directory))
;; テンプレートの設定
(setq org-remember-templates
      '(("Note" ?n "** %?\n    %i\n    %a\n    %t" nil "Inbox")
        ("Todo" ?t "** TODO %?\n    %i\n    %a\n    %t" nil "Inbox")))
;; Select template: [n]ote [t]odo
 (global-set-key (kbd "C-t") 'org-remember)

;;; 表を作成する[14.5]
;; 他のモードでも有効にする
;; いらないコマンド
;; (add-hook 'c-mode-common-hook 'turn-on-orgtbl)
;; (add-hook 'emacs-lisp-mode-hook 'turn-on-orgtbl)

;;; TODOリストを作成する[14.6]
(setq org-use-fast-todo-selection t)
 (setq org-todo-keywords
      '((sequence "TODO(t)"  "STARTED(s)"  "WAITING(w)" "|" "DONE(x)" "CANCEL(c)")
	(sequence "APPT(a)" "|" "DONE(x)" "CANCEL(c)")))

;;; ハイパーリンクを作成する・辿る[14.9]
(global-set-key (kbd "C-c l") 'org-store-link)
(setq browse-url-browser-function 'w3m-browse-url)
(setq org-return-follows-link t)


;;; 予定表を見る[14.14]
;; M-x org-rememberによるメモを集めるorgファイル
(setq org-default-notes-file "~/memo/plan.org")
;; 予定表に使うorgファイルのリスト
(setq org-agenda-files (list org-default-notes-file))
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-custom-commands
      '(("x" "My agenda view"
	 ((agenda)
	  (todo "WAITING")
	  (tags-tod "project")))))

;;; [20]Chapter15 anything.el〜すべてを統べるものとその仲間たち
(require 'anything-startup)

;;; 複数の情報源を扱う[15.4]
(define-key anything-map "\C-\M-p" 'anything-previous-source)
(define-key anything-map "\C-\M-n" 'anything-next-source)
(global-set-key (kbd "C-x b") 'anything-for-files)
(global-set-key (kbd "M-:") 'anything-for-files)

;;; キーバインドを調べる[15.10]
(setq descbinds-anything-window-style 'split-window) ; 画面分割する

;;; シェルコマンドの履歴から補完する[15.11]
(anything-complete-shell-history-setup-key "\M-o")

;;; 過去のkill-ringの内容を取り出す
(global-set-key (kbd "M-y") 'anything-show-kill-ring)

(require 'anything-c-moccur)
(setq moccur-split-word t)
(global-set-key (kbd "M-s") 'anything-c-moccur-occur-by-moccur)
;; インクリメンタルサーチから移行できるように
(define-key isearch-mode-map (kbd "M-o") 'anything-c-moccur-from-isearch)
;; 旧来のisearch-occurはC-M-oへ引越し
(define-key isearch-mode-map (kbd "C-M-o") 'isearch-occur)

(require 'split-root)
(defun anything-display-function--split-root (buf)
  (let ((percent 40.0))  ; フレームの高さに対するanythingバッファの高さの割合
    (set-window-buffer (split-root-window (truncate (* (frame-height) (/ percent 100.0)))) buf)))
(setq anything-display-function 'anything-display-function--split-root)




;; お気に入りEmacsLisp設定
;; windows.el
;(load"windows")
;(require 'windows)
;(win:startup-with-window)
;(define-key ctl-x-map "C" 'see-you-again)


;; revive.el
;(autoload 'save-current-configuration "revive" "Save status" t)
;(autoload 'resume "revive" "Resume Emacs" t)
;(autoload 'wipe "revive" "Wipe emacs" t)


;; smart-compile.el
;(require 'smart-compile)
;(global-set-key "\C-cc" 'smart-compile)
;(define-key menu-bar-tools-menu [compile] '("Compile..." . smart-compile))


;;; GDB 関連
;;; 有用なバッファを開くモード
(setq gdb-many-windows t)
;;; 変数の上にマウスカーソルを置くと値を表示
(add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode t)))
;;; I/O バッファを表示
(setq gdb-use-separate-io-buffer t)
;;; t にすると mini buffer に値が表示される
(setq gud-tooltip-echo-area nil)


;;; pukiwiki関連
(setq pukiwiki-auto-insert t)
(autoload 'pukiwiki-edit
  "pukiwiki-mode" "pukwiki-mode." t)
(autoload 'pukiwiki-index
  "pukiwiki-mode" "pukwiki-mode." t)
(autoload 'pukiwiki-edit-url
  "pukiwiki-mode" "pukwiki-mode." t)
(setq
 pukiwiki-site-list
 '(("Meadow"
    "http://www.bookshelf.jp/pukiwiki/pukiwiki.php"
    nil euc-jp-dos)
   ("macemacs"
    "http://macemacsjp.sourceforge.jp/index.php"
    nil euc-jp-dos)
   ("Xyzzy"
    "http://xyzzy.s53.xrea.com/wiki/wiki.php"
    nil euc-jp-dos)
   ("Pukiwiki"
    "http://pukiwiki.org/index.php" nil utf-8-dos)
   ))


;;; hideshowvis関連(括弧を折り畳む)
(load-library "hideshow")

(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")

(dolist (hook (list
	       'emacs-lisp-mode-hooak
	       'c++-mode-hook
	       'c-mode-hook))
  (add-hook hook 'hideshowvis-enable))

(define-fringe-bitmap 'hs-marker [0 24 24 126 126 24 24 0])

(defcustom hs-fringe-face 'hs-fringe-face
  "*Specify face used to highlight the fringe on hidden regions."
  :type 'face
  :group 'hideshow)

(defface hs-fringe-face
  '((t (:foreground "#888" :box (:line-width 2 :color "grey75" :style released-button))))
  "Face used to highlight the fringe on folded regions"
  :group 'hideshow)

(defcustom hs-face 'hs-face
  "*Specify the face to to use for the hidden region indicator"
  :type 'face
  :group 'hideshow)

(defface hs-face
  '((t (:background "#888" :box t)))
  "Face to hightlight the ... area of hidden regions"
  :group 'hideshow)

(defun display-code-line-counts (ov)
  (when (eq 'code (overlay-get ov 'hs))
    (let* ((marker-string "*fringe-dummy*")
           (marker-length (length marker-string))
           (display-string (format "(%d)..." (count-lines (overlay-start ov) (overlay-end ov))))
           )
      (overlay-put ov 'help-echo "Hiddent text. C-c,= to show")
      (put-text-property 0 marker-length 'display (list 'left-fringe 'hs-marker 'hs-fringe-face) marker-string)
      (overlay-put ov 'before-string marker-string)
      (put-text-property 0 (length display-string) 'face 'hs-face display-string)
      (overlay-put ov 'display display-string)
      )))

(setq hs-set-up-overlay 'display-code-line-counts)


;; いわゆる右上の最大化するボタンを押しての最大化
;(set-frame-parameter nil 'fullscreen 'fullscreen)

;; (ALT+ENTER)でfullscreen
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)

;; mac設定(command→alt, alt→command)
;(setq ns-command-modifier (quote meta))
;(setq ns-alternate-modifier (quote super))

;; 透過度
;(set-frame-parameter (selected-frame) 'alpha '(85 50))

;; meadowの外観設定
;; (w32-add-font
;;      "MS Gothic 16"
;;      '((spec
;; 	((:char-spec ascii :height any)
;; 	 strict
;; 	 (w32-logfont "MS Gothic" 0 -16 400 0 nil nil nil 0 1 3 0))
;; 	((:char-spec ascii :height any :weight bold)
;; 	 strict
;; 	 (w32-logfont "MS Gothic" 0 -16 700 0 nil nil nil 0 1 3 0)
;; 	 ((spacing . -1)))
;; 	((:char-spec ascii :height any :slant italic)
;; 	 strict
;; 	 (w32-logfont "MS Gothic" 0 -16 400 0   t nil nil 0 1 3 0))
;; 	((:char-spec ascii :height any :weight bold :slant italic)
;; 	 strict
;; 	 (w32-logfont "MS Gothic" 0 -16 700 0   t nil nil 0 1 3 0)
;; 	 ((spacing . -1)))
;; 	((:char-spec japanese-jisx0208 :height any)
;; 	 strict
;; 	 (w32-logfont "MS Gothic" 0 -16 400 0 nil nil nil 128 1 3 0))
;; 	((:char-spec japanese-jisx0208 :height any :weight bold)
;; 	 strict
;; 	 (w32-logfont "MS Gothic" 0 -16 700 0 nil nil nil 128 1 3 0)
;; 	 ((spacing . -1)))
;; 	((:char-spec japanese-jisx0208 :height any :slant italic)
;; 	 strict
;; 	 (w32-logfont "MS Gothic" 0 -16 400 0   t nil nil 128 1 3 0))
;; 	((:char-spec japanese-jisx0208 :height any :weight bold :slant italic)
;; 	 strict
;; 	 (w32-logfont "MS Gothic" 0 -16 700 0   t nil nil 128 1 3 0)
;; 	 ((spacing . -1))))))
;; ; 起動時およびnew-frame時のフレーム(ウィンドウ)の設定。
;; (add-to-list 'default-frame-alist '(font . "MS Gothic 16"))
;; ; 現在のフレームの設定(.emacs中では省略可)
;; (set-frame-font "MS Gothic 16")
;; ; IMEのフォントを設定。こういう書式でないとだめらしい。
;; (let ((logfont '(w32-logfont "MS Gothic" 0 0 400 0 nil nil nil 128 1 3 0)))
;;   (modify-frame-parameters (selected-frame) (list (cons 'ime-font logfont)))
;;   (add-to-list 'default-frame-alist (cons 'ime-font logfont))
;;   )

(require 'mic-paren)
(paren-activate)
(setq paren-match-face '(underline paren-face))
(setq paren-sexp-mode t)
(setq parse-sexp-ignore-comments t)


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(require 'web-mode)

;;; emacs 23以下の互換
(when (< emacs-major-version 24)
  (defalias 'prog-mode 'fundamental-mode))

;;; 適用する拡張子
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))

;;; インデント数
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-html-offset   2)
  (setq web-mode-css-offset    2)
  (setq web-mode-script-offset 2)
  (setq web-mode-php-offset    2)
  (setq web-mode-java-offset   2)
  (setq web-mode-asp-offset    2))
(add-hook 'web-mode-hook 'web-mode-hook)

;; html-modeでac-modes
(add-to-list 'ac-modes 'web-mode)

;; 選択範囲を削除
(delete-selection-mode t)

;; 大文字・小文字を区別する
(setq ac-ignore-case nil)

(setq backup-directory-alist
  (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
        backup-directory-alist))

;; dirtree
(setq  dirtree-windata '(frame left 0.16 nil))

(require 'dirtree)

(defmacro my/if-dirtree-window-exist (win &rest on-t on-nil)
  `(let* ((buffer (get-buffer dirtree-buffer))
          (,win (and buffer
                    (get-buffer-window buffer))))
         (if ,win
             ,@on-t
           ,@on-nil)))

(global-set-key [f8]
                #'(lambda ()
                   (interactive)
                   (my/if-dirtree-window-exist window
                                               (delete-window window)
                                               (dirtree default-directory nil))))

(defun my/dirtree-update ()
  (my/if-dirtree-window-exist window
                              (unless (equal (buffer-name) dirtree-buffer)
                                (dirtree default-directory nil))))

(defadvice switch-to-buffer (after dirtree-update (buffer-or-name
                                                   &optional
                                                   norecord
                                                   force-same-window))
  (my/dirtree-update))
(defadvice quit-window (after dirtree-update (&optional kill window))
  (my/dirtree-update))
(defadvice windmove-do-window-select (after dirtree-update (dir &optional arg window))
  (my/dirtree-update))

(ad-activate 'switch-to-buffer)
(ad-activate 'quit-window)
(ad-activate 'windmove-do-window-select)



;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


(setq default-frame-alist
      (append (list '(top . 0) ; 起動時の表示位置（右から）
                    '(left . 53) ; 起動時の表示位置（左から）
;                    '(left . 660) ; 起動時の表示位置（左から）
;                    '(width . 166) ; 起動時のサイズ（幅）
;                    '(width . 83) ; 起動時のサイズ（幅）
                    '(width . 185) ; 起動時のサイズ（幅）
                     '(height . 51) ; 起動時のサイズ（縦）
                    )
              default-frame-alist))

