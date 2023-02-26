(defun my/org-checkbox-todo ()
  "Switch header TODO state to DONE when all checkboxes are ticked, to TODO otherwise"
  (save-excursion
    (let* ((todo-state (org-get-todo-state))
           (re-percent "\\[\\([0-9]*%\\)\\]")
           (re-count "\\[\\([0-9]*\\)/\\([0-9]*\\)\\]")
           (beg (progn (org-back-to-heading) (point)))
           (end (progn (end-of-line) (point))))
      (when todo-state
        (goto-char beg)
        (if (re-search-forward (concat re-percent "\\|" re-count) end t)
            (if (match-end 1)
                (if (equal (match-string 1) "100%")
                    (unless (string-equal todo-state "DONE")
                      (org-todo 'done))
                  (unless (string-equal todo-state "TODO")
                    (org-todo 'todo)))
              (if (and (> (match-end 2) (match-beginning 2))
                       (equal (match-string 2) (match-string 3)))
                  (unless (string-equal todo-state "DONE")
                    (org-todo 'done))
                (unless (string-equal todo-state "TODO")
                  (org-todo 'todo)))))))))


(add-hook 'org-checkbox-statistics-hook 'my/org-checkbox-todo)

(provide 'org-setup)
