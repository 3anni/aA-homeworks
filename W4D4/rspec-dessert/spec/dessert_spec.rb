require 'rspec'
require 'dessert'
require 'chef'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { Chef.new("chef")}
  subject(:cookie) {Dessert.new("cookie", 50, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cookie.type).to eq ('cookie')
    end

    it "sets a quantity" do
      expect(cookie.quantity).to eq (50)
    end

    it "starts ingredients as an empty array" do
      expect(cookie.ingredients).to eq ([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("cookie", "chocolate") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cookie.add_ingredient("chocolate chips")
      expect(cookie.ingredients).to eq(["chocolate chips"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      cookie.add_ingredient("flour")
      cookie.add_ingredient("sugar")
      cookie.add_ingredient("egg")
      current_arr = cookie.ingredients.map{ |el| el }
      cookie.mix!
      expect(cookie.ingredients).to_not eq(current_arr)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cookie.eat(1)
      expect(cookie.quantity).to eq(49)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {cookie.eat(51)}.to raise_error(RuntimeError)
    end
  end

  # let(:chef) { double("chef") }
  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(cookie.serve).to match(/Chef/)
    end
  end

  # let(:chef) { double("chef") }
  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      cookie.make_more
    end
  end
end
