package com.corecto.web.service;

import java.io.ByteArrayOutputStream;

import com.corecto.web.model.dto.ReportData;


public interface ReportGeneratorService {

	ByteArrayOutputStream generateReport(ReportData reportData);

}