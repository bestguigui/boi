require 'gosu'
require 'opengl'
require 'glu'

OpenGL.load_lib
GLU.load_lib

include OpenGL, GLU

require_relative 'character.rb'
require_relative 'projectile.rb'
require_relative 'room.rb'

class Window < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = 'BoI clone'

    @character = Character.new(self.width/2, self.height/2)
    $window = self
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