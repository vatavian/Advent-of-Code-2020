# Advent of Code 2020 Day 19 part 1 using Parslet

require 'parslet' 

class ParseMessage < Parslet::Parser

  rule(:r18) { r48 >> r48}
  rule(:r25) { r48 >> r81 | r41 >> r7}
  rule(:r48) { match('b') }
  rule(:r4) { r131 >> r48 | r70 >> r41}
  rule(:r20) { r61 >> r48 | r57 >> r41}
  rule(:r89) { r41 >> r41 | r41 >> r48}
  rule(:r74) { r41 >> r107 | r48 >> r124}
  rule(:r98) { r41 >> r48}
  rule(:r99) { r97 >> r48 | r92 >> r41}
  rule(:r91) { r34 >> r48}
  rule(:r100) { r48 >> r41 | r67 >> r48}
  rule(:r6) { r48 >> r100 | r41 >> r132}
  rule(:r40) { r81 >> r48 | r7 >> r41}
  rule(:r124) { r83 >> r48 | r130 >> r41}
  rule(:r50) { r7 >> r41 | r7 >> r48}
  rule(:r68) { r64 >> r41 | r24 >> r48}
  rule(:r60) { r30 >> r41 | r86 >> r48}
  rule(:r75) { r89 >> r41 | r39 >> r48}
  rule(:r103) { r67 >> r67}
  rule(:r58) { r41 >> r22 | r48 >> r111}
  rule(:r71) { r67 >> r34}
  rule(:r56) { r34 >> r48 | r39 >> r41}
  rule(:r122) { r48 >> r120 | r41 >> r89}
  rule(:r12) { r41 >> r18 | r48 >> r98}
  rule(:r95) { r34 >> r41 | r103 >> r48}
  rule(:r93) { r110 >> r41 | r34 >> r48}
  rule(:r13) { r43 >> r41 | r69 >> r48}
  rule(:r44) { r101 >> r48 | r114 >> r41}
  rule(:r69) { r106 >> r41 | r32 >> r48}
  rule(:r67) { r48 | r41}
  rule(:r45) { r7 >> r48}
  rule(:r117) { r48 >> r120 | r41 >> r39}
  rule(:r46) { r48 >> r29 | r41 >> r82}
  rule(:r121) { r48 >> r49 | r41 >> r47}
  rule(:r130) { r103 >> r48 | r89 >> r41}
  rule(:r132) { r41 >> r48 | r48 >> r41}
  rule(:r94) { r41 >> r4 | r48 >> r76}
  rule(:r14) { r9 >> r48 | r93 >> r41}
  rule(:r26) { r41 >> r72 | r48 >> r81}
  rule(:r79) { r67 >> r1}
  rule(:r115) { r67 >> r132}
  rule(:r15) { r41 >> r20 | r48 >> r63}
  rule(:r47) { r120 >> r41 | r81 >> r48}
  rule(:r27) { r100 >> r41 | r7 >> r48}
  rule(:r11) { r42 >> r31}
  rule(:r113) { r49 >> r41 | r56 >> r48}
  rule(:r31) { r48 >> r133 | r41 >> r127}
  rule(:r131) { r90 >> r41 | r28 >> r48}
  rule(:r81) { r48 >> r48 | r67 >> r41}
  rule(:r23) { r84 >> r41 | r27 >> r48}
  rule(:r84) { r18 >> r48}
  rule(:r107) { r79 >> r41 | r33 >> r48}
  rule(:r83) { r67 >> r89}
  rule(:r49) { r81 >> r41 | r7 >> r48}
  rule(:r108) { r102 >> r41 | r60 >> r48}
  rule(:r37) { r41 >> r7 | r48 >> r120}
  rule(:r120) { r48 >> r41}
  rule(:r32) { r41 >> r96 | r48 >> r95}
  rule(:r2) { r48 >> r85 | r41 >> r128}
  rule(:r102) { r48 >> r62 | r41 >> r50}
  rule(:r5) { r41 >> r110}
  rule(:r61) { r41 >> r37 | r48 >> r6}
  rule(:r97) { r41 >> r120 | r48 >> r34}
  rule(:r85) { r120 >> r41 | r89 >> r48}
  rule(:r80) { r120 >> r48 | r98 >> r41}
  rule(:r92) { r48 >> r103 | r41 >> r34}
  rule(:r65) { r16 >> r48 | r58 >> r41}
  rule(:r112) { r48 >> r71 | r41 >> r123}
  rule(:r70) { r87 >> r48 | r115 >> r41}
  rule(:r39) { r41 >> r67 | r48 >> r41}
  rule(:r41) { match('a') }
  rule(:r38) { r2 >> r48 | r77 >> r41}
  rule(:r110) { r48 >> r41 | r41 >> r41}
  rule(:r88) { r7 >> r48 | r89 >> r41}
  rule(:r52) { r41 >> r73 | r48 >> r104}
  rule(:r96) { r100 >> r48 | r103 >> r41}
  rule(:r66) { r41 >> r126 | r48 >> r121}
  rule(:r77) { r40 >> r48 | r47 >> r41}
  rule(:r3) { r48 >> r118 | r41 >> r25}
  rule(:r126) { r75 >> r48 | r27 >> r41}
  rule(:r1) { r41 >> r41 | r48 >> r48}
  rule(:r19) { r48 >> r72 | r41 >> r18}
  rule(:r42) { r41 >> r68 | r48 >> r105}
  rule(:r129) { r48 >> r110 | r41 >> r120}
  rule(:r72) { r48 >> r48 | r41 >> r67}
  rule(:r7) { r41 >> r41}
  rule(:r59) { r41 >> r47 | r48 >> r125}
  rule(:r73) { r1 >> r48 | r103 >> r41}
  rule(:r114) { r41 >> r117 | r48 >> r73}
  rule(:r118) { r89 >> r41 | r132 >> r48}
  rule(:r51) { r41 >> r1 | r48 >> r81}
  rule(:r101) { r129 >> r48 | r93 >> r41}
  rule(:r133) { r48 >> r15 | r41 >> r13}
  rule(:r104) { r48 >> r1 | r41 >> r81}
  rule(:r123) { r110 >> r48 | r98 >> r41}
  rule(:r0) { r8 >> r11}
  rule(:r55) { r48 >> r1 | r41 >> r18}
  rule(:r30) { r89 >> r41 | r18 >> r48}
  rule(:r76) { r48 >> r14 | r41 >> r35}
  rule(:r43) { r52 >> r48 | r112 >> r41}
  rule(:r24) { r48 >> r109 | r41 >> r38}
  rule(:r29) { r116 >> r48 | r3 >> r41}
  rule(:r106) { r88 >> r41}
  rule(:r9) { r89 >> r41 | r100 >> r48}
  rule(:r125) { r41 >> r120 | r48 >> r132}
  rule(:r22) { r103 >> r48 | r18 >> r41}
  rule(:r21) { r48 >> r83 | r41 >> r51}
  rule(:r64) { r48 >> r44 | r41 >> r74}
  rule(:r111) { r103 >> r67}
  rule(:r54) { r41 >> r36 | r48 >> r55}
  rule(:r119) { r48 >> r12 | r41 >> r19}
  rule(:r35) { r123 >> r48 | r91 >> r41}
  rule(:r127) { r41 >> r94 | r48 >> r10}
  rule(:r116) { r41 >> r93 | r48 >> r122}
  rule(:r8) { r42}
  rule(:r128) { r48 >> r72 | r41 >> r1}
  rule(:r28) { r41 >> r132 | r48 >> r120}
  rule(:r63) { r41 >> r59 | r48 >> r17}
  rule(:r87) { r103 >> r48 | r72 >> r41}
  rule(:r36) { r48 >> r81 | r41 >> r100}
  rule(:r17) { r62 >> r48 | r26 >> r41}
  rule(:r62) { r100 >> r48 | r98 >> r41}
  rule(:r34) { r48 >> r41 | r48 >> r48}
  rule(:r82) { r23 >> r48 | r21 >> r41}
  rule(:r78) { r41 >> r65 | r48 >> r66}
  rule(:r33) { r120 >> r41}
  rule(:r109) { r48 >> r113 | r41 >> r99}
  rule(:r57) { r41 >> r92 | r48 >> r80}
  rule(:r86) { r48 >> r89 | r41 >> r39}
  rule(:r53) { r54 >> r48 | r119 >> r41}
  rule(:r10) { r108 >> r48 | r53 >> r41}
  rule(:r90) { r81 >> r41 | r34 >> r48}
  rule(:r16) { r48 >> r5 | r41 >> r45}
  rule(:r105) { r46 >> r41 | r78 >> r48}

  root(:r0)
end

parser = nil
reading_rules = true
rule0all_possible = nil
match0 = 0
input_number = 1
IO.readlines('19-input.txt', chomp: true).each do |line|
  if line.length == 0
    reading_rules = false 
    input_number = 1
    parser = ParseMessage.new
  elsif reading_rules
    rule_num, rule_txt = line.split(': ')
    prule = "  rule(:r#{rule_num}) { "
    
    if rule_txt[0] == '"'
      prule += "match('#{rule_txt[1]}') }"
    else
      pors = []
      rule_txt.split('|').each do |group|
        pors.append group.split(' ').map {|s| 'r' + s}.join(' >> ')
      end
      prule += pors.join(' | ') + '}'
    end
    puts prule
  else # reading messages
    begin
      parser.parse(line)
      match0 += 1
    rescue Parslet::ParseFailed => failure
      #p "#{input_number}: #{line} does not match rule 0"
      #puts failure.parse_failure_cause.ascii_tree
    end
    input_number += 1
  end
end

p "Found #{match0} input values matching rule 0."
# 57 is not the right answer.
# 454 is too high.