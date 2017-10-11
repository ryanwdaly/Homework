require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Ryan") }
  subject(:brownie) {Dessert.new("brownie", 5, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to be(5)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("brownie", "five", "Ryan")}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient("flour")
      expect(brownie.ingredients).to eq(["flour"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["flour", "chocolate", "eggs", "sugar"]
      brownie.mix!
      expect(brownie.ingredients).to_not eq(["flour", "chocolate", "eggs", "sugar"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"do
      brownie.eat(2)
      expect(brownie.quantity).to eq(3)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{brownie.eat(10)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Ryan the Great Baker")
     expect(brownie.serve).to eq("Chef Ryan the Great Baker has made 5 brownies!")
  end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
