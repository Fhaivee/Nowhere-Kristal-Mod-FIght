-- Gua ganti nama "Dummy" jadi "TesJokowi" biar lu gak bingung
local TesJokowi, super = Class(Encounter)

function TesJokowi:init()
    super.init(self)

    -- Text awal battle
    self.text = "* Bunuh aja si bangsat ini"

    -- Lagu battle
    self.music = "battle"
    
    -- Background kotak-kotak ungu
    self.background = true

    -- Manggil musuh (PENTING: ini harus "jokowi" sesuai nama file enemy lu)
    self:addEnemy("jokowi")
end

return TesJokowi