#!/usr/bin/env ruby

require 'rubygems'
require 'json'

module IcoMoonKit

  class Parser

    def initialize(filename)
      file = File.read(filename)
      data = JSON.parse(file)
      @icons = data["icons"]
      @font_name = data["metadata"]["name"]
    end

    def run()
      template = "Template.swift"
      class_name = @font_name + "Glyph"
      open(class_name + ".swift", "w") {|dest|
        open(template) {|f|
          f.each {|line|
            if line =~ /___GLYPH_CLASS_NAME___/
              line = line.gsub(/___GLYPH_CLASS_NAME___/, class_name)
            elsif line =~ /___FONT_NAME___/
              line = line.gsub(/___FONT_NAME___/, @font_name)
            elsif line =~ /___FONT_FILE___/
              line = line.gsub(/___FONT_FILE___/, @font_name + ".ttf")
            end
            if line =~ /___GLYPH_ENUM___/
              dest.write("    enum Type: String {\n")
              dest.write(enum(@icons))
              dest.write("    }")
            elsif line =~ /___GLYPH_CLASS_FUNC___/
              dest.write(class_func(@font_name, @icons))
            else
              dest.write(line)
            end
          }
        }
      }
    end

    :private

    def get_glyph_name(prop)
      name = ""
      prop["name"].split("-").each {|v|
        name += v.capitalize
      }
      return name
    end

    def enum(icons)
      dest = ""
      icons.each{|v|
        prop = v["properties"]
        name = get_glyph_name(prop)
        code = "\"\\u{%x}" % prop["code"] + '"'
        line = "case #{name} = #{code}"
        dest += "        " + line + "\n"
      }
      return dest
    end

    def class_func(font_name, icons)
      dest = ""
      icons.each{|v|
        prop = v["properties"]
        name = get_glyph_name(prop)
        dest += "\n"
        dest += "    public class func #{name}(#size: CGFloat, color: IcoMoonKit.Color) -> #{font_name}Glyph {\n"
        dest += "        return #{font_name}Glyph(type: .#{name}, size: size, color: color)\n"
        dest += "    }\n"
      }
      return dest
    end

  end

end

IcoMoonKit::Parser.new(ARGV[0]).run

