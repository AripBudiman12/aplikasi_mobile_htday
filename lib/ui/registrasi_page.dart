import 'package:flutter/material.dart';

class RegistrasiPage extends StatefulWidget {
  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _showPassword = false;
  bool _tampilPassword = false;
  final _namaTextboxController = TextEditingController();
  final _emailTexboxController = TextEditingController();
  final _passwordTexboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrasi"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("png/bg.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.only(top: 100.0),
                    ),
                    _namaTextField(),
                    new Padding(
                      padding: new EdgeInsets.only(top: 15.0),
                    ),
                    _emailTextField(),
                    new Padding(
                      padding: new EdgeInsets.only(top: 15.0),
                    ),
                    _passwordTextField(),
                    new Padding(
                      padding: new EdgeInsets.only(top: 15.0),
                    ),
                    _passwordKonfirmasiTextField(),
                    new Padding(
                      padding: new EdgeInsets.only(top: 15.0),
                    ),
                    _buttonRegistrasi(),
                    new Padding(
                      padding: new EdgeInsets.only(bottom: 100.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Membuat Textbox Nama
  Widget _namaTextField() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border:
            OutlineInputBorder(borderRadius: new BorderRadius.circular(20.0)),
        suffixIcon: Icon(
          Icons.person,
          size: 25,
        ),
        labelText: "Nama",
        labelStyle: new TextStyle(color: Colors.blue),
        hintText: "Please input Your name...",
      ),
      keyboardType: TextInputType.text,
      controller: _namaTextboxController,
      validator: (value) {
        if (value.length < 3) {
          return "Nama harus diisi minimal 3 karakter";
        }
        return null;
      },
    );
  }

  //Membuat Textbox Email
  Widget _emailTextField() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          labelText: "Email",
          labelStyle: new TextStyle(color: Colors.blue),
          border:
              OutlineInputBorder(borderRadius: new BorderRadius.circular(20.0)),
          suffixIcon: Icon(
            Icons.mail,
            size: 25,
          )),
      keyboardType: TextInputType.emailAddress,
      controller: _emailTexboxController,
      validator: (value) {
        //validasi harus diisi
        if (value.isEmpty) {
          return 'Email Harus Diisi';
        }
        //validasi Email
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>([\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = new RegExp(pattern.toString());
        if (!regex.hasMatch(value)) {
          return "Email tidak Valid";
        }
        return null;
      },
    );
  }

  //Membuat Textbox password
  Widget _passwordTextField() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      obscureText: !_showPassword,
      decoration: InputDecoration(
          labelText: "Password",
          labelStyle: new TextStyle(color: Colors.blue),
          border:
              OutlineInputBorder(borderRadius: new BorderRadius.circular(20.0)),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
            child: Icon(
              _showPassword ? Icons.visibility : Icons.visibility_off,
            ),
          )),
      keyboardType: TextInputType.text,
      controller: _passwordTexboxController,
      validator: (value) {
        //jika karakter yang dimasukkan kurang dari 6 karakter
        if (value.length < 6) {
          return "Password harus diisi minimal 6 karakter";
        }
        return null;
      },
    );
  }

  //Membuat textbox konfirmasi password
  Widget _passwordKonfirmasiTextField() {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      obscureText: !_tampilPassword,
      decoration: InputDecoration(
          labelText: "Konfirmasi Password",
          labelStyle: new TextStyle(color: Colors.blue),
          border:
              OutlineInputBorder(borderRadius: new BorderRadius.circular(20.0)),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _tampilPassword = !_tampilPassword;
              });
            },
            child: Icon(
              _tampilPassword ? Icons.visibility : Icons.visibility_off,
            ),
          )),
      keyboardType: TextInputType.text,
      validator: (Value) {
        //jika inputan tidak sama dengan password
        if (Value != _passwordTexboxController.text) {
          return "Konfirmasi password tidak sama";
        }
        return null;
      },
    );
  }

  //Membuat tombol Registrasi
  Widget _buttonRegistrasi() {
    return RaisedButton(
        child: Text("Registrasi"),
        onPressed: () {
          var validate = _formKey.currentState.validate();
        });
  }
}
