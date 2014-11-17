#! /usr/bin/env ruby

require 'thor'
require 'nokogiri'
require 'csv'
require 'fileutils'

module Converter

  class Formatter
    def initialize(file = nil)
      f = File.open(file)
      @doc = Nokogiri::XML(f)
      f.close
    end

    def clean
      FileUtils.rm_rf Dir.glob("#{Dir.pwd}/*.csv")
    end

    def convert_nodes(differentiator)
      clean
      write_csv('formHeader', "land_data-#{differentiator}.csv")
      write_csv('seller', "sellers-#{differentiator}.csv")
      write_csv('buyer', "buyers-#{differentiator}.csv")
    end

    def write_csv(node, file)
      csv = CSV.open(file, 'wb')
      puts "Writing #{node} elements to #{file}..."
      @doc.xpath("//#{node}").each do |element|
        csv << element.search('*').map(&:text)
      end
    end

  end

  class Cli < Thor
    desc "convert FILE", "Convert XML file to CSV"
    def xml(dir = Dir.pwd)
      puts "Converting XML files in #{dir}..."

      counter = 1

      Dir["#{dir}/*.xml"].each do |file|
        xml = Converter::Formatter.new(file)
        xml.convert_nodes(counter)
        counter += 1
      end
    end
  end
end

Converter::Cli.start(ARGV)
