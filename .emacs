(require 'package)

(tool-bar-mode nil)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(add-to-list 'package-archives '("elpa" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;;(add-hook 'after-init-hook 'my-after-init-hook)
;;(defun my-after-init-hook ()
;;  (require 'edts-start))

(show-paren-mode t) ;; включить выделение выражений между {},[],()
(setq show-paren-style 'expression) ;; выделить цветом выражения между {},[],()

(electric-pair-mode    1) ;; автозакрытие {},[],() с переводом курсора внутрь скобок
(electric-indent-mode -1) ;; отключить индентацию  electric-indent-mod'ом (default in Emacs-24.4)

(require 'linum) ;; вызвать Linum
(line-number-mode   t) ;; показать номер строки в mode-line
(global-linum-mode  t) ;; показывать номера строк во всех буферах
(column-number-mode t) ;; показать номер столбца в mode-line
(setq linum-format " %d") ;; задаем формат нумерации строк

(global-linum-mode 1)
(show-paren-mode)

(require 'ido)
(ido-mode                      t)
(icomplete-mode                t)
(ido-everywhere                t)
(setq ido-vitrual-buffers      t)
(setq ido-enable-flex-matching t)

(package-initialize)

(require 'ergoemacs-mode)
(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
(ergoemacs-mode 1)

(require 'bs)
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer) ;; отдельный список буферов при нажатии C-x C-b
(global-set-key (kbd "C-q") 'bs-show) ;; запуск buffer selection "C-q"

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(background-color "#002b36")
 '(background-mode dark)
 '(cursor-color "#839496")
 '(custom-enabled-themes (quote (charcoal-black)))
 '(custom-safe-themes
   (quote
    ("eb399cbd3ea4c93d9ab15b513fd6638e801600e13c8a70b56f38e609397a5eca" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "941bc214a26ed295e68bbeaadcd279475a3d6df06ae36b0b2872319d58b855f7" default)))
 '(foreground-color "#839496")
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))

(require 'auto-complete)
(require 'auto-complete-config)

(ac-config-default)
