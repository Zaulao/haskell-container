# haskell-container
Container to develop with Haskell

## Running

The `Makefile` automates the build and run processes using docker. 

To only build the image, type:
```
sudo make build
```
It will create an Ubuntu image named `dev-container`.

---

To run the `dev-container` image, type:
```
sudo make run
```
It will run the image, copy the `code/` folder into the container and give you an interactive terminal into this folder inside the running container. 

---

If you just want to run all the process using a single command, type:
```
sudo make all
```
---

To achieve the best result with this container, keep your files under the `code` folder.
