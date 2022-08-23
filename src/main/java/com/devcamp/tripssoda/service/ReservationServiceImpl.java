package com.devcamp.tripssoda.service;

import com.devcamp.tripssoda.dto.PaymentDetailDto;
import com.devcamp.tripssoda.exception.InsertException;
import com.devcamp.tripssoda.mapper.ReservationMapper;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ReservationServiceImpl implements ReservationService {

    public final ReservationMapper reservationMapper;

    public ReservationServiceImpl(ReservationMapper reservationMapper) {
        this.reservationMapper = reservationMapper;
    }

    public int insertReservation(PaymentDetailDto paymentDetailDto) throws InsertException {
        int rowCnt = reservationMapper.insertReservation(paymentDetailDto);
        System.out.println("paymentDetailDto = " + paymentDetailDto);
        if (rowCnt != 1)
            throw new InsertException("Error occurred while inserting reservation");

        Map<String, Object> reservationDetail = new HashMap<>();
        reservationDetail.put("reservationId",paymentDetailDto.getReservationId());
        reservationDetail.put("userId",paymentDetailDto.getUserId());

        Map<String, String> optionDetail = paymentDetailDto.getOptionDetail();
        if (optionDetail!=null) {
            for (int i = 0; i < optionDetail.size(); i++) {
                String[] option = optionDetail.get("" + i).split("#");
                Integer optionId = Integer.valueOf(option[0]);
                String optionValue = option[1];
                reservationDetail.put("productOptionId", optionId);
                reservationDetail.put("content", optionValue);
                rowCnt = reservationMapper.insertReservationDetail(reservationDetail);
                if (rowCnt != 1)
                    throw new InsertException("Error occurred while inserting reservation detail");
            }
        } else {
            reservationDetail.put("productOptionId", 0);
            reservationDetail.put("content", "선택된 옵션이 없습니다.");
            rowCnt = reservationMapper.insertReservationDetail(reservationDetail);
            if (rowCnt != 1)
                throw new InsertException("Error occurred while inserting reservation detail");
        }
        return 1;
    }
}
