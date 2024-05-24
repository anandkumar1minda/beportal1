package xlsx;

import java.io.FileOutputStream;
import java.io.IOException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import idc.common.AppDbCommon;

public class CreateXlsx {
	
	Workbook workbook;
	Sheet sheet;
	Row row;
	
	public CreateXlsx(){
		 this.workbook = new XSSFWorkbook();		
	}
	
	public void setSheet(String sheetName) {
		this.sheet =  this.workbook.createSheet(sheetName);		
	}	
	
	public void setNewRow(int rowNum){
		this.row = this.sheet.createRow(rowNum);		
	}
	
	public void setCellWithValue(int cellNum, String cellValue) {
		Cell cell = this.row.createCell(cellNum);
		cell.setCellValue(cellValue);
	}
	
	public void setCellWithValue(int cellNum, int cellValue) {
		Cell cell = this.row.createCell(cellNum);
		cell.setCellValue(cellValue);
	}
	
	public Cell getCell(int cellNum){
		return this.row.createCell(cellNum);		
	}
	
	public CellStyle getCellStyle() {
		return this.workbook.createCellStyle();
	}
	
	public void setCellColorAndFontColor(Cell cell, IndexedColors FGcolor, IndexedColors FontColor ){
		
		CellStyle cellStyle = this.workbook.createCellStyle();
		Font font = this.workbook.createFont();
		
	    font.setBold(true);
	    font.setColor(FontColor.getIndex()); 
	    cellStyle.setFont(font);
	    cellStyle.setFillForegroundColor(FGcolor.getIndex());
	    cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);	    
	    cell.setCellStyle(cellStyle);	    
	    
	}
	
	public void writeWorkbook(String fileName){
		try {
			FileOutputStream outputStream = new FileOutputStream(AppDbCommon.COMMON_DOC_DATA+fileName);
			this.workbook.write(outputStream);	
		}catch(IOException ex) {
			System.out.println("Error in function "+this.getClass().getName()+".writeWorkbook(String fileName) "+ex.toString());
		}
	}
 }


