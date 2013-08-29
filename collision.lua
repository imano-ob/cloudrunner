
require "cloud_strife"
require "cloudinho"

function isColliding(stuff1, stuff2)
  if not stuff1 or not stuff2 then
    if not stuff1 then
      print ("fark")
    end
    if not stuff2 then
      print("fark2")
    end
    return false
  end
  local width1, height1 = stuff1:size()
  local width2, height2 = stuff2:size()
  if stuff1.posx + width1 >= stuff2.posx and
     stuff1.posy + height1 >= stuff2.posy and
     stuff1.posx <= stuff2.posx + width2 and
     stuff1.posy <= stuff2.posy + height2 then
     return true
   end
   return false
end