#!/bin/bash

# Define file paths for data storage
hospital_file="hospital.txt"
donor_file="donor.txt"
patient_file="patient.txt"
blood_stock_file="blood_stock.txt"
staff_file="staff.txt"
blood_bank_location_file="blood_bank_location.txt"
blood_bank_name_file="blood_bank_name.txt"
available_blood_group_file="available_blood_group.txt"

# Function to create data files if they don't exist
initialize_data_files() {
    touch "$hospital_file"
    touch "$donor_file"
    touch "$patient_file"
    touch "$blood_stock_file"
    touch "$staff_file"
    touch "$blood_bank_location_file"
    touch "$blood_bank_name_file"
    touch "$available_blood_group_file"
}

# Initialize data files if they don't exist
initialize_data_files

# Initialize arrays with existing data from files
hospital_list=($(cat "$hospital_file"))
blood_donor_list=($(cat "$donor_file"))
patient_list=($(cat "$patient_file"))
blood_stock=($(cat "$blood_stock_file"))
staff_list=($(cat "$staff_file"))
blood_bank_location_list=($(cat "$blood_bank_location_file"))
blood_bank_name_list=($(cat "$blood_bank_name_file"))
available_blood_group_list=($(cat "$available_blood_group_file"))

# Main menu
while true; do
    echo "=== Blood Bank Management System ==="
    echo "1. Blood Bank"
    echo "2. Hospital list"
    echo "3. Blood Donor list"
    echo "4. Patient list"
    echo "5. Blood stock"
    echo "6. Staff"
    echo "7. Exit"

    read -p "Select an option: " choice

    case $choice in
        1)  # Blood Bank
            while true; do
                echo "Blood Bank"
                echo "1. Blood Bank Location"
                echo "2. Blood Bank Name"
                echo "3. Available Blood Group"
                echo "4. Back to main menu"

                read -p "Select an option: " blood_bank_option

                case $blood_bank_option in
                    1)  # Blood Bank Location
                        echo "Blood Bank Locations:"
                        for location in "${blood_bank_location_list[@]}"; do
                            echo "$location"
                        done
                        echo "1. Create a Location"
                        echo "2. Delete a Location"
                        echo "3. Back to Blood Bank Menu"

                        read -p "Select an option: " location_option

                        case $location_option in
                            1)  # Create a Location
                                read -p "Enter Blood Bank Location: " location_name
                                blood_bank_location_list+=("$location_name")
                                echo "${blood_bank_location_list[@]}" > "$blood_bank_location_file"
                                echo "Location added."
                                ;;
                            2)  # Delete a Location
                                read -p "Enter the Location to delete: " location_to_delete
                                blood_bank_location_list=("${blood_bank_location_list[@]/$location_to_delete/}")
                                echo "${blood_bank_location_list[@]}" > "$blood_bank_location_file"
                                echo "Location deleted."
                                ;;
                            3)  # Back to Blood Bank Menu
                                ;;
                            *) echo "Invalid option";;
                        esac
                        ;;
                    2)  # Blood Bank Name
                        echo "Blood Bank Names:"
                        for name in "${blood_bank_name_list[@]}"; do
                            echo "$name"
                        done
                        echo "1. Create a Name"
                        echo "2. Delete a Name"
                        echo "3. Back to Blood Bank Menu"

                        read -p "Select an option: " name_option

                        case $name_option in
                            1)  # Create a Name
                                read -p "Enter Blood Bank Name: " name
                                blood_bank_name_list+=("$name")
                                echo "${blood_bank_name_list[@]}" > "$blood_bank_name_file"
                                echo "Name added."
                                ;;
                            2)  # Delete a Name
                                read -p "Enter the Name to delete: " name_to_delete
                                blood_bank_name_list=("${blood_bank_name_list[@]/$name_to_delete/}")
                                echo "${blood_bank_name_list[@]}" > "$blood_bank_name_file"
                                echo "Name deleted."
                                ;;
                            3)  # Back to Blood Bank Menu
                                ;;
                            *) echo "Invalid option";;
                        esac
                        ;;
                    3)  # Available Blood Group
                        echo "Available Blood Groups:"
                        for group in "${available_blood_group_list[@]}"; do
                            echo "$group"
                        done
                        echo "1. Create a Blood Group"
                        echo "2. Delete a Blood Group"
                        echo "3. Back to Blood Bank Menu"

                        read -p "Select an option: " group_option

                        case $group_option in
                            1)  # Create a Blood Group
                                read -p "Enter Blood Group: " blood_group
                                available_blood_group_list+=("$blood_group")
                                echo "${available_blood_group_list[@]}" > "$available_blood_group_file"
                                echo "Blood Group added."
                                ;;
                            2)  # Delete a Blood Group
                                read -p "Enter the Blood Group to delete: " group_to_delete
                                available_blood_group_list=("${available_blood_group_list[@]/$group_to_delete/}")
                                echo "${available_blood_group_list[@]}" > "$available_blood_group_file"
                                echo "Blood Group deleted."
                                ;;
                            3)  # Back to Blood Bank Menu
                                ;;
                            *) echo "Invalid option";;
                        esac
                        ;;
                    4)  # Back to main menu
                        break
                        ;;
                    *) echo "Invalid option";;
                esac
            done
            ;;
        2)  # Hospital list
            while true; do
                echo "Hospital list"
                echo "1. Add a hospital record"
                echo "2. View hospital record"
                echo "3. Delete a hospital record"
                echo "4. Back to main menu"

                read -p "Select an option: " hospital_option

                case $hospital_option in
                    1)  # Add a hospital record
                        read -p "Hospital name: " hospital_name
                        read -p "Location: " location
                        read -p "Hospital Id: " hospital_id
                        hospital_list+=("$hospital_name, $location, $hospital_id")
                        echo "${hospital_list[@]}" > "$hospital_file"
                        echo "Hospital record added."
                        ;;
                    2)  # View hospital record
                        cat "$hospital_file"
                        ;;
                    3)  # Delete a hospital record
                        read -p "Enter the hospital name to delete: " name_to_delete
                        hospital_list=("${hospital_list[@]/$name_to_delete/}")
                        echo "${hospital_list[@]}" > "$hospital_file"
                        echo "Hospital record deleted."
                        ;;
                    4)  # Back to main menu
                        break
                        ;;
                    *) echo "Invalid option";;
                esac
            done
            ;;
        3)  # Blood Donor list
            while true; do
                echo "Blood Donor list"
                echo "1. Add a blood donor record"
                echo "2. View blood donor record"
                echo "3. Delete a blood donor record"
                echo "4. Back to main menu"

                read -p "Select an option: " donor_option

                case $donor_option in
                    1)  # Add a blood donor record
                        read -p "Donor name: " donor_name
                        read -p "Donor registration no: " registration_no
                        read -p "Donor id: " donor_id
                        read -p "Blood group: " blood_group
                        blood_donor_list+=("$donor_name, $registration_no, $donor_id, $blood_group")
                        echo "${blood_donor_list[@]}" > "$donor_file"
                        echo "Blood donor record added."
                        ;;
                    2)  # View blood donor record
                        cat "$donor_file"
                        ;;
                    3)  # Delete a blood donor record
                        read -p "Enter the donor name to delete: " name_to_delete
                        blood_donor_list=("${blood_donor_list[@]/$name_to_delete/}")
                        echo "${blood_donor_list[@]}" > "$donor_file"
                        echo "Blood donor record deleted."
                        ;;
                    4)  # Back to main menu
                        break
                        ;;
                    *) echo "Invalid option";;
                esac
            done
            ;;
        4)  # Patient list
            while true; do
                echo "Patient list"
                echo "1. Add a patient record"
                echo "2. View patient record"
                echo "3. Delete a patient record"
                echo "4. Back to main menu"

                read -p "Select an option: " patient_option

                case $patient_option in
                    1)  # Add a patient record
                        read -p "Patient name: " patient_name
                        read -p "Amount of blood: " blood_amount
                        read -p "Group of blood: " blood_group
                        patient_list+=("$patient_name, $blood_amount, $blood_group")
                        echo "${patient_list[@]}" > "$patient_file"
                        echo "Patient record added."
                        ;;
                    2)  # View patient record
                        cat "$patient_file"
                        ;;
                    3)  # Delete a patient record
                        read -p "Enter the patient name to delete: " name_to_delete
                        patient_list=("${patient_list[@]/$name_to_delete/}")
                        echo "${patient_list[@]}" > "$patient_file"
                        echo "Patient record deleted."
                        ;;
                    4)  # Back to main menu
                        break
                        ;;
                    *) echo "Invalid option";;
                esac
            done
            ;;
        5)  # Blood stock
            while true; do
                echo "Blood stock"
                echo "1. Add a blood stock record"
                echo "2. View blood stock record"
                echo "3. Delete a blood stock record"
                echo "4. Back to main menu"

                read -p "Select an option: " blood_stock_option

                case $blood_stock_option in
                    1)  # Add a blood stock record
                        read -p "Amount of blood: " blood_amount
                        read -p "Donor id: " donor_id
                        read -p "Type of blood: " blood_type
                        blood_stock+=("$blood_amount, $donor_id, $blood_type")
                        echo "${blood_stock[@]}" > "$blood_stock_file"
                        echo "Blood stock record added."
                        ;;
                    2)  # View blood stock record
                        cat "$blood_stock_file"
                        ;;
                    3)  # Delete a blood stock record
                        read -p "Enter the donor id to delete: " id_to_delete
                        blood_stock=("${blood_stock[@]/$id_to_delete/}")
                        echo "${blood_stock[@]}" > "$blood_stock_file"
                        echo "Blood stock record deleted."
                        ;;
                    4)  # Back to main menu
                        break
                        ;;
                    *) echo "Invalid option";;
                esac
            done
            ;;
        6)  # Staff
            while true; do
                echo "Staff"
                echo "1. Add a staff record"
                echo "2. View staff record"
                echo "3. Delete a staff record"
                echo "4. Back to main menu"

                read -p "Select an option: " staff_option

                case $staff_option in
                    1)  # Add a staff record
                        read -p "Staff name: " staff_name
                        read -p "Staff id: " staff_id
                        read -p "Provided service: " provided_service
                        staff_list+=("$staff_name, $staff_id, $provided_service")
                        echo "${staff_list[@]}" > "$staff_file"
                        echo "Staff record added."
                        ;;
                    2)  # View staff record
                        cat "$staff_file"
                        ;;
                    3)  # Delete a staff record
                        read -p "Enter the staff id to delete: " id_to_delete
                        staff_list=("${staff_list[@]/$id_to_delete/}")
                        echo "${staff_list[@]}" > "$staff_file"
                        echo "Staff record deleted."
                        ;;
                    4)  # Back to main menu
                        break
                        ;;
                    *) echo "Invalid option";;
                esac
            done
            ;;
        7)
            echo "Exiting the program."
            exit 0
            ;;
        *) echo "Invalid option";;
    esac
done
