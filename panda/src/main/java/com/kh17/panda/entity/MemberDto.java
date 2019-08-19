package com.kh17.panda.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@Builder@AllArgsConstructor@NoArgsConstructor
public class MemberDto {
  private String id,pw,name,email,  phone, 
  							postCode,basicAddr,detailAddr
                          ,registDt,loginDt,pwDt,birth;

}
