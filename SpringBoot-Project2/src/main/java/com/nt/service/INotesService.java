package com.nt.service;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import com.nt.model.Notes;

public interface INotesService {

	public Set<Notes> getNotes(List<Integer> ids);
	public Optional<Notes> getNoteById(Integer id);
	
}
