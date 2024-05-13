pragma solidity ^0.8.0;

contract PatientRegistry {
    struct Patient {
        string name;
        string disease;
    }

    mapping(address => Patient) public patients;

    event PatientRegistered(address indexed patientAddress, string name, string disease);

    function registerPatient(string memory _name, string memory _disease) public {
        patients[msg.sender] = Patient(_name, _disease);
        emit PatientRegistered(msg.sender, _name, _disease);
    }
}

contract PatientData {
    PatientRegistry patientRegistry;

    constructor(address _patientRegistryAddress) {
        patientRegistry = PatientRegistry(_patientRegistryAddress);
    }

    function addPatientData() public {
        patientRegistry.registerPatient("Nida Khan", "Flu");
    }
}

