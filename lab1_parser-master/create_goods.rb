require 'csv'

class Create
    def create_goods(html)
        goods = []
        doc = Nokogiri::HTML(html)
            doc.css(".products-layout__item").each do |item|
            name = item.css('.product-card__title').map { |name| name.text.strip }
            feedback_count = item.css('.review-button__text').map{ |feedback_count| feedback_count.text.strip }
            price = item.css('.sum').map { |price| price.text.strip }
            goods.push(
                name: name.first,
                feedback_count: feedback_count.first,
                price: price.first
            )
        end
        return goods
    end
end