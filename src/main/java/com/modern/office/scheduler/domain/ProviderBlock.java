package com.modern.office.scheduler.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Appsch_Provider_Blocks")
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
    private int duration;
   
    @Column(name = "prb_day_of_week")
    private int dayOfWeek;

    public int getProviderBlockNo() {
		return providerBlockNo;
	}

	public void setProviderBlockNo(int providerBlockNo) {
		this.providerBlockNo = providerBlockNo;
	}

	public int getProviderNo() {
		return providerNo;
	}

	public void setProviderNo(int providerNo) {
		this.providerNo = providerNo;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public int getBlockType() {
		return blockType;
	}

	public void setBlockType(int blockType) {
		this.blockType = blockType;
	}

	public String getStartDateTime() {
		return startDateTime;
	}

	public void setStartDateTime(String startDateTime) {
		this.startDateTime = startDateTime;
	}

	public String getEndDateTime() {
		return endDateTime;
	}

	public void setEndDateTime(String endDateTime) {
		this.endDateTime = endDateTime;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public int getDayOfWeek() {
		return dayOfWeek;
	}

	public void setDayOfWeek(int dayOfWeek) {
		this.dayOfWeek = dayOfWeek;
	}
}
