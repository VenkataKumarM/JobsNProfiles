import re

def job_name(x,y,z):
    data1 = x.lower().split()
    data2 = y.lower().split()
    data3 = z.lower().split()
    if len(data1)==1:
        if data1[0] in data2:
            return "data matched in job title"
        elif data1[0] in data3:
            return "data matched in skills"
        else:
            return "entry not matched in job title, skills"
    elif len(data1) ==2:
        if data1[0] in data2 or data1[1] in data2:
            return "data matched in job title"
        elif data1[0] in data3 or data1[1] in data3:
            return "data matched in skills"
        else:
            return "data not matched"
    else:
        if len(data1) == 3:
            if data1[0] in data2 or data1[1] in data2 or data1[2] in data2:
                return "data matched in job title"
            elif data1[0] in data3 or data1[1] in data3 or data1[2] in data3:
                return "data matched in skills"
            else:
                return "data not matched"




new_dic ={'ALABAMA':'AL', 'ALASKA':'AK', 'ARIZONA':'AZ',
          'ARKANSAS':'AR', 'CALIFORNIA':'CA', 'COLORADO':'CO',
          'CONNECTICUT':'CT', 'DELAWARE':'DE', 'FLORIDA':'FL',
          'GEORGIA':'GA', 'HAWAII':'HI', 'IDAHO':'ID', 'ILLINOIS':'IL',
          'INDIANA':'IN', 'IOWA':'IA', 'KANSAS':'KS', 'KENTUCKY':'KY',
          'LOUISIANA':'LA', 'MAINE':'ME', 'MARYLAND':'MD', 'MASSACHUSETTS':'MA',
          'MICHIGAN':'MI', 'MINNESOTA':'MN', 'MISSISSIPPI':'MS', 'MISSOURI':'MO',
          'MONTANA':'MT', 'NEBRASKA':'NE', 'NEVADA':'NV', 'NEW HAMPSHIRE':'NH',
          'NEW JERSEY':'NJ', 'NEW MEXICO':'NM', 'NEW YORK':'NY', 'NORTH CAROLINA':'NC',
          'NORTH DAKOTA':'ND', 'OHIO':'OH', 'OKLAHOMA':'OK', 'OREGON':'OR', 'PENNSYLVANIA':'PA',
          'RHODE ISLAND':'RI', 'SOUTH CAROLINA':'SC', 'SOUTH DAKOTA':'SD', 'TENNESSEE':'TN','TEXAS':'TX',
          'UTAH':'UT', 'VERMONT':'VT', 'VIRGINIA':'VA', 'WASHINGTON':'WA', 'WEST VIRGINIA':'WV', 'WISCONSIN':'WI', 'WYOMING':'WY'}



def loc1(x=None,y=None):
    user_input = re.sub(r"\s+", "", x).upper()
    dis_op = re.sub(r"\s+", "", y).upper().split(',')
    # print(user_input)
    # print(dis_op)
    if user_input in dis_op:
        return "Location Mathced"
    if user_input not in dis_op:
        if user_input in new_dic.keys():
            for k, v in new_dic.items():
                if user_input == k:
                    if v in dis_op:
                        return "Location Mathced"
                    else:
                        return "Location Not Matched"
                else:
                    return "Location Not Matched"
        else:
            return "Location Not Matched"
    else:
        return "Location Not Matched"


