;;; Desactivar la barra de menú
(menu-bar-mode -1)

;; Desactivar la barra de herramientas
(tool-bar-mode -1)

;; Desactivar la barra de desplazamiento
(scroll-bar-mode -1)

;; Activar el resaltado de sintaxis
(global-font-lock-mode t)

;; Barra de Tutorial de emacs
(setq inhibit-startup-screen t)

;; Activar el resaltado de líneas activas
(global-hl-line-mode t)

;; Mostrar números de línea
(global-display-line-numbers-mode)

;; Mostrar número de columna
(column-number-mode t)

;; Mostrar corchetes coincidentes
(show-paren-mode t)

;; Utilizar espacios en lugar de tabuladores
(setq-default indent-tabs-mode nil)

;; Definir el ancho de tabulación
(setq-default tab-width 4)

;; Desactivar los archivos de respaldo
(setq make-backup-files nil)

;; Desactivar los archivos de autoguardado
(setq auto-save-default nil)

;; Desactivar el sonido de advertencia
(setq ring-bell-function 'ignore)

;; Cambiar el color de fondo
;;(set-face-background 'default "#011220")
;;(set-face-background 'fringe "#011220")
;(set-face-background 'mode-line "#011220")
;;(set-face-background 'mode-line-inactive "#011220")
;(set-face-background 'minibuffer-prompt "#011220")

;; Cambiar el color de fondo de las líneas de número
;(set-face-background 'line-number "#011220")
;(set-face-background 'line-number-current-line "#011220")

;; Ajustar el tamaño de la fuente

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))

;(load-theme 'catppuccin t)
(load-theme 'almost-mono-black t)
;;(setq doom-theme 'catppuccin)
;(setq catppuccin-flavor 'mocha) ;; or 'latte, 'macchiato, or 'mo>
;;(catppuccin-reload)

;; Habilitar el auto-completado
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; Configurar el atajo de teclado para abrir el archivo de confi>
(global-set-key (kbd "C-c C-c") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))

;; Manejo de proyectos
(use-package projectile
  :ensure t
  :config
  (projectile-mode +1))

(use-package yasnippet
  :ensure t
  :config (yas-global-mode 1))

(add-to-list 'load-path "~/.emacs.d/nyan-mode")
(require 'nyan-mode)
(nyan-mode 1)

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package all-the-icons
  :ensure t)

(with-eval-after-load 'almost-mono-black
  (set-face-attribute 'default nil
                      :family "Noto Sans Mono"
                      :height 115
                      :weight 'normal))

;; Para nuevos frames (emacsclient -c, etc.)
(add-to-list 'default-frame-alist
             '(font . "Noto Sans Mono-11"))

;; Atajo de teclado para abrir una terminal
(global-set-key (kbd "C-c t") 'vterm)

(global-set-key [f8] #'treemacs)
;;Dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))
(setq dashboard-startup-banner "/home/grauler/Imágenes/Solani.jpeg")


(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(set-frame-parameter nil 'alpha-background 90)
(add-to-list 'default-frame-alist '(alpha-background . 90))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4780d7ce6e5491e2c1190082f7fe0f812707fc77455616ab6f8b38e796cbffa9"
     "1a6d120936f9df3f44953124dbf9e56b399e021702ca7d1844e6c5e1658b692b"
     default))
 '(package-selected-packages
   '(all-the-icons all-the-icons-completion all-the-icons-ibuffer
                   all-the-icons-nerd-fonts almost-mono-themes
                   auto-complete catppuccin-theme company dashboard
                   doom-modeline doom-themes exotica-theme go
                   go-add-tags go-autocomplete go-mode haskell-emacs
                   magit material-theme minimal-theme night-owl-theme
                   nyan-mode org-dashboard racket-mode rust-mode
                   tao-theme treemacs treemacs-all-the-icons
                   treemacs-nerd-icons vterm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
