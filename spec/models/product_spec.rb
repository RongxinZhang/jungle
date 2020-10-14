require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context "new product given empty object" do
      it "fails" do
        product=Product.new
        expect(product.save).to be false
      end
    end

    context "new product has no name" do
      test_product = {description: "something new", 
        price_cents: 100, quantity: 10, category_id: 1}

      it "fails" do
        product=Product.new(test_product)
        expect(product.save).to be false

      end
    end

    context "new product has no description" do
      test_product = {name: "name", 
        price_cents: 100, quantity: 10, category_id: 1}

      it "fails" do
        product=Product.new(test_product)
        expect(product.save).to be false
      end
    end

    context "new product has no price" do
      test_product = {name: "name", 
        description: "description", quantity: 10, category_id: 1}

      it "fails" do
        product=Product.new(test_product)
        expect(product.save).to be false
      end
    end

    context "new product has no categoryid" do
      test_product = {name: "name", 
        description: "description", quantity: 10, price_cents: 1}

      it "fails" do
        product=Product.new(test_product)
        expect(product.save).to be false
      end
    end

    context "new product has no categoryid" do
      test_product = {name: "name", 
        description: "description", category_id: 10, price_cents: 1}

      it "fails" do
        product=Product.new(test_product)
        expect(product.save).to be false
      end
    end

    context "has all fields" do
      test_product = {name: "name", 
        description: "description", price_cents: 10 , quantity: 10, category_id: 1}

      it "pass" do
        product=Product.new(test_product)
        expect(product.save).to be true
      end
    end

  end
end
