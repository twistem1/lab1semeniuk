require 'nokogiri'
require 'json'
require 'csv'
require 'open-uri'
require_relative 'save_to_csv.rb'
require_relative 'save_to_json.rb'
require_relative 'create_goods.rb'

class Goods
    url = 'https://allo.ua/ua/televizory/'
    html = open(url)
    create = Create.new
    goods = create.create_goods(html)
    saveCSV = SaveCSV.new
    saveCSV.saveToCSV(File.join(File.dirname(__FILE__), "goods.csv"), goods)
    #saveCSV.save
    saveJson = SaveJson.new
    saveJson.saveToJson(File.join(File.dirname(__FILE__), "goods.json"), goods)
    #saveJson.save
end