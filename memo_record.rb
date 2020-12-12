class MemoRecord
  @@count = 0
  @@db = []
  def initialize(hash)
    hash.merge!({ :id => @@count += 1}) if hash[:id].nil?
    hash.each do |key, value|
      eval("@#{key} = value")
      eval("MemoRecord.attr_accessor :#{key}")
    end
  end
  def save
    @@db << self if MemoRecord.find(self.id).nil?
    true
  end
  def self.create(hash)
    (@@db << MemoRecord.new(hash))[-1]
  end
  def update(hash)
    hash.each { |key, value| eval("@#{key} = value") }
    self
  end
  def destroy
    @@db.delete_if { |obj| obj == self }
  end
  def self.find(id)
    @@db.find { |obj| obj.id == id }
  end
  def self.find_by(hash)
    hash.each do |key, value|
      return @@db.find { |obj| obj.send(key) == value }
    end
  end
  def self.where(hash)
    hash.each do |key, value|
      return @@db.find_all { |obj| obj.send(key) == value }
    end
  end
  def self.all
    @@db
  end
end
