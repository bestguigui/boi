class Character
  def initialize(x = 0, y = 0)
    @x, @y = x, y
  end

  def update
    velocity = 2
    # horizontal movement
    if Gosu::button_down?(Gosu::KB_RIGHT)
      @x += velocity
    elsif Gosu::button_down?(Gosu::KB_LEFT)
      @x -= velocity
    end
    # vertical movement
    if Gosu::button_down?(Gosu::KB_DOWN)
      @y += velocity
    elsif Gosu::button_down?(Gosu::KB_UP)
      @y -= velocity
    end
  end

  def draw
    size = 32
    color = Gosu::Color::GREEN
    Gosu::draw_rect(@x - size/2, @y - size/2, size, size, color)  
  end
end