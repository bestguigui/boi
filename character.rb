class Character
  def initialize(x = 0, y = 0)
    @x, @y = x, y

    @projectiles = Array.new
    @max_cooldown = 20
    @cooldown = @max_cooldown
  end

  def update
    velocity = 2

    # diagonal speed adjustment
    if ([Gosu::KB_D, Gosu::KB_A].any? {|key| Gosu::button_down?(key)})
      if ([Gosu::KB_W, Gosu::KB_S].any? {|key| Gosu::button_down?(key)})
        velocity *= 0.7 
      end
    end

    # horizontal movement
    if Gosu::button_down?(Gosu::KB_D)
      @x += velocity
    elsif Gosu::button_down?(Gosu::KB_A)
      @x -= velocity
    end
    # vertical movement
    if Gosu::button_down?(Gosu::KB_S)
      @y += velocity
    elsif Gosu::button_down?(Gosu::KB_W)
      @y -= velocity
    end

    # shot if allowed by the cooldown
    if @cooldown <= 0
      if [Gosu::KB_RIGHT, Gosu::KB_LEFT, Gosu::KB_UP, Gosu::KB_DOWN].any? {|key| Gosu::button_down?(key)} 
        x, y = @x, @y
        vx, vy = 0, 0
        projectile_vel = 5
        vx = projectile_vel  if Gosu::button_down?(Gosu::KB_RIGHT)        
        vx = -projectile_vel if Gosu::button_down?(Gosu::KB_LEFT)        
        vy = -projectile_vel if Gosu::button_down?(Gosu::KB_UP)        
        vy = projectile_vel  if Gosu::button_down?(Gosu::KB_DOWN)        
        @projectiles.push (Projectile.new(x, y, vx, vy))
        @cooldown = @max_cooldown
      end
    else
      @cooldown -= 1
    end

    to_delete = Array.new
    @projectiles.each_with_index do |projectile, i| 
      projectile.update
      to_delete.push i unless projectile.alive
    end
    to_delete.each {|e| @projectiles.delete_at(e)}
  end

  def draw
    size = 32
    color = Gosu::Color::GREEN
    Gosu::draw_rect(@x - size/2, @y - size/2, size, size, color) 

    @projectiles.each {|projectile| projectile.draw} 
  end
end