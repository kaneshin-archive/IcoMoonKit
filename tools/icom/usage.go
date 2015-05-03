package main

import (
	"fmt"
	"os"
)

const usageText = `icom

  Usage:
    icom -h/--help
    icom <command> <json file>

  Commands:
    gen
    out

  Examples:
    icom out selection.json
    icom gen selection.json
`

func usage() {
	fmt.Printf(usageText)
	os.Exit(1)
}
