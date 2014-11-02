(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(setq slime-lisp-implementations
      '((clisp ("/usr/bin/clisp" "-q -I"))
        (sbcl  ("/usr/bin/sbcl") :coding-system utf-8-unix)))

(require 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)
(require 'yasnippet)
(yas-global-mode 1)

(defun my:ac-c-header-init()
(require 'auto-complete-c-headers)

(add-to-list 'ac-sources 'ac-sources-c-headers)
(add-to-list 'achead:include-directories '"/usr/include"))

(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)


(define-key global-map (kbd "C-c ;") 'iedit-mode)

(setq erlang-root-dir "/usr/lib/erlang")
(setq erlang-man-root-dir "/usr/lib/erlang/man")
(setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
;;(setq load-path (cons "/usr/lib/erlang/lib/tools-2.6.15/emacs" load-path))
(add-to-list 'load-path "/usr/lib/erlang/lib/tools-2.6.15/emacs")

(require 'erlang-start)

(defun my-erlang-mode-hook ()
;; when starting an Erlang shell in Emacs, default in the node name
(setq inferior-erlang-machine-options '("-sname" "emacs"))
;; add Erlang functions to an imenu menu
(imenu-add-to-menubar "imenu")
;; customize keys
(local-set-key [return] 'newline-and-indent)
)
;; Some Erlang customizations
(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)
(add-to-list 'load-path "~/.emacs.d/distel/elisp")

(require 'distel)
(distel-setup)
(defconst distel-shell-keys
'(("\C-\M-i" erl-complete)
("\M-?" erl-complete)
("\M-." erl-find-source-under-point)
("\M-," erl-find-source-unwind)
("\M-*" erl-find-source-unwind)
)
"Additional keys to bind when in Erlang shell.")
(add-hook 'erlang-shell-mode-hook
(lambda ()
;; add some Distel bindings to the Erlang shell
(dolist (spec distel-shell-keys)
(define-key erlang-shell-mode-map (car spec) (cadr spec)))))

(require 'magit)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))

;;(require 'dirtree)
(require 'scheme-complete)
(eval-after-load 'scheme
  '(define-key scheme-mode-map "\t" 'scheme-complete-or-indent))
(require 'edts-start)

(require 'tabbar)

(global-set-key [C-S-tab] 'tabbar-backward-tab)
(global-set-key [C-tab] 'tabbar-forward-tab)

(set-face-foreground 'tabbar-default "LightSteelBlue")
(set-face-background 'tabbar-default "DarkSlateGray")
(set-face-foreground 'tabbar-selected "pale green")
(set-face-bold-p 'tabbar-selected t)
(set-face-attribute 'tabbar-button nil :box '(:line-width 1 :color "gray72"))

(setq tabbar-buffer-groups-function
      (lambda () 
        (list
         (cond
          ((find (aref (buffer-name (current-buffer)) 0) " *") "*")
          (t "All Buffers"))
         )))

(tabbar-mode)
