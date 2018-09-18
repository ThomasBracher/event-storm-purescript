module Test.Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Test.Assert (assert)
import Main

main :: Effect Unit
main = do
  assert $ eventListener { todo: [], onGoing: [], done: []} (CardAdded "cardId" "date" "body") == {todo: [{id: "cardId", body: "body"}], onGoing: [], done:[]}

