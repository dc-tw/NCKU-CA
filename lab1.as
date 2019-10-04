.data
argument: .word 7 # Number to find the lucas number value of
str1: .string "lucus number of "
str2: .string " is "

.text
main:
        lw       a0, argument   # Load argument from static data
        mv       a1, a0
        li       a2, 0
        li       a3, 0
        jal      ra, iter       
        ecall
back:
        # Print the result to console
        mv       a1, a0
        #mv       a2, zero
        #mv       a3, zero
        lw       a0, argument
        jal      ra, printResult
        ecall

        # Exit program
        li       a0, 10
        ecall

iter:
        li       a2, 2
        li       a3, 1
        bgt      a2, a1, exit
        addi     a1, a1, -1
        jal      for
        #ecall
exit:
        bnez     a1, zeta
        mv       a4, a3
        ret
zeta:
        mv       a4, a2
        ret
for:
        add      a4, a2, a3
        mv       a2, a3
        mv       a3, a4
        addi     a1, a1, -1
        bne      a1, zero, for
        jal      back


# expects:
printResult:
        mv       t0, a0
        mv       t1, a4

        la       a1, str1
        li       a0, 4
        ecall

        mv       a1, t0
        li       a0, 1
        ecall

        la       a1, str2
        li       a0, 4
        ecall

        mv       a1, t1
        li       a0, 1
        #ecall

        ret       li       a0, 4
        ecall

        mv       a1, t1
        li       a0, 1
        #ecall

        ret