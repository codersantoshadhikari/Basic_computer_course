// ignore_for_file: library_private_types_in_public_api

import 'package:bloc_computer_app/computerui/computerpage.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF3366FF);
const kAccentColor = Color(0xFFFFA726);
const kBackgroundColor = Colors.white;
const kTextColor = Colors.black;
const kSuccessColor = Colors.green;

const kInputDecoration = InputDecoration(
  border: OutlineInputBorder(),
  prefixIcon: Icon(Icons.email, color: kTextColor),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor),
  ),
);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _loggedIn = false;
  bool _loginFailed = false;
  bool _obscureText = true;

  void _login() {
    // Simulated login logic (replace with actual authentication)
    if (_emailController.text == 'admin' &&
        _passwordController.text == 'password') {
      setState(() {
        _loggedIn = true;
        _loginFailed = false;
      });

      _showSuccessDialog();
    } else {
      setState(() {
        _loginFailed = true;
      });

      _showErrorDialog();
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Logged in successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ComputerHomePage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Invalid email or password.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: kBackgroundColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 64),
                Image.asset(
                  'assets/logo.png',
                  height: 150,
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _emailController,
                  style: const TextStyle(fontSize: 16, color: kTextColor),
                  decoration: kInputDecoration.copyWith(
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: kTextColor),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  style: const TextStyle(fontSize: 16, color: kTextColor),
                  decoration: kInputDecoration.copyWith(
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: kTextColor),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: kTextColor,
                      ),
                    ),
                  ),
                  obscureText: _obscureText,
                ),
                const SizedBox(height: 22),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    // primary: kPrimaryColor,
                    // onPrimary: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _showForgotPasswordDialog,
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: _showCreateAccountDialog,
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                if (_loggedIn)
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      '',
                      style: TextStyle(
                        color: kSuccessColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                if (_loginFailed)
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }



void _showForgotPasswordDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Create a form to gather user input.
      return AlertDialog(
        title: const Text('Forgot Password'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Input field for Phone Number
            TextField(
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            // Input field for Old Password
            TextField(
              obscureText: true, // Hide password text
              decoration: InputDecoration(labelText: 'Old Password'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
         
              Navigator.of(context).pop();
            },
            child: const Text('Submit'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); 
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}




void _showCreateAccountDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Create a form to gather user input.
      return AlertDialog(
        title: const Text('Create Account'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Input field for First Name
            TextField(
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            // Input field for Last Name
            TextField(
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            // Input field for Address
            TextField(
              decoration: InputDecoration(labelText: 'Address'),
            ),
            // Input field for Phone Number
            TextField(
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            // Input field for Password
            TextField(
              obscureText: true, // Hide password text
              decoration: InputDecoration(labelText: 'Password'),
            ),
            // Input field for Re-enter Password
            TextField(
              obscureText: true, // Hide password text
              decoration: InputDecoration(labelText: 'Re-enter Password'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Implement your account creation logic here
              // You can access the input values using the TextEditingController for each field.
              // For simplicity, we are just closing the dialog in this example.
              Navigator.of(context).pop();
            },
            child: const Text('Create Account'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cancel the account creation.
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}
}