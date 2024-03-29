;;; mylib.el -*- lexical-binding: t; -*-

(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count))))


      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list))))
                                        ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))

(global-set-key (kbd "C-x C-d") 'duplicate-line)

(global-set-key (quote [f2]) 'dabbrev-expand)
(global-set-key (quote [f3]) 'insert-register)


;; (global-set-key (quote [f9]) 'copy-and-comment)
;; (global-set-key (quote [f12]) 'comment-or-uncomment-region)
;; (global-set-key [C-tab] 'other-window)
;; (global-set-key [C-S-tab] (lambda () (interactive) (other-window -1)))

(add-hook 'emacs-lisp-mode-hook
          (lambda () (local-set-key (kbd "<f5>") 'eval-last-sexp)))
