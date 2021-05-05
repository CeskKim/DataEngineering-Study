import dis

def add_two():
    a = 1
    b = 2
    return a + b

def add_two_fstring():
    a = 1
    b = 2
    return f'{a+b}'

def add_two_string_format():
    a = 1
    b = 2
    return '{}'.format(a+b)


if __name__ == "__main__":
    dis.dis(add_two)
    dis.dis(add_two_fstring)
    dis.dis(add_two_string_format)
    
