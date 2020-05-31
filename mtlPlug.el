(setq ring-bell-function 'ignore)
    (global-auto-revert-mode t)
    (set-face-attribute 'default nil :height 160)
    ;; 设置行号
    (global-linum-mode t)
    (setq linum-format "%4d \u2502 ")
    ;; 禁止备份
    (setq make-backup-files nil)
    (setq auto-save-default nil)
    ;; 最近打开文件配置
    (require 'recentf)
    (recentf-mode 1)
    (setq recentf-max-menu-items 50)
    (global-set-key "\C-x\ \C-r" 'recentf-open-files)
    (set-language-environment "UTF-8")
    (show-paren-mode t)
    ;; 缓冲区打开关闭
    (setq indo-enable-fles-matching t)
    (setq ido-everywhere t)
    (ido-mode 1)
    ;;(defalias 'list-buffers 'ibuffer)
    ;;(defalias 'list-buffers 'ibuffer-other-windows)
    (global-set-key (kbd "C-c b") #'list-buffers)
    (fset 'yes-or-no-p 'y-or-n-p)
    (global-set-key (kbd "<f5>") 'revert-buffer) 
    ;; 设置tab为4根空格宽度，将tab转换为空格
    (setq-default indent-tabs-mode nil)
    (setq-default tab-width 2)
(setq tab-width 2)
(setq-default c-basic-offset 2)
(setq c-basic-offset 2)
(setq-default c-basic-indent 2)

(setq c-default-style "linux"
  c-basic-offset 2)
(add-hook 'c-mode-common-hook '(lambda()
  (c-set-style "K&R")
  (setq tab-width 2)
  (setq c-basic-offset 2)))

(add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/") t)

(use-package hungry-delete
  :ensure t
  :config (global-hungry-delete-mode t))
(use-package aggressive-indent
  :ensure t
  :config
  (global-aggressive-indent-mode 1))

;; 帮助提示快捷键
(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t))

(use-package counsel
  :ensure t)
;; 正则查找字符串
(use-package swiper
  :ensure try
  :bind(("C-s" . swiper)
	("C-r" . swiper)
	("C-c C-r" . swiper)
	("M-x" . counsel-M-x)
	("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
    ))
;; 通过一个一个的按键定位输入的关键字
(use-package avy
  :ensure t
  :bind(("M-g c" . avy-goto-char)
	("M-g w" . avy-goto-word-1))
  )

;; Org模式标题状态
(use-package org-bullets 
  :ensure t
  :config (add-hook 'org-mode-hook 'org-bullets-mode))
;; 
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t) 
   (emacs-lisp . t)
   (C . t)
   (latex . t)
   ))

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(setq py-python-command "python3")
(setq python-shell-interpreter "python3")

;; git代码管理
(use-package magit
  :ensure t)

;; 补全
(use-package auto-complete
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  )
  ;; global-company-mode
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

;; 对于C-x o 选择窗口提供了快捷键选择
(use-package ace-window
  :ensure t
  :init
  (progn
  (global-set-key [remap other-window] 'ace-window)
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 3.0)))))
  ))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g k" . dumb-jump-back)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config
  (setq dumb-jump-selector 'ivy)
  :ensure)

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)
  (setq sp-show-pair-delay 1)

  ;; no '' pair in emacs-lisp-mode
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
  (sp-local-pair 'markdown-mode "`"   nil :actions '(wrap insert))  ;; only use ` for wrap and auto insertion in markdown-mode
  (sp-local-tag 'markdown-mode "s" "```scheme" "```")
  (define-key smartparens-mode-map (kbd "C-s-<right>") 'sp-forward-slurp-sexp)
  (define-key smartparens-mode-map (kbd "C-s-<left>") 'sp-forward-barf-sexp))
;; 扩展当前光标的选择区域
(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package yaml-mode
  :ensure t)

(use-package protobuf-mode
  :ensure t)

(use-package go-mode
  :ensure t
  :mode (("\\.go'\\'" . go-mode))
  :hook ((before-save . gofmt-before-save)))
