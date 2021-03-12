(defun run-cling ()
  "Open an instance of the cling c++ interpreter on a terminal"
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (progn (split-window-sensibly)
	     (other-window 1)
	     (ansi-term "/usr/bin/zsh"))
    (switch-to-buffer-other-window "*ansi-term*"))
  (term-send-raw-string "cling\n"))

(defun cling-send-block ()
  "Send selected region to cling running on terminal"
  (interactive)
  (defvar block)
  (setq block (concat (buffer-substring (region-beginning) (region-end)) "\n"))
  (run-cling)
  (term-send-raw-string block))

(defun cpp-comment ()
  "Create vertical comment line for better visualization between functions"
  (interactive)
  (insert "\n\n//------------------------------------------------------------------------------\n\n\n"))

(defun execute-c-program ()
  "Option to quick compile and see results in minibuffer"
  (interactive)
  (defvar foo)
  (setq foo (concat "g++ " (buffer-name) " && ./a.out\n" ))
  (if (not (get-buffer "*ansi-term*"))
      (progn (split-window-sensibly)
	     (other-window 1)
	     (ansi-term "/usr/bin/zsh"))
    (switch-to-buffer-other-window "*ansi-term*")
    (term-send-raw-string foo)))

(defun cpp-snippet ()
  "Create a prototype main file with main libraries and main function"
  (interactive)
  (insert "/*
 * AUTHOR: Joao Pargana
 * MAIL: icmjmp@protonmail.ch
 * jmpargana.com
 * MIT License 
 *
 *
 * DETAILS: 
 * 
 *
 *
 */


// Input/Output streams
#include <iostream>
#include <fstream>
#include <sstream>

// Containers 
#include <string>
#include <vector>
#include <array>
#include <map>
#include <unordered_map>
#include <iterator>

// Others
#include <algorithm>
#include <regex>
#include <random>
#include <functional>
#include <exception>
#include <locale>
#include <chrono>
#include <cmath>


//------------------------------------------------------------------------------


using namespace std;


//------------------------------------------------------------------------------





//------------------------------------------------------------------------------


int main()
try
{

    return 0;
}

catch (exception& e)
{
    cerr << e.what() << endl;
    return 1;
}

catch (...)
{
    cout << \"exiting\" << endl;
    return 2;
}
")
  (goto-line 8) (end-of-line) (insert (buffer-name))
  (goto-line 48))
