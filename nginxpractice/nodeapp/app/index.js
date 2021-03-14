const app = require("express")();

const appid = process.env.APPID;

app.get("/app1", (req, res) => {
    console.log(appid)
    res.send("APPID: " + appid + ",  Hello from Node App: app1 !!!!!!")
});

app.get("/app2", (req, res) => {
    console.log(appid)
    res.send("APPID: " + appid + ",  Hello from Node App: app2 !!!!!!")
});

app.get("/admin", (req, res) => {
    console.log(appid)
    res.send("APPID: " + appid + ",  Node App: Admin !!!!!! Few people can see this")
});


app.get("/", (req, res) => {
    res.send("APPID: " + appid + ",  Hello from Node App!!!!!!")
});

app.listen(9999, () => console.log(`${appid} is Listening on 9999`));