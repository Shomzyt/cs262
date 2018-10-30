package ota2.cs262.calvin.edu.lab02;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    private int mCount = 0;
    private TextView mShowCount;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mShowCount = (TextView) findViewById(R.id.show_count);
    }

    public void countUp(View view) {
        mCount++;
        if(mShowCount != null)
            mShowCount.setText(Integer.toString(mCount));
    }

    /*
     * When the TOAST button is clicked, show a toast.
     *
     * @param view The view that triggers this onClick handler.
     *             Since a toast always shows on the top, view is not used.
     * */
    public void showToast(View view) {
        Toast toast = Toast.makeText(this, getString(R.string.toast_message), Toast.LENGTH_LONG);
        toast.show();
    }


}