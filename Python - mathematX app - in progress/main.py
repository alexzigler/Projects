import math
#TO DO:
#provide functions and instructions;
#implement input mechs

#strint returns the first possible digits from a string and returns the number
def strint(s):
    rez=''
    for c in s:
        if c.isdigit():
            rez+=c
        else: break
    return rez
#adaptstr fills with one where no coef and adds '+' b4 each '-'
def adaptstr(s):
    rez=''
    if s[0]=='x':
        rez+='1'
        rez+='x'
    else: rez+=s[0]
    for i in range(1,len(s)):
        if s[i]=='x' and not s[i-1].isdigit():
            rez+='1'
            rez+='x'
        else:
            rez+=s[i]

    rez2=''
    if rez[0]=='-':
        rez2+='+'
        rez2+='-'
    else:
        rez2+=rez[0]
    for i in range (1,len(rez)):
        if rez[i]=='-':
            rez2+='+-'
        else:rez2+=rez[i]

    return rez2
#minustr returns signed str to int
def minustr(s):
    minus=False
    if s[0]=='-':
        minus=True
    if minus:
        return -int(strint(s[1:]))
    else: return int(strint(s))
#cleares white spaces
def clear(s):
    clear = ''
    for c in s:
        if c != ' ':
            clear += c
    return clear

#list to string; usually declare polynomials with this one, unless you input
class polynomial2():
    def __init__(self,coef):
        self.coef=coef
    def __str__(self):
        rez=''
        grad=len(self.coef)-1
        if self.coef[grad]==1:
            rez += 'x^'
        elif self.coef[grad]==-1:
            rez+='-x^'
        else:
            rez+=str(self.coef[grad])
            rez+='x^'
        rez+=str(grad)
        for i in range(grad):
            if(i==grad-2):
               if self.coef[grad-1-i]==0:
                   continue
               elif self.coef[grad-1-i]>0:
                    rez+='+'
                    if self.coef[grad-1-i]==1:
                        rez+='x'
                    else:
                        rez+=str(self.coef[grad-1-i])
                        rez+='x'
               else:
                    if self.coef[grad - 1 - i] == -1:
                        rez+='-x'
                    else:
                        rez += str(self.coef[grad-1-i])
                        rez += 'x'
            elif i==grad-1:
                if self.coef[grad - 1 - i] == 0:
                    continue
                elif self.coef[grad - 1 - i] > 0:
                    rez += '+'
                    rez += str(self.coef[grad - 1 - i])
                else:
                    rez += str(self.coef[grad - 1 - i])
            else:
                if self.coef[grad - 1 - i] == 0:
                    continue
                elif self.coef[grad - 1 - i] > 0:
                    rez += '+'
                    if self.coef[grad - 1 - i] == 1:
                        rez += 'x^'
                        rez += str(grad - 1 - i)
                    else:
                        rez += str(self.coef[grad - 1 - i])
                        rez += 'x^'
                        rez += str(grad - 1 - i)
                else:
                    if self.coef[grad - 1 - i] == -1:
                        rez += '-x^'
                        rez += str(grad - 1 - i)
                    else:
                        rez += str(self.coef[grad - 1 - i])
                        rez += 'x^'
                        rez += str(grad - 1 - i)
        return rez

#string to list, the method returns the other object, constructed using the list
class polynomial():
    def __init__(self,polystr):
        self.polystr = polystr
        self.grade = 0
        if 'x' in polystr:
            self.grade=1
        self.coef=[]
    def __str__(self):
        return str(self.coef)
    def poly1_2(self):
        cleared=clear(self.polystr)
        #print(cleared)
        abslist= cleared.split('x')
        for i in range(len(abslist)):
            abslist[i]=abslist[i].strip()
        #polynomial cleared of white spaces
        for it in abslist:
            try:
                wind=it.index('^')
                grade= int(strint(it[wind+1:]))
            except: grade=0
            if (self.grade<grade):
                self.grade=grade
        # done grade
        #check if grade 0
        if self.grade==0:
            self.coef.append(0)
            p=adaptstr(cleared).split('+')
            #print(p)
            for zq in p:
                if zq == '':                                #calc polys w/ no x
                    continue
                self.coef[0]+=int(minustr(zq))
        else:
            for i in range (self.grade+1):      #init all coefficients 0
                self.coef.append(0)
            clist = adaptstr(cleared).split('+')
            #print(self.grade)
            #print(cleared)
            #print(clist)
            for item in clist:
                if(item==''):                               #bug negative number w/ grade 0  at the start of the string
                    continue
                if 'x' not in item:                         #grade 0 coef general case
                    self.coef[0]+=int(minustr(item))
                elif 'x' in item and '^' not in item:       #grade 1 coef general case
                    self.coef[1]+=minustr(item)
                else:                                       #grade i coef general case
                    x=item.index('x')
                    cc=int((item[x+2:]))
                    self.coef[cc]+=minustr(item[:x])
        return polynomial2(self.coef)

# takes 2 poly objects(lists) and spits out the sum of them as list->string format
def plus(a,b):
    lsta=a.coef
    lstb=b.coef
    lstc=[]
    for i in range(max(len(lsta),len(lstb))):
        ai = False
        bi = False
        try:
            lsta[i]
            ai=True
            lstb[i]
            bi=True
            lstc.append(lsta[i]+lstb[i])
        except:
            if ai==True:
                lstc.append(lsta[i])
            else:
                lstc.append(lstb[i])
    return polynomial2(lstc)
def multi(a,b):
    pass



class advanced():
    funcs = ['log', 'exp', 'sin', 'cos', 'sh', 'ch', 'tan', 'ctg', 'atan']
    def __init__(self,adv_string):
        self.adv_string=adv_string
        self.adv_list=[]
    def __str__(self):
        return str(self.adv_list)
    def adv(self):
        pass
        #TO DO


class advanced2():
    funcs = ['log', 'exp', 'sin', 'cos', 'sh', 'ch', 'tan', 'ctg', 'atan']
    signs = ['+','-','*','/','^']
    def __init__(self,adv_list):
        self.adv_list=adv_list
        self.adv_string=''
    def __str__(self):
        pass #TO DO



p1=polynomial('1-x^3+x^10-4')
p2=polynomial('-1-2x')
p3=polynomial('-1+x^2-4x^2')
p4=polynomial('-x^4+x-1')
p5=polynomial('1+x^6-x^2+x^9')
p6=polynomial('12313x')
p7=polynomial('3+2x-3+2x-1+5x^2')

px=polynomial2([3,2,1,1,1,1,1,2])           #('x^2+2x+3')
py=polynomial2([-1,1,2])                    #('2x^2+x-1')
a=p1.poly1_2()
b=p2.poly1_2()
#print(plus(a,b))
print(py)