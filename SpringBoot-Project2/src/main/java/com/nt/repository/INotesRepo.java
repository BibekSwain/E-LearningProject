package com.nt.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nt.model.Notes;

public interface INotesRepo extends JpaRepository<Notes, Integer>{

}
