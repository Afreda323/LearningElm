module Main exposing (..)

import Html
import String


(~=) str1 str2 =
    String.slice 0 1 str1 == String.slice 0 1 str2


main =
    let
        str1 =
            "Text"

        str2 =
            "Test"

        p =
            str1 ++ " ~= " ++ str2 ++ " = "
    in
    Html.text (p ++ toString (str1 ~= str2))
