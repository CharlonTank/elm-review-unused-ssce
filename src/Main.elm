module Main exposing (view)

import Html exposing (..)
import Html.Attributes as Attr exposing (class, type_)
import Html.Events exposing (..)


type alias Model =
    { name : String
    , entityType : Maybe EntityType
    , workspaceName : String
    , propertyName : String
    , unitName : String
    }


type EntityType
    = Individual
    | Company


type Msg
    = NoOp


viewOnboardingFullFlow : Model -> Html Msg
viewOnboardingFullFlow form =
    let
        needsSiren =
            case form.entityType of
                Just Individual ->
                    False

                _ ->
                    True

        entityTypeLabel =
            case form.entityType of
                Just Individual ->
                    "Individual"

                Just Company ->
                    "Company"

                Nothing ->
                    ""

        workspaceNameValue =
            form.workspaceName

        workspaceAddressText =
            "123 Main St"

        propertyAddressText =
            "456 Oak Ave"

        propertyNameValue =
            form.propertyName

        unitNameValue =
            form.unitName

        viewAnsweredItem label value =
            if String.isEmpty value then
                text ""

            else
                div [ class "text-neutral-500 dark:text-stone-400 text-sm" ]
                    [ text label
                    , text " "
                    , span [ class "font-medium text-neutral-700 dark:text-stone-300" ] [ text value ]
                    ]

        mobileRecapItems =
            List.filterMap identity
                [ if form.entityType /= Nothing then
                    Just (viewAnsweredItem "Legal Form" entityTypeLabel)

                  else
                    Nothing
                , if not (String.isEmpty workspaceNameValue) then
                    Just (viewAnsweredItem "Workspace" workspaceNameValue)

                  else
                    Nothing
                , if not (String.isEmpty propertyNameValue) then
                    Just (viewAnsweredItem "Property" propertyNameValue)

                  else
                    Nothing
                ]
    in
    div []
        mobileRecapItems


view : Model -> Html Msg
view model =
    viewOnboardingFullFlow model
