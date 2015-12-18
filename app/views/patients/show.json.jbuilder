json.extract! @patient, :id, :name
json._id @patient.to_param
json.url patient_url(@patient, format: :json)
