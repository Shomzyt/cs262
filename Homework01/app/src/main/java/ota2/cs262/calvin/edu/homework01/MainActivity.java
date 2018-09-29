package ota2.cs262.calvin.edu.homework01;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    TextView result;
    EditText value1_input, value2_input;
    Button calculate;
    Spinner operator;

    float result_num;
    int num1, num2;

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        value1_input = findViewById(R.id.value1_input);
        value2_input = findViewById(R.id.value2_input);
        operator = findViewById(R.id.operator);
        calculate = findViewById(R.id.calculate);
        result = findViewById(R.id.result);


        calculate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (value1_input.getText().length() == 0 && value2_input.getText().length() == 0) {
                    result.setText("0");
                } else {

                    num1 = Integer.parseInt(value1_input.getText().toString());
                    num2 = Integer.parseInt(value2_input.getText().toString());

                    if (operator.getSelectedItem().toString().equals("+")) {
                        result_num = num1 + num2;
                    } else if (operator.getSelectedItem().toString().equals("×")) {
                        result_num = num1 * num2;
                    } else if (operator.getSelectedItem().toString().equals("÷")) {
                        result_num = num1 / num2;
                    } else if (operator.getSelectedItem().toString().equals("−")) {
                        result_num = num1 - num2;
                    }

                    result.setText(String.valueOf(result_num));
                }

            }
        });
    }
}