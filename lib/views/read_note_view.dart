import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes/models/notes_model.dart';
import 'package:notes/views/notes_edit_view.dart';

class ReadNoteView extends StatefulWidget {
  const ReadNoteView({super.key, required this.notes});

  final NotesModel notes;

  @override
  State<ReadNoteView> createState() => _ReadNoteViewState();
}

class _ReadNoteViewState extends State<ReadNoteView> {
  ScrollController? _scrollController;
  String? _appBarTitle;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController?.addListener(_scrollListener);
    _appBarTitle = null;
    BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
  }

  void _scrollListener() {
    if (_scrollController != null && _scrollController!.hasClients) {
      setState(() {
        _appBarTitle = _scrollController!.offset > 50
            ? widget.notes.title
            : null;
      });
    }
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(widget.notes.color),
            automaticallyImplyLeading: true,
            title: Text(
              _appBarTitle ?? '',
              maxLines: 1,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NotesEditView(notes: widget.notes);
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Color(widget.notes.color)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: SingleChildScrollView(
                controller:
                    _scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        widget.notes.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.notes.subTitle,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
