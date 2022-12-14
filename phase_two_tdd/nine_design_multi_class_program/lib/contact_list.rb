class ContactList
  def initialize
    @phonebook = []
  end

  def add(contact) # contact is an instance of Contact
    # Contact is added to ContactList
    # Nothing is returned
    @phonebook << contact
  end

  def print
    #Prints all the contacts in the list
    return @phonebook.compact
  end
end