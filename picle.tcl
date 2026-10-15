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
    # Text variables for the command entry widgets

    variable E0TextVar {}
    variable E1TextVar {}
    variable E2TextVar {}
    variable E3TextVar {}
    variable E4TextVar {}
    variable E5TextVar {}
    variable E6TextVar {}
    variable E7TextVar {}
    variable E8TextVar {}
    variable E9TextVar {}
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
    variable E0TextVar
    variable E1TextVar
    variable E2TextVar
    variable E3TextVar
    variable E4TextVar
    variable E5TextVar
    variable E6TextVar
    variable E7TextVar
    variable E8TextVar
    variable E9TextVar

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

    ttk::entry .t.l.e0 -textvariable picle::E0TextVar
    ttk::entry .t.l.e1 -textvariable picle::E1TextVar
    ttk::entry .t.l.e2 -textvariable picle::E2TextVar
    ttk::entry .t.l.e3 -textvariable picle::E3TextVar
    ttk::entry .t.l.e4 -textvariable picle::E4TextVar
    ttk::entry .t.l.e5 -textvariable picle::E5TextVar
    ttk::entry .t.l.e6 -textvariable picle::E6TextVar
    ttk::entry .t.l.e7 -textvariable picle::E7TextVar
    ttk::entry .t.l.e8 -textvariable picle::E8TextVar
    ttk::entry .t.l.e9 -textvariable picle::E9TextVar

    grid .t.l.e0 -sticky we -columnspan 2 -row 0
    grid .t.l.e1 -sticky we -column 1 -row 1
    grid .t.l.e2 -sticky we -column 1 -row 2
    grid .t.l.e3 -sticky we -column 1 -row 3
    grid .t.l.e4 -sticky we -column 1 -row 4
    grid .t.l.e5 -sticky we -column 1 -row 5
    grid .t.l.e6 -sticky we -column 1 -row 6
    grid .t.l.e7 -sticky we -column 1 -row 7
    grid .t.l.e8 -sticky we -column 1 -row 8
    grid .t.l.e9 -sticky we -column 1 -row 9

    set E0TextVar {echo 'hi, friend!'}
    set E1TextVar {sed 's/r//'}
    set E2TextVar {}
    set E3TextVar {}
    set E4TextVar {}
    set E5TextVar {}
    set E6TextVar {}
    set E7TextVar {}
    set E8TextVar {}
    set E9TextVar {}

    # Bind all the entry fields to call RefreshOutput on Enter

    bind .t.l.e0 <KeyPress-Return> picle::RefreshOutput
    bind .t.l.e1 <KeyPress-Return> picle::RefreshOutput
    bind .t.l.e2 <KeyPress-Return> picle::RefreshOutput
    bind .t.l.e3 <KeyPress-Return> picle::RefreshOutput
    bind .t.l.e4 <KeyPress-Return> picle::RefreshOutput
    bind .t.l.e5 <KeyPress-Return> picle::RefreshOutput
    bind .t.l.e6 <KeyPress-Return> picle::RefreshOutput
    bind .t.l.e7 <KeyPress-Return> picle::RefreshOutput
    bind .t.l.e8 <KeyPress-Return> picle::RefreshOutput
    bind .t.l.e9 <KeyPress-Return> picle::RefreshOutput

    return
}

# picle::RefreshOutput --
#
#       Executes the command pipeline, replacing the output pane text with the
#       pipeline output. Assumes /bin/sh is on the path.
#
# Arguments:
#       NONE
#
# Results:
#       NONE

proc picle::RefreshOutput {} {
    set pipeStdout [exec /bin/sh -c [picle::PipeCmd]]
    .t.r.t configure -state normal
    .t.r.t replace 0.0 end $pipeStdout
    .t.r.t configure -state disabled

    return
}

# picle::PipeCmd --
#
#       Return the full pipeline command text.
#
# Arguments:
#       NONE
#
# Results:
#       The pipeline commands joined together by pipe chars, as one string.

proc picle::PipeCmd {} {
    # Get the command list and prepend call to the : builtin to ensure the
    # pipeline exec does not hang due to an initial cmd waiting for input

    set cmdList [linsert [picle::ListDelEmpty [picle::TextVarList]] 0 ":"]

    return [join $cmdList " | "]
}

# picle::ListDelEmpty --
#
#       Utility proc to remove empty list items. An empty item is defined as a
#       zero-length string or string with only space characters.
#
# Arguments:
#       listVal   the list of items from which empty items should be removed.
#
# Results:
#       The list of items with empty items removed.

proc picle::ListDelEmpty {listVal} {
    # Create a new list and add all non-empty items to it, then return it

    set retval [list]

    foreach item $listVal {
        if {[concat $item] == {}} {
            continue
        }
        lappend retval $item
    }

    return $retval
}

# picle::TextVarList --
#
#       Get list of all command entry widget textvariable values.
#
# Arguments:
#       NONE
#
# Results:
#       List of all command entry widget textvariable values.

proc picle::TextVarList {} {
    variable E0TextVar
    variable E1TextVar
    variable E2TextVar
    variable E3TextVar
    variable E4TextVar
    variable E5TextVar
    variable E6TextVar
    variable E7TextVar
    variable E8TextVar
    variable E9TextVar

    return [list \
            $E0TextVar \
            $E1TextVar \
            $E2TextVar \
            $E3TextVar \
            $E4TextVar \
            $E5TextVar \
            $E6TextVar \
            $E7TextVar \
            $E8TextVar \
            $E9TextVar]
}

###############################################################################
# Main
###############################################################################
picle::TopWindow
picle::RefreshOutput
