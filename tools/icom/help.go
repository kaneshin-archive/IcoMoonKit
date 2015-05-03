package main

import (
	"fmt"
)

var cmdHelp = &command{
	usage: "help",
}

func init() {
	cmdHelp.run = help
}

func help(args []string) error {
	fmt.Printf(usageText)
	return nil
}
