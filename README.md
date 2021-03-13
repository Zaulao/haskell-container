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

To achieve the best result with this container, keep your files under the `code/` folder.

# VSCode + Containers

If you use VSCode to edit your files, you can use it to edit files directly from the running container.

First of all, you need to install the extension `Remote - Containers`. It lets you run VSCode inside a Docker container.

![alt text](https://code.visualstudio.com/assets/docs/remote/containers-tutorial/containers-extension.png)

After the installation is complete, you will see the new extension icon in the menu on the left. Run the container and it will be listed in the "Containers" menu. You can now right-click on the correct container and select the "attach to container" option. A new VSCode instance will start to run inside the container and that's it.

![alt text](https://i.ibb.co/K2PL5Bk/image.png)
