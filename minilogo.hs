module MiniLogo where

-- 1a
data Mode = Up | Down
            deriving Show

data Pos  = Num Int | Name String
            deriving Show

data Pars = PList String Pars | Param String
            deriving Show

data Vals = VList Int Vals | Val Int
            deriving Show

data Cmd = Pen Mode
	     | MoveTo Pos Pos
	     | Def String Pars Cmd
	     | Call String Vals
	     | CmdList Cmd Cmd
         | Nop
           deriving Show

-- 1b
-- def vector (x0, y0, x1, y1) pen up; moveto x0 y0; pen down; moveto x1 y1;

vector = Def "vector" (PList "x0" (PList "y0" (PList "x1" (Param "y1"))))
         (CmdList
           (Pen Up)
           (CmdList
             (MoveTo (Name "x0") (Name "y0"))
             (CmdList
               (Pen Down)
                 (MoveTo (Name "x1") (Name "y1")))))

-- 1c
steps :: Int -> Cmd
steps 0 = Nop
steps 1 = (CmdList
            (Pen Up)
            (CmdList
              (MoveTo (Num 1) (Num 1))
              (CmdList
                (Pen Down)
                (CmdList
                  (MoveTo (Num 0) (Num 1))
                  (MoveTo (Num 0) (Num 0))))))

steps n = (CmdList
            (Pen Up)
            (CmdList
              (MoveTo (Num n) (Num n))
              (CmdList
                (Pen Down)
                (CmdList
                  (MoveTo (Num (n - 1)) (Num n))
                  (CmdList
                    (MoveTo (Num (n - 1)) (Num (n - 1)))
                    (steps (n - 1)))))))
