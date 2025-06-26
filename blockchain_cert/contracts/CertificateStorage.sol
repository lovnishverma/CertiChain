// SPDX-License-Identifier: MIT
pragma solidity ^0.5.16;

contract CertificateStorage {
    struct Certificate {
        string certificateName;
        string courseCode;
        string courseName;
        string rollNumber;
        string studentName;
        string hash;
    }

    mapping(string => Certificate) public certificates;

    function setCD(
        string memory certificateId,
        string memory certificateName,
        string memory courseCode,
        string memory courseName,
        string memory rollNumber,
        string memory studentName,
        string memory hash
    ) public {
        certificates[certificateId] = Certificate(
            certificateName,
            courseCode,
            courseName,
            rollNumber,
            studentName,
            hash
        );
    }

    function getCD(string memory certificateId)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        Certificate memory cert = certificates[certificateId];
        return (
            certificateId,
            cert.certificateName,
            cert.courseCode,
            cert.courseName,
            cert.rollNumber,
            cert.studentName,
            cert.hash
        );
    }
}
