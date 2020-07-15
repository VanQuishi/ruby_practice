require './caesar_cipher.rb'

describe "#caesar_cipher" do
    it "transform all capital letters message" do
        expect(caesar_cipher("WHAT A STRING!", 5)).to eq("BMFY F XYWNSL!")
    end

    it "transform all lowercase letters message" do
        expect(caesar_cipher("what a string!", 5)). to eq("bmfy f xywnsl!")
    end

    it "transform message with mixed letters" do
        expect(caesar_cipher("What A sTrIng!", 5)).to eq("Bmfy F xYwNsl!")
    end

    it "transform an empty message" do
        expect(caesar_cipher("", 10)).to eq ("")
    end

    it "transform message that has only punctuation marks" do
        expect(caesar_cipher("?.,!", 12)). to eq("?.,!")
    end

    it "transform message with negative position" do
        expect(caesar_cipher("boDy", -1)). to eq("anCx")
    end

    it "transform message that requires wrapping" do
        expect(caesar_cipher("ant man", -3)). to eq("xkq jxk")
    end
end