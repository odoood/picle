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

# picle::TopWindow --
#
#       Create and display the top level window and all children.
#
# Arguments:
#       NONE
#
# Results:
#       NONE

proc picle::TopWindow {} {
    wm title    . "Picle"
    wm minsize  . 650 515
    wm geometry . =650x515+1006+308
    grid columnconfigure . 0 -weight 1
    grid rowconfigure . 0 -weight 1

    ttk::frame .t -padding "1 1 1 1"
    grid .t -column 0 -row 0 -sticky nwes
    grid columnconfigure .t 0 -weight 1
    grid columnconfigure .t 1 -weight 1
    grid rowconfigure .t 0 -weight 1
    grid columnconfigure .t 0 -weight 1

    # The main right pane: pipe command output

    ttk::frame .t.r
    .t.r configure -relief sunken
    .t.r configure -borderwidth 2
    grid .t.r -column 1 -row 0 -sticky nwes
    grid columnconfigure .t.r 0 -weight 1
    grid rowconfigure .t.r 0 -weight 1

    scrollbar .t.v -orient vertical -command {.t.r.t yview}
    text .t.r.t -yscroll {.t.v set} -width 20 -state disabled
    grid .t.r.t .t.v -sticky nsew

    # The main left pane: pipe command entry

    ttk::frame .t.l -borderwidth 2 -relief sunken
    grid .t.l -column 0 -row 0 -sticky nwes
    grid columnconfigure .t.l 0 -weight 1
    grid columnconfigure .t.l 0 -weight 0
    grid columnconfigure .t.l 1 -weight 1
    .t.l configure -padding "3 3 3 3"
    grid columnconfigure .t.l 1 -weight 1

    # The main left pane label widgets (implied pipe operator labels)

    grid [ttk::label .t.l.l1 -text {|} -padding "1 1 1 1"] -sticky w -row 1
    grid [ttk::label .t.l.l2 -text {|} -padding "1 1 1 1"] -sticky w -row 2
    grid [ttk::label .t.l.l3 -text {|} -padding "1 1 1 1"] -sticky w -row 3
    grid [ttk::label .t.l.l4 -text {|} -padding "1 1 1 1"] -sticky w -row 4
    grid [ttk::label .t.l.l5 -text {|} -padding "1 1 1 1"] -sticky w -row 5
    grid [ttk::label .t.l.l6 -text {|} -padding "1 1 1 1"] -sticky w -row 6
    grid [ttk::label .t.l.l7 -text {|} -padding "1 1 1 1"] -sticky w -row 7
    grid [ttk::label .t.l.l8 -text {|} -padding "1 1 1 1"] -sticky w -row 8
    grid [ttk::label .t.l.l9 -text {|} -padding "1 1 1 1"] -sticky w -row 9

    # The main left pane entry widgets for user-entered command text

    grid [ttk::entry .t.l.e0] -sticky we -columnspan 2 -row 0
    grid [ttk::entry .t.l.e1] -sticky we -column 1 -row 1
    grid [ttk::entry .t.l.e2] -sticky we -column 1 -row 2
    grid [ttk::entry .t.l.e3] -sticky we -column 1 -row 3
    grid [ttk::entry .t.l.e4] -sticky we -column 1 -row 4
    grid [ttk::entry .t.l.e5] -sticky we -column 1 -row 5
    grid [ttk::entry .t.l.e6] -sticky we -column 1 -row 6
    grid [ttk::entry .t.l.e7] -sticky we -column 1 -row 7
    grid [ttk::entry .t.l.e8] -sticky we -column 1 -row 8
    grid [ttk::entry .t.l.e9] -sticky we -column 1 -row 9
}

###############################################################################
# Main
###############################################################################

picle::TopWindow
