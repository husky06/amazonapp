const express = require('express');
const mongoose = require('mongoose');
// Import from other files
const authRouter = require("./routes/auth");
const adminRouter = require('./routes/admin');
const productRouter = require('./routes/product');
const userRouter = require('./routes/user');

const PORT = 3000;
const app = express();
// const DB = "mongodb+srv://thanhcuong:thanhcuong@cluster0.ldwjcuc.mongodb.net/?retryWrites=true&w=majority";
const DB = "mongodb+srv://thanhcuong:thanhcuong@cluster0.ldwjcuc.mongodb.net/?retryWrites=true&w=majority";

// middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);
mongoose.connect(DB).then(() => {
    console.log("Connection Successful");
}).catch((e) => {
    console.log(e);
})

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Connected at port ${PORT}` );
});