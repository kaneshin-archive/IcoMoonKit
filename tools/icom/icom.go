package main

import (
	"flag"
	"fmt"
	"os"
	"os/exec"
)

var commands = []*command{
	cmdOut,
	cmdGen,
	cmdHelp,
}

func run(args []string) ([]byte, error) {
	if len(args) == 0 {
		usage()
	}
	cmd := exec.Command(args[0], args[1:]...)
	return cmd.Output()
}

func main() {
	flag.Usage = usage
	flag.Parse()
	if flag.NArg() == 0 {
		usage()
	}

	commandName := flag.Arg(0)
	for _, cmd := range commands {
		if cmd.name() == commandName {
			if err := cmd.run(flag.Args()[1:]); err != nil {
				fmt.Fprintln(stderr, "ERROR: ", err)
				os.Exit(1)
			}
			os.Exit(0)
		}
	}
	fmt.Fprintln(stderr, "ERROR: Unknown command ", commandName)
	os.Exit(1)
}
