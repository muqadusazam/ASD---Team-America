package fc.model.dao;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoDatabase;

/**
 *
 * @author Liam
 */
public class MongoDBConnector extends MongoDB {

    protected MongoClientURI generateURI() {
        return new MongoClientURI("mongodb://" + this.OWNER + ":" + this.PASSWORD + this.KEY);
    }

    public MongoDatabase getMongoDB(){
       MongoClientURI uri = generateURI();
       MongoDatabase db;
       try (MongoClient client = new MongoClient(uri)) {
            db = client.getDatabase(uri.getDatabase());
       }
       return db;
    }
}
