import mongoose from 'mongoose';
import dataBaseData from './default';

const { mongoURI }: any = dataBaseData;

const connectDB = async () => {
    try {
        await mongoose.connect(mongoURI, {
            useNewUrlParser: true,
            useCreateIndex: true,
            useFindAndModify: false,
            useUnifiedTopology: true
        });
        console.log('Connected to the Database');
    } catch (err) {
        console.error(err.message);
        process.exit(1);
    }
};

export default connectDB;