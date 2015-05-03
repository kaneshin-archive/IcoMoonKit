package main

import (
	"errors"
	"strings"
)

type command struct {
	usage string
	run   func([]string) error
}

func (c *command) name() string {
	if f := strings.Fields(c.usage); len(f) > 0 {
		return f[0]
	}
	return ""
}

func (c *command) err() error {
	return errors.New(`While executing icom ` + c.name() + `
Usage: ` + c.usage)
}
