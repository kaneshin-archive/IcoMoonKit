package main

import (
	"encoding/json"
	"io/ioutil"
	"os"
	"path/filepath"
	"reflect"
	"strings"
	"text/template"
)

var cmdOut = &command{
	usage: "out <json file>",
}

var cmdGen = &command{
	usage: "gen <json file>",
}

func init() {
	cmdOut.run = out
	cmdGen.run = gen
}

const (
	unknown = iota
	ios
	android
)

var target = unknown
var delimiter = "_"
var base = ""
var lang = ""

var coordinator = map[string]map[string]string{}

func parseOptions(args []string) {
	isOpt := false
	for idx, arg := range args {
		if !isOpt && strings.HasPrefix(arg, "--") {
			isOpt = true
		}
		if isOpt {
			switch arg {
			case "--target":
				if len(args) > idx+1 {
					switch strings.ToLower(args[idx+1]) {
					case "ios":
						target = ios
					case "android":
						target = android
					}
				}
			case "--delimiter":
				if len(args) > idx+1 {
					delimiter = args[idx+1]
				}
			case "--base":
				if len(args) > idx+1 {
					base = args[idx+1]
				}
			case "--lang":
				if len(args) > idx+1 {
					lang = args[idx+1]
				}
			}
		}
	}
}

func common(args []string) error {
	if len(args) == 0 {
		return cmdGen.err()
	}

	dir, err := os.Getwd()
	if err != nil {
		return err
	}
	parseOptions(args)
	for _, arg := range args {
		file := filepath.Join(dir, arg)
		if !isFile(file) {
			continue
		}
		b, err := ioutil.ReadFile(file)
		if err != nil {
			return err
		}
		var d map[string]interface{}
		if err := json.Unmarshal(b, &d); err != nil {
			return err
		}
		format("", "", d)
	}

	if len(base) > 0 {
		sweepToFill(base)
	}
	return nil
}

func out(args []string) error {
	if err := common(args); err != nil {
		return err
	}

	for k, v := range coordinator {
		if lang != k {
			continue
		}
		switch target {
		case ios:
			execute(stdout, plistTemplate, v)
		case android:
			execute(stdout, androidTemplate, v)
		}
	}

	return nil
}

func gen(args []string) error {
	if err := common(args); err != nil {
		return err
	}

	if len(lang) == 0 {
		for k, v := range coordinator {
			switch target {
			case ios:
				genFile("ios_"+k+".plist", plistTemplate, v)
			case android:
				genFile("android_"+k+".xml", androidTemplate, v)
			}
		}
	} else {
		switch target {
		case ios:
			genFile("ios_"+lang+".plist", plistTemplate, coordinator[lang])
		case android:
			genFile("android_"+lang+".xml", androidTemplate, coordinator[lang])
		}
	}

	return nil
}

func format(key, subKey string, val interface{}) {
	switch reflect.ValueOf(val).Kind() {
	case reflect.Map:
		if len(key) > 0 {
			key += delimiter
		}
		key += subKey
		for k, v := range val.(map[string]interface{}) {
			format(key, k, v)
		}
	case reflect.String:
		if len(coordinator[subKey]) == 0 {
			coordinator[subKey] = map[string]string{}
		}
		// TODO: Check duplicated value
		coordinator[subKey][key] = val.(string)
	}
}

func sweepToFill(base string) {
	for ckey, cval := range coordinator {
		if ckey == base {
			continue
		}
		for key, val := range coordinator[base] {
			if len(cval[key]) == 0 {
				cval[key] = val
			}
		}
	}
}

func execute(file *os.File, tmpl string, v map[string]string) error {
	t := template.Must(template.New("").Parse(tmpl))
	if err := t.Execute(file, v); err != nil {
		return err
	}
	return nil
}

func genFile(filename, tmpl string, v map[string]string) error {
	_, err := os.Stat(filename)
	if err == nil {
		if err = os.Remove(filename); err != nil {
			return err
		}
	}
	f, err := os.Create(filename)
	if err != nil {
		return err
	}
	defer f.Close()
	return execute(f, tmpl, v)
}

const plistTemplate = `<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>{{range $k, $v := $}}
    <key>{{$k}}</key>
    <string>{{$v}}</string>{{end}}
</dict>
</plist>
`

const androidTemplate = `<?xml version="1.0" encoding="utf-8"?>
<resources>{{range $k, $v := $}}
    <string name="{{$k}}">{{$v}}</string>{{end}}
</resources>
`
