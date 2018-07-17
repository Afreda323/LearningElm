module Main exposing (..)

import Html
import String


capLongNames maxLen str =
    if String.length str > maxLen then
        String.toUpper str
    else
        str


main =
    let
        name =
            "Anthony"

        nameLength =
            String.length name
    in
    capLongNames 10 name
        ++ "; length: "
        ++ toString nameLength
        |> Html.text
