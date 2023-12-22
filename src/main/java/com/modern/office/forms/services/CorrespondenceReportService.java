package com.modern.office.forms.services;

import com.modern.office.config.AppConfig;
import com.modern.office.forms.domain.CorrespondenceReportRequest;
import com.modern.office.forms.domain.CorrespondenceReportResponse;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.sql.DataSource;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CorrespondenceReportService {
    private static final String SQL = "SELECT distinct patient.patient_no, patient.last_name, patient.first_name, address.address1, address.address2, address.city, code.description AS state, address.zip, " +
            "address.phone1, address.phone2, patient.eMail_address, patient.last_exam_date, patient.birth_date, insurance_name, datediff(year, patient.birth_date, SYSDATETIME()) as age " +
            "FROM (((((address INNER JOIN " +
            "patient ON address.address_no = patient.address_no) INNER JOIN " +
            "patient_insurances ON patient.patient_no = patient_insurances.patient_no) INNER JOIN " +
            "insurance ON patient_insurances.insurance_no = insurance.insurance_no) INNER JOIN " +
            "code ON address.state = code.code) Inner Join patient_recalls on patient.patient_no = patient_recalls.patient_no) " +
            "WHERE 1=1";

    private final DataSource dataSource;
    private final AppConfig appConfig;

    public List<CorrespondenceReportResponse> getReportData(CorrespondenceReportRequest request) {
        try {
            var jdbcTemplate = new NamedParameterJdbcTemplate(this.dataSource);
            var paramSource = new MapSqlParameterSource();

            this.parameterize(request, paramSource);

            return jdbcTemplate.query(this.getSql(request), paramSource,
                    (rs, rowNum) -> new CorrespondenceReportResponse(
                            rs.getInt("patient_no"),
                            rs.getString("last_name"),
                            rs.getString("first_name"),
                            rs.getString("address1"),
                            rs.getString("address2"),
                            rs.getString("city"),
                            rs.getString("state"),
                            rs.getString("zip"),
                            rs.getString("phone1"),
                            rs.getString("phone2"),
                            rs.getString("eMail_address"),
                            rs.getDate("last_exam_date"),
                            rs.getDate("birth_date"),
                            rs.getInt("age"),
                            rs.getString("insurance_name")
                    )
            );
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {

        }
    }

    private String getSql(CorrespondenceReportRequest request) {
        StringBuilder sql = new StringBuilder(SQL);
        if (request.fromLastExamDate() != null) {
            sql.append(" and patient.last_exam_date between :fromLastExamDate and :toLastExamDate");
        }
        if (request.fromBirthDate() != null) {
            sql.append(" and patient.birth_date between :fromBirthDate and :toBirthDate");
        }
        if (request.fromRecallDate() != null) {
            sql.append(" and patient_recalls.recall_dt between :fromRecallDate and :toRecallDate");
        }
        if (!CollectionUtils.isEmpty(request.insurances())) {
            sql.append(" and patient_insurances.insurance_no IN (")
                    .append(request.insurances().stream().map(String::valueOf).collect(Collectors.joining(",")))
                    .append(")");
        }
        if (request.recallType() != null && request.recallType() != 0) {
            sql.append(" and recall_type_no = :recallTypeId");
        }
        sql.append(" order By patient.last_name");

        return sql.toString();
    }

    private void parameterize(CorrespondenceReportRequest request, MapSqlParameterSource paramSource) {
        if (request.fromLastExamDate() != null) {
            paramSource.addValue("fromLastExamDate", request.fromLastExamDate());
            paramSource.addValue("toLastExamDate", request.toLastExamDate());
        }
        if (request.fromBirthDate() != null) {
            paramSource.addValue("fromBirthDate", request.fromBirthDate());
            paramSource.addValue("toBirthDate", request.toBirthDate());
        }
        if (request.fromRecallDate() != null) {
            paramSource.addValue("fromRecallDate", request.fromRecallDate());
            paramSource.addValue("toRecallDate", request.toRecallDate());
        }
        if (request.recallType() != null && request.recallType() != 0) {
            paramSource.addValue("recallTypeId", request.recallType());
        }
    }
}
