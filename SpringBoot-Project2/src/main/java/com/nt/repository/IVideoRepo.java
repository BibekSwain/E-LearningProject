package com.nt.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nt.model.Videos;

public interface IVideoRepo extends JpaRepository<Videos, Integer> {

	public List<Videos> findByNid(Integer nid);
	public Videos findByNidAndDays(Integer id,String day);
}
