import 'package:flutter/material.dart';
import '../widgets/custom_widgets.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscure = true;
  String? _selectedFlat;

  final List<String> _flats = [
    'Flat 101 – Ground Floor',
    'Flat 102 – Ground Floor',
    'Flat 201 – First Floor',
    'Flat 202 – First Floor',
    'Flat 301 – Second Floor',
    'Flat 302 – Second Floor',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4EF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A3A5C),
        foregroundColor: Colors.white,
        title: const Text('New Registration', style: TextStyle(fontWeight: FontWeight.w700)),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const SectionTitle(title: 'Create Your Account', sub: 'Fill in your details below'),
                const SizedBox(height: 28),
                const FieldLabel('Full Name'),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Your full name', prefixIcon: Icon(Icons.person_outline)),
                  validator: (v) => v == null || v.isEmpty ? 'Name is required' : null,
                ),
                const SizedBox(height: 18),
                const FieldLabel('Mobile Number'),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(hintText: '10-digit mobile number', prefixIcon: Icon(Icons.phone_outlined)),
                  validator: (v) => v == null || v.length < 10 ? 'Enter valid mobile number' : null,
                ),
                const SizedBox(height: 18),
                const FieldLabel('Email Address (optional)'),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(hintText: 'your@email.com', prefixIcon: Icon(Icons.email_outlined)),
                ),
                const SizedBox(height: 18),
                const FieldLabel('Select Your Flat / Unit'),
                DropdownButtonFormField<String>(
                  value: _selectedFlat,
                  isExpanded: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFD0C9BC), width: 1.5)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFD0C9BC), width: 1.5)),
                  ),
                  hint: const Text('Choose your flat', style: TextStyle(fontSize: 16, color: Color(0xFF9E9080))),
                  items: _flats.map((f) => DropdownMenuItem(value: f, child: Text(f, overflow: TextOverflow.ellipsis))).toList(),
                  onChanged: (v) => setState(() => _selectedFlat = v),
                  validator: (v) => v == null ? 'Please select your flat' : null,
                ),
                const SizedBox(height: 18),
                const FieldLabel('Set Password'),
                TextFormField(
                  obscureText: _obscure,
                  decoration: InputDecoration(
                    hintText: 'Minimum 6 characters',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    ),
                  ),
                  validator: (v) => v == null || v.length < 6 ? 'Password must be at least 6 characters' : null,
                ),
                const SizedBox(height: 32),
                PrimaryButton(
                  text: 'Register Now',
                  backgroundColor: const Color(0xFFD4A843),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already registered?  ', style: TextStyle(fontSize: 15, color: Color(0xFF6B6154))),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginPage())),
                      child: const Text('Login', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF1A3A5C), decoration: TextDecoration.underline)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}