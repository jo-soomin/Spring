package com.mvc.upgrade.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.upgrade.model.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<BoardDto> selectList() {
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			list = sqlsession.selectList(namespace+"selectlist");
		} catch (Exception e) {
			System.out.println("[error] : selectlist");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BoardDto selectOne(int myno) {
		BoardDto selectOne = new BoardDto();
		
		try {
			System.out.println(myno);
			selectOne = sqlsession.selectOne(namespace+"selectOne", myno);
		} catch (Exception e) {
			System.out.println("[error] : selectOne");
			e.printStackTrace();
		}
		return selectOne;
	}

	@Override
	public int insert(BoardDto dto) {
		int res = 0;
		
		try {
			res = sqlsession.insert(namespace+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error] : insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(BoardDto dto) {
		int res = 0;
		
		try {
			res = sqlsession.update(namespace+"update",dto);
		} catch (Exception e) {
			System.out.println("[error] : update");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int myno) {
		int res = 0;
		
		try {
			res = sqlsession.delete(namespace+"delete", myno);
		} catch (Exception e) {
			System.out.println("[error] : delete");
			e.printStackTrace();
		}
		return res;
	}

}
