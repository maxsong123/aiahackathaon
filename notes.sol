{"5500200760": {"age": 36, "gender": "Male", "smoking": "Never smoked", "fam_cancer": "No", "med_bmi": 13.4, "assess_act_days_per_week": 4.0}

contract.register_insuree(id=5500200760, age=15, gender="male")

contract = InsurancePlatform.at(InsurancePlatform.address)

contract.upload_data_from_client(id=5500200760, smoking="Never smoked", fam_cancer="No", med_bmi=13.4, assess_act_days_per_week=4.0)

contract.request_data_from_client(insurance_id = 18192001, data_type = "steps")