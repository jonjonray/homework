require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end
 
describe Dessert do
  let(:chef) { double("chef") }
  subject(:tiramisu) {Dessert.new("tiramisu",50,:chef)}

  describe "#initialize" do
    it "sets a type"
      expect(tiramisu.type).to_eq("tiramisu")
    it "sets a quantity"
      expect(tiramisu.quantity).to_eq(50)
    it "starts ingredients as an empty array"
      expect(tiramisu.ingredients)to_eq([])
    it "raises an argument error when given a non-integer quantity"
      expect(Tiramisu.new("aaaa","a lot",:chef)).to_raise_error(ArgumentError)
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array"
      tiramisu.add_ingredient("eggs")
      expect(tiramisu.ingredients).to_eq(["eggs"])
  end

  describe "#mix!" do
    it "shuffles the ingredient array"

  end

  describe "#eat" do
    it "subtracts an amount from the quantity"

    it "raises an error if the amount is greater than the quantity"
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
