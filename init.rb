require 'gosu'
require_relative 'character.rb'
require_relative 'projectile.rb'

class Window < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = 'BoI clone'

    @character = Character.new(self.width/2, self.height/2)
  end

  def needs_cursor?; true; end

  def button_down(id)
    super
    close! if id == Gosu::KB_ESCAPE
  end

  def update
    @character.update
  end

  def draw
    @character.draw
  end
end

Window.new.show