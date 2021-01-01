docker exec cli peer channel create -o orderer.dfarmorderer.com:7050 -c yngchannel -f ./channel-artifacts/yngchannel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/dfarmorderer.com/orderers/orderer.dfarmorderer.com/msp/tlscacerts/tlsca.dfarmorderer.com-cert.pem
sleep 5

docker exec cli peer channel join -b yngchannel.block

docker exec -e CORE_PEER_ADDRESS=peer0.dfarmadmin.com:7051 -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/dfarmadmin.com/peers/peer0.dfarmadmin.com/tls/ca.crt cli peer channel join -b yngchannel.block

docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/yngadmin.com/users/Admin@yngadmin.com/msp -e CORE_PEER_ADDRESS=peer0.yngadmin.com:8051 -e CORE_PEER_LOCALMSPID="YngadminMSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/yngadmin.com/peers/peer0.yngadmin.com/tls/ca.crt cli peer channel join -b yngchannel.block

docker exec cli peer channel update -o orderer.dfarmorderer.com:7050 -c yngchannel -f ./channel-artifacts/DfarmadminMSPanchors.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/dfarmorderer.com/orderers/orderer.dfarmorderer.com/msp/tlscacerts/tlsca.dfarmorderer.com-cert.pem

docker exec -e CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/yngadmin.com/users/Admin@yngadmin.com/msp -e CORE_PEER_ADDRESS=peer0.yngadmin.com:8051 -e CORE_PEER_LOCALMSPID="YngadminMSP" -e CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/yngadmin.com/peers/peer0.yngadmin.com/tls/ca.crt cli peer channel update -o orderer.dfarmorderer.com:7050 -c yngchannel -f ./channel-artifacts/YngadminMSPanchors.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/dfarmorderer.com/orderers/orderer.dfarmorderer.com/msp/tlscacerts/tlsca.dfarmorderer.com-cert.pem
