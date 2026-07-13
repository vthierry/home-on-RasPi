; To reload this configuration file: M-x eval-buffer


(setq bell-volume 0)

(setq-default c-basic-offset 2)
(setq-default js-indent-level 2)

(setq-default async-shell-command-buffer 'new-buffer)

(setq ispell-program-name "aspell")

; (setq compilation-scroll-output t)
(setq compilation-scroll-output 'first-error)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

 (defun my-ongoing ()
  (interactive)  
  (my-whole-screen)
  (my-whole-screen)
  (switch-to-buffer (find-file-noselect "/home/vthierry/Desktop/gits"))
)

(defun my-show-file ()
  (interactive)
  (async-shell-command (concat "/home/vthierry/bin/show.sh " (buffer-file-name)))
)

(defun my-make ()
  (interactive)  
  (my-kill-buffer "*compilation*")
  (compile "/home/vthierry/bin/make.sh")
  )

(defun my-save ()
  (interactive)  
  (save-some-buffers)
  )

(defun my-reload ()
  (interactive)  
  (revert-buffer)
)

(defun my-term ()
  (interactive)
  (let
    ((explicit-shell-file-name "/bin/bash"))
    (shell (concat "shell: " default-directory))
    )
)

(defun my-terminal ()
  (interactive)
  (shell-command "(nohup mate-terminal ; /bin/rm -f nohup.out) &")
)

(defun my-filer ()
  (interactive)
  (shell-command "(nohup thunar ; /bin/rm -f nohup.out) &")
)

(defun my-whole-screen ()
  (interactive)
  (set-frame-width (selected-frame) 170)
  (set-frame-height (selected-frame) 50)
  (set-frame-position (selected-frame) -1 10)
  (tool-bar-mode -1)
  (my-clean-buffers)
)

(defun my-emacs ()
  (interactive)  
  (switch-to-buffer (find-file-noselect "/home/vthierry/.emacs"))
  (load-file user-init-file)
)

(defun my-clean-buffers ()
  (my-kill-buffer "*GNU Emacs*")
  (my-kill-matching-buffers ".Messages.*")
  (my-kill-buffer ".Directory.*")
  (my-kill-matching-buffers ".Async Shell Command.*")
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

(setq set-default-coding-systems 'utf-8)
(setq require-final-newline t)
(setq compile-command "make -s")
(setq bell-volume 0)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)

(define-key global-map "\M-&" 'replace-regexp)
(define-key global-map "\C-g" 'ispell-continue)

(define-key global-map (kbd "<f1>") 'my-term)
(define-key global-map (kbd "<f2>") 'ispell)
(define-key global-map (kbd "<f3>") 'my-show-file)
(define-key global-map (kbd "<f4>") 'my-make)
(define-key global-map (kbd "<f5>") 'my-reload)
(define-key global-map (kbd "<f6>") 'my-terminal)
(define-key global-map (kbd "<f7>") 'my-filer)
(define-key global-map (kbd "<f8>") 'my-save)
;(define-key global-map (kbd "<f9>") 'my-ongoing)
;(define-key global-map (kbd "<f10>") 'menu-bar-open)
;(define-key global-map (kbd "<f11>") 'toggle-frame-fullscreen)
(define-key global-map (kbd "<f12>") 'my-whole-screen)

(require 'easymenu)
(easy-menu-define my-menu nil "vthierry"
  `("vthierry"
   ["<f1> Shell" my-term t]
    ["<f2> Spell" ispell t]
    ["<f3> Show" my-show-file t]
    ["<f4> Make" my-make t]
    ["<f5> Reload" my-reload t]
    ["<f6> Terminal" my-terminal t]
    ["<f7> Filer" my-filer t]
    ["<f8> Save" my-save t]
    "----------------"
    ["<f9> ongoing" my-ongoing t]
    "----------------"
    ["<f10> Menu" menu-bar-open t]
    ["<f11> Fullscreen" toggle-frame-fullscreen t]
    ["<f12> Clean" my-whole-screen t]
    "----------------"
    [".emacs" my-emacs t]
 ))
(define-key-after (lookup-key global-map [menu-bar])
  [openflow]
  (cons "Vthierry" my-menu) nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans" :size "18pt" :foundry "GOOG" :slant normal :weight regular :height 162 :width normal)))))

(add-to-list 'load-path "~/.emacs.d/lisp")
;(require 'edit-server)
;(edit-server-start)
(require 'abbrev)
;(autoload 'maplev-mode "maplev" "Maple editing mode" t)
;(setq auto-mode-alist (cons `("\\.mpl\\'" . maplev-mode) auto-mode-alist))
;(byte-recompile-directory "~/.emacs.d/lisp")

(setq inhibit-splash-screen t)
(my-whole-screen)

(put 'downcase-region 'disabled nil)
