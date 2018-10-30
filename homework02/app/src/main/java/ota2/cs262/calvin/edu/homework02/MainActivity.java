package ota2.cs262.calvin.edu.homework02;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;

import java.util.List;

public class MainActivity extends AppCompatActivity {

    //    TextView mTitleText;
//    TextView mAuthorText;
    EditText idInput;
    TextView playerList;
    getMonopolyData theData;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

//        mTitleText = findViewById(R.id.titleText);
//        mAuthorText = findViewById(R.id.authorText);
        idInput = findViewById(R.id.IDinput);
        playerList = findViewById(R.id.playerList);
        theData = new getMonopolyData(playerList, idInput, this);
//
//        if(getSupportLoaderManager().getLoader(0)!=null){
//            getSupportLoaderManager().initLoader(0,null,this);
//        }

    }

    public void fetchData(View view) {

        if (theData != null) {
            theData.cancel(true);
        }
        theData = new getMonopolyData(playerList, idInput, this);
        theData.execute();

    }
}
