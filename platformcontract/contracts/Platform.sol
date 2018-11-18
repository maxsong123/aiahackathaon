pragma solidity ^0.4.8;


contract InsurancePlatform {

	enum Gender {
	    Male,
	    Female,
	    Other
	}

	struct InsureeData {
		string insuree_type;
		address eth_address;
		uint age;
		Gender gender;
		string smoking;
		string fam_cancer;
		uint med_bmi;
		uint assess_act_days_per_week;
		mapping (string => bool) data_streams;
	}

	struct AuthorizedInsurances{
		string insurane_name;
	}

	mapping (uint =>InsureeData) insuree_data;

	mapping (uint =>AuthorizedInsurances) authorized_insurances;

	function register_insuree (uint _id, string _data) {
		insuree_data(_id) memory = InsureeData({insuree_type : "standard"});
		//insuree_data(_id).eth_address= msg.sender;
		return;
	}

	// function request_data
	// function update_data_from_client(uint _id, string _data_stream) public {
	// 	anonymized_data = _data_stream;
	// }

	// function updateShares(uint _share) public {
	// 	shares[msg.sender] = getShares(msg.sender) + _share;
	// }

	// function getShares(address _addr) public view returns(uint) {
	// 	return shares[_addr];
	// }

  //function testNestedMappings() {
    //@log test nested mappings
    //mymap[1][2] = 42;
    //@log mymap[1][2] = `uint mymap[1][2]`
    //@log test struct array:
    //@log someName[msg.sender][1].length = `uint someName[msg.sender][1].length`
    //@log incrementing length
    // someName[msg.sender][1].length++;
    // //@log saving timestamp to last entry
    // someName[msg.sender][1][someName[msg.sender][1].length - 1].timestamp = block.timestamp;
    // //@log `uint someName[msg.sender][1][someName[msg.sender][1].length-1].timestamp`
  }
