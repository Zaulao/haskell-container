data Expr a = Var a | Val Int | Add (Expr a ) (Expr a ) deriving (Show)

instance Functor Expr where
    fmap f (Var x) = Var (f x)
    fmap _ (Val x) = Val x
    fmap f (Add x y) = Add (fmap f x) (fmap f y)

instance Applicative Expr where
    pure = Var
    _ <*> Val x = Val x
    Val x <*> _ = Val x
    Var f <*> Var x = Var (f x)
    Var f <*> Add x y = Add (fmap f x) (fmap f y)
    Add f g <*> x = Add (f <*> x) (g <*> x)

instance Monad Expr where
    return = pure
    Val x >>= _ = Val x
    Var x >>= f = f x
    Add x y >>= f = Add (x >>= f) (y >>= f)


-- Como exeplo, temos a expressão: 
-- Add (Var 4) (Var 5) >>= \x -> Var (x * 2)
-- Que aplicaria a função anônima, que duplica cada valor do tipo Var, na expressão, resultando em:
-- Add (Var 8) (Var 10)
