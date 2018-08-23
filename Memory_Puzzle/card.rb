class Card
  attr_accessor :face_value, :face_up
  
  def initialize(face_value)
    @face_value = face_value
    @face_up = false
  end
  
  def display_info
    if @face_up
      print @face_value + '|'
    else
      print 'FD'+'|'
    end
  end
  
  def hide
    @face_up = false
  end
  
  def reveal
    @face_up = true
  end
  
  '''
  def to_s
    @face_value.to_s
  end
  
  def ==(another_card)
    @face_value.to_s == another_card.face_value.to_s
  end
  '''
  
end