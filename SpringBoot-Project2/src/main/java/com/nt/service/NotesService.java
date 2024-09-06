package com.nt.service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.model.Notes;
import com.nt.repository.INotesRepo;

@Service
public class NotesService implements INotesService {

	@Autowired
	private INotesRepo noteRepo;
	@Override
	public Set<Notes> getNotes(List<Integer> ids) {
		
		List<Notes> allById = noteRepo.findAllById(ids);
		return new HashSet<>(allById);
	}
	@Override
	public Optional<Notes> getNoteById(Integer id) {
		
		return  noteRepo.findById(id);
	}
	

}
