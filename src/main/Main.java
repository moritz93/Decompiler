package main;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.util.LinkedList;
import java.util.List;

import translation.Translator;

/**
 * The coordination of Lexer, Parser and Translator.
 * 
 * @author Mo
 *
 */
public class Main {

//	private static String debugSdata = "\naes.o:     file format ss-coff-little\n\n"
//			+ "Contents of section .rdata:\n"
//			+ " 10000000 637c777b f26b6fc5 3001672b fed7ab76  c|w{.ko.0.g+...v\n"
//			+ " 10000010 ca82c97d fa5947f0 add4a2af 9ca472c0  ...}.YG.......r.\n"
//			+ " 10000020 b7fd9326 363ff7cc 34a5e5f1 71d83115  ...&6?..4...q.1.\n"
//			+ " 10000030 04c723c3 1896059a 071280e2 eb27b275  ..#..........\'.u\n"
//			+ " 10000040 09832c1a 1b6e5aa0 523bd6b3 29e32f84  ..,..nZ.R;..)./.\n"
//			+ " 10000050 53d100ed 20fcb15b 6acbbe39 4a4c58cf  S... ..[j..9JLX.\n"
//			+ " 10000060 d0efaafb 434d3385 45f9027f 503c9fa8  ....CM3.E...P<..\n"
//			+ " 10000070 51a3408f 929d38f5 bcb6da21 10fff3d2  Q.@...8....!....\n"
//			+ " 10000080 cd0c13ec 5f974417 c4a77e3d 645d1973  ...._.D...~=d].s\n"
//			+ " 10000090 60814fdc 222a9088 46eeb814 de5e0bdb  `.O.\"*..F....^..\n"
//			+ " 100000a0 e0323a0a 4906245c c2d3ac62 9195e479  .2:.I.$\\...b...y\n"
//			+ " 100000b0 e7c8376d 8dd54ea9 6c56f4ea 657aae08  ..7m..N.lV..ez..\n"
//			+ " 100000c0 ba78252e 1ca6b4c6 e8dd741f 4bbd8b8a  .x%.......t.K...\n"
//			+ " 100000d0 703eb566 4803f60e 613557b9 86c11d9e  p>.fH...a5W.....\n"
//			+ " 100000e0 e1f89811 69d98e94 9b1e87e9 ce5528df  ....i........U(.\n"
//			+ " 100000f0 8ca1890d bfe64268 41992d0f b054bb16  ......BhA.-..T..\n"
//			+ " 10000100 52096ad5 3036a538 bf40a39e 81f3d7fb  R.j.06.8.@......\n"
//			+ " 10000110 7ce33982 9b2fff87 348e4344 c4dee9cb  |.9../..4.CD....\n"
//			+ " 10000120 547b9432 a6c2233d ee4c950b 42fac34e  T{.2..#=.L..B..N\n"
//			+ " 10000130 082ea166 28d924b2 765ba249 6d8bd125  ...f(.$.v[.Im..%\n"
//			+ " 10000140 72f8f664 86689816 d4a45ccc 5d65b692  r..d.h....\\.]e..\n"
//			+ " 10000150 6c704850 fdedb9da 5e154657 a78d9d84  lpHP....^.FW....\n"
//			+ " 10000160 90d8ab00 8cbcd30a f7e45805 b8b34506  ..........X...E.\n"
//			+ " 10000170 d02c1e8f ca3f0f02 c1afbd03 01138a6b  .,...?.........k\n"
//			+ " 10000180 3a911141 4f67dcea 97f2cfce f0b4e673  :..AOg.........s\n"
//			+ " 10000190 96ac7422 e7ad3585 e2f937e8 1c75df6e  ..t\"..5...7..u.n\n"
//			+ " 100001a0 47f11a71 1d29c589 6fb7620e aa18be1b  G..q.)..o.b.....\n"
//			+ " 100001b0 fc563e4b c6d27920 9adbc0fe 78cd5af4  .V>K..y ....x.Z.\n"
//			+ " 100001c0 1fdda833 8807c731 b1121059 2780ec5f  ...3...1...Y\'.._\n"
//			+ " 100001d0 60517fa9 19b54a0d 2de57a9f 93c99cef  `Q....J.-.z.....\n"
//			+ " 100001e0 a0e03b4d ae2af5b0 c8ebbb3c 83539961  ..;M.*.....<.S.a\n"
//			+ " 100001f0 172b047e ba77d626 e1691463 55210c7d  .+.~.w.&.i.cU!.}\n"
//			+ " 10000200 00000001 00000002 00000004 00000008  ................\n"
//			+ " 10000210 00000010 00000020 00000040 00000080  ....... ...@....\n"
//			+ " 10000220 0000001b 00000036 0000006c 000000d8  .......6...l....\n"
//			+ " 10000230 000000ab 0000004d 0000009a 00000000  .......M........\n"
//			+ " 10000240 00000000 00000000 00000000 00000000  ................\n"
//			+ " 10000250 908e4000 c08e4000 b88f4000 30904000  ..@...@...@.0.@.\n"
//			+ " 10000260 60904000 00000000 00000000 00000000  `.@.............\n"
//			+ " 10000270 709e4000 889e4000 809d4000 a89d4000  p.@...@...@...@.\n"
//			+ " 10000280 d09d4000 f89d4000 209e4000 489e4000  ..@...@. .@.H.@.\n"
//			+ " 10000290 80a24000 a0a24000 90a14000 b8a14000  ..@...@...@...@.\n"
//			+ " 100002a0 e0a14000 08a24000 30a24000 58a24000  ..@...@.0.@.X.@.";
	/**
	 * The size of .data section in bytes without any global memory allocated.
	 */
//	public static final short globalOverhead = 552;

