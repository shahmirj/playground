#!/usr/bin/env python
#
# This program allows us to take VM languages and turn it into hack
# language.
#
# To run simply call ./vm.py <file.asm>

import argparse
import re

##
# Suffix generater to allow namespacing of our variables
# 
# @returns a string with a number such as ".n"
# 
def suffixGenerator():
    x=0
    while True:
        x = x + 1
        yield ".{}".format(x)  
suffix = suffixGenerator()

##
# Determines weather the current line is a code line or should
# be ignored
# 
# @param line the line to check
# 
# @return boolean to represent the function name
def isCodeLine(line):
    line = line.strip()
    if not line or re.match(r"^\s*//", line):
        return False
    return True

##
# Initialize our stack pointer
# 
# @return Array of commands to init our stack to 256
def stackInit():
    return [
        "// Stack(Pointer) Init!",
        "@SP",
        "@256",
        "D=A",
        "@SP",
        "M=D"
    ]

## 
# Add to stack
#
# @return Array of values representing addition to stack
# 
def plusMeStack():
    return [
        "// Add 1 to Stack",
        "@SP",
        "M=M+1"
    ]

##
# Subtract from stack
# 
# @return Array of value representing stack subtraction
# 
def subMeStack():
    return [
        "// Sub 1 from Stack",
        "@SP",
        "M=M-1"
    ]

##
# Push to stack
# 
# @param segment The segment to push to
# @param index The value to push it self
# 
# @return 
def handlePush(segment, index):
    return [ 
        "// push:" + segment + ":" + index,
        "@"+index,
        "D=A",
        "@SP",
        "A=M",
        "M=D"
    ] + plusMeStack()

##
# Add SP-1 and SP-2
# 
# @return Array representing the Add operation
#
def handleAdd():
    return [ "// ADD SP-1 + SP-2 : RETURN *(SP-2)" 
    ] + subMeStack() + [
        "A=M",
        "D=M"
    ] + subMeStack() + [
        "A=M",
        "M=D+M"
    ] + plusMeStack()

##
# Equality Check weather the two variables are equal. If they are
# set SP-1 to the return value
# 
# @return Array representing equality
#
def handleEquality():
    my_suffix = suffix.next()
    return subMeStack() + [ 
        "A=M",
        "D=M" 
    ] + subMeStack() + [
        "A=M",
        "D=D-M",
        "@TRUE"+my_suffix,
        "D;JEQ",
        "D=0",
        "@CONTINUE"+my_suffix,
        "0;JMP",
        "(TRUE"+my_suffix+")",
        "D=-1",
        "(CONTINUE"+my_suffix+")",
        "@SP",
        "A=M",
        "M=D"
    ] + plusMeStack()

##
# Add the end loop
# 
# @return [] The end loop array string
# 
def terminate_program():
    return [ 
        "(END)",
        "@END",
        "0;JMP"
    ]

##
# Given an action call the appropriate function
# 
# @param action The action string such as 'push', 'pop', 'eq' etc.
# 
# @return [] Array of strings representing the code
# 
actions = {
    "push": handlePush,
    "add": handleAdd,
    "eq": handleEquality
}
def performAction(action, whatshallido):
    if action in actions:
        return actions[action](*whatshallido)
    else:
        raise RuntimeError("This aint a command (wtf!) " + action)

def main():
    # Ensure the correct number of arguments are passed
    parser = argparse.ArgumentParser(description = "VM translator")
    parser.add_argument("vmfile", help = "The vm file to parse string")
    args = parser.parse_args()

    # Build only the commands
    commands = []
    with open(args.vmfile) as fh:
        for line in [ l.strip() for l in fh ]:
            if isCodeLine(line):
                commands.append(line)

    assembly = stackInit()

    # Call the action on each command
    for command in commands:
        parts = command.split()
        action = parts[0]
        assembly += performAction(action, parts[1:])

    assembly += terminate_program()

    print "\n".join(assembly)

main()


# Read the file line by line