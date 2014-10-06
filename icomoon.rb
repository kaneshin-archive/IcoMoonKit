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
      filename = @font_name + "Glyph.swift"
      open(filename, "w") {|dest|
        open(template) {|f|
          f.each {|line|
            if line =~ /#__FONT_NAME__#/
              line = line.gsub(/#__FONT_NAME__#/, @font_name)
            elsif line =~ /#__FONT_FILE__#/
              line = line.gsub(/#__FONT_FILE__#/, @font_name + ".ttf")
            end
            if line =~ /enum Type: String/
              dest.write(line)
              dest.write(enum(@icons))
            elsif line =~ /#__GLYPH_CLASS__#/
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
        dest += "    public class func #{name}(size: CGFloat, color: UIColor) -> #{font_name}Glyph {\n"
        dest += "        return #{font_name}Glyph(type: .#{name}, size: size, color: color)\n"
        dest += "    }\n\n"
      }
      return dest
    end

  end

end

parser = IcoMoonKit::Parser.new(ARGV[0])
parser.run

