#! /usr/bin/env ruby

require 'nokogiri'

RECORDS_PATTERN = "./PT*.xml"

@records = Nokogiri::XML("<records></records>").root

Dir["#{RECORDS_PATTERN}"].each do |file|
  doc = Nokogiri::XML(File.open(file))

  doc.xpath('//formHeader').each do |element|
    @records.add_child(element)
  end
end

File.write('records.xml', @records)
