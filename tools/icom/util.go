package main

import (
	"os"
	"path/filepath"
)

var (
	stdout = os.Stdout
	stderr = os.Stderr
	stdin  = os.Stdin
)

func isFile(p string) bool {
	fi, err := os.Stat(filepath.Join(p))
	return (err == nil && !fi.IsDir())
}
