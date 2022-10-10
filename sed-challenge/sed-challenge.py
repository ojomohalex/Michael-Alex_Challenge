import re

for _ in range(int(input())):
    s = input()
    if not re.match(r'^[4-6]\d{3}-?\d{4}-?\d{4}-?\d{4}$',
    s):
        print('Invalid')
    else:
        if re.search(r'(\d)\1\1\1', re.sub(r'-', '', s)):
            print('Invalid')
        else:
            print('Valid')
            
            #GIT
            
            
            