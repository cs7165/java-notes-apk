
package com.example.notes.controller;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import com.example.notes.model.Note;
import com.example.notes.repository.NoteRepository;

@RestController
@RequestMapping("/api/notes")
public class NoteController {

    private final NoteRepository repo;

    public NoteController(NoteRepository repo){
        this.repo = repo;
    }

    @PostMapping
    public Note add(@RequestBody Note note){
        return repo.save(note);
    }

    @GetMapping
    public List<Note> getAll(){
        return repo.findAll();
    }
}
