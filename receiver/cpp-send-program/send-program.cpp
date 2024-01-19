#include <iostream>
#include <fstream>
#include <string>
#include "asio.hpp"

using asio::ip::udp;

static constexpr auto cHostFile{ "host" };
static constexpr auto cPortFile{ "port" };
static constexpr auto cInterfaceFile{ "interface" };
static constexpr auto cDeviceFile{ "/dev/receiver" };
static constexpr size_t cMacAddressLength{ 17 };
static constexpr int cTimeStampBytes{ 8 };

static std::string getHost();
static int getPort();
static std::string getInterface();
static std::string getMac(std::string const& interfaceName);
static std::string getJsonMessage(uint64_t const timestamp, std::string const& macAddress, size_t const count);

int main() {
	char data[cTimeStampBytes]{ 0 };
	uint64_t timestamp{ 0 };
	uint64_t count{ 1 };

	try {
		auto const host{ getHost() };
		auto const port{ getPort() };
		auto const mac{ getMac(getInterface()) };
		
		asio::io_context io_context;
		udp::socket s(io_context, udp::endpoint(udp::v4(), 0));
		udp::resolver resolver(io_context);
		auto endpoints{ resolver.resolve(udp::v4(), host, std::to_string(port)) };
		
		if (endpoints.begin() == endpoints.end()) {
			std::cout << "Couldn't resolve endpoint with host " << host << " and port " << port << "!" << std::endl;
			return 0;
		}
		
		auto& endpoint{*endpoints.begin()};
		
		while (1) {
			std::ifstream file(cDeviceFile);
			
			if(!file.read(data, 8)) {
				continue;
			}
			
			timestamp = 0;
			for (int i{0}; i < cTimeStampBytes; ++i) {
				uint64_t const d{ data[i] };
				timestamp |= (d << (8 * i));
			}

			std::string const message{ getJsonMessage(timestamp, mac, count++) };
			std::cout << "message: " << message << std::endl;
			s.send_to(asio::buffer(message), endpoint);
		}
	}
	catch (std::exception& e) {
		std::cerr << e.what() << std::endl;
	}

	return 0;
}

static std::string getHost() {
	std::ifstream file(cHostFile);
	
	if(!file.is_open()) {
		throw std::runtime_error("Error: host file is missing!");
	}
	
	std::string host{};
	file >> host;
	
	if(host.empty()) {
		throw std::runtime_error("Error: host can't be empty!");
	}
	
	return host;
}

static int getPort() {
	std::ifstream file(cPortFile);
	
	if(!file.is_open()) {
		throw std::runtime_error("Error: port file is missing!");
	}
	
	int port{};
	file >> port;
	
	if(port < 1024 || port > 65535) {
		throw std::runtime_error("Error: given port can't be used!");
	}
	
	return port;
}

static std::string getInterface() {
	std::ifstream file(cInterfaceFile);
	
	if(!file.is_open()) {
		throw std::runtime_error("Error: interface file is missing!");
	}
	
	std::string ethInterface{};
	file >> ethInterface;
	
	if(ethInterface.empty()) {
		throw std::runtime_error("Error: interface can't be empty!");
	}
	
	return ethInterface;
}

static std::string getMac(std::string const& interfaceName) {
	std::string macFile{ "/sys/class/net/" };
	macFile.append(interfaceName);
	macFile.append("/address");
	
	std::ifstream file(macFile);
	
	if(!file.is_open()) {
		throw std::runtime_error("Error: interface address file is missing!");
	}
	
	std::string mac{};
	file >> mac;

	if(mac.length() != cMacAddressLength) {
		throw std::runtime_error("Error: invalid mac address!");
	}
	
	return mac;
}

static std::string getJsonMessage(uint64_t const timestamp, std::string const& macAddress, size_t const count) {
	std::stringstream message;
	message << "{\"MAC\": \"" << macAddress << "\", ";
	message << "\"Timestamp\": " << timestamp << ", ";
	message << "\"Count\": " << count << "}";
	return message.str();
}
