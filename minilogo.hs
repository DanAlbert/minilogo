module MiniLogo where

data Mode = Up | Down
            deriving Show

data Pos  = Num Integer | Name String
            deriving Show

data Pars = PList String Pars | Param String
            deriving Show

data Vals = VList Integer Vals | Val Integer
            deriving Show

data Cmd = Pen Mode
	     | Moveto Pos Pos
	     | Def String Pars Cmd
	     | Call String Vals
	     | CmdList Cmd Cmd
           deriving Show
