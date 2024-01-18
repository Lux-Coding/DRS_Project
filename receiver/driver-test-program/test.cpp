#include <iostream>
#include <fstream>
#include <string>

int main() {
	char data[8] = {0};
	uint64_t data0, data1, data2, data3, data4, data5, data6, data7;
	uint64_t result = 0;

	while(1) {
		std::ifstream file("/dev/receiver");
		
		if(!file.read(data, 8)) {
			continue;
		}
		
		data0 = data[0];
		data1 = data[1];
		data2 = data[2];
		data3 = data[3];
		data4 = data[4];
		data5 = data[5];
		data6 = data[6];
		data7 = data[7];
		result = (data7 << (7 * 8)) | (data6 << (6 * 8)) | (data5 << (5 * 8)) | (data4 << (4 * 8)) | (data3 << (3 * 8)) | (data2 << (2 * 8)) | (data1 << (1 * 8)) | data0; 		
		std::cout << "data:" << result << std::endl;	
	}
	return 0;
}
