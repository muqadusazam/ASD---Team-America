package fc.model.dao;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoDatabase;

//Sets up connection to mLab and gets our MongoDB
public class MongoDBConnector extends MongoDB {
    
    //Generates the uniform resource identifier for accessing our MongoDB
    protected MongoClientURI generateURI() {
        return new MongoClientURI("mongodb://" + this.OWNER + ":" + this.PASSWORD + this.KEY);
    }
    
    //Fetches our team's MongoDB via the generated URI
    public MongoDatabase getMongoDB(){
       MongoClientURI uri = generateURI();
       MongoDatabase db;
       try (MongoClient client = new MongoClient(uri)) {
            db = client.getDatabase(uri.getDatabase());
       }
       return db;
    }
}
