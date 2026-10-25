;; To reload: M-x eval-buffer

;; Adjusts emacs aspect

(setq frame-title-format "Emacs")
      
(setq inhibit-splash-screen t)
(setq bell-volume 0)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(custom-set-variables
 '(custom-enabled-themes '(tango-dark))
 '(tool-bar-mode nil))
(custom-set-faces
 '(default ((t (:family "Ubuntu Sans Mono" :foundry "DAMA" :slant normal :weight medium :height 181 :width normal)))))

;; Initial frame geometry

(defun my-set-initial-frame ()
  (set-frame-position (selected-frame) -2 -1)
  (set-frame-size (selected-frame) 128 36))
(my-set-initial-frame)

;; Compilation and command options

(setq compile-command "~/bin/make")
(setq compilation-scroll-output 'first-error)
(add-to-list  'display-buffer-alist  '("\\*compilation\\*"  (display-buffer-no-window)))

(setq-default async-shell-command-buffer 'new-buffer)

(setq ispell-program-name "aspell")

(recentf-mode 1)
(setq recentf-max-menu-items 32)
(setq recentf-max-saved-items 32)

;; Code formating option

(setq set-default-coding-systems 'utf-8)
(setq require-final-newline t)

(setq-default bash-indent-level 2)
(setq-default sh-basic-offset 2)
(setq-default c-basic-offset 2)
(setq-default js-indent-level 2)

;; Customized menu

(define-key global-map "\M-&" 'replace-regexp)
(define-key global-map "\C-g" 'ispell-continue)

(defun my-term ()
  (interactive)
  (let
    ((explicit-shell-file-name "/bin/bash"))
    (shell (concat "shell: " default-directory))
    )
)

(defun my-reload ()
  (interactive)  
  (revert-buffer :ignore-auto :noconfirm)
)

(defun my-make ()
  (interactive)  
  (my-kill-buffer "*compilation*")
  (compile "~/bin/make")
  )

(defun my-make-build ()
  (interactive)  
  (my-kill-buffer "*compilation*")
  (compile "~/bin/make build")
  )

(defun my-show-compilation ()
  (interactive)
  (display-buffer "*compilation*")
)

(defun my-terminal ()
  (interactive)
  (shell-command "(nohup lxterminal ; /bin/rm -f nohup.out) &")
)

(defun my-filer ()
  (interactive)
  (shell-command "(nohup pcmanfm ; /bin/rm -f nohup.out) &")
)

(defun my-save ()
  (interactive)  
  (save-some-buffers)
)

(defun my-split ()
  (interactive)  
  (split-window-right)
)

(defun my-clean ()
  (interactive)
  (my-clean-buffers)
  (redraw-display)
  (my-set-initial-frame)
)

(defun my-clean-buffers ()
  (my-kill-buffer "*GNU Emacs*")
  (my-kill-matching-buffers ".Messages.*")
  (my-kill-buffer ".Directory.*")
  (my-kill-matching-buffers ".Async Shell Command.*")
  (my-kill-matching-buffers "shell:.*")
  (my-kill-matching-buffers ".background-.*")
  (my-kill-buffer "*Backtrace*")
  (my-kill-buffer "*Buffer List*")
  (my-kill-matching-buffers ".Compile-.*")
  (my-kill-buffer "*Macro and Targets*")
  (my-kill-buffer "*compilation*")
  (my-kill-buffer "*Completions*")
  (my-kill-buffer "*Process List*")
  (my-kill-buffer "*Warnings*")
  (my-kill-buffer "*scratch*")
  (my-kill-buffer "*Shell Command Output*")
  (my-kill-buffer "*Async-native-compile-log*")
  (my-kill-buffer "*info*")
  (my-kill-buffer "*interpretation*")
  (my-kill-buffer "*Finder*")
  (my-kill-buffer "*Help*")
  (delete-other-windows)
)

(global-set-key (kbd "C-x k") 'kill-current-buffer)
(setq kill-buffer-query-functions nil)

(defun my-kill-matching-buffers (regexp)
  (interactive)
  (dolist (buffer (buffer-list))
    (let ((name (buffer-name buffer)))
      (when (and name (not (string-equal name "")) (string-match regexp name))
	(kill-buffer buffer))))
  )

(defun my-kill-buffer (buffer)
  (if (member buffer (mapcar 'buffer-name (buffer-list))) (kill-buffer buffer))
)

(defun my-emacs ()
  (interactive)  
  (switch-to-buffer (find-file-noselect "~/.emacs"))
  (load-file user-init-file)
)

(define-key global-map [(f1)] 'my-term)
(define-key global-map [(f2)] 'ispell)
(define-key global-map [(f3)] 'my-reload)
(define-key global-map [(f4)] 'my-make)
(define-key global-map [(shift f4)] 'my-make-build)
(define-key global-map [(f5)] 'my-show-compilation)
(define-key global-map [(f6)] 'my-terminal)
(define-key global-map [(f7)] 'my-filer)
(define-key global-map [(f8)] 'my-save)
(define-key global-map [(f9)] 'my-split)
;(define-key global-map [(f10)] 'menu-bar-open)
;(define-key global-map [(f11)] 'toggle-frame-fullscreen)
(define-key global-map [(f12)] 'my-clean)

(require 'easymenu)
(easy-menu-define my-menu nil "Functions"
  `("Functions"
    ["Shell" my-term t]
    ["Spell" ispell t]
    ["Reload" my-reload t]
    ["Make" my-make t]
    ["Make build" my-make-build t]
    ["Show compilation" my-show-compilation t]
    ["Terminal" my-terminal t]
    ["Filer" my-filer t]
    ["Save" my-save t]
    "----------------"
    ["Split" my-split t]
    ["Menu" menu-bar-open t]
    ["Fullscreen" toggle-frame-fullscreen t]
    ["Clean" my-clean t]
    "----------------"
    [".emacs" my-emacs t]
 ))
(define-key-after (lookup-key global-map [menu-bar])
  [openflow]
  (cons "Functions" my-menu) nil)

