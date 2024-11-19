## F1tenth Sim League 

Clone the repo and run the following to download the f1tenth_ws by running the following command

```
git submodule update --init --recursive
```

Once the submodules are updated, you should see the f1tenth_ws folder in the ws folder. To run the docker containers, go to each of the respective folders: `autodrive_sim` and `autodrive_devkit`. 

An example using the `autodrive_devkit` folder is as follows:
```
cd autodrive_devkit
./build.sh
./run.sh
```

Make sure each script is given executable access as follows:
```
chmod +x build.sh
```

Run each docker container in seperate terminal windows.