	public static void main(String[] args) throws FileNotFoundException, IOException {
		String fileName = "";
		// Check program input/file path.
		String msg = "";
		try {
			if (args.length != 1) {
				msg = "Incorrect amount of arguments";
				throw new Exception();
			} else {
				fileName = args[0];
				if (!fileName.substring(fileName.lastIndexOf('.')).equals(".s")) {
					msg = "Incorrect file suffix.";
					throw new Exception();
				}
			}
		} catch (Exception e) {
			throw new IOException(msg);
		}
		final Reader reader = new FileReader(fileName);
		final Translator translator = new Translator(reader);

		fileName = fileName.substring(0, fileName.lastIndexOf('.'));

		List<Integer> dataSegmentAssignment;
		int dataSize;
		try {
			dataSegmentAssignment = getAssignmentsFromDataSection(fileName, false);
			dataSize = dataSegmentAssignment.size();
		} catch (Exception e) {
			System.err.println("The .data section could not be read.");
			dataSegmentAssignment = new LinkedList<>();
			dataSize = -1;
		}
//		System.out.println(".data: " + dataSegmentAssignment + ", size: " + dataSize);
		System.out.println(".data size: " + dataSize);

		List<Integer> sdataSegmentAssignment;
		int sdataSize;
		try {
			sdataSegmentAssignment = getAssignmentsFromDataSection(fileName, true);
			sdataSize = sdataSegmentAssignment.size();
		} catch (Exception e) {
			System.err.println("The .sdata section could not be read.");
			sdataSegmentAssignment = new LinkedList<>();
			sdataSize = -1;
		}
//		System.out.println(".sdata: " + sdataSegmentAssignment + ", size: " + sdataSize);
		System.out.println(".sdata size: " + sdataSize);

		fileName = fileName.concat(".ll");
		final PrintWriter writer = new PrintWriter(fileName, "UTF-8");
		// Little-endian machine
		writer.println("target datalayout = \"e\"");
		if (fileName.contains("/")) {
			fileName = fileName.substring(0, fileName.lastIndexOf('/')) + "/fake.load";
		} else {
			fileName = "fake.load";
		}
		final PrintWriter fakeLoadWriter = new PrintWriter(fileName, "UTF-8");
		translator.buildTree();
		translator.constructCFG();
		translator.setFunctionParameters();
		translator.setTypes();
		translator.handleMemoryModel(writer, dataSize, sdataSize);
		translator.locatePhiInstructions();
		translator.generateCode(writer, fakeLoadWriter, dataSegmentAssignment, sdataSegmentAssignment);
	}

