import psycopg
from psycopg.rows import dict_row

host = ""
database = ""
username = ""
pwd = ""
port_id = ""


try:
    with psycopg.connect(
        host=host,
        dbname=database,
        user=username,
        password=pwd,
        port=port_id,
    ) as conn:
        with conn.cursor(row_factory=dict_row) as cur:
            create_script = """CREATE TABLE IF NOT EXISTS employee(
                    id      int PRIMARY KEY,
                    name    varchar(40)NOT NULL,
                    salary  int,
                    department  varchar(50)
            )"""
            cur.execute(create_script)

            # insert_script = 'INSERT INTO employee(id,name,salary,department) VALUES(%s,%s,%s,%s)'
            # insert_value = (1,'Jason',82000,'Operation')
            # cur.execute(insert_script,insert_value)

            # update_script = 'UPDAT employee SET salary = %s WHERE id = %s'
            # update_values = (100000, 1)
            # cur.execute(update_script,update_values)

            # delete_script = 'DELETE FROM employee WHERE id= %s'
            # delete_value = (1,)
            # cur.execute(delete_script,delete_value)
            # fetch_value = (1,)
            # cur.execute('SELECT * FROM employee WHERE id = %s',fetch_value)
            # result =cur.fetchone()
            # if result is None:
            #     print("Employee not found")
            # else:
            #     print(result)



            def get_employee_by_id(cur, employee_id):
    
                create_script = "SELECT * FROM employee WHERE id = %s"
                script_value = (employee_id,)

                cur.execute(create_script, script_value)
                result = cur.fetchone()

                return result

            def update_employee_salary(cur, employee_id, new_salary):
                create_script = "UPDATE employee SET salary = %s WHERE id = %s"
                script_value = (
                    new_salary,
                    employee_id,
                )
                cur.execute(create_script, script_value)

            def delete_employee(cur, employee_id):
                create_script = "DELETE FROM employee WHERE id =%s"
                script_value = (employee_id,)
                cur.execute(create_script, script_value)

            def create_employee(cur, employee_id, name, salary, department):
                create_script = "INSERT INTO employee(id,name,salary,department) VALUES(%s,%s,%s,%s)"
                script_values = (
                    employee_id,
                    name,
                    salary,
                    department,
                )
                cur.execute(create_script, script_values)

      



            # while True:

            #     print("Select 1 to create employee \n"
            #           "Select 2 to find employee \n"
            #           "Select 3 to Update employee salary \n" 
            #           "Select 4 to delete employee"   )

            #     choice = input("Please select on option").strip()

            #     if choice == "1":

            #         create_employee()
                    







except Exception as error:
    print(error)


# def get_employee_by_id(employee_id):
#     while True:
#         create_script = "SELECT id FROM employee WEHERE id = %s"
#         scrip_value = employee_id

#         result = cur.execute(create_script,scrip_value)

#         return result


# print(get_employee_by_id(1))
