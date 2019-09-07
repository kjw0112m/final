package com.kh17.panda.vo;

import java.util.List;

import com.kh17.panda.entity.OrderViewDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderListVO {
	private String team;
	private String order_dt;
	private String member_name;
	private String pay_type;
	private String pay_status;
	private String re_name, re_phone, re_addr;

	private List<OrderViewDto> list;

	public String getDate() {
		return order_dt.substring(0, 10);
	}

	public String getTime() {
		return order_dt.substring(0, 19);
	}

	public int getCount() {
		return list.size();
	}

	public int getTotalAmount() {
		int total_amount = 0;
		if (list != null) {
			for (OrderViewDto dto : list) {
				total_amount += dto.getTotal_price();
			}
		}
		return total_amount;
	}

	public int getTrueAmount() {
		int true_amount = 0;
		if (list != null) {
			for (OrderViewDto dto : list) {
				true_amount += (dto.getTotal_price() - dto.getDiscount_price());
			}
		}
		return true_amount;
	}

}
