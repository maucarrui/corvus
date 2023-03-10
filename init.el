;;; init.el --- Corvus' configuration entry point.
;;
;; Copyright (c) 2023 Mauricio Carrasco Ruiz
;;
;; Author: Mauricio Carrasco Ruiz
;; URL: https://github.com/maucarrui
;; Version: 0.0.0

;; This file is not part of GNU Emacs.

;;; Commentary:
;; This file sets up all the default configurations and modules of Corvus.

(defvar corvus-root-dir (file-name-directory load-file-name)
  "The root directory of Corvus.")

(defvar corvus-core-dir (expand-file-name "core" corvus-root-dir)
  "The directory which contains Corvus' core configurations.")

(defvar corvus-modules-dir (expand-file-name "modules" corvus-root-dir)
  "The directory which contains Corvus' modules.")

(defun set-up-corvus ()
  "Load Corvus' configuration files."
  (corvus-message "Loading configurations...")
  (corvus-message "Loading packages...")
  (require 'corvus-packages)
  (corvus-message "Setting up behaviour...")
  (require 'corvus-behaviour)
  (corvus-message "Setting up editor...")
  (require 'corvus-editor)
  (corvus-message "Setting up keybindings...")
  (require 'corvus-keybindings)
  (corvus-message "Setting up user interface...")
  (require 'corvus-user-interface)
  (corvus-message "Setting up mode line...")
  (require 'corvus-mode-line)
  (corvus-message "Setting up themes...")
  (require 'corvus-themes)
  (corvus-message "Setting up modules...")
  (require 'corvus-leetcode)
  (require 'corvus-latex)
  (require 'corvus-golang))

(defun initialize-corvus ()
  "Initialize Corvus, indicating the time it took to set up."
  (add-to-list 'load-path corvus-core-dir)
  (add-to-list 'load-path corvus-modules-dir)
  (require 'corvus-utilities)
  (corvus-message "Starting...")
  (setq custom-file (expand-file-name "custom.el" corvus-root-dir))
  (message-function-time (set-up-corvus)
			 "Finished setting up."))

(initialize-corvus)

;;; init.el ends here
