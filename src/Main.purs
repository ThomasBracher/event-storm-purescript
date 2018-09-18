module Main where

import Prelude

data ColumnTransition
  = TodoToOngoing
  | OngoingToFinished

type Body = String
type Date = String
type CardId = String

data Event
  = CardMoved CardId Date ColumnTransition
  | CardBodyChanged CardId Date Body
  | CardAdded CardId Date Body
  | CardRemoved CardId Date
  | CardArchived CardId Date

-- Commande -> Evenement -> Modèle de lecture

type Card =
  { id :: CardId
  , body :: Body
  }
type OnGoingCard =
  { id :: CardId
  , body :: Body
  , tooLong :: Boolean
  }
type KanbanBoard =
  { todo :: Array Card
  , onGoing :: Array OnGoingCard
  , done :: Array Card
  }

fun :: Event -> Event -> Unit
fun (CardAdded cardIdLeft _ _) (CardAdded cardIdRight _ _) = unit
fun _ _ = unit

eventListener :: KanbanBoard -> Event -> KanbanBoard
eventListener { todo, onGoing, done } (CardAdded cardId date body) =
  { todo: [{ id: cardId, body: body }] <> todo
  , onGoing
  , done }
eventListener board _  = board
