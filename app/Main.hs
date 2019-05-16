import Data.SBV

main :: IO ()
main = do
    res <- prove $ \x -> x `shiftL` 2 .== 4 * (x :: SWord8)
    print res
