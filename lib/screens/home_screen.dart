import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/notes_cubit.dart';
import 'add_notes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NotesCubit>().getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if (state is NotesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NotesLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(index.toString()),
                  title: Text(state.arrNotes![index].title),
                  subtitle: Text(state.arrNotes![index].desc),
                );
              },
              itemCount: state.arrNotes!.length,
            );
          } else if (state is NotesError) {
            return Center(
              child: Text("error"),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
      ),
    );
  }
}
