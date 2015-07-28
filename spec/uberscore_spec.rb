require_relative "../lib/uberscore"
require "pry"

describe Uberscore do
  it "works" do
    expect(%w[A B C].map(&_.downcase)).to eq(%w[a b c])
  end

  it "chains method calls" do
    expect(%w[0x 0d ea].map(&_.hex.divmod(13)[1] == 0)).to eq(%w[0x 0d ea].map { |element| element.hex.divmod(13)[1] == 0 })
  end

  it "can call ::new" do
    expect([Array, Hash].map(&_.new(4))).to eq([Array, Hash].map { |a_class| a_class.new(4) })
  end

  it "can be nested" do
    expect([[2, 3]].map(&_.map(&_ * 2))).to eq([[2, 3]].map { |array| array.map { |element| element * 2 } })
  end

  it "can subscript" do
    expect([{ name: "foo" }, { name: "bar" }].map(&_[:name])).to eq([{ name: "foo" }, { name: "bar" }].map { |hash| hash[:name] })
  end

  it "can use multiple parameters" do
    expect([[1, 2], [3, 4]].map(&_ + _)).to eq([3, 7])
    expect([[1, 2], [3, 4]].map(&_ + _ * 10)).to eq([21, 43])
    expect([[1, 2, "100"], [3, 4, "200"]].map(&_ + _ * _.to_i)).to eq([201, 803])
    expect([["text, with, commas", ""]].map(&_.gsub(",", _))).to eq(["text with commas"])
    expect([["text, with, commas", ",", ""]].map(&_.gsub(_, _))).to eq(["text with commas"])
  end
end
