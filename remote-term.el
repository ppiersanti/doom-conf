;;; these customizations reconcile awkward terminal
;;; settings when you work from remote terminals

;; rebind C-M-@ to work through terminal
;(global-set-key (kbd "C-M-SPC") 'mark-sexp)
(define-key input-decode-map " " [C-M-@])
(global-set-key (quote [C-M-@]) 'mark-sexp)
(define-key input-decode-map "[1;5S" [C-f4])
