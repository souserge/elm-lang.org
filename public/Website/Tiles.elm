
module Website.Tiles (tile, toTile, miniTiles) where

import List (take,drop,intersperse)

format (x,y,z) = (x, z ++ y ++ ".elm", "/screenshot/" ++ y ++ ".jpg")

tileSize = 130

toTile info =
  let (name, ex, pic) = format info
      x = tileSize
  in  Graphics.link ("/edit/examples/" ++ ex) $ flow down
       [ container x x middle $ image (x-10) (x-10) pic
       , width x . centeredText $ toText name
       ]

groups n lst =
  case lst of
  { [] -> [] ; x:xs -> take n lst : groups n (drop n lst) }

tile w tiles =
  flow down . intersperse (spacer 1 14) . map (flow right) $ groups (w `div` tileSize) tiles


toMiniTile info =
  let (name, ex, pic) = format info
  in  Graphics.link ("/edit/examples/" ++ ex) $
      container 100 100 middle $ image 90 90 pic


miniTiles w info =
  let tiles = map toMiniTile info in
  flow down . intersperse (spacer 1 14) . map (flow right) $ groups (w `div` 70) tiles