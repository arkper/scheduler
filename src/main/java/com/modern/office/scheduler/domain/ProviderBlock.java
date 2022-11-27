package com.modern.office.scheduler.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "Appsch_Provider_Blocks")
@Data
public class ProviderBlock {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "prb_no")
	private int providerBlockNo;
	
	@Column(name = "range_no")
	private int rangeNo;
    
    @Column(name = "pro_no")
    private int providerNo;
	
    @Column(name = "LocationID")
    private int locationId;
    
    @Column(name = "prb_block_type")
    private int blockType;

    @Column(name = "prb_start_date_time")
    private String startDateTime;
    
    @Column(name = "prb_end_date_time")
    private String endDateTime;
    
    @Column(name = "prb_duration")
    private Integer duration;
   
    @Column(name = "prb_day_of_week")
    private int dayOfWeek;
}
