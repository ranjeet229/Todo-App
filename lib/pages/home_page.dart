import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import 'package:todo_app/pages/profile%20page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? imageFile;
  final List<String> _todos = [];
  final List<String> _filteredTodos = [];
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final Map<String, bool> _checkedItems = {};

  @override
  void initState() {
    super.initState();
    _loadData();
    _searchController.addListener(_filterTodos);
    _filterTodos();
  }

  void _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final todoList = prefs.getStringList('todos') ?? [];
    final imagePath = prefs.getString('imageFilePath');

    setState(() {
      _todos.addAll(todoList);
      _filteredTodos.addAll(todoList);
      if (imagePath != null) {
        imageFile = File(imagePath);
      }
    });
  }

  void _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('todos', _todos);
  }

  void _saveImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('imageFilePath', path);
  }

  void selectImage(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      cropImage(pickedFile);
    }
  }

  void cropImage(XFile file) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      compressQuality: 40,
    );

    if (croppedImage != null) {
      setState(() {
        imageFile = File(croppedImage.path);
      });
      _saveImagePath(croppedImage.path);
    }
  }

  void _showChangePictureDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('View image'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _showImageDialog();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Choose from gallery'),
                  onTap: () {
                    Navigator.of(context).pop();
                    selectImage(ImageSource.gallery);
                  },
                ),
            
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Take a photo'),
                  onTap: () {
                    Navigator.of(context).pop();
                    selectImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todos.add(_controller.text);
        _filteredTodos.add(_controller.text);
        _checkedItems[_controller.text] = false;
        _controller.clear();
        _saveTodos();
      });
    }
  }

  void _removeTodoAt(int index) {
    setState(() {
      String todo = _filteredTodos[index];
      _todos.remove(todo);
      _filteredTodos.removeAt(index);
      _checkedItems.remove(todo);
      _saveTodos();
    });
  }

  void _filterTodos() {
    setState(() {
      if (_searchController.text.isEmpty) {
        _filteredTodos.clear();
        _filteredTodos.addAll(_todos);
      } else {
        _filteredTodos.clear();
        _filteredTodos.addAll(_todos.where((todo) =>
            todo.toLowerCase().contains(_searchController.text.toLowerCase())));
      }
    });
  }

  void _showImageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            height: 300,
            width: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: imageFile != null
                  ? Image.file(
                imageFile!,
                fit: BoxFit.cover,
              )
                  : Icon(
                Icons.person,
                size: 100,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF4A90E2), Color(0xFF50E3C2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          'To-Do List',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: _showChangePictureDialog,
              child: CircleAvatar(
                radius: 20,
                backgroundImage: imageFile != null
                    ? FileImage(imageFile!)
                    : null,
                child: imageFile == null
                    ? Icon(
                  Icons.person,
                  size: 30,
                )
                    : null,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_rounded),
                hintText: 'Search here',
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "All ToDo's",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(height: 16,),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredTodos.length,
              itemBuilder: (context, index) {
                String todo = _filteredTodos[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      todo,
                      style: const TextStyle(color: Colors.black87),
                    ),
                    value: _checkedItems[todo] ?? false,
                    activeColor: Colors.blue,
                    onChanged: (newBool) {
                      setState(() {
                        _checkedItems[todo] = newBool!;
                      });
                    },
                    secondary: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.white,
                        onPressed: () => _removeTodoAt(index),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Add a new todo item',
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF4A90E2), // Blue color
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    color: Colors.white, // White icon color
                    onPressed: _addTodo,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}