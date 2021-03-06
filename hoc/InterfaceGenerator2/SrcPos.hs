{-# LANGUAGE DeriveDataTypeable #-}
module SrcPos where

import Data.Generics
import Text.PrettyPrint.HughesPJ
import Text.Parsec( sourceName, sourceLine, sourceColumn )

data SrcPos = SrcPos String Int Int
            | AutoGeneratedPos
    deriving ( Read, Show, Eq, Ord, Typeable, Data )

pprSourcePos (SrcPos file line col)
    = text file <> char ':' <> int line <> char ':' <> int col
pprSourcePos AutoGeneratedPos
    = text "<generated>"

parsecPosToSrcPos s = SrcPos (sourceName s) (sourceLine s) (sourceColumn s)
