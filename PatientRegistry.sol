pragma solidity ^0.8.0;

contract PatientRegistry {
    struct Patient {
        string name;
        string disease;
    }

    mapping(address => Patient) public patients;

    event PatientRegistered(address indexed patientAddress, string name, string disease);

    function registerPatient() public {
        string memory name = "Nida Khan";
        string memory disease = "Flu";
        patients[msg.sender] = Patient(name, disease);
        emit PatientRegistered(msg.sender, name, disease);
    }
}
