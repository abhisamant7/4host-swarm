docker exec cli peer channel create -o orderer.dfarmorderer.com:7050 -c demodfarmchannel -f ./channel-artifacts/demodfarmchannel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/dfarmorderer.com/orderers/orderer.dfarmorderer.com/msp/tlscacerts/tlsca.dfarmorderer.com-cert.pem
sleep 5

docker exec cli peer channel join -b demodfarmchannel.block

docker exec -e CORE_PEER_ADDRESS=peer0.dfarmadmin.com:7051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/dfarmadmin.com/peers/peer0.dfarmadmin.com/tls/ca.crt cli peer channel join -b demodfarmchannel.block

docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/dfarmdemo.com/users/Admin@dfarmdemo.com/msp -e CORE_PEER_ADDRESS=peer0.dfarmdemo.com:9051 -e CORE_PEER_LOCALMSPID="DfarmdemoMSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/dfarmdemo.com/peers/peer0.dfarmdemo.com/tls/ca.crt cli peer channel join -b demodfarmchannel.block

docker exec cli peer channel update -o orderer.dfarmorderer.com:7050 -c demodfarmchannel -f ./channel-artifacts/DfarmadminMSPanchors1.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/dfarmorderer.com/orderers/orderer.dfarmorderer.com/msp/tlscacerts/tlsca.dfarmorderer.com-cert.pem

docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/dfarmdemo.com/users/Admin@dfarmdemo.com/msp -e CORE_PEER_ADDRESS=peer0.dfarmdemo.com:9051 -e CORE_PEER_LOCALMSPID="DfarmdemoMSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/dfarmdemo.com/peers/peer0.dfarmdemo.com/tls/ca.crt cli peer channel update -o orderer.dfarmorderer.com:7050 -c demodfarmchannel -f ./channel-artifacts/DfarmdemoMSPanchors.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/dfarmorderer.com/orderers/orderer.dfarmorderer.com/msp/tlscacerts/tlsca.dfarmorderer.com-cert.pem
