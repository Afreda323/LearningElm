module Main exposing (..)

import Html
import List
import String


wordCount words =
    String.split " " words |> List.length


main =
    let
        words =
            "Hello Elm lol"
    in
    Html.text (words ++ "; Count: " ++ toString (wordCount words))
