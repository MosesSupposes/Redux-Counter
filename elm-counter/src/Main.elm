module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)



---- MODEL ----


type alias Player =
    { name : String, score : Int }


type alias Model =
    { p1 : Player
    , p2 : Player
    }


init : ( Model, Cmd Msg )
init =
    ( { p1 = Player "Moses" 0
      , p2 = Player "Casper" 0
      }
    , Cmd.none
    )



---- UPDATE ----


type Msg
    = Incrememnt Player
    | Decrement Player
    | Reset Player


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Incrememnt player ->
            if player.name == "Moses" then
                ( { model | p1 = { player | score = player.score + 1 } }, Cmd.none )

            else
                ( { model | p2 = { player | score = player.score + 1 } }, Cmd.none )

        Decrement player ->
            if player.name == "Moses" then
                ( { model | p1 = { player | score = player.score - 1 } }, Cmd.none )

            else
                ( { model | p2 = { player | score = player.score - 1 } }, Cmd.none )

        Reset player ->
            if player.name == "Moses" then
                ( { model | p1 = { player | score = 0 } }, Cmd.none )

            else
                ( { model | p2 = { player | score = 0 } }, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view { p1, p2 } =
    div []
        [ div []
            [ p [] [ text p1.name ]
            , p [] [ text (String.fromInt p1.score) ]
            ]
        , button [ onClick (Incrememnt p1) ] [ text "+" ]
        , button [ onClick (Decrement p1) ] [ text "-" ]
        , button [ onClick (Reset p1) ] [ text "reset" ]
        , div []
            [ p [] [ text "Casper" ]
            , p [] [ text (String.fromInt p2.score) ]
            ]
        , button [ onClick (Incrememnt p2) ] [ text "+" ]
        , button [ onClick (Decrement p2) ] [ text "-" ]
        , button [ onClick (Reset p2) ] [ text "reset" ]
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
