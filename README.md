![](images/ntc_logo.jpg)

# GO ntc
Waltonchain Mainnet User Manual


## Steps

### 1. Run docker container
Install latest distribution of [Go](https://golang.org "Go") if you don't have it already.  
`# sudo apt-get install -y build-essential`  

### 2. Compile source code
`# cd /usr/local/src`  
`# git clone https://github.com/WaltonChain/WaltonChain_Gntc_Src.git`  
`# cd WaltonChain_Gntc_Src`  
`# make gntc`  
`# ./build/bin/gntc version`  

### 3. Deploy
`# cd /usr/local/src/WaltonChain_Gntc_Src/gntc_bin/`  
`# cp ../build/bin/gntc ./bin/gntc`  
`# ./backend.sh`

### 4. Enter console
`# cd /usr/local/src/WaltonChain_Gntc_Src/gntc_bin/`  
`# ./bin/gntc attach ./data/gntc.ipc`

### 5. View information of the connected node
`# admin.peers`

### 6. Create account
`# personal.newAccount()`  
`# ******`  ---- Enter new account password  
`# ******`  ---- Confirm the new account password  

### 7. Mine
`# miner.start()`

### 8. Query
`# ntc.getBalance(ntc.coinbase)`

### 9. Unlock account
`# personal.unlockAccount(ntc.coinbase)`

### 10. Transfer
`# ntc.sendTransaction({from: ntc.accounts[0], to: ntc.accounts[1], value: web3.toWei(1)})`

### 11. Exit console
`# exit`

### 12. View log
`# cd /usr/local/src/WaltonChain_Gntc_Src/gntc_bin/`  
`# tail -f gntc.log`

### 13. Stop gntc
`# cd /usr/local/src/WaltonChain_Gntc_Src/gntc_bin/`  
`# ./stop.sh` 


## Acknowledgement
We hereby thank:  
· [Ethereum](https://www.ethereum.org/ "Ethereum")




