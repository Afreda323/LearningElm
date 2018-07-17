module Main exposing (..)

import Html
import List


type alias Item =
    { name : String
    , qty : Int
    , freeQty : Int
    }


cart : List Item
cart =
    [ { name = "Lemon", qty = 1, freeQty = 0 }
    , { name = "Apple", qty = 5, freeQty = 0 }
    , { name = "Pear", qty = 10, freeQty = 0 }
    ]


checkFree : Int -> Int -> Item -> Item
checkFree qtyCheck freeQtyCheck item =
    if item.freeQty == 0 && item.qty >= qtyCheck then
        { item | freeQty = freeQtyCheck }
    else
        item


main : Html.Html msg
main =
    List.map (checkFree 10 3 >> checkFree 5 1) cart
        |> toString
        |> Html.text
