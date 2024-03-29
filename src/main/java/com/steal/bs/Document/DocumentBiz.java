package com.steal.bs.Document;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.steal.bs.dto.DocumentDto;

@Service
public class DocumentBiz {

	@Autowired
	DocumentDao dao;
	
	public List<DocumentDto> selectList() {
		return dao.selectList();
	}
	
	public int insert(DocumentDto dto) {
		return dao.insertDoc(dto);
	}
	
	public DocumentDto docInfo(String title) {
		return dao.docInfo(title);
	}
	
	public int initAlert() {
		return dao.initAlert();
	}
	
}
