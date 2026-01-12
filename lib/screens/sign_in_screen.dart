import 'package:mandalahearts/widgets/ui/agree_to_signup.dart';
import 'package:mandalahearts/widgets/ui/google_button.dart';
import 'package:mandalahearts/widgets/ui/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    InputDecoration inputDecoration(String label) {
      return InputDecoration(
        labelText: label,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.onSurface.withValues(alpha: 80),
            width: 1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                /// TITLE
                Text(
                  'Sign in',
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 6),

                /// JOIN LINK
                Row(
                  children: [
                    Text('or ', style: textTheme.bodyMedium),
                    GestureDetector(
                      onTap: () {
                        context.replaceNamed("sign_up");
                      },
                      child: Text(
                        'Join MandalaHearts',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                /// GOOGLE SIGN-IN
                GoogleButton(
                  text: 'Sign in with Google',
                  borderRadius: 24,
                  onPressed: () {},
                ),

                const SizedBox(height: 12),

                /// LEGAL TEXT
                AgreeToSignUp(
                  text: "By clicking Continue, you agree to MandalaHearts ",
                  textAlign: TextAlign.start,
                ),

                const SizedBox(height: 24),

                /// OR DIVIDER
                OrDivider(),
                const SizedBox(height: 24),

                /// EMAIL
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: inputDecoration('Email'),
                ),

                const SizedBox(height: 20),

                /// PASSWORD
                TextField(
                  obscureText: true,
                  decoration: inputDecoration('Password'),
                ),

                const SizedBox(height: 16),
                Row(
                  children: [
                    Transform.translate(
                      offset: const Offset(
                        -8,
                        0,
                      ), // removes left padding visually
                      child: Checkbox(
                        value: false,
                        onChanged: (_) {},
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                    Text('Remember me', style: textTheme.bodyMedium),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot password?',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                /// CONTINUE BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'Continue',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.25,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
