{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}

import           BasicPrelude
import           Control.Monad.Trans.Resource
import           Data.Binary
import           Data.ByteString.Lazy
import           Data.Conduit
import           Data.Conduit.Binary
import qualified Data.Conduit.List                 as CL
import           Data.Conduit.Network.UDP
import           Data.Conduit.Serialization.Binary
import           Data.Streaming.Network
import           Network.Socket
import           Options.Generic
import           SwiftNav.SBP
import           System.IO

data Args = Args
  { host :: String
  , port :: Int
  } deriving (Generic)

instance ParseRecord Args

convert :: AddrInfo -> SBPMsg -> Message
convert addr sm =
  Message (toStrict $ encode sm) (addrAddress addr)

main :: IO ()
main = do
  args         <- getRecord "sbp2udp"
  (sock, addr) <- getSocketUDP (host args) (port args)
  runResourceT $
    sourceHandle stdin      =$=
      conduitDecode         =$=
      CL.map (convert addr) $$
      sinkToSocket sock
