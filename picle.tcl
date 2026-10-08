#!/bin/sh
# restart using tcl \
exec tclsh "$0" ${@}

# picle.tcl --
#
#       Pipe Cleaner: the pipeline debugger app.
#
#       This is built for use on *Nix operating systems with shells that
#       utilize the pipe '|' operator. It lets the user build command pipelines
#       and inspect output with a GUI instead of having to on the command line.
#
# Copyright (c) 2026 odoood
#
# License: GPLv3 only; see COPYING for full license info
#
package require Tk

namespace eval picle {
}
