## 📁 Importing Server Files

Anything **placed** in the `modules/` directory will be copied to the `Modules/` directory in **[Docker Container](https://www.docker.com/resources/what-container/)**. This includes custom **scripts**, **assets**, **configurations**, or even **new modules**.

##### Folder Structure:
```
.etc/
.github/
config/
modules/ <<-- Your modules should be placed here.
CODEOWNERS
dockerfile
LICENSE
readme.md
```

---

##### 👉 Note: Adding Your files without overriding Native/Multiplayer modules.

If **any file** in your `local modules/` directory **match file** already present in the `server’s Modules/` directory, they will be replaced by the `local files`.

If you want to add **custom maps** for the **Multiplayer Game Type**, you would place them in the following directory `modules/Multiplayer/SceneObj/some_map/`.
- This **ensures** that only the map files are **modified** while the **rest** of the **Native** and **Multiplayer** module files **remains untouched**.
- **Do not forget** to **include** your map in **server configuration**.