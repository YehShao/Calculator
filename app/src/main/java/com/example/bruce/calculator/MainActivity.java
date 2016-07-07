package com.example.bruce.calculator;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    private TextView mCalculatorNumber;
    private Button mOne;
    private Button mTwo;
    private Button mThree;
    private Button mFour;
    private Button mFive;
    private Button mSix;
    private Button mSeven;
    private Button mEight;
    private Button mNine;
    private Button mZero;
    private Button mPoint;
    private Button mPlus;
    private Button mLess;
    private Button mMultiply;
    private Button mExcept;
    private Button mEqual;
    private Button mAC;
    private Button mPlusLess;
    private Button mPercentage;

    private int i = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mOne = (Button) findViewById(R.id.btn_1);
        mTwo = (Button) findViewById(R.id.btn_2);
        mThree = (Button) findViewById(R.id.btn_3);
        mFour = (Button) findViewById(R.id.btn_4);
        mFive = (Button) findViewById(R.id.btn_5);
        mSix = (Button) findViewById(R.id.btn_6);
        mSeven = (Button) findViewById(R.id.btn_7);
        mEight = (Button) findViewById(R.id.btn_8);
        mNine = (Button) findViewById(R.id.btn_9);
        mZero = (Button) findViewById(R.id.btn_0);
        mPoint = (Button) findViewById(R.id.btn_point);
        mPlus = (Button) findViewById(R.id.btn_plus);
        mLess = (Button) findViewById(R.id.btn_less);
        mMultiply = (Button) findViewById(R.id.btn_multiply);
        mExcept = (Button) findViewById(R.id.btn_except);
        mEqual = (Button) findViewById(R.id.btn_equal);
        mAC = (Button) findViewById(R.id.btn_ac);
        mPlusLess = (Button) findViewById(R.id.btn_plus_less);
        mPercentage = (Button) findViewById(R.id.btn_percentage);
        mCalculatorNumber = (TextView) findViewById(R.id.cal_number);
        ButtonClick();
    }

    private void ButtonClick() {
        mOne.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                ClickMe();
            }
        });
    }

    private void ClickMe() {
        switch (i) {
            case 0:
                mCalculatorNumber.setText(String.valueOf(i+1));
                mOne.setText("I am Black Tina.");
                break;
            case 1:
                mCalculatorNumber.setText(String.valueOf(i+1));
                mOne.setText("I am Cinderella.");
                break;
            case 2:
                mCalculatorNumber.setText(String.valueOf(i+1));
                mOne.setText("I am Handsome Guys");
                break;
            case 3:
                mCalculatorNumber.setText(String.valueOf(i+1));
                mOne.setText("Bruce love Cinderella");
                break;
            case 4:
                mCalculatorNumber.setText(String.valueOf(i+1));
                mOne.setText("I love u");
                break;
            }
        i++;
        if(i == 5) {
            i = 0;
        }
    }
}
