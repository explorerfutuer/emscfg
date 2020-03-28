;; 自定义配置
(setq package-enable-at-startup nil)
(setq custom-file (expand-file-name "~/.emacs.d/mtlCustom.el" user-emacs-directory))
(load-file custom-file)

(add-to-list 'load-path "~/.emacs.d/mtl")
(package-initialize)
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://elpa.emacs-china.org/melpa/"))
;;  使用use-pacakge管理插件
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; 添加配置从指定的Org文件中
(org-babel-load-file (expand-file-name "~/.emacs.d/mtlPlug.org"))  


(put 'downcase-region 'disabled nil)
