import re

def emailval(n):
    regex = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
    if len(n)>=6 and len(n)<=30:
        if (re.fullmatch(regex, n)):
            return "Valid Email"
        else:
            return "Invalid Email"
        n = "valid length"
        return n
    else:
        n = "characters length must be between 6 to 30"
        return  n

def passward(n):
    check_req = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,15}$"
    if re.search(check_req,n):
        return "Valid Password"
    else:
        return 'Invalid Passward'