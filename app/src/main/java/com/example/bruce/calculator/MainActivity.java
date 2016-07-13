package com.example.bruce.calculator;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.util.Log;

import java.text.DecimalFormat;

public class MainActivity extends AppCompatActivity {
    private static final String TAG = "MainActivity";
    private final DecimalFormat mDecimalFormat = new DecimalFormat("###,###.#");
    private TextView mCalculatorNumber;
    private static final int[] mNumID = {
            R.id.btn_1,
            R.id.btn_2,
            R.id.btn_3,
            R.id.btn_4,
            R.id.btn_5,
            R.id.btn_6,
            R.id.btn_7,
            R.id.btn_8,
            R.id.btn_9,
            R.id.btn_0,
            R.id.btn_point,
    };
    private static final int[] mOperatorID = {
            R.id.btn_plus,
            R.id.btn_less,
            R.id.btn_multiply,
            R.id.btn_except,
            R.id.btn_equal
    };
    private Button btnAC;
    private double mNum1 = 0d;
    private double mNum2 = -1d;
    private int mOperator = -1;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mCalculatorNumber = (TextView) findViewById(R.id.cal_number);
        btnAC = (Button) findViewById(R.id.btn_ac);
        btnAC.setOnClickListener(zero);
        for(int i : mNumID) {
            Button btn = (Button) findViewById(i);
            btn.setOnClickListener(numClick);
            Log.i(TAG, "i = " + i + " " + mNumID.length);
        }
        for(int i : mOperatorID) {
            Button btn = (Button) findViewById(i);
            btn.setOnClickListener(operatorClick);
            Log.i(TAG, "i = " + i + " " + mOperatorID.length);
        }
        Log.i(TAG, "onCreate(Bundle savedInstanceState)");
    }

    private Button.OnClickListener numClick = new Button.OnClickListener() {
        @Override
        public void onClick(View v) {
            if(mOperator == -1) {
                Button clickButton = (Button) v;
                if(mCalculatorNumber.getText().equals("0") && v.getId() == R.id.btn_point) {
                    mCalculatorNumber.setText(mCalculatorNumber.getText().toString() + clickButton.getText());
                } else if(mCalculatorNumber.getText().equals("0")){
                    if(v.getId() != R.id.btn_0) {
                        btnAC.setText(getString(R.string.btn_c));
                    }
                    mCalculatorNumber.setText(clickButton.getText());
                } else {
                    mCalculatorNumber.setText(mCalculatorNumber.getText().toString() + clickButton.getText());
                }
            } else if(mOperator == 0 || mOperator == 1 || mOperator == 2 || mOperator == 3) {
                Button clickButton = (Button) v;
                if(mNum2 == -1d && v.getId() == R.id.btn_point) {
                    mCalculatorNumber.setText(getString(R.string.btn_0) + clickButton.getText());
                } else if(mNum2 == -1d){
                    mCalculatorNumber.setText(clickButton.getText());
                } else {
                    mCalculatorNumber.setText(mCalculatorNumber.getText().toString() + clickButton.getText());
                }
                mNum2 = Double.valueOf(mCalculatorNumber.getText().toString());
            }
        }
    };

    private Button.OnClickListener operatorClick = new Button.OnClickListener() {
        @Override
        public void onClick(View v) {
            switch(v.getId()) {
                case(R.id.btn_plus):
                    mOperator = 0;
                    mNum1 = Double.valueOf(mCalculatorNumber.getText().toString());
                    break;
                case(R.id.btn_less):
                    mOperator = 1;
                    mNum1 = Double.valueOf(mCalculatorNumber.getText().toString());
                    break;
                case(R.id.btn_multiply):
                    mOperator = 2;
                    mNum1 = Double.valueOf(mCalculatorNumber.getText().toString());
                    break;
                case(R.id.btn_except):
                    mOperator = 3;
                    mNum1 = Double.valueOf(mCalculatorNumber.getText().toString());
                    break;
                case(R.id.btn_equal):
                    mCalculatorNumber.setText(Calculator(mNum1,mNum2));
                    break;
            }
            Log.i(TAG, mNum1 + " " + mNum2);
        }
    };

    private Button.OnClickListener zero = new Button.OnClickListener() {
        @Override
        public void onClick(View v) {
            if (v.getId() == R.id.btn_ac) {
                btnAC.setText(getString(R.string.btn_ac));
                mCalculatorNumber.setText(getString(R.string.btn_0));
                mNum1 = 0d;
                mNum2 = -1d;
                mOperator = -1;
            }
        }
    };

    private String Calculator(double num1, double num2) {
        String result = "";
        if(mOperator == 0) {
            result = mDecimalFormat.format(num1 + num2);
            mNum1 += mNum2;
        } else if(mOperator == 1) {
            result = mDecimalFormat.format(num1 - num2);
            mNum1 -= mNum2;
        } else if(mOperator == 2) {
            result = mDecimalFormat.format(num1 * num2);
            mNum1 *= mNum2;
        } else if(mOperator == 3) {
            result = mDecimalFormat.format(num1 / num2);
            mNum1 /= mNum2;
        }
        return result;
    };
}