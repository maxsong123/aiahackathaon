pragma solidity ^0.4.8;


contract InsurancePlatform {

	enum Gender {
	    Male,
	    Female,
	    Other
	}

	address authorized_insurances_id;
	string data_string;
	// create a new mapping with uID 
	mapping(uint =>InsureeData) insuree_data;

	constructor() public {
        authorized_insurances_id = msg.sender;
		data_string = "{5500200760: {age: 36, gender: Male, smoking: Never smoked, fam_cancer: No, med_bmi: 13.4, assess_act_days_per_week: 4.0}, 5500201404: {age: 40, gender: Male, smoking: Never smoked, fam_cancer: NaN, med_bmi: 23.4, assess_act_days_per_week: 0.0}, 5500202030: {age: 57, gender: Male, smoking: NaN, fam_cancer: NaN, med_bmi: 22.6, assess_act_days_per_week: NaN}, 5500202790: {age: 46, gender: Male, smoking: Not smoking, but used to smoke before, fam_cancer: No, med_bmi: 21.8, assess_act_days_per_week: 2.0}, 5500202824: {age: 42, gender: Male, smoking: Never smoked, fam_cancer: No, med_bmi: NaN, assess_act_days_per_week: 3.0}, 5500203079: {age: 39, gender: Female, smoking: Never smoked, fam_cancer: NaN, med_bmi: 19.1, assess_act_days_per_week: 2.0}, 5500203194: {age: 51, gender: Female, smoking: Never smoked, fam_cancer: No, med_bmi: 20.1, assess_act_days_per_week: 5.0}, 5500207211: {age: 35, gender: Female, smoking: Never smoked, fam_cancer: No, med_bmi: 22.3, assess_act_days_per_week: 0.0}, 5500207401: {age: 25, gender: Male, smoking: Never smoked, fam_cancer: No, med_bmi: 23.0, assess_act_days_per_week: 2.0}, 5500207450: {age: 43, gender: Female, smoking: Not smoking, but used to smoke before, fam_cancer: NaN, med_bmi: NaN, assess_act_days_per_week: 1.0}}";
		  }

	// main structure for employee / insuree data
	struct InsureeData {
		string insuree_type;
		address eth_address;
		uint age;
		string gender;
		string smoking;
		string fam_cancer;
		uint med_bmi;
		uint assess_act_days_per_week;
		//mapping (string => bool) data_streams;
	}

	// main structure for insurances
	struct AuthorizedInsurances{
		string insurane_name;
	}

	function compareStrings (string a, string b) view returns (bool){
	       return keccak256(a) == keccak256(b);
	   }

	//InsureeData[] private insuree_data;

	//mapping(uint =>AuthorizedInsurances) authorized_insurances;
	//authorized_insurances_id = 18192001;

	function register_insuree (uint _id, uint _age, string _gender) public returns (bool) {
		insuree_data[_id] = InsureeData({
		//insuree_data.push( InsureeData({
			insuree_type : "standard",
			eth_address: msg.sender,
			age: _age,
			gender: _gender,
			smoking: "",
			fam_cancer: "",
			med_bmi: 0, 
			assess_act_days_per_week:0
			});
		return true;
	}

	function upload_data_from_client(uint _id, string _smoking, string _fam_cancer, 
		uint _med_bmi, uint _assess_act_days_per_week) public returns (string) {
		require(insuree_data[_id].eth_address == msg.sender, 
			"Only the client account owner can upload data");
		insuree_data[_id].smoking = _smoking;
		insuree_data[_id].med_bmi = _med_bmi;
		insuree_data[_id].assess_act_days_per_week = _assess_act_days_per_week;
		return(insuree_data[_id].smoking);
	}

	function request_data_from_client(uint _insurance_id, string _data_type) public view returns(string) {

		require(msg.sender == authorized_insurances_id, "only authorized insurances can claim this data");
		// this is just a mockup data string, the real function should do the following
		// - check what data_streams the insurance has access to for each customer
		// - pull the data from these authorized lists
		if (compareStrings(_data_type, "steps") == true) {
			return data_string;
		}
	}


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
