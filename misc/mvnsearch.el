;;; mvnsearch.el

;; Copyright (C) 2012  Toshiyuki Takahashi

;; Author: Toshiyuki Takahashi (@tototoshi)
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Configuration:
;;;
;;; (require 'mvnsearch)
;;;
;;; Code:

;;; find files in current project

(require 'helm)

(defun mvnsearch ()
  (let ((search-word (read-from-minibuffer "WORD: ")))
    (split-string
     (shell-command-to-string
      (concat "mvnsearch " search-word))
    "\n")))

(defvar helm-c-source-mvnsearch
      '((name . "Maven Search")
        (candidates . mvnsearch)
        (action
         . (("insert" . (insert (x) (print x)))
            ))))

(defun helm-mvnsearch ()
  (interactive)
  (helm '(helm-c-source-mvnsearch)))

(provide 'mvnsearch)
