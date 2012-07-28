'''
This program generates the best timer settings for sound frequencies

Created on Jul 25, 2012

@author: balazs.grill
'''

import math

#if __name__ == '__main__':
#    pass

clock = 1000000
prescaler = [1, 4, 16, 64]
postscaler = [1+x for x in range(16)] 

octave0 = [
      ['C' , 261.6255653006], #C
      ['C1', 277.1826309769],
      ['D' , 293.6647679174], #D
      ['D1', 311.1269837221],
      ['E' , 329.6275569129], #E
      ['F' , 349.2282314330], #F
      ['F1', 369.9944227116],
      ['G' , 391.9954359817], #G
      ['G1', 415.3046975799],
      ['A' , 440.0000000000], #A
      ['A1', 466.1637615181],
      ['B' , 493.8833012561] #B 
      ]

def getFreq(pr, pre, post):
    return (1.0*clock)/(pr*pre*post)

def findFreq(freq):
    result = [0, 0, 0, 9999.0] #PR, pre, post, diff
    for i in range(256):
        for pre in prescaler:
            for post in postscaler:
                f = getFreq(i+1, pre, post)
                g = abs(f-freq)
                if (g < result[3]):
                    result = [i+1, pre, post, g]                         
    return result

frequencies = []
offset = -1
for i in range(4):
    octave = i+offset
    for d in octave0:
        frequencies.append([octave, d[0], d[1]*(2**octave)])

sounds = []
for f in frequencies:
    sounds.append([f, findFreq(f[2])])

music_octave = [
                [0, 'C',2],
                [0, 'off',1],
                [0, 'D',2],
                [0, 'off',1],
                [0, 'E',2],
                [0, 'off',1],
                [0, 'F',2],
                [0, 'off',1],
                [0, 'G',2],
                [0, 'off',1],
                [0, 'A',2],
                [0, 'off',1],
                [0, 'B',2],
                [0, 'off',1],
                [1, 'C',2],
                [0, 'off',1],
                ]
   
music_test = [
              [0, 'A',2],
              [0, 'off',2]
              ]   
   
music_boci = [
              [0, 'C',2],
              [0, 'off',0],
              [0, 'E',2],
              [0, 'off',0],
              [0, 'C',2],
              [0, 'off',0],
              [0, 'E',2],
              [0, 'off',0],
              [0, 'G',4],
              [0, 'off',0],
              [0, 'G',4],
              [0, 'off',0],
              
              [0, 'C',2],
              [0, 'off',0],
              [0, 'E',2],
              [0, 'off',0],
              [0, 'C',2],
              [0, 'off',0],
              [0, 'E',2],
              [0, 'off',0],
              [0, 'G',4],
              [0, 'off',0],
              [0, 'G',4],
              [0, 'off',0],
              
              [1, 'C',2],
              [0, 'off',0],
              [0, 'B',2],
              [0, 'off',0],
              [0, 'A',2],
              [0, 'off',0],
              [0, 'G',2],
              [0, 'off',0],
              [0, 'F',4],
              [0, 'off',0],
              [0, 'A',4],
              [0, 'off',0],
              
              [0, 'G',2],
              [0, 'off',0],
              [0, 'F',2],
              [0, 'off',0],
              [0, 'E',2],
              [0, 'off',0],
              [0, 'D',2],
              [0, 'off',0],
              [0, 'C',4],
              [0, 'off',0],
              [0, 'C',4],
              [0, 'off',4],
              ]   

music = music_boci
#music = music_test
#music = music_octave

tape = []

for step in music:
    soundstep = [0, 0, 0, step[2], 'off']
    for sound in sounds:
        if (sound[0][0] == step[0] and sound[0][1] == step[1]):
            soundstep = [sound[1][0], sound[1][1], sound[1][2], step[2]]
    tape.append(soundstep)

tapefile = open('music.e', 'w')

tapefile.write('library music;\n\n')
tapefile.write('use e.platform;\n')
tapefile.write('use microchip.pic16.enchanced;\n')
tapefile.write('use pic16.bankselect;\n')

tapefile.write('\nconst uint8 length = %(len)d;\n' % {'len' : len(tape)})

tapefile.write('\ntable_PR(uint8 index){\n')
tapefile.write('\tSELECTB(&index);\n\tMOVF(&index,W);\n\tCALL(dat);\n\tGOTO(end);\n\tlabel dat;\n\tBRW();\n');
for d in tape:
    tapefile.write('\tRETLW(0x%(v)X);\n' % {'v' : d[0]})
tapefile.write('\tlabel end;\n\tSELECTB(&result);\n\tMOVWF(&result);\n')
tapefile.write('}returns uint8 result;\n')

tapefile.write('\ntable_TCON(uint8 index){\n')
tapefile.write('\tSELECTB(&index);\n\tMOVF(&index,W);\n\tCALL(dat);\n\tGOTO(end);\n\tlabel dat;\n\tBRW();\n');
for d in tape:
    value = 0
    if len(d) == 4:
        pre = math.log(d[1],4)
        post = d[2]-1
        value = pre + 4 + (post*8)
    tapefile.write('\tRETLW(0x%(v)X);\n' % {'v' : value})
tapefile.write('\tlabel end;\n\tSELECTB(&result);\n\tMOVWF(&result);\n')
tapefile.write('}returns uint8 result;\n')

tapefile.write('\ntable_counter(uint8 index){\n')
tapefile.write('\tSELECTB(&index);\n\tMOVF(&index,W);\n\tCALL(dat);\n\tGOTO(end);\n\tlabel dat;\n\tBRW();\n');
for d in tape:
    tapefile.write('\tRETLW(0x%(v)X);\n' % {'v' : d[3]})
tapefile.write('\tlabel end;\n\tSELECTB(&result);\n\tMOVWF(&result);\n')
tapefile.write('}returns uint8 result;\n')

print 'done'