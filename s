[1mdiff --cc app/src/main/java/com/example/bruce/calculator/MainActivity.java[m
[1mindex 93f2dd0,f95a9af..0000000[m
[1m--- a/app/src/main/java/com/example/bruce/calculator/MainActivity.java[m
[1m+++ b/app/src/main/java/com/example/bruce/calculator/MainActivity.java[m
[36m@@@ -5,145 -5,93 +5,236 @@@[m [mimport android.os.Bundle[m
  import android.view.View;[m
  import android.widget.Button;[m
  import android.widget.TextView;[m
[32m++<<<<<<< HEAD[m
[32m +import android.util.Log;[m
[32m +[m
[32m +import java.text.DecimalFormat;[m
[32m +[m
[32m +public class MainActivity extends AppCompatActivity {[m
[32m +    private static final String TAG = "MainActivity";[m
[32m +    private final DecimalFormat mDecimalFormat = new DecimalFormat("###,###.#");[m
[32m +    private TextView mCalculatorNumber;[m
[32m +    private static final int[] mNumID = {[m
[32m +            R.id.btn_1,[m
[32m +            R.id.btn_2,[m
[32m +            R.id.btn_3,[m
[32m +            R.id.btn_4,[m
[32m +            R.id.btn_5,[m
[32m +            R.id.btn_6,[m
[32m +            R.id.btn_7,[m
[32m +            R.id.btn_8,[m
[32m +            R.id.btn_9,[m
[32m +            R.id.btn_0,[m
[32m +            R.id.btn_point,[m
[32m +    };[m
[32m +    private static final int[] mOperatorID = {[m
[32m +            R.id.btn_plus,[m
[32m +            R.id.btn_less,[m
[32m +            R.id.btn_multiply,[m
[32m +            R.id.btn_except,[m
[32m +            R.id.btn_equal[m
[32m +    };[m
[32m +    private Button btnAC;[m
[32m +    private double mNum1 = 0d;[m
[32m +    private double mNum2 = -1d;[m
[32m +    private int mOperator = -1;[m
[32m++=======[m
[32m+ [m
[32m+ public class MainActivity extends AppCompatActivity {[m
[32m+ [m
[32m+     private TextView mCalculatorNumber;[m
[32m+     private Button mOne;[m
[32m+     private Button mTwo;[m
[32m+     private Button mThree;[m
[32m+     private Button mFour;[m
[32m+     private Button mFive;[m
[32m+     private Button mSix;[m
[32m+     private Button mSeven;[m
[32m+     private Button mEight;[m
[32m+     private Button mNine;[m
[32m+     private Button mZero;[m
[32m+     private Button mPoint;[m
[32m+     private Button mPlus;[m
[32m+     private Button mLess;[m
[32m+     private Button mMultiply;[m
[32m+     private Button mExcept;[m
[32m+     private Button mEqual;[m
[32m+     private Button mAC;[m
[32m+     private Button mPlusLess;[m
[32m+     private Button mPercentage;[m
[32m+ [m
[32m+     private int i = 0;[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
  [m
      @Override[m
      protected void onCreate(Bundle savedInstanceState) {[m
          super.onCreate(savedInstanceState);[m
          setContentView(R.layout.activity_main);[m
[32m++<<<<<<< HEAD[m
[32m +[m
[32m +        mCalculatorNumber = (TextView) findViewById(R.id.cal_number);[m
[32m +        btnAC = (Button) findViewById(R.id.btn_ac);[m
[32m +        btnAC.setOnClickListener(zero);[m
[32m +        for(int i : mNumID) {[m
[32m +            Button btn = (Button) findViewById(i);[m
[32m +            btn.setOnClickListener(numClick);[m
[32m +            Log.i(TAG, "i = " + i + " " + mNumID.length);[m
[32m +        }[m
[32m +        for(int i : mOperatorID) {[m
[32m +            Button btn = (Button) findViewById(i);[m
[32m +            btn.setOnClickListener(operatorClick);[m
[32m +            Log.i(TAG, "i = " + i + " " + mOperatorID.length);[m
[32m +        }[m
[32m +        Log.i(TAG, "onCreate(Bundle savedInstanceState)");[m
[32m +    }[m
[32m +[m
[32m +    private Button.OnClickListener numClick = new Button.OnClickListener() {[m
[32m +        @Override[m
[32m +        public void onClick(View v) {[m
[32m +            if(mOperator == -1) {[m
[32m +                Button clickButton = (Button) v;[m
[32m +                if(mCalculatorNumber.getText().equals("0") && v.getId() == R.id.btn_point) {[m
[32m +                    mCalculatorNumber.setText(mCalculatorNumber.getText().toString() + clickButton.getText());[m
[32m +                } else if(mCalculatorNumber.getText().equals("0")){[m
[32m +                    if(v.getId() != R.id.btn_0) {[m
[32m +                        btnAC.setText(getString(R.string.btn_c));[m
[32m +                    }[m
[32m +                    mCalculatorNumber.setText(clickButton.getText());[m
[32m +                } else {[m
[32m +                    mCalculatorNumber.setText(mCalculatorNumber.getText().toString() + clickButton.getText());[m
[32m +                }[m
[32m +            } else if(mOperator == 0 || mOperator == 1 || mOperator == 2 || mOperator == 3) {[m
[32m +                Button clickButton = (Button) v;[m
[32m +                if(mNum2 == -1d && v.getId() == R.id.btn_point) {[m
[32m +                    mCalculatorNumber.setText(getString(R.string.btn_0) + clickButton.getText());[m
[32m +                } else if(mNum2 == -1d){[m
[32m +                    mCalculatorNumber.setText(clickButton.getText());[m
[32m +                } else {[m
[32m +                    mCalculatorNumber.setText(mCalculatorNumber.getText().toString() + clickButton.getText());[m
[32m +                }[m
[32m +                mNum2 = Double.valueOf(mCalculatorNumber.getText().toString());[m
[32m +            }[m
[32m +        }[m
[32m +    };[m
[32m +[m
[32m +    private Button.OnClickListener operatorClick = new Button.OnClickListener() {[m
[32m +        @Override[m
[32m +        public void onClick(View v) {[m
[32m +            switch(v.getId()) {[m
[32m +                case(R.id.btn_plus):[m
[32m +                    mOperator = 0;[m
[32m +                    mNum1 = Double.valueOf(mCalculatorNumber.getText().toString());[m
[32m +                    break;[m
[32m +                case(R.id.btn_less):[m
[32m +                    mOperator = 1;[m
[32m +                    mNum1 = Double.valueOf(mCalculatorNumber.getText().toString());[m
[32m +                    break;[m
[32m +                case(R.id.btn_multiply):[m
[32m +                    mOperator = 2;[m
[32m +                    mNum1 = Double.valueOf(mCalculatorNumber.getText().toString());[m
[32m +                    break;[m
[32m +                case(R.id.btn_except):[m
[32m +                    mOperator = 3;[m
[32m +                    mNum1 = Double.valueOf(mCalculatorNumber.getText().toString());[m
[32m +                    break;[m
[32m +                case(R.id.btn_equal):[m
[32m +                    mCalculatorNumber.setText(Calculator(mNum1,mNum2));[m
[32m +                    break;[m
[32m +            }[m
[32m +            Log.i(TAG, mNum1 + " " + mNum2);[m
[32m +        }[m
[32m +    };[m
[32m +[m
[32m +    private Button.OnClickListener zero = new Button.OnClickListener() {[m
[32m +        @Override[m
[32m +        public void onClick(View v) {[m
[32m +            if (v.getId() == R.id.btn_ac) {[m
[32m +                btnAC.setText(getString(R.string.btn_ac));[m
[32m +                mCalculatorNumber.setText(getString(R.string.btn_0));[m
[32m +                mNum1 = 0d;[m
[32m +                mNum2 = -1d;[m
[32m +                mOperator = -1;[m
[32m +            }[m
[32m +        }[m
[32m +    };[m
[32m +[m
[32m +    private String Calculator(double num1, double num2) {[m
[32m +        String result = "";[m
[32m +        if(mOperator == 0) {[m
[32m +            result = mDecimalFormat.format(num1 + num2);[m
[32m +            mNum1 += mNum2;[m
[32m +        } else if(mOperator == 1) {[m
[32m +            result = mDecimalFormat.format(num1 - num2);[m
[32m +            mNum1 -= mNum2;[m
[32m +        } else if(mOperator == 2) {[m
[32m +            result = mDecimalFormat.format(num1 * num2);[m
[32m +            mNum1 *= mNum2;[m
[32m +        } else if(mOperator == 3) {[m
[32m +            result = mDecimalFormat.format(num1 / num2);[m
[32m +            mNum1 /= mNum2;[m
[32m +        }[m
[32m +        return result;[m
[32m +    };[m
[31m- }[m
[32m++}[m
[32m++=======[m
[32m+         mOne = (Button) findViewById(R.id.btn_1);[m
[32m+         mTwo = (Button) findViewById(R.id.btn_2);[m
[32m+         mThree = (Button) findViewById(R.id.btn_3);[m
[32m+         mFour = (Button) findViewById(R.id.btn_4);[m
[32m+         mFive = (Button) findViewById(R.id.btn_5);[m
[32m+         mSix = (Button) findViewById(R.id.btn_6);[m
[32m+         mSeven = (Button) findViewById(R.id.btn_7);[m
[32m+         mEight = (Button) findViewById(R.id.btn_8);[m
[32m+         mNine = (Button) findViewById(R.id.btn_9);[m
[32m+         mZero = (Button) findViewById(R.id.btn_0);[m
[32m+         mPoint = (Button) findViewById(R.id.btn_point);[m
[32m+         mPlus = (Button) findViewById(R.id.btn_plus);[m
[32m+         mLess = (Button) findViewById(R.id.btn_less);[m
[32m+         mMultiply = (Button) findViewById(R.id.btn_multiply);[m
[32m+         mExcept = (Button) findViewById(R.id.btn_except);[m
[32m+         mEqual = (Button) findViewById(R.id.btn_equal);[m
[32m+         mAC = (Button) findViewById(R.id.btn_ac);[m
[32m+         mPlusLess = (Button) findViewById(R.id.btn_plus_less);[m
[32m+         mPercentage = (Button) findViewById(R.id.btn_percentage);[m
[32m+         mCalculatorNumber = (TextView) findViewById(R.id.cal_number);[m
[32m+         ButtonClick();[m
[32m+     }[m
[32m+ [m
[32m+     private void ButtonClick() {[m
[32m+         mOne.setOnClickListener(new View.OnClickListener() {[m
[32m+             public void onClick(View v) {[m
[32m+                 ClickMe();[m
[32m+             }[m
[32m+         });[m
[32m+     }[m
[32m+ [m
[32m+     private void ClickMe() {[m
[32m+         switch (i) {[m
[32m+             case 0:[m
[32m+                 mCalculatorNumber.setText(String.valueOf(i+1));[m
[32m+                 mOne.setText("I am Black Tina.");[m
[32m+                 break;[m
[32m+             case 1:[m
[32m+                 mCalculatorNumber.setText(String.valueOf(i+1));[m
[32m+                 mOne.setText("I am Cinderella.");[m
[32m+                 break;[m
[32m+             case 2:[m
[32m+                 mCalculatorNumber.setText(String.valueOf(i+1));[m
[32m+                 mOne.setText("I am Handsome Guys");[m
[32m+                 break;[m
[32m+             case 3:[m
[32m+                 mCalculatorNumber.setText(String.valueOf(i+1));[m
[32m+                 mOne.setText("Bruce love Cinderella");[m
[32m+                 break;[m
[32m+             case 4:[m
[32m+                 mCalculatorNumber.setText(String.valueOf(i+1));[m
[32m+                 mOne.setText("I love u");[m
[32m+                 break;[m
[32m+             }[m
[32m+         i++;[m
[32m+         if(i == 5) {[m
[32m+             i = 0;[m
[32m+         }[m
[32m+     }[m
[32m+ }[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
[1mdiff --cc app/src/main/res/layout/activity_main.xml[m
[1mindex d1900e8,e5895de..0000000[m
[1m--- a/app/src/main/res/layout/activity_main.xml[m
[1m+++ b/app/src/main/res/layout/activity_main.xml[m
[36m@@@ -19,7 -19,6 +19,10 @@@[m
          android:fontFamily="sans-serif-medium"[m
          android:textStyle="bold"[m
          android:textSize="60sp"[m
[32m++<<<<<<< HEAD[m
[32m +        android:maxLength="10"[m
[32m++=======[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
          android:text="0"/>[m
  [m
      <RelativeLayout[m
[36m@@@ -35,7 -34,7 +38,11 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="@string/btn_ac"/>[m
[32m++=======[m
[32m+             android:text="AC"/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
          <Button[m
              android:id="@+id/btn_plus_less"[m
              android:layout_width="wrap_content"[m
[36m@@@ -44,8 -43,7 +51,12 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="+/-"[m
[32m +            android:visibility="invisible"/>[m
[32m++=======[m
[32m+             android:text="+/-"/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
          <Button[m
              android:id="@+id/btn_percentage"[m
              android:layout_width="wrap_content"[m
[36m@@@ -54,8 -52,7 +65,12 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="%"[m
[32m +            android:visibility="invisible"/>[m
[32m++=======[m
[32m+             android:text="%"/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
          <Button[m
              android:id="@+id/btn_except"[m
              android:layout_width="wrap_content"[m
[36m@@@ -64,7 -61,7 +79,11 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="@string/btn_except"/>[m
[32m++=======[m
[32m+             android:text="÷"/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
      </RelativeLayout>[m
  [m
      <RelativeLayout[m
[36m@@@ -80,7 -77,7 +99,11 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="@string/btn_7"/>[m
[32m++=======[m
[32m+             android:text="7"/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
          <Button[m
              android:id="@+id/btn_8"[m
              android:layout_width="wrap_content"[m
[36m@@@ -89,7 -86,7 +112,11 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="@string/btn_8"/>[m
[32m++=======[m
[32m+             android:text="8"/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
          <Button[m
              android:id="@+id/btn_9"[m
              android:layout_width="wrap_content"[m
[36m@@@ -98,7 -95,7 +125,11 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="@string/btn_9"/>[m
[32m++=======[m
[32m+             android:text="9"/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
          <Button[m
              android:id="@+id/btn_multiply"[m
              android:layout_width="wrap_content"[m
[36m@@@ -107,7 -104,7 +138,11 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="@string/btn_multiply"/>[m
[32m++=======[m
[32m+             android:text="×"/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
      </RelativeLayout>[m
  [m
      <RelativeLayout[m
[36m@@@ -123,7 -120,7 +158,11 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="@string/btn_4"/>[m
[32m++=======[m
[32m+             android:text="4"/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
          <Button[m
              android:id="@+id/btn_5"[m
              android:layout_width="wrap_content"[m
[36m@@@ -132,7 -129,7 +171,11 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="@string/btn_5"/>[m
[32m++=======[m
[32m+             android:text="5"/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
          <Button[m
              android:id="@+id/btn_6"[m
              android:layout_width="wrap_content"[m
[36m@@@ -141,7 -138,7 +184,11 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="@string/btn_6"/>[m
[32m++=======[m
[32m+             android:text="6"/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
          <Button[m
              android:id="@+id/btn_less"[m
              android:layout_width="wrap_content"[m
[36m@@@ -150,7 -147,7 +197,11 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="@string/btn_less"/>[m
[32m++=======[m
[32m+             android:text="-"/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
      </RelativeLayout>[m
  [m
      <RelativeLayout[m
[36m@@@ -166,7 -163,7 +217,11 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="@string/btn_1"/>[m
[32m++=======[m
[32m+             android:text="1"/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
          <Button[m
              android:id="@+id/btn_2"[m
              android:layout_width="wrap_content"[m
[36m@@@ -175,7 -172,7 +230,11 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="@string/btn_2"/>[m
[32m++=======[m
[32m+             android:text="2"/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
          <Button[m
              android:id="@+id/btn_3"[m
              android:layout_width="wrap_content"[m
[36m@@@ -184,7 -181,7 +243,11 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="@string/btn_3"/>[m
[32m++=======[m
[32m+             android:text="3"/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
          <Button[m
              android:id="@+id/btn_plus"[m
              android:layout_width="wrap_content"[m
[36m@@@ -193,7 -190,7 +256,11 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="@string/btn_plus"/>[m
[32m++=======[m
[32m+             android:text="+"/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
      </RelativeLayout>[m
  [m
      <RelativeLayout[m
[36m@@@ -209,7 -206,7 +276,11 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="@string/btn_0"/>[m
[32m++=======[m
[32m+             android:text="0"/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
          <Button[m
              android:id="@+id/btn_point"[m
              android:layout_width="wrap_content"[m
[36m@@@ -218,7 -215,7 +289,11 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="@string/btn_p"/>[m
[32m++=======[m
[32m+             android:text="."/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
          <Button[m
              android:id="@+id/btn_equal"[m
              android:layout_width="wrap_content"[m
[36m@@@ -227,6 -224,6 +302,10 @@@[m
              android:fontFamily="sans-serif"[m
              android:textStyle="bold"[m
              android:textSize="30sp"[m
[32m++<<<<<<< HEAD[m
[32m +            android:text="@string/btn_equal"/>[m
[32m++=======[m
[32m+             android:text="="/>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
      </RelativeLayout>[m
  </RelativeLayout>[m
[1mdiff --cc app/src/main/res/values/strings.xml[m
[1mindex e00bbbe,49d8cb9..0000000[m
[1m--- a/app/src/main/res/values/strings.xml[m
[1m+++ b/app/src/main/res/values/strings.xml[m
[36m@@@ -1,22 -1,3 +1,26 @@@[m
  <resources>[m
[32m++<<<<<<< HEAD[m
[32m +    <string name="app_name">"Calculator"</string>[m
[32m +[m
[32m +    <string name="btn_1">"1"</string>[m
[32m +    <string name="btn_2">"2"</string>[m
[32m +    <string name="btn_3">"3"</string>[m
[32m +    <string name="btn_4">"4"</string>[m
[32m +    <string name="btn_5">"5"</string>[m
[32m +    <string name="btn_6">"6"</string>[m
[32m +    <string name="btn_7">"7"</string>[m
[32m +    <string name="btn_8">"8"</string>[m
[32m +    <string name="btn_9">"9"</string>[m
[32m +    <string name="btn_0">"0"</string>[m
[32m +    <string name="btn_p">"."</string>[m
[32m +    <string name="btn_plus">"+"</string>[m
[32m +    <string name="btn_less">"-"</string>[m
[32m +    <string name="btn_multiply">"×"</string>[m
[32m +    <string name="btn_except">"÷"</string>[m
[32m +    <string name="btn_equal">"="</string>[m
[32m +    <string name="btn_ac">"AC"</string>[m
[32m +    <string name="btn_c">"C"</string>[m
[32m++=======[m
[32m+     <string name="app_name">Calculator</string>[m
[32m++>>>>>>> e06e166... [Calculator] Layout[m
  </resources>[m
