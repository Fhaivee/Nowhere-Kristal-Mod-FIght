local actor, super = Class(Actor)

function actor:init()
    super:init(self)

    self.name = "Nowhere"

    -- Ukuran disesuaikan dengan sprite lu
    self.width = 40
    self.height = 40

    -- Path ke folder gambar di assets/sprites/enemies/nowhere/
    self.sprite = "enemies/nowhere"
end

return actor