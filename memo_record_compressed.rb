class MemoRecord;@@c=0;@@d=[]
  def initialize(h);{id:@@c+=1}.merge(h).each{|k,v| eval("@#{k}=v;MemoRecord.attr_accessor :#{k}")};end
  def save;@@d<<self if MemoRecord.find(self.id).nil?;true;end
  def update(h);h.each{|k,v| eval("@#{k}=v")};self;end
  def destroy;@@d.delete_if{|o| o==self};end;def self.find(i);@@d.find{|o| o.id==i};end
  def self.create(h);(@@d<<MemoRecord.new(h))[-1];end;def self.all;@@d;end
  def self.find_by(h);h.each{|k,v| return @@d.find{|o| o.send(k)==v}};end
  def self.where(h);h.each{|k,v| return @@d.find_all{|o| o.send(k)==v}};end
end
