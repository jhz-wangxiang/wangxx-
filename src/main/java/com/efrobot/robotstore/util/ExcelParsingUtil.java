/**
 * 描述：TODO
 * 包名：com.ren001.utils
 * 文件名：ExcelParsing.java
 * 日期:2017年4月5日-上午10:28:03
 * 版权:北京进化者机器人科技有限公司
 * 
 */
package com.efrobot.robotstore.util;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * TODO(这里用一句话描述这个类的作用)
 * <p>
 * TODO(这里描述这个类补充说明 – 可选)
 * 
 * @author LHX
 * @email lihuaxin@ren001.com
 * @date 2017年4月5日-上午10:28:03
 * @version 1.0.0
 */
public class ExcelParsingUtil {

	// private static String path = "C:/evolver/文档/测试.xlsx";

	public static List<String[]> dataProcess(InputStream in, String extensionName, int ignoreRows) throws IOException {

		Workbook wb = null;

		if (extensionName.toLowerCase().equals("xls")) {
			wb = new HSSFWorkbook(in);
		} else if (extensionName.toLowerCase().equals("xlsx")) {
			wb = new XSSFWorkbook(in);
		}

		ArrayList<String[]> result = new ArrayList<String[]>();
		int rowSize = 0;
		Cell cell = null;
		for (int sheetIndex = 0; sheetIndex < wb.getNumberOfSheets(); sheetIndex++) {
			Sheet st = wb.getSheetAt(sheetIndex);
			System.out.println("Row size is " + st.getLastRowNum());
			// 第一行为标题，不取
			for (int rowIndex = ignoreRows; rowIndex <= st.getLastRowNum(); rowIndex++) {
				Row row = st.getRow(rowIndex);
				if (row == null) {
					continue;
				}
				int tempRowSize = 100;//解析個數
				if (tempRowSize > rowSize) {
					rowSize = tempRowSize;
				}
				String[] values = new String[rowSize];
				Arrays.fill(values, "");
				boolean hasValue = false;
				for (short columnIndex = 0; columnIndex <= row.getLastCellNum(); columnIndex++) {
					String value = "";
					cell = row.getCell(columnIndex);
					if (cell != null) {
						switch (cell.getCellType()) {
						case HSSFCell.CELL_TYPE_STRING:
							value = cell.getStringCellValue();
							break;
						case HSSFCell.CELL_TYPE_NUMERIC:
							if (HSSFDateUtil.isCellDateFormatted(cell)) {
								Date date = cell.getDateCellValue();
								if (date != null) {
									value = new SimpleDateFormat("yyyy/MM/dd HH:mm").format(date);
								} else {
									value = "";
								}
							} else {
								value = String.valueOf(cell.getNumericCellValue());
								value = value.replace(".0", "");
							}
							break;
						case HSSFCell.CELL_TYPE_FORMULA:
							// 导入时如果为公式生成的数据则无值
//							if (!cell.getStringCellValue().equals("")) {
							if (cell!=null) {
								cell.setCellType(Cell.CELL_TYPE_STRING);
								value = cell.getStringCellValue();
							} else {
								value ="";
							}
							break;
						default:
							value = "";
						}
					}
					if (columnIndex == 0 && value.trim().equals("")) {
						break;
					}

					values[columnIndex] = value;
					hasValue = true;
				}
				if (hasValue) {
					result.add(values);
				}

			}
		}
		in.close();

		return result;
	}

	// public static void main(String[] args) throws IOException {
	// String path = "C:\\Users\\kangning\\Desktop\\asd.xlsx";
	// File file = new File(path );
	// InputStream in = new FileInputStream(file);
	// List<String[]> list = dataProcess(in, "xlsx", 1);
	// for (String[] strings : list) {
	// System.out.println(Arrays.toString(strings));
	// }
	// System.out.println("-----------------共" + list.size() +
	// "行--------------");
	// }
}
