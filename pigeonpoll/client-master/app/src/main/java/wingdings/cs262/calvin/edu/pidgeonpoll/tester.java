package wingdings.cs262.calvin.edu.pidgeonpoll;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class tester extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tester);


    }
    override fun onCreate(savedInstanceState: Bundle?) {
        // Make sure this is before calling super.onCreate
        setTheme(R.style.AppTheme)
        super.onCreate(savedInstanceState)

        val user = UserDb.getCurrentUser()
        routeToAppropriatePage(user)
        finish()
    }

    private fun routeToAppropriatePage(user: User) {
        // Example routing
        when {
            user == null -> OnboardingActivity.start(this)
            user.hasPhoneNumber() -> EditProfileActivity.start(this)
            user.hasSubscriptionExpired() -> PaymentPlansActivity.start(this)
            else -> HomeActivity.start(this)
        }
    }

}
}
