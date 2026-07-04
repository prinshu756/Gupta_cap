import 'package:flutter/material.dart';
import '../widgets/custom_widgets.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2538),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F2538),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(color: const Color(0xFFD4A843), borderRadius: BorderRadius.circular(20)),
                  child: const Icon(Icons.admin_panel_settings, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text('Admin / Owner Portal', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                const Text('Manage tenants, payments & more', style: TextStyle(color: Color(0xFF8AAAC4), fontSize: 14)),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(color: const Color(0xFFF7F4EF), borderRadius: BorderRadius.circular(24)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FieldLabel('Admin Username'),
                      TextFormField(
                        decoration: const InputDecoration(hintText: 'Enter admin username', prefixIcon: Icon(Icons.manage_accounts_outlined)),
                        validator: (v) => v == null || v.isEmpty ? 'Username required' : null,
                      ),
                      const SizedBox(height: 18),
                      const FieldLabel('Password'),
                      TextFormField(
                        obscureText: _obscure,
                        decoration: InputDecoration(
                          hintText: 'Enter admin password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(_obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                            onPressed: () => setState(() => _obscure = !_obscure),
                          ),
                        ),
                        validator: (v) => v == null || v.isEmpty ? 'Password required' : null,
                      ),
                      const SizedBox(height: 28),
                      PrimaryButton(
                        text: 'Login as Admin',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}