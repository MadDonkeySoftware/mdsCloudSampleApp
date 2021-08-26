import copy

def main(input):
    retObj = copy.deepcopy(input)
    retObj.two = 2
    return retObj
