module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, type_, value)
import Html.Events exposing (onClick, onInput)


-- model


type alias Model =
    { total : Int
    , input : Int
    , error : Maybe String
    }


initModel : Model
initModel =
    { total = 0
    , input = 0
    , error = Nothing
    }



-- update


type Msg
    = AddNum
    | Clear
    | UpdateInput String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateInput val ->
            case String.toInt val of
                Ok input ->
                    { model | input = input, error = Nothing }

                Err err ->
                    { model | input = 0, error = Just err }

        AddNum ->
            { model | total = model.total + model.input, input = 0 }

        Clear ->
            initModel



-- view


view : Model -> Html Msg
view model =
    div []
        [ h3
            []
            [ text ("Your Count: " ++ toString model.total) ]
        , input
            [ type_ "text"
            , onInput UpdateInput
            , value
                (if model.input == 0 then
                    ""
                 else
                    toString model.input
                )
            ]
            []
        , div
            []
            [ text (Maybe.withDefault "" model.error) ]
        , button
            [ type_ "button", onClick AddNum, class "btn" ]
            [ text "Add Number" ]
        , button
            [ type_ "button", class "btn", onClick Clear ]
            [ text "Clear" ]
        ]


main : Program Never Model Msg
main =
    beginnerProgram
        { model = initModel
        , view = view
        , update = update
        }
