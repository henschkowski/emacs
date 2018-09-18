(defun get-buffer-dir (buffer-name)
  "Get a buffer's directory. Works also for Dired buffers"
  (interactive "b")
  (let* ((buffer (get-buffer buffer-name))
         (file (buffer-file-name buffer)))
    (with-current-buffer buffer
      (if file
        (setq file (file-name-directory file))
        ;; No visited file.  Check local value of
        ;; list-buffers-directory.
        (when (and (boundp 'list-buffers-directory)
                   list-buffers-directory)
          (setq file list-buffers-directory)))
      (message file)
      file)))


;; Usage example:
;;  (require 'switch-to-shell)
;;  (global-set-key "\C-cs" 'switch-to-shell)
;;  (global-set-key "\C-cb" (lambda () (interactive) (switch-to-shell -1)))

(defun switch-to-shell (&optional back)
  "Switch to the shell buffer and save the name of the current buffer. With argument, switch back."
  (interactive "P")
  (if back 
    (if (buffer-live-p (get-buffer *buffer-before-switch-to-shell-buffer*))
      (progn
        (switch-to-buffer  *buffer-before-switch-to-shell-buffer*)
        (setq *buffer-before-switch-to-shell-buffer* (buffer-name)))
      (buffer-menu))
    (if (not (string= "*shell*" (buffer-name)))
      (progn 
        (setq *buffer-before-switch-to-shell-buffer* (buffer-name))
        ;; Change directory on the shell to the buffer's directory
        (let ((dir (get-buffer-dir (current-buffer))))
          (shell)
          ;; Make sure dirtrack-mode is used instead of shell-dirtrack-mode 
          ;; You must customize dirtrack-list variable
          (dirtrack-mode t)
          (with-current-buffer (get-buffer "*shell*")
            (if dir  
              (progn
                (let* ((proc (get-process "shell"))
                       (change-dir-command (concat "cd " dir)))
                  (comint-send-string proc change-dir-command) 
                  (comint-send-input nil t)
                  ))
              (message "Buffer is not associated with a file.")))
          )))))


(provide 'switch-to-shell)



