require 'contact_list'

describe ContactList do
  context "constructs" do
    it "#print initially returns empty array" do
      phonebook = ContactList.new
      expect(phonebook.print).to eq []
    end
  end
end