	/**
	 * Converts a LittleEndian integer in hexadecimal version to bytes.
	 * 
	 * @param hex
	 * @return Collection of four bytes.
	 */
	public static List<Integer> splitIntegerToBytes(final String hex) {
		List<Integer> ret = new LinkedList<>();
		if (hex.length() % 2 != 0) {
			System.err.println("Parsing Hex String failed.");
			return ret;
		}
		for (int i = 0; i < hex.length(); i += 2) {
			ret.add(Integer.parseInt(hex.substring(i, i + 2), 16));
		}
//		for (int i = hex.length() - 2; i >= 0; i -= 2) {
//			ret.add(Integer.parseInt(hex.substring(i, i + 2), 16));
//		}
		return ret;
	}

	/**
	 * 
	 * @param fileName
	 * @param sdata
	 *            - True if assignments of .sdata section should be read, false
	 *            for reading .data section.
	 * @return Assigned values in global memory.
	 * @throws IOException
	 */
	public static List<Integer> getAssignmentsFromDataSection(String fileName, boolean sdata) throws IOException {
		// Obtains the .data section size in order to determine global memory.
		String binaryFile = fileName.concat(".o");
		Runtime rt = Runtime.getRuntime();
		String s = null;
		BufferedReader stdInput;
		LinkedList<Integer> assignment = new LinkedList<>();
		
		String[] commands = {"sslittle-na-sstrix-objdump.cde", "-s", "-j", ".rdata", binaryFile};;
		Process proc;
		// Read the .rdata section.
		if (!sdata) {
//			stdInput = new BufferedReader(new StringReader(debugSdata));
			proc = rt.exec(commands);
			stdInput = new BufferedReader(new InputStreamReader(proc.getInputStream()));
			stdInput.readLine();
			stdInput.readLine();
			stdInput.readLine();
			stdInput.readLine();
			while ((s = stdInput.readLine()) != null) {
				// Skips whitespace at the beginning of each line.
				s = s.substring(1);
				// Skips line's address and hyroglyphs at the end.
				String currentLine = s.substring(s.indexOf(" ") + 1, 44);
				String[] values = currentLine.split(" ");
				// Parses bytes of each word.
				for (int i = 0; i < values.length; i++) {
					try {
						assignment.addAll(splitIntegerToBytes(values[i]));
					} catch (Exception e) {
						// Catches MaxIntVal exception.
						assignment.add(-1);
						System.err.println("Data could not be parsed.");
					}
				}
			}
		}
		commands[3] = sdata ? ".sdata" : ".data";
		proc = rt.exec(commands);
		stdInput = new BufferedReader(new InputStreamReader(proc.getInputStream()));
		// Skip first 4 lines.
		stdInput.readLine();
		stdInput.readLine();
		stdInput.readLine();
		stdInput.readLine();
		// read the output from the command
		while ((s = stdInput.readLine()) != null) {
			// Skips whitespace at the beginning of each line.
			s = s.substring(1);
			// Skips line's address.
			String currentLine = s.substring(s.indexOf(" ") + 1, 44);
			String[] values = currentLine.split(" ");
			// Parses bytes of each word.
			for (int i = 0; i < values.length; i++) {
				try {
					assignment.addAll(splitIntegerToBytes(values[i]));
				} catch (Exception e) {
					// Catches MaxIntVal exception.
					assignment.add(-1);
					System.err.println("Data could not be parsed.");
				}
			}
		}
		return assignment;
	}
}
