package kr.kosta.bus.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.kosta.bus.model.PayDAO;
import kr.kosta.bus.model.PayDTO;

@Service
public class PayServiceImpl implements PayService {
	
	@Inject
	PayDAO payDAO;

	@Override
	public List<PayDTO> payList(HashMap map) {
		return payDAO.payList(map);
	}

	@Override
	public void payInsert(PayDTO dto) {
		payDAO.payInsert(dto);

	}

}
