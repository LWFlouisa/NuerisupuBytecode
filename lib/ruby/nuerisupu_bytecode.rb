# psa pse psi pso psu
# sda sde sdi sdo sdu

module Obelisk
  class Cerberus
    def self.cpp(fake_percent) # convert_from_piano_to_percent
      # if number is 0.eaaaaf, convert to real percent
      real_percent = fake_percent.tr ".cdefgab", ".0123456"
      real_percent = real_percent.to_f
  
      real_percent
    end

    ## Closer to the original intent, where each head represents unfalsifiable probability.
    def self.cpo(a, b, c, d) # cerberus_piano
      first_value  = cpp(a) # a.tr ".cdefgab", ".0123456"  #.to_f
      second_value = cpp(b) # b.tr ".cdefgab", ".0123456" #.to_f
      third_value  = cpp(c) # c.tr ".cdefgab", ".0123456"  #.to_f
  
      new_first  = ( 1 / first_value ) ** d
      new_second = ( 1 / second_value ) ** d
      new_third  = ( 1 / third_value ) ** d

      "#{a}, #{b}, #{c} is processed in parallel."

      [ first_value, second_value, third_value ]

      File.open("scripts/obelisk/cerberus_data.awa", "a") { |f|
        f.puts "cpo #{a} #{b} #{c}"
      }
    end

    ## This handles coverted probabilities.
    def self.cbs(a, b, c, d) # cerberus
      first_value  = ( 1 / a ) ** d
      second_value = ( 1 / b ) ** d
      third_value  = ( 1 / c ) ** d

      "#{a}, #{b}, #{c} is processed in parallel."
    
      [ first_value, second_value, third_value ]
    end
  end

  class Language
    def self.generate_phrase
      word_classes = [[
        [
          [["Le",  "Le"], ["Le",  "La"], ["Le",  "Les"]],
          [["La",  "Le"], ["La",  "La"], ["La",  "Les"]],
          [["Les", "Le"], ["Les", "La"], ["Les", "Les"]],
        ], [
          [["Anu",  "Anu"], ["Anu",  "Ana"], ["Anu",  "Anos"]],
          [["Ana",  "Anu"], ["Ana",  "Ana"], ["Ana",  "Anos"]],
          [["Anos", "Anu"], ["Anos", "Ana"], ["Anos", "Anus"]],
        ], [
          [["Lanu",  "Lanu"], ["Lanu",  "Lana"], ["Lanu",  "Lanos"]],
          [["Lana",  "Lanu"], ["Lana",  "Lana"], ["Lana",  "Lanos"]],
          [["Lanos", "Lanu"], ["Lanos", "Lana"], ["Lanos", "Lanos"]],
        ],
      ], [
        [
          [["El",  "El"], ["El",  "Al"], ["El",  "Els"]],
          [["Al",  "El"], ["Al",  "Al"], ["Al",  "Els"]],
          [["Els", "El"], ["Els", "Al"], ["Els", "Els"]],
        ], [
          [["Nua",  "Naa"], ["Nua",  "Naa"], ["Nua",  "Nosa"]],
          [["Naa",  "Naa"], ["Naa",  "Naa"], ["Naa",  "Nosa"]],
          [["Nosa", "Naa"], ["Nosa", "Naa"], ["Nosa", "Nosa"]],
        ], [
          [["Nula",  "Nula"], ["Nula",  "Nala"], ["Nula",  "Nosal"]],
          [["Nala",  "Nula"], ["Nala",  "Nala"], ["Nala",  "Nosal"]],
          [["Nosal", "Nula"], ["Nosal", "Nala"], ["Nosal", "Nosal"]],
        ],
      ]]

      context_window = [0, 1, 2]
      row_options    = [0, 1, 2]
      col_options    = [0, 1, 2]
      arr_options    = [0, 1]

      # Modifies word genders based on sanity state.
      current_sanity  = File.read("data/npc/dialogue/sanity.txt").to_i

      cur_con = context_window.sample
      cur_row =    row_options.sample
      cur_col =    col_options.sample
      cur_arr =    arr_options.sample

      chosen_word_class = word_classes[current_sanity][cur_con][cur_row][cur_col][cur_arr]

      ## This covers the generation of classified nouns.
      ho   = ["homme",        "ommehay"]
      fe   = ["femme",        "emmefay"]
      fi   = ["fille",        "illefay"]
      ga   = ["garcon",       "arcongay"]
      ta   = ["tante",        "antetay"]
      oj   = ["oncle",        "cleoney"]
      cofi = ["cousinfille",  "ousincay illefay"]
      coga = ["cousingarcon", "ousincay arcongay"]
      grm  = [ "grandmere",   "randgay eremay"]
      grp  = [ "grandpere",   "randgay erepay"]

      ct   = [    "chat",      "atchay"]
      ch   = [   "chien",     "ienchay"]
      oi   = [  "oiseau",    "seauoiay"]
      gr   = [  "souris",     "ourisay"]
      ou   = [    "ours",      "ursoay"]
      wo   = [ "orgueil",   "gueiloray"]
      pr   = ["ostritch", "ritchostray"]
      po   = [  "jiraff",    "iraffjay"]
      pi   = ["écureuil",  "ureuilecay"]

      m    = ["maison", "aisonmay"]
      c    = [ "cabin",  "abincay"]
      e    = [ "ecole",   "coleay"]

      oju  = [   "ojijaku",    "jijakuoay"]
      neo  = ["ne ojijaku", "ne jijakuoay"]

      nouns_sanity = [[
        [[ho[0],   ho[0]], [ho[0],   fe[0]], [ho[0],   fi[0]], [ho[0],   ga[0]], [ho[0],   ta[0]], [ho[0],   oj[0]], [ho[0],   cofi[0]], [ho[0],   coga[0]], [ho[0],   grm[0]], [ho[0],   grp[0]]],
        [[fe[0],   ho[0]], [fe[0],   fe[0]], [fe[0],   fi[0]], [fe[0],   ga[0]], [fe[0],   ta[0]], [fe[0],   oj[0]], [fe[0],   cofi[0]], [fe[0],   coga[0]], [fe[0],   grm[0]], [fe[0],   grp[0]]],
        [[fi[0],   ho[0]], [fi[0],   fe[0]], [fi[0],   fi[0]], [fi[0],   ga[0]], [fi[0],   ta[0]], [fi[0],   oj[0]], [fi[0],   cofi[0]], [fi[0],   coga[0]], [fi[0],   grm[0]], [fi[0],   grp[0]]],
        [[ga[0],   ho[0]], [ga[0],   fe[0]], [ga[0],   fi[0]], [ga[0],   ga[0]], [ga[0],   ta[0]], [ga[0],   oj[0]], [ga[0],   cofi[0]], [ga[0],   coga[0]], [ga[0],   grm[0]], [ga[0],   grp[0]]],
        [[ta[0],   ho[0]], [ta[0],   fe[0]], [ta[0],   fi[0]], [ta[0],   ga[0]], [ta[0],   ta[0]], [ta[0],   oj[0]], [ta[0],   cofi[0]], [ta[0],   coga[0]], [ta[0],   grm[0]], [ta[0],   grp[0]]],
        [[oj[0],   ho[0]], [oj[0],   fe[0]], [oj[0],   fi[0]], [oj[0],   ga[0]], [oj[0],   ta[0]], [oj[0],   oj[0]], [oj[0],   cofi[0]], [oj[0],   coga[0]], [oj[0],   grm[0]], [oj[0],   grp[0]]],
        [[cofi[0], ho[0]], [cofi[0], fe[0]], [cofi[0], fi[0]], [cofi[0], ga[0]], [cofi[0], ta[0]], [cofi[0], oj[0]], [cofi[0], cofi[0]], [cofi[0], coga[0]], [cofi[0], grm[0]], [cofi[0], grp[0]]],
        [[coga[0], ho[0]], [coga[0], fe[0]], [coga[0], fi[0]], [coga[0], ga[0]], [coga[0], ta[0]], [coga[0], oj[0]], [coga[0], cofi[0]], [coga[0], coga[0]], [coga[0], grm[0]], [coga[0], grp[0]]],
        [[grm[0],  ho[0]], [grm[0],  fe[0]], [grm[0],  fi[0]], [grm[0],  ga[0]], [grm[0],  ta[0]], [grm[0],  oj[0]], [grm[0],  cofi[0]], [grm[0],  coga[0]], [grm[0],  grm[0]], [grm[0],  grp[0]]],
        [[grp[0],  ho[0]], [grp[0],  fe[0]], [grp[0],  fi[0]], [grp[0],  ga[0]], [grp[0],  ta[0]], [grp[0],  oj[0]], [grp[0],  cofi[0]], [grp[0],  coga[0]], [grp[0],  grm[0]], [grp[0],  grp[0]]],
      ], [
        [[ct[0], ct[0]], [ct[0], ch[0]], [ct[0], oi[0]], [ct[0], gr[0]], [ct[0], wo[0]], [ct[0], ou[0]], [ct[0], pr[0]], [ct[0], po[0]]],
        [[ch[0], ct[0]], [ch[0], ch[0]], [ch[0], oi[0]], [ch[0], gr[0]], [ch[0], wo[0]], [ch[0], ou[0]], [ch[0], pr[0]], [ch[0], po[0]]],
        [[oi[0], ct[0]], [oi[0], ch[0]], [oi[0], oi[0]], [pi[0], gr[0]], [oi[0], wo[0]], [oi[0], ou[0]], [oi[0], pr[0]], [oi[0], po[0]]],
        [[gr[0], ct[0]], [gr[0], ch[0]], [gr[0], oi[0]], [gr[0], gr[0]], [gr[0], wo[0]], [gr[0], ou[0]], [gr[0], pr[0]], [gr[0], po[0]]],
      ], [
        [[m[0], m[0]], [m[0], c[0]], [m[0], e[0]]],
        [[c[0], m[0]], [c[0], c[0]], [c[0], e[0]]],
        [[e[0], m[0]], [e[0], c[0]], [e[0], e[0]]],
      ], [
        [[oju[0], oju[0]], [oju[0], neo[0]]],
        [[neo[0], oju[0]], [neo[0], neo[0]]],
      ]]

      nouns_insanity = [[
        [[ho[1],   ho[1]], [ho[1],   fe[1]], [ho[1],   fi[1]], [ho[1],   ga[1]], [ho[1],   ta[1]], [ho[1],   oj[1]], [ho[1],   cofi[1]], [ho[1],   coga[1]], [ho[1],   grm[1]], [ho[1],   grp[1]]],
        [[fe[1],   ho[1]], [fe[1],   fe[1]], [fe[1],   fi[1]], [fe[1],   ga[1]], [fe[1],   ta[1]], [fe[1],   oj[1]], [fe[1],   cofi[1]], [fe[1],   coga[1]], [fe[1],   grm[1]], [fe[1],   grp[1]]],
        [[fi[1],   ho[1]], [fi[1],   fe[1]], [fi[1],   fi[1]], [fi[1],   ga[1]], [fi[1],   ta[1]], [fi[1],   oj[1]], [fi[1],   cofi[1]], [fi[1],   coga[1]], [fi[1],   grm[1]], [fi[1],   grp[1]]],
        [[ga[1],   ho[1]], [ga[1],   fe[1]], [ga[1],   fi[1]], [ga[1],   ga[1]], [ga[1],   ta[1]], [ga[1],   oj[1]], [ga[1],   cofi[1]], [ga[1],   coga[1]], [ga[1],   grm[1]], [ga[1],   grp[1]]],
        [[ta[1],   ho[1]], [ta[1],   fe[1]], [ta[1],   fi[1]], [ta[1],   ga[1]], [ta[1],   ta[1]], [ta[1],   oj[1]], [ta[1],   cofi[1]], [ta[1],   coga[1]], [ta[1],   grm[1]], [ta[1],   grp[1]]],
        [[oj[1],   ho[1]], [oj[1],   fe[1]], [oj[1],   fi[1]], [oj[1],   ga[1]], [oj[1],   ta[1]], [oj[1],   oj[1]], [oj[1],   cofi[1]], [oj[1],   coga[1]], [oj[1],   grm[1]], [oj[1],   grp[1]]],
        [[cofi[1], ho[1]], [cofi[1], fe[1]], [cofi[1], fi[1]], [cofi[1], ga[1]], [cofi[1], ta[1]], [cofi[1], oj[1]], [cofi[1], cofi[1]], [cofi[1], coga[1]], [cofi[1], grm[1]], [cofi[1], grp[1]]],
        [[coga[1], ho[1]], [coga[1], fe[1]], [coga[1], fi[1]], [coga[1], ga[1]], [coga[1], ta[1]], [coga[1], oj[1]], [coga[1], cofi[1]], [coga[1], coga[1]], [coga[1], grm[1]], [coga[1], grp[1]]],
        [[grm[1],  ho[1]], [grm[1],  fe[1]], [grm[1],  fi[1]], [grm[1],  ga[1]], [grm[1],  ta[1]], [grm[1],  oj[1]], [grm[1],  cofi[1]], [grm[1],  coga[1]], [grm[1],  grm[1]], [grm[1],  grp[1]]],
        [[grp[1],  ho[1]], [grp[1],  fe[1]], [grp[1],  fi[1]], [grp[1],  ga[1]], [grp[1],  ta[1]], [grp[1],  oj[1]], [grp[1],  cofi[1]], [grp[1],  coga[1]], [grp[1],  grm[1]], [grp[1],  grp[1]]],
      ], [
        [[ct[1], ct[1]], [ct[1], ch[1]], [ct[1], oi[1]], [ct[1], gr[1]], [ct[1], wo[1]], [ct[1], ou[1]], [ct[1], pr[1]], [ct[1], po[1]]],
        [[ch[1], ct[1]], [ch[1], ch[1]], [ch[1], oi[1]], [ch[1], gr[1]], [ch[1], wo[1]], [ch[1], ou[1]], [ch[1], pr[1]], [ch[1], po[1]]],
        [[oi[1], ct[1]], [oi[1], ch[1]], [oi[1], oi[1]], [pi[1], gr[1]], [oi[1], wo[1]], [oi[1], ou[1]], [oi[1], pr[1]], [oi[1], po[1]]],
        [[gr[1], ct[1]], [gr[1], ch[1]], [gr[1], oi[1]], [gr[1], gr[1]], [gr[1], wo[1]], [gr[1], ou[1]], [gr[1], pr[1]], [gr[1], po[1]]],
      ], [
        [[m[1], m[1]], [m[1], c[1]], [m[1], e[1]]],
        [[c[1], m[1]], [c[1], c[1]], [c[1], e[1]]],
        [[e[1], m[1]], [e[1], c[1]], [e[1], e[1]]],
      ], [
        [[oju[1], oju[1]], [oju[1], neo[1]]],
        [[neo[1], oju[1]], [neo[1], neo[1]]],
      ]]

      nouns       = [nouns_sanity, nouns_insanity]
      current_sanity  = File.read("_data/npc/dialogue/sanity.txt").to_i # sanity_context.sample

      context_window = [0, 1, 2, 3]
      cur_con    = context_window.sample

      if    cur_con == 0
        row_options    = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        col_options    = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        arr_options    = [0, 1]

        #cur_con = context_window.sample
        cur_row =    row_options.sample
        cur_col =    col_options.sample
        cur_arr =    arr_options.sample

        chosen_noun = nouns[current_sanity][cur_con][cur_row][cur_col][cur_arr]  
      elsif cur_con == 1
        row_options    = [0, 1, 2, 3]
        col_options    = [0, 1, 2, 3]
        arr_options    = [0, 1]

        #cur_con = context_window.sample
        cur_row =    row_options.sample
        cur_col =    col_options.sample
        cur_arr =    arr_options.sample

        chosen_noun = nouns[current_sanity][cur_con][cur_row][cur_col][cur_arr]
      elsif cur_con == 2
        row_options    = [0, 1, 2]
        col_options    = [0, 1, 2]
        arr_options    = [0, 1]

        # Modifies word genders based on sanity state.
        #cur_san = 0

        #cur_con = context_window.sample
        cur_row =    row_options.sample
        cur_col =    col_options.sample
        cur_arr =    arr_options.sample

        chosen_noun = nouns[current_sanity][cur_con][cur_row][cur_col][cur_arr]
      elsif cur_con == 3
        row_options    = [0, 1]
        col_options    = [0, 1]
        arr_options    = [0, 1]

        #cur_con = context_window.sample
        cur_row =    row_options.sample
        cur_col =    col_options.sample
        cur_arr =    arr_options.sample

        chosen_noun = nouns[current_sanity][cur_con][cur_row][cur_col][cur_arr]
      end

      ## This covers the adjectives that follows the nouns.
      t  = ["tsin",            "sintway"] # Possibly an ox
      p  = ["petite",         "etitepay"]
      s1 = ["sucré",           "ucrepay"]
      r  = ["roudy",           "oudyray"]
      l  = ["l'éducation", "ducationley"]
      s2 = ["sages",            "agesay"]

      adjectives_sanity = [[
        [[t[0],  t[0]], [t[0],  p[0]], [t[0],  s1[0]], [t[0],  r[0]], [t[0],  l[0]], [t[0],  s2[0]]],
        [[p[0],  t[0]], [p[0],  p[0]], [p[0],  s1[0]], [p[0],  r[0]], [p[0],  l[0]], [p[0],  s2[0]]],
        [[s1[0], t[0]], [s1[0], p[0]], [s1[0], s1[0]], [s1[0], r[0]], [s1[0], l[0]], [s1[0], s2[0]]],
        [[r[0],  t[0]], [r[0],  p[0]], [r[0],  s1[0]], [r[0],  r[0]], [r[0],  l[0]], [r[0],  s2[0]]],
        [[l[0],  t[0]], [l[0],  p[0]], [l[0],  s1[0]], [l[0],  r[0]], [l[0],  l[0]], [l[0],  s2[0]]],
        [[s2[0], t[0]], [s2[0], p[0]], [s2[0], s1[0]], [s2[0], r[0]], [s2[0], l[0]], [s2[0], s2[0]]],
      ], [
        [[p[0],  t[0]], [p[0],  p[0]], [p[0],  s1[0]], [p[0],  r[0]], [p[0],  l[0]], [p[0],  s2[0]]],
        [[s1[0], t[0]], [s1[0], p[0]], [s1[0], s1[0]], [s1[0], r[0]], [s1[0], l[0]], [s1[0], s2[0]]],
        [[r[0],  t[0]], [r[0],  p[0]], [r[0],  s1[0]], [r[0],  r[0]], [r[0],  l[0]], [r[0],  s2[0]]],
        [[l[0],  t[0]], [l[0],  p[0]], [l[0],  s1[0]], [l[0],  r[0]], [l[0],  l[0]], [l[0],  s2[0]]],
        [[s2[0], t[0]], [s2[0], p[0]], [s2[0], s1[0]], [s2[0], r[0]], [s2[0], l[0]], [s2[0], s2[0]]],
        [[t[0],  t[0]], [t[0],  p[0]], [t[0],  s1[0]], [t[0],  r[0]], [t[0],  l[0]], [t[0],  s2[0]]],
      ], [
        [[s1[0], t[0]], [s1[0], p[0]], [s1[0], s1[0]], [s1[0], r[0]], [s1[0], l[0]], [s1[0], s2[0]]],
        [[r[0],  t[0]], [r[0],  p[0]], [r[0],  s1[0]], [r[0],  r[0]], [r[0],  l[0]], [r[0],  s2[0]]],
        [[l[0],  t[0]], [l[0],  p[0]], [l[0],  s1[0]], [l[0],  r[0]], [l[0],  l[0]], [l[0],  s2[0]]],
        [[s2[0], t[0]], [s2[0], p[0]], [s2[0], s1[0]], [s2[0], r[0]], [s2[0], l[0]], [s2[0], s2[0]]],
        [[t[0],  t[0]], [t[0],  p[0]], [t[0],  s1[0]], [t[0],  r[0]], [t[0],  l[0]], [t[0],  s2[0]]],
        [[p[0],  t[0]], [p[0],  p[0]], [p[0],  s1[0]], [p[0],  r[0]], [p[0],  l[0]], [p[0],  s2[0]]],
      ], [
        [[r[0],  t[0]], [r[0],  p[0]], [r[0],  s1[0]], [r[0],  r[0]], [r[0],  l[0]], [r[0],  s2[0]]],
        [[l[0],  t[0]], [l[0],  p[0]], [l[0],  s1[0]], [l[0],  r[0]], [l[0],  l[0]], [l[0],  s2[0]]],
        [[s2[0], t[0]], [s2[0], p[0]], [s2[0], s1[0]], [s2[0], r[0]], [s2[0], l[0]], [s2[0], s2[0]]],
        [[t[0],  t[0]], [t[0],  p[0]], [t[0],  s1[0]], [t[0],  r[0]], [t[0],  l[0]], [t[0],  s2[0]]],
        [[p[0],  t[0]], [p[0],  p[0]], [p[0],  s1[0]], [p[0],  r[0]], [p[0],  l[0]], [p[0],  s2[0]]],
        [[s1[0], t[0]], [s1[0], p[0]], [s1[0], s1[0]], [s1[0], r[0]], [s1[0], l[0]], [s1[0], s2[0]]],
      ], [
        [[l[0],  t[0]], [l[0],  p[0]], [l[0],  s1[0]], [l[0],  r[0]], [l[0],  l[0]], [l[0],  s2[0]]],
        [[s2[0], t[0]], [s2[0], p[0]], [s2[0], s1[0]], [s2[0], r[0]], [s2[0], l[0]], [s2[0], s2[0]]],
        [[t[0],  t[0]], [t[0],  p[0]], [t[0],  s1[0]], [t[0],  r[0]], [t[0],  l[0]], [t[0],  s2[0]]],
        [[p[0],  t[0]], [p[0],  p[0]], [p[0],  s1[0]], [p[0],  r[0]], [p[0],  l[0]], [p[0],  s2[0]]],
        [[s1[0], t[0]], [s1[0], p[0]], [s1[0], s1[0]], [s1[0], r[0]], [s1[0], l[0]], [s1[0], s2[0]]],
        [[r[0],  t[0]], [r[0],  p[0]], [r[0],  s1[0]], [r[0],  r[0]], [r[0],  l[0]], [r[0],  s2[0]]],
      ], [
        [[s2[0], t[0]], [s2[0], p[0]], [s2[0], s1[0]], [s2[0], r[0]], [s2[0], l[0]], [s2[0], s2[0]]],
        [[t[0],  t[0]], [t[0],  p[0]], [t[0],  s1[0]], [t[0],  r[0]], [t[0],  l[0]], [t[0],  s2[0]]],
        [[p[0],  t[0]], [p[0],  p[0]], [p[0],  s1[0]], [p[0],  r[0]], [p[0],  l[0]], [p[0],  s2[0]]],
        [[s1[0], t[0]], [s1[0], p[0]], [s1[0], s1[0]], [s1[0], r[0]], [s1[0], l[0]], [s1[0], s2[0]]],
        [[r[0],  t[0]], [r[0],  p[0]], [r[0],  s1[0]], [r[0],  r[0]], [r[0],  l[0]], [r[0],  s2[0]]],
        [[l[0],  t[0]], [l[0],  p[0]], [l[0],  s1[0]], [l[0],  r[0]], [l[0],  l[0]], [l[0],  s2[0]]],
      ]]

      adjectives_insanity = [[
        [[t[1],  t[1]], [t[1],  p[1]], [t[1],  s1[1]], [t[1],  r[1]], [t[1],  l[1]], [t[1],  s2[1]]],
        [[p[1],  t[1]], [p[1],  p[1]], [p[1],  s1[1]], [p[1],  r[1]], [p[1],  l[1]], [p[1],  s2[1]]],
        [[s1[1], t[1]], [s1[1], p[1]], [s1[1], s1[1]], [s1[1], r[1]], [s1[1], l[1]], [s1[1], s2[1]]],
        [[r[1],  t[1]], [r[1],  p[1]], [r[1],  s1[1]], [r[1],  r[1]], [r[1],  l[1]], [r[1],  s2[1]]],
        [[l[1],  t[1]], [l[1],  p[1]], [l[1],  s1[1]], [l[1],  r[1]], [l[1],  l[1]], [l[1],  s2[1]]],
        [[s2[1], t[1]], [s2[1], p[1]], [s2[1], s1[1]], [s2[1], r[1]], [s2[1], l[1]], [s2[1], s2[1]]],
      ], [
        [[p[1],  t[1]], [p[1],  p[1]], [p[1],  s1[1]], [p[1],  r[1]], [p[1],  l[1]], [p[1],  s2[1]]],
        [[s1[1], t[1]], [s1[1], p[1]], [s1[1], s1[1]], [s1[1], r[1]], [s1[1], l[1]], [s1[1], s2[1]]],
        [[r[1],  t[1]], [r[1],  p[1]], [r[1],  s1[1]], [r[1],  r[1]], [r[1],  l[1]], [r[1],  s2[1]]],
        [[l[1],  t[1]], [l[1],  p[1]], [l[1],  s1[1]], [l[1],  r[1]], [l[1],  l[1]], [l[1],  s2[1]]],
        [[s2[1], t[1]], [s2[1], p[1]], [s2[1], s1[1]], [s2[1], r[1]], [s2[1], l[1]], [s2[1], s2[1]]],
        [[t[1],  t[1]], [t[1],  p[1]], [t[1],  s1[1]], [t[1],  r[1]], [t[1],  l[1]], [t[1],  s2[1]]],
      ], [
        [[s1[1], t[1]], [s1[1], p[1]], [s1[1], s1[1]], [s1[1], r[1]], [s1[1], l[1]], [s1[1], s2[1]]],
        [[r[1],  t[1]], [r[1],  p[1]], [r[1],  s1[1]], [r[1],  r[1]], [r[1],  l[1]], [r[1],  s2[1]]],
        [[l[1],  t[1]], [l[1],  p[1]], [l[1],  s1[1]], [l[1],  r[1]], [l[1],  l[1]], [l[1],  s2[1]]],
        [[s2[1], t[1]], [s2[1], p[1]], [s2[1], s1[1]], [s2[1], r[1]], [s2[1], l[1]], [s2[1], s2[1]]],
        [[t[1],  t[1]], [t[1],  p[1]], [t[1],  s1[1]], [t[1],  r[1]], [t[1],  l[1]], [t[1],  s2[1]]],
        [[p[1],  t[1]], [p[1],  p[1]], [p[1],  s1[1]], [p[1],  r[1]], [p[1],  l[1]], [p[1],  s2[1]]],
      ], [
        [[r[1],  t[1]], [r[1],  p[1]], [r[1],  s1[1]], [r[1],  r[1]], [r[1],  l[1]], [r[1],  s2[1]]],
        [[l[1],  t[1]], [l[1],  p[1]], [l[1],  s1[1]], [l[1],  r[1]], [l[1],  l[1]], [l[1],  s2[1]]],
        [[s2[1], t[1]], [s2[1], p[1]], [s2[1], s1[1]], [s2[1], r[1]], [s2[1], l[1]], [s2[1], s2[1]]],
        [[t[1],  t[1]], [t[1],  p[1]], [t[1],  s1[1]], [t[1],  r[1]], [t[1],  l[1]], [t[1],  s2[1]]],
        [[p[1],  t[1]], [p[1],  p[1]], [p[1],  s1[1]], [p[1],  r[1]], [p[1],  l[1]], [p[1],  s2[1]]],
        [[s1[1], t[1]], [s1[1], p[1]], [s1[1], s1[1]], [s1[1], r[1]], [s1[1], l[1]], [s1[1], s2[1]]],
      ], [
        [[l[1],  t[1]], [l[1],  p[1]], [l[1],  s1[1]], [l[1],  r[1]], [l[1],  l[1]], [l[1],  s2[1]]],
        [[s2[1], t[1]], [s2[1], p[1]], [s2[1], s1[1]], [s2[1], r[1]], [s2[1], l[1]], [s2[1], s2[1]]],
        [[t[1],  t[1]], [t[1],  p[1]], [t[1],  s1[1]], [t[1],  r[1]], [t[1],  l[1]], [t[1],  s2[1]]],
        [[p[1],  t[1]], [p[1],  p[1]], [p[1],  s1[1]], [p[1],  r[1]], [p[1],  l[1]], [p[1],  s2[1]]],
        [[s1[1], t[1]], [s1[1], p[1]], [s1[1], s1[1]], [s1[1], r[1]], [s1[1], l[1]], [s1[1], s2[1]]],
        [[r[1],  t[1]], [r[1],  p[1]], [r[1],  s1[1]], [r[1],  r[1]], [r[1],  l[1]], [r[1],  s2[1]]],
      ], [
        [[s2[1], t[1]], [s2[1], p[1]], [s2[1], s1[1]], [s2[1], r[1]], [s2[1], l[1]], [s2[1], s2[1]]],
        [[t[1],  t[1]], [t[1],  p[1]], [t[1],  s1[1]], [t[1],  r[1]], [t[1],  l[1]], [t[1],  s2[1]]],
        [[p[1],  t[1]], [p[1],  p[1]], [p[1],  s1[1]], [p[1],  r[1]], [p[1],  l[1]], [p[1],  s2[1]]],
        [[s1[1], t[1]], [s1[1], p[1]], [s1[1], s1[1]], [s1[1], r[1]], [s1[1], l[1]], [s1[1], s2[1]]],
        [[r[1],  t[1]], [r[1],  p[1]], [r[1],  s1[1]], [r[1],  r[1]], [r[1],  l[1]], [r[1],  s2[1]]],
        [[l[1],  t[1]], [l[1],  p[1]], [l[1],  s1[1]], [l[1],  r[1]], [l[1],  l[1]], [l[1],  s2[1]]],
      ]]

      adjectives = [ adjectives_sanity, adjectives_insanity ]

      context_window = [0, 1, 2, 3, 4, 5]

      row_options    = [0, 1, 2, 3, 4, 5]
      col_options    = [0, 1, 2, 3, 4, 5]
      arr_options    = [0, 1]

      # Modifies word genders based on sanity state.
      current_sanity  = File.read("_data/npc/dialogue/sanity.txt").to_i # sanity_context.sample

      cur_con = context_window.sample
      cur_row =    row_options.sample
      cur_col =    col_options.sample
      cur_arr =    arr_options.sample

      chosen_adjective = adjectives[current_sanity][cur_con][cur_row][cur_col][cur_arr].strip

      subjects = [[
        [["es",    "es"], ["es",    "es ne"]],
        [["es ne", "es"], ["es ne", "es ne"]],
      ], [
        [["es",    "es"], ["es",    "es ne"]],
        [["es ne", "es"], ["es ne", "es ne"]],
      ]]
  
      context_window = [0, 1]

      row_options    = [0, 1]
      col_options    = [0, 1]
      arr_options    = [0, 1]

      cur_con = context_window.sample
      cur_row =    row_options.sample
      cur_col =    col_options.sample
      cur_arr =    arr_options.sample

      chosen_subject = subjects[cur_con][cur_row][cur_col][cur_arr]

      ## This covers the verbs that come before the adverbs.
      avo = ["avoir",        "voiray"]
      cou = ["coupe",       "oupecay"]
      ser = ["serrure",       "erruresay"]
      dev = ["deverrouillage", "everrouillageday"]

      verbs_sanity = [[
        [[avo[0], avo[0]], [avo[0], cou[0]], [avo[0], ser[0]], [avo[0], dev[0]]],
        [[cou[0], avo[0]], [cou[0], cou[0]], [cou[0], ser[0]], [cou[0], dev[0]]],
        [[ser[0], avo[0]], [ser[0], cou[0]], [ser[0], ser[0]], [ser[0], dev[0]]],
        [[dev[0], avo[0]], [dev[0], cou[0]], [dev[0], ser[0]], [dev[0], dev[0]]],
      ], [
        [[cou[0], avo[0]], [cou[0], cou[0]], [cou[0], ser[0]], [cou[0], dev[0]]],
        [[ser[0], avo[0]], [ser[0], cou[0]], [ser[0], ser[0]], [ser[0], dev[0]]],
        [[dev[0], avo[0]], [dev[0], cou[0]], [dev[0], ser[0]], [dev[0], dev[0]]],
        [[avo[0], avo[0]], [avo[0], cou[0]], [avo[0], ser[0]], [avo[0], dev[0]]],
      ], [
        [[ser[0], avo[0]], [ser[0], cou[0]], [ser[0], ser[0]], [ser[0], dev[0]]],
        [[dev[0], avo[0]], [dev[0], cou[0]], [dev[0], ser[0]], [dev[0], dev[0]]],
        [[avo[0], avo[0]], [avo[0], cou[0]], [avo[0], ser[0]], [avo[0], dev[0]]],
        [[cou[0], avo[0]], [cou[0], cou[0]], [cou[0], ser[0]], [cou[0], dev[0]]],
      ], [
        [[dev[0], avo[0]], [dev[0], cou[0]], [dev[0], ser[0]], [dev[0], dev[0]]],
        [[avo[0], avo[0]], [avo[0], cou[0]], [avo[0], ser[0]], [avo[0], dev[0]]],
        [[cou[0], avo[0]], [cou[0], cou[0]], [cou[0], ser[0]], [cou[0], dev[0]]],
        [[ser[0], avo[0]], [ser[0], cou[0]], [ser[0], ser[0]], [ser[0], dev[0]]],
      ]]

      verbs_insanity = [[
        [[avo[1], avo[1]], [avo[1], cou[1]], [avo[1], ser[1]], [avo[1], dev[1]]],
        [[cou[1], avo[1]], [cou[1], cou[1]], [cou[1], ser[1]], [cou[1], dev[1]]],
        [[ser[1], avo[1]], [ser[1], cou[1]], [ser[1], ser[1]], [ser[1], dev[1]]],
        [[dev[1], avo[1]], [dev[1], cou[1]], [dev[1], ser[1]], [dev[1], dev[1]]],
      ], [
        [[cou[1], avo[1]], [cou[1], cou[1]], [cou[1], ser[1]], [cou[1], dev[1]]],
        [[ser[1], avo[1]], [ser[1], cou[1]], [ser[1], ser[1]], [ser[1], dev[1]]],
        [[dev[1], avo[1]], [dev[1], cou[1]], [dev[1], ser[1]], [dev[1], dev[1]]],
        [[avo[1], avo[1]], [avo[1], cou[1]], [avo[1], ser[1]], [avo[1], dev[1]]],
      ], [
        [[ser[1], avo[1]], [ser[1], cou[1]], [ser[1], ser[1]], [ser[1], dev[1]]],
        [[dev[1], avo[1]], [dev[1], cou[1]], [dev[1], ser[1]], [dev[1], dev[1]]],
        [[avo[1], avo[1]], [avo[1], cou[1]], [avo[1], ser[1]], [avo[1], dev[1]]],
        [[cou[1], avo[1]], [cou[1], cou[1]], [cou[1], ser[1]], [cou[1], dev[1]]],
      ], [
        [[dev[1], avo[1]], [dev[1], cou[1]], [dev[1], ser[1]], [dev[1], dev[1]]],
        [[avo[1], avo[1]], [avo[1], cou[1]], [avo[1], ser[1]], [avo[1], dev[1]]],
        [[cou[1], avo[1]], [cou[1], cou[1]], [cou[1], ser[1]], [cou[1], dev[1]]],
        [[ser[1], avo[1]], [ser[1], cou[1]], [ser[1], ser[1]], [ser[1], dev[1]]],
      ]]

      verbs = [ verbs_sanity, verbs_insanity]

      # Modifies word genders based on sanity state.
      current_sanity  = File.read("_data/npc/dialogue/sanity.txt").to_i # sanity_context.sample

      context_window = [0, 1, 2, 3]
      row_options    = [0, 1, 2, 3]
      col_options    = [0, 1, 2, 3]
      arr_options    = [0, 1]

      # Modifies word genders based on sanity state.
      cur_san = 0

      cur_con = context_window.sample
      cur_row =    row_options.sample
      cur_col =    col_options.sample
      cur_arr =    arr_options.sample

      chosen_verb = verbs[current_sanity][cur_con][cur_row][cur_col][cur_arr]

      r = ["rapidement.",     "apidementray."]
      l = ["lentement.",    "tementelay."]
      a = ["assurement.",     "surementasay."]
      t = ["tranquillement.", "quillementtranay."]

      adverbs_sanity   = [[
        [[r[0], r[0]], [r[0], l[0]], [r[0], a[0]], [r[0], t[0]]],
        [[l[0], r[0]], [l[0], l[0]], [l[0], a[0]], [l[0], t[0]]],
        [[a[0], r[0]], [a[0], l[0]], [a[0], a[0]], [a[0], t[0]]],
        [[t[0], r[0]], [t[0], l[0]], [t[0], a[0]], [t[0], t[0]]],
      ], [
        [[l[0], r[0]], [l[0], l[0]], [l[0], a[0]], [l[0], t[0]]],
        [[a[0], r[0]], [a[0], l[0]], [a[0], a[0]], [a[0], t[0]]],
        [[t[0], r[0]], [t[0], l[0]], [t[0], a[0]], [t[0], t[0]]],
        [[r[0], r[0]], [r[0], l[0]], [r[0], a[0]], [r[0], t[0]]],
      ], [
        [[a[0], r[0]], [a[0], l[0]], [a[0], a[0]], [a[0], t[0]]],
        [[t[0], r[0]], [t[0], l[0]], [t[0], a[0]], [t[0], t[0]]],
        [[r[0], r[0]], [r[0], l[0]], [r[0], a[0]], [r[0], t[0]]],
        [[l[0], r[0]], [l[0], l[0]], [l[0], a[0]], [l[0], t[0]]],
      ], [
        [[t[0], r[0]], [t[0], l[0]], [t[0], a[0]], [t[0], t[0]]],
        [[r[0], r[0]], [r[0], l[0]], [r[0], a[0]], [r[0], t[0]]],
        [[l[0], r[0]], [l[0], l[0]], [l[0], a[0]], [l[0], t[0]]],
        [[a[0], r[0]], [a[0], l[0]], [a[0], a[0]], [a[0], t[0]]],
      ]]

      adverbs_insanity = [[
        [[r[1], r[1]], [r[1], l[1]], [r[1], a[1]], [r[1], t[1]]],
        [[l[1], r[1]], [l[1], l[1]], [l[1], a[1]], [l[1], t[1]]],
        [[a[1], r[1]], [a[1], l[1]], [a[1], a[1]], [a[1], t[1]]],
        [[t[1], r[1]], [t[1], l[1]], [t[1], a[1]], [t[1], t[1]]],
      ], [
        [[l[1], r[1]], [l[1], l[1]], [l[1], a[1]], [l[1], t[1]]],
        [[a[1], r[1]], [a[1], l[1]], [a[1], a[1]], [a[1], t[1]]],
        [[t[1], r[1]], [t[1], l[1]], [t[1], a[1]], [t[1], t[1]]],
        [[r[1], r[1]], [r[1], l[1]], [r[1], a[1]], [r[1], t[1]]],
      ], [
        [[a[1], r[1]], [a[1], l[1]], [a[1], a[1]], [a[1], t[1]]],
        [[t[1], r[1]], [t[1], l[1]], [t[1], a[1]], [t[1], t[1]]],
        [[r[1], r[1]], [r[1], l[1]], [r[1], a[1]], [r[1], t[1]]],
        [[l[1], r[1]], [l[1], l[1]], [l[1], a[1]], [l[1], t[1]]],
      ], [
        [[t[1], r[1]], [t[1], l[1]], [t[1], a[1]], [t[1], t[1]]],
        [[r[1], r[1]], [r[1], l[1]], [r[1], a[1]], [r[1], t[1]]],
        [[l[1], r[1]], [l[1], l[1]], [l[1], a[1]], [l[1], t[1]]],
        [[a[1], r[1]], [a[1], l[1]], [a[1], a[1]], [a[1], t[1]]],
      ]]

      adverbs     = [ adverbs_sanity, adverbs_insanity ]
      current_sanity  = File.read("_data/npc/dialogue/sanity.txt").to_i # sanity_context.sample

      context_window = [0, 1, 2, 3]
      row_options    = [0, 1, 2, 3]
      col_options    = [0, 1, 2, 3]
      arr_options    = [0, 1]

      cur_con = context_window.sample
      cur_row =    row_options.sample
      cur_col =    col_options.sample
      cur_arr =    arr_options.sample

      chosen_adverb = adverbs[current_sanity][cur_con][cur_row][cur_col][cur_arr]

      current_phrase = "#{chosen_word_class}_#{chosen_noun}_#{chosen_adjective}_#{chosen_subject}_#{chosen_verb}_#{chosen_adverb}".downcase
  
      current_phrase
    end
  end

  class UnitRecycling
    ################################################################################################
    #                                Military Rank Specific FE Burials                             #
    ################################################################################################
    # Here the ranks of male officers and grunts is what designs the burial plot where their ashes #
    # remain for eternity.                                                                         #
    ################################################################################################

    ################################################################################################
    #                                Military Rank Specific FE Burials                             #
    ################################################################################################
    # Here the rank of female officers and grunts is what designates the burial plot where their   #
    # ashes remain for eternity.                                                                   #
    ################################################################################################
    def self.obelisk_de_sama
      old_graveyard = File.readlines("mce/female/sama_urn.txt").shuffle
      size_limit    = old_graveyard.size.to_i
      index = 0

      File.open("mce/female/sama_urn.txt", "w") { |f|
        f.puts old_data
      
        size_limit.times do
          f.puts old_graveyard[index]
          
          index = index + 1
        end
      }
    end

    def self.obelisk_de_hikasa
      old_graveyard = File.readlines("mce/female/hikasa_urn.txt").shuffle
      size_limit    = old_graveyard.size.to_i
      index = 0

      File.open("mce/female/hikasa_urn.txt", "w") { |f|
        f.puts old_data
      
        size_limit.times do
          f.puts old_graveyard[index]
          
          index = index + 1
        end
      }
    end

    def self.obelisk_de_sana
      old_graveyard = File.readlines("mce/female/sana_urn.txt").shuffle
      size_limit    = old_graveyard.size.to_i
      index = 0

      File.open("mce/female/sana_urn.txt", "w") { |f|
        f.puts old_data
      
        size_limit.times do
          f.puts old_graveyard[index]
          
          index = index + 1
        end
      }
    end

    def self.obelisk_de_senpa
      old_graveyard = File.readlines("mce/female/senpa_urn.txt").shuffle
      size_limit    = old_graveyard.size.to_i
      index = 0

      File.open("mce/female/senpa_urn.txt", "w") { |f|
        f.puts old_data
      
        size_limit.times do
          f.puts old_graveyard[index]
          
          index = index + 1
        end
      }
    end

    def self.obelisk_de_chana
      old_graveyard = File.readlines("mce/female/chana_urn.txt").shuffle
      size_limit    = old_graveyard.size.to_i
      index = 0

      File.open("mce/female/chana_urn.txt", "w") { |f|
        f.puts old_data
      
        size_limit.times do
          f.puts old_graveyard[index]
          
          index = index + 1
        end
      }
    end

    def self.obelisk_de_tuna
      old_graveyard = File.readlines("mce/female/tuna_urn.txt").shuffle
      size_limit    = old_graveyard.size.to_i
      index = 0

      File.open("mce/female/tuna_urn.txt", "w") { |f|
        f.puts old_data
      
        size_limit.times do
          f.puts old_graveyard[index]
          
          index = index + 1
        end
      }
    end

    ################################################################################################
    #                                Military Rank Specific AI Burials                             #
    ################################################################################################
    # Here the rank of the intelligent machines final battle is what designates the burial plot    #
    # where their ashes remains for eternity.                                                      #
    ################################################################################################
    def self.obelisk_de_samos
      old_graveyard = File.readlines("mce/ai/samos_urn.txt").shuffle
      size_limit    = old_graveyard.size.to_i
      index = 0

      File.open("mce/ai/samos_urn.txt", "w") { |f|
        f.puts old_data
      
        size_limit.times do
          f.puts old_graveyard[index]
          
          index = index + 1
        end
      }
    end

    def self.obelisk_de_hikasos
      old_graveyard = File.readlines("mce/ai/hikasos_urn.txt").shuffle
      size_limit    = old_graveyard.size.to_i
      index = 0

      File.open("mce/ai/hikasos_urn.txt", "w") { |f|
        f.puts old_data
      
        size_limit.times do
          f.puts old_graveyard[index]
          
          index = index + 1
        end
      }
    end

    def self.obelisk_de_sanos
      old_graveyard = File.readlines("mce/ai/sanos_urn.txt").shuffle
      size_limit    = old_graveyard.size.to_i
      index = 0

      File.open("mce/ai/sanos_urn.txt", "w") { |f|
        f.puts old_data
      
        size_limit.times do
          f.puts old_graveyard[index]
          
          index = index + 1
        end
      }
    end

    def self.obelisk_de_senpos
      old_graveyard = File.readlines("mce/ai/senpos_urn.txt").shuffle
      size_limit    = old_graveyard.size.to_i
      index = 0

      File.open("mce/ai/senpos_urn.txt", "w") { |f|
        f.puts old_data
      
        size_limit.times do
          f.puts old_graveyard[index]
          
          index = index + 1
        end
      }
    end

    def self.obelisk_de_chanos
      old_graveyard = File.readlines("mce/ai/chanos_urn.txt").shuffle
      size_limit    = old_graveyard.size.to_i
      index = 0

      File.open("mce/ai/chanos_urn.txt", "w") { |f|
        f.puts old_data
      
        size_limit.times do
          f.puts old_graveyard[index]
          
          index = index + 1
        end
      }
    end

    def self.obelisk_de_tunos
      old_graveyard = File.readlines("mce/ai/tunos_urn.txt").shuffle
      size_limit    = old_graveyard.size.to_i
      index = 0

      File.open("mce/ai/tunos_urn.txt", "w") { |f|
        f.puts old_data
      
        size_limit.times do
          f.puts old_graveyard[index]
          
          index = index + 1
        end
      }
    end

    def self.obelisk_de_kunos
      old_graveyard = File.readlines("mce/ai/kunos_urn.txt").shuffle
      size_limit    = old_graveyard.size.to_i
      index = 0

      File.open("mce/ai/kunos_urn.txt", "w") { |f|
        f.puts old_data
      
        size_limit.times do
          f.puts old_graveyard[index]
          
          index = index + 1
        end
      }
    end
  end

  class DataRecycling
    #################################################################################################################
    #                                                Memoricimetiere                                                #
    #################################################################################################################
    def self.obelisk(old_data)
      old_graveyard = File.readlines("mce/urn.txt").shuffle
      size_limit    = old_graveyard.size.to_i
      index = 0

      File.open("mce/urn.txt", "w") { |f|
        f.puts old_data
      
        size_limit.times do
          f.puts old_graveyard[index]
          
          index = index + 1
        end
      }
    end

    def self.obelisk_shell(old_data)
      old_graveyard = File.readlines("mce/surn.txt").shuffle
      size_limit    = old_graveyard.size.to_i
      index = 0

      File.open("mce/surn.txt", "w") { |f|
        f.puts old_data
      
        size_limit.times do
          f.puts old_graveyard[index]
          
          index = index + 1
        end
      }
    end

    def self.obelisk_script(old_data)
      old_graveyard = File.readlines("mce/aurn.txt").shuffle
      size_limit    = old_graveyard.size.to_i
      index = 0

      File.open("mce/aurn.txt", "w") { |f|
        f.puts old_data
      
        size_limit.times do
          f.puts old_graveyard[index]
          
          index = index + 1
        end
      }
    end

    ## Group Burial
    def self.three_plot_burial(father, mother, child)
      buried_fathers  = File.readlines("mce/family/father.txt").uniq.sort
      buried_mothers  = File.readlines("mce/family/mother.txt").uniq.sort
      buried_children = File.readlines("mce/family/child.txt").uniq.sort

      File.open("mce/family/father.txt", "w") { |f|
        f.puts father
        f.puts buried_fathers
      }
  
      File.open("mce/family/mother.txt", "w") { |f|
        f.puts mother
        f.puts buried_mothers
      }
  
      File.open("mce/family/child.txt", "w") { |f|
        f.puts child
        f.puts buried_children
      }
    end

    def self.four_plot_burial(father, mother, brother, sister)
      buried_fathers  = File.readlines("mce/family/father.txt").uniq.sort
      buried_mothers  = File.readlines("mce/family/mother.txt").uniq.sort
      buried_brothers = File.readlines("mce/family/brother.txt").uniq.sort
      buried_sisters  = File.readlines("mce/family/sister.txt").uniq.sort

      File.open("mce/family/father.txt", "w") { |f|
        f.puts father
        f.puts buried_fathers
      }
  
      File.open("mce/family/mother.txt", "w") { |f|
        f.puts mother
        f.puts buried_mothers
      }
  
      File.open("mce/family/brother.txt", "w") { |f|
        f.puts brother
        f.puts buried_brothers
      }

      File.open("mce/family/sister.txt", "w") { |f|
        f.puts sister
        f.puts buried_sisters
      }
    end

    def self.scatter_ashes
      old_graveyard = File.readlines("mce/urn.txt").uniq.sort.shuffle
      size_limit    = old_graveyard.size.to_i
      index         = 0
  
      size_limit.times do
        puts old_graveyard[index]
  
        index = index + 1
      end
    end

    def self.scatter_shells
      old_graveyard = File.readlines("mce/surn.txt").uniq.sort.shuffle
      size_limit    = old_graveyard.size.to_i
      index         = 0
  
      size_limit.times do
        system("#{old_graveyard[index]}")
  
        index = index + 1
      end
    end

    def self.chopstick(deceased_process, archive_name)
      urn      = File.readlines("mce/urn.txt")
      urn_size = urn.size.to_i

      sampled_index = rand(urn_size)
      select_bone   = urn[sampled_index]

      archive = <<-HISTORICAL
      #{select_bone}
      HISTORICAL

      File.open(archive_name, "a") { |f|
        f.puts archive
      }

      "Vous est dormie, oyasumi #{deceased_process} de indice #{sampled_index}."
    end

    def self.scatter_three_ashes
      old_fathers  = File.readlines(%Q(mce/family/father.txt)).uniq.sort.shuffle
      old_mothers  = File.readlines(%Q(mce/family/mother.txt)).uniq.sort.shuffle
      old_children = File.readlines(%Q(mce/family/child.txt)).uniq.sort.shuffle

      size_limit    = old_fathers.size.to_i
      index         = 0
  
      ## Scatters fathers ashes in the wind.
      size_limit.times do
        puts old_fathers[index]
  
        index = index + 1
      end
  
      ## Scatters mothers ashes in the wind
      size_limit    = old_mothers.size.to_i
      index         = 0
  
      size_limit.times do
        puts old_mothers[index]
  
        index = index + 1
      end

      ## Scatters childrens ashes in the wind.
      size_limit    = old_children.size.to_i
      index         = 0
  
      size_limit.times do
        puts old_children[index]
  
        index = index + 1
      end
    end

    def self.scatter_four_ashes
      old_fathers  = File.readlines(%Q(mce/family/father.txt)).uniq.sort.shuffle
      old_mothers  = File.readlines(%Q(mce/family/mother.txt)).uniq.sort.shuffle
      old_brothers = File.readlines(%Q(mce/family/brother.txt)).uniq.sort
      old_sister   = File.readlines(%Q(mce/family/sister.txt)).uniq.sort

      size_limit    = old_fathers.size.to_i
      index         = 0
  
      ## Scatters fathers ashes in the wind.
      size_limit.times do
        puts old_fathers[index]
  
        index = index + 1
      end
  
      ## Scatters mothers ashes in the wind
      size_limit    = old_mothers.size.to_i
      index         = 0
  
      size_limit.times do
        puts old_mothers[index]
  
        index = index + 1
      end

      ## Scatters brothers ashes in the wind.
      size_limit    = old_brothers.size.to_i
      index         = 0
  
      size_limit.times do
        puts old_brothers[index]
  
        index = index + 1
      end

      ## Scatters sisters ashes in the wind.
      size_limit    = old_sister.size.to_i
      index         = 0
  
      size_limit.times do
        puts old_sister[index]
  
        index = index + 1
      end
    end

    def self.yonagumi(current_year, specific_event)
      age_of_yonagumi = 11000.0
  
      age_percent = age_of_yonagumi - current_year
  
      %Q( For a point of comparison: Yonagumi is #{age_percent} years old as of #{current_year}.)

      Obelisk::DataRecycling.obelisk(%Q(For a point of comparison: Yonagumi is #{age_percent} years old as of #{current_year}.))
      Obelisk::DataRecycling.scatter_ashes
    end

    def self.age_comparison(current_year, age_historical, specific_event)
      years_ago = current_year - age_historical
  
      print %Q(The current year is #{current_year}, #{specific_event} is #{years_ago} years ago.)
      puts Obelisk::DataRecycling.yonagumi(2026.0, %Q(#{specific_event}))
      
      Obelisk::DataRecycling.obelisk(%Q(The current year is #{current_year}, #{specific_event} is #{years_ago} years ago.))
    end
  end
end

#################################################################################
#                           Atoll Of Damnation Cemetary                         #
#################################################################################
# Atoll De Encaved Cimitiere - "Chemin De Hemetsu", Chemihemetsu. A sinking     #
# island that had once been larger that is known to sink faster in the center   #
# of the atoll. Urban legend has it it was used to enterre execution victims    #
# beheaded by the sword, with war prisoner corpses causing the island to        #
# gradually sink.                                                               #
#################################################################################
def wave_data(wl, wh, wp)
  if wl.nil? || wh.nil? || wp.nil?
    "Erreur: Il y n'est wl, wh, ou wp."

    abort
  else
    "The wave lasted for a length of #{period}, at a wave length of #{wavelength} at height of #{height}."
  end
end

def waterlight_data(ph, pd, ps)
  if ph.nil? || pd.nil? || ps.nil?
    "Erreur: Il y n'est wl, wh, ou wp."

    abort
  else
    "The waterlight has a pole hieght of #{pole_height}, a pole dpeth of #{pole_depth}, and a stability of #{pole_stability}."
  end
end

def raiteau(*args)
  wavelength, height, period,
  pole_height, pole_depth, pole_stability = args

  pole_stability = pole_stability.tr ")", ""

  waterlight_info = [wave_data(wavelength, height, period), waterlight_data(pole_height, pole_depth, pole_stability)]

  Obelisk::DataRecycling.obelisk(waterlight_info[0])
  Obelisk::DataRecycling.obelisk(waterlight_info[1])
end

def cemetary_metrics(y, x)
  if ph.nil? || pd.nil? || ps.nil?
    puts "Erreur: Il y n'est y ou x."

    abort
  else
    y * x
  end
end

def cavern_metrics(y, x)
  if ph.nil? || pd.nil? || ps.nil?
    puts "Erreur: Il y n'est y ou x."

    abort
  else
    y * x
  end
end

def atoll(*args)
  cemetary_y, cemetary_x, cemetary_d,
  cavern_y, cavern_x, cavern_d = args

  if cemetary_y.nil?
    puts "Erreur: Il y n'est [cemetary Y]"

    abort
  end

  if cemetary_x.nil?
    puts "Erreur: Il y n'est [cemetary X]"

    abort
  end

  if cemetary_d.nil?
    puts "Erreur: Il y n'est [cemetary Z]"

    abort
  end

  if cavern_y.nil?
    puts "Erreur: Il y n'est [cavern Y]"

    abort
  end

  if cavern_x.nil?
    puts "Erreur: Il y n'est [cavern X]"

    abort
  end

  if cavern_d.nil?
    puts "Erreur: Il y n'est [cavern Z]"

    abort
  end

  cavern_d = cavern_d.tr ")", ""

  cemetary_dance = ["Cemetary is #{cemetary_y} by #{cemetary_x} or #{cemetary_metrics(cemetary_y, cemetary_x)} at depth #{cemetary_d}",
                    "Cavern is #{cavern_y} by #{cavern_x} or #{cemetary_metrics(cavern_y, cavern_x)} at depth #{cavern_d}"]

  Obelisk::DataRecycling.obelisk(cemetary_dance[0])
  Obelisk::DataRecycling.obelisk(cemetary_dance[1])
end

def ground_radar(y, x, z, *kwargs)
  if y.nil? || x.nil? || z.nil? || kwargs.nil?
    "Erreur: Il y n'est y, x, z, ou kwargs."

    abort
  else
    features = kwargs

    size_limit = features.size
    index = 0

    size_limit.times do
      selected_feature = features[index]

      puts "#{selected_feature} at #{y} #{x} #{z}"

      Obelisk::DataRecycling.obelisk("#{selected_feature} at #{y} #{x} #{z}")

      index = index + 1
    end

    Obelisk::DataRecycling.scatter_ashes
  end
end

def measure_myth(*args)
  if args.nil?
    "Erreur: Il y n'est les values args."

    abort
  else
    a1, a2, b1, b2, c1, c2, search_space = args

    search_space = search_space.to_i

    search_space.times do
      counterfact_selection(a1, a2, b1, b2, c1, c2)

      dynamic_mode_switcher
    end

    caction("reality", "partially mythological", "mythological")
  end
end

def loup_de_foret(wolf_count, *kwargs)
  if wolf_count.nil? || kwargs.nil?
    "Erreur: Il y n'est les values wolf_count ou kwargs."

    abort
  else
    anomalous_features = kwargs

    size_limit = anomalous_features.size.to_i
    index = 0

    size_limit.times do
      current_anomaly = anomalous_features[index]

      new_iteration = current_anomaly.size
      new_index = 0

      new_iteration.times do
        puts "The precise wolf count should be #{wolf_count}. The current anomaly is that shouldn't be in this #{current_location} is #{current_anomaly[new_index]}"
 
        urn_logic = "The precise wolf count should be #{wolf_count}. The current anomaly is that shouldn't be in this #{current_location} is #{current_anomaly[new_index]}"

        Obelisk::DataRecycling.obelisk(urn_logic)

        new_index = new_index + 1
      end

      index = index + 1
    end

    Obelisk::DataRecycling.scatter_ashes
  end
end

def black_sheep(sheep_count, *kwargs)
  if sheep_count.nil? || kwargs.nil?
    "Erreur: Il y n'est les values sheep_count ou kwargs."

    abort
  else
    anomalous_features = kwargs

    size_limit = anomalous_features.size.to_i
    index = 0

    size_limit.times do
      current_anomaly = anomalous_features[index]

      new_iteration = current_anomaly.size
      new_index = 0

      new_iteration.times do
        puts "The precise sheep count should be #{sheep_count}. The current anomaly is that shouldn't be in this #{current_location} is #{current_anomaly[new_index]}"
 
        urn_logic = "The precise sheep count should be #{sheep_count}. The current anomaly is that shouldn't be in this #{current_location} is #{current_anomaly[new_index]}"

        Obelisk::DataRecycling.obelisk(urn_logic)

        new_index = new_index + 1
      end

      index = index + 1
    end

    Obelisk::DataRecycling.scatter_ashes
  end
end

def tree_count(tree_number, *kwargs)
  if tree_number.nil? || kwargs.nil?
    "Erreur: Il y n'est les values tree_number ou kwargs."

    abort
  else
    anomalous_features = kwargs

    size_limit = anomalous_features.size.to_i
    index = 0

    size_limit.times do
      current_anomaly = anomalous_features[index]

      new_iteration = current_anomaly.size
      new_index = 0

      new_iteration.times do
        puts "The precise tree count should be #{tree_number}. The current anomaly is that shouldn't be buried here is #{current_anomaly[new_index]}"
 
        urn_logic = "The precise tree count should be #{tree_number}. The current anomaly is that shouldn't be buried here is #{current_anomaly[new_index]}"

        Obelisk::DataRecycling.obelisk(urn_logic)

        new_index = new_index + 1
      end

      index = index + 1
    end

    Obelisk::DataRecycling.scatter_ashes
  end
end

################################################################################################
#                                Who What When Where Why How                                   #
################################################################################################
def nom(a)
  a = a.tr ")", ""

  if a.nil?
    "Erreur: Il y n'est un value [A]"

    abort
  else
    ## Appends who to the obelisk.
    Obelisk::DataRecycling.obelisk("Mes nom est #{a}.")

    ## Scatters the ashes by shuffling, removing duplicates, and resorting remains.
    Obelisk::DataRecycling.scatter_ashes

    File.open("scripts/awamachine/nomdata.awa", "a") { |f|
      f.puts <<-NOMDATA
      nom a
      NOMDATA
    }
  end
end

def buttai(b)
  b = b.tr ")", ""

  if b.nil?
    "Erreur: Il y n'est un value [B]"

    abort
  else
    ## Appends what to the obelisk.
    Obelisk::DataRecycling.obelisk("C'est un/une #{b}.")

    ## Scatters the ashes by shuffling, removing duplicates, and resorting remains.
    Obelisk::DataRecycling.scatter_ashes

    File.open("scripts/awamachine/buttaidata.awa", "a") { |f|
      f.puts <<-BUTTAIDATA
      buttai b
      BUTTAIDATA
    }
  end
end

def temps(c)
  c = c.tr ")", ""

  if c.nil?
    "Erreur: Il y n'est un value [C]"

    abort
  else
    ## Appends when to the obelisk.
    Obelisk::DataRecycling.obelisk("Le temp est #{c}.")

    ## Scatters the ashes by shuffling, removing duplicates, and resorting remains.
    Obelisk::DataRecycling.scatter_ashes

    File.open("scripts/awamachine/tempsdata.awa", "a") { |f|
      f.puts <<-TEMPSDATA
      temps c
      TEMPSDATA
    }
  end
end

# nda nde ndi ndo ndu
def fukin(d)
  d = d.tr ")", ""

  if d.nil?
    "Erreur: Il y n'est un value [d]"

    abort
  else
    ## Appends when to the obelisk.
    Obelisk::DataRecycling.obelisk("Je suis en le voisinage de #{d}.")

    ## Scatters the ashes by shuffling, removing duplicates, and resorting remains.
    Obelisk::DataRecycling.scatter_ashes

    File.open("scripts/awamachine/fukindata.awa", "a") { |f|
      f.puts <<-FUKINDATA
      temps c
      FUKINDATA
    }   
  end
end

def motif(e)
  e = e.tr ")", ""

  if e.nil?
    "Erreur: Il y n'est un value [e]"

    abort
  else
    puts "Mes raison pour ce est #{e}."
  end
end

def hono(f)
  f = f.tr ")", ""

  if f.nil?
    "Erreur: Il y n'est un value [f]"

    abort
  else
    puts "Mois methode pour le fabrication mes objectifs est #{f}."
  end
end

def jiko(a, b, c)
  c = c.tr ")", ""

  if a.nil? || b.nil? || c.nil?
    "Erreur: Il y n'est un value [a b c]"

    abort
  else
    puts "Vous avoir damande moi #{a} a propos #{b} par #{c}."
  end
end

## Unite specific people at a time and place
def unir(a, b, c)
  c = c.tr ")", ""

  if a.nil? || b.nil? || c.nil?
    "Erreur: Il y n'est un value [a b c]"

    abort
  else
    puts "Je avoir unif avec #{a} avec #{b} a #{c}."
  end
end

def genkei(a)
  a = a.tr ")", ""

  if a.nil?
    "Erreur: Il y n'est un value [a]"

    abort
  else
    puts "Je suis un etudiant a propos #{a}."
  end
end

def musee_comprime(a)
  a = a.tr ")", ""

  if a.nil?
    "Erreur: Il y n'est un value [a]"

    abort
  else
    puts "Cette musee comprime #{a}."
  end
end

# That is a black expanse / remodel.
def noremodei(a)
  a = a.tr ")", ""

  if a.nil?
    "Erreur: Il y n'est un value [a]"

    abort
  else
    puts "Cette #{a} est noermodeios."
  end
end

def ninom(a)
  a = a.tr ")", ""

  if a.nil?
    "Erreur: Il y n'est un value [a]"

    abort
  else
    puts "Mes nom est ne #{a}."
  end
end

def nibuttai(b)
  b = b.tr ")", ""

  if b.nil?
    "Erreur: Il y n'est un value [b]"

    abort
  else
    puts "C'est non un/une #{b}."
  end
end

def netemps(c)
  c = c.tr ")", ""

  if c.nil?
    "Erreur: Il y n'est un value [c]"

    abort
  else
    puts "Le temp est ne #{c}."
  end
end

def nifukin(d)
  d = d.tr ")", ""

  if d.nil?
    "Erreur: Il y n'est un value [d]"

    abort
  else
    puts "Je suis ne en le voisinage de #{d}."
  end
end

def nemotif(e)
  e = e.tr ")", ""

  if e.nil?
    "Erreur: Il y n'est un value [e]"

    abort
  else
    puts "Mes raison pour ce est ne #{e}."
  end
end

def nihono(f)
  f = f.tr ")", ""

  if f.nil?
    "Erreur: Il y n'est un value [f]"

    abort
  else
    puts "Mois methode pour le fabrication mes objectifs est ne #{f}."
  end
end

## Disunification
def neunir(a, b, c)
  c = c.tr ")", ""

  if a.nil? || b.nil? || c.nil?
    "Erreur: Il y n'est un value [a b c]"

    abort
  else
    puts "Je ne avoir unif avec #{a} avec #{b} a #{c}."
  end
end

def nijiko(a, b, c)
  c = c.tr ")", ""

  if a.nil? || b.nil? || c.nil?
    "Erreur: Il y n'est un value [a b c]"

    abort
  else
    puts "Vous ne avoir damande moi #{a} a propos #{b} par #{c}."
  end
end

def nigenkei(a)
  a = a.tr ")", ""

  if a.nil?
    "Erreur: Il y n'est un value [a]"

    abort
  else
    puts "Je suis ne un etudiant a propos #{a}."
  end
end

#################################################################################
#                          Clothing Types [ Low Level ]                         #
#################################################################################
## Natural language outfit descriptions.
def arc(*args)
  color, shape, size = args

  size = size.tr ")", ""

  puts "Le archette est #{color}, #{shape}, et #{size}."
end

def cor(*args)
  color, shape, size = args

  size = size.tr ")", ""

  puts "Le corset est #{color}, #{shape}, et #{size}."
end

def jup(*args)
  color, shape, size = args

  size = size.tr ")", ""

  puts "La jupe est #{color}, #{shape}, et #{size}."
end

def bas(*args)
  color, shape, size = args

  size = size.tr ")", ""

  puts "Le sabots de bois est #{color}, #{shape}, et #{size}."
end

def sab(*args)
  color, shape, size = args

  size = size.tr ")", ""

  puts "Le sab est #{color}, #{shape}, et #{size}."
end

def from_script
  file_name = ARGV[0].to_s

  script      = File.readlines("#{file_name}")
  total_lines = script.size.to_i
  index = 0

  total_lines.times do
    current_line = script[index]

    repl_line("#{current_line}")

    index = index + 1
  end
end

def repl
  type_history = []

  istack = []
  sstack = []

  loop do
    print " >>> "; statement = gets.chomp

    if statement.class == String
      type_history = type_history.append(statement.class); type_history = type_history.shuffle.uniq.sort

      # Checks for numbers
      if    statement ==  "0"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement ==  "1"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement ==  "2"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement ==  "3"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement ==  "4"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement ==  "5"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement ==  "6"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement ==  "7"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement ==  "8"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement ==  "9"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement == "-0"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement == "-1"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement == "-2"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement == "-3"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement == "-4"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement == "-5"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement == "-6"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement == "-7"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement == "-8"; statement = statement.to_i; istack = istack.append(statement)
      elsif statement == "-9"; statement = statement.to_i; istack = istack.append(statement)

      # Checks for letters.
      elsif statement == "A"; sstack = sstack.append(statement)
      elsif statement == "B"; sstack = sstack.append(statement)
      elsif statement == "C"; sstack = sstack.append(statement)
      elsif statement == "D"; sstack = sstack.append(statement)
      elsif statement == "E"; sstack = sstack.append(statement)
      elsif statement == "F"; sstack = sstack.append(statement)
      elsif statement == "G"; sstack = sstack.append(statement)
      elsif statement == "H"; sstack = sstack.append(statement)
      elsif statement == "I"; sstack = sstack.append(statement)
      elsif statement == "J"; sstack = sstack.append(statement)
      elsif statement == "K"; sstack = sstack.append(statement)
      elsif statement == "L"; sstack = sstack.append(statement)
      elsif statement == "M"; sstack = sstack.append(statement)
      elsif statement == "N"; sstack = sstack.append(statement)
      elsif statement == "O"; sstack = sstack.append(statement)
      elsif statement == "P"; sstack = sstack.append(statement)
      elsif statement == "Q"; sstack = sstack.append(statement)
      elsif statement == "R"; sstack = sstack.append(statement)
      elsif statement == "S"; sstack = sstack.append(statement)
      elsif statement == "T"; sstack = sstack.append(statement)
      elsif statement == "U"; sstack = sstack.append(statement)
      elsif statement == "V"; sstack = sstack.append(statement)
      elsif statement == "W"; sstack = sstack.append(statement)
      elsif statement == "X"; sstack = sstack.append(statement)
      elsif statement == "Y"; sstack = sstack.append(statement)
      elsif statement == "Z"; sstack = sstack.append(statement)
      elsif statement == "a"; sstack = sstack.append(statement)
      elsif statement == "b"; sstack = sstack.append(statement)
      elsif statement == "c"; sstack = sstack.append(statement)
      elsif statement == "d"; sstack = sstack.append(statement)
      elsif statement == "e"; sstack = sstack.append(statement)
      elsif statement == "f"; sstack = sstack.append(statement)
      elsif statement == "g"; sstack = sstack.append(statement)
      elsif statement == "h"; sstack = sstack.append(statement)
      elsif statement == "i"; sstack = sstack.append(statement)
      elsif statement == "j"; sstack = sstack.append(statement)
      elsif statement == "k"; sstack = sstack.append(statement)
      elsif statement == "l"; sstack = sstack.append(statement)
      elsif statement == "m"; sstack = sstack.append(statement)
      elsif statement == "n"; sstack = sstack.append(statement)
      elsif statement == "o"; sstack = sstack.append(statement)
      elsif statement == "p"; sstack = sstack.append(statement)
      elsif statement == "q"; sstack = sstack.append(statement)
      elsif statement == "r"; sstack = sstack.append(statement)
      elsif statement == "s"; sstack = sstack.append(statement)
      elsif statement == "t"; sstack = sstack.append(statement)
      elsif statement == "u"; sstack = sstack.append(statement)
      elsif statement == "v"; sstack = sstack.append(statement)
      elsif statement == "w"; sstack = sstack.append(statement)
      elsif statement == "x"; sstack = sstack.append(statement)
      elsif statement == "y"; sstack = sstack.append(statement)
      elsif statement == "z"; sstack = sstack.append(statement)
      elsif statement == " "; sstack = sstack.append(statement)

      elsif statement ==          "."; sstack = sstack.append(statement)
      elsif statement ==         ".."; sstack = sstack.append(statement)
      elsif statement ==        "..."; sstack = sstack.append(statement)
      elsif statement ==        "..|"; sstack = sstack.append(statement)
      elsif statement ==       "..|."; sstack = sstack.append(statement)
      elsif statement ==      "..|.."; sstack = sstack.append(statement)
      elsif statement ==     "..|..."; sstack = sstack.append(statement)
      elsif statement ==    "..|...."; sstack = sstack.append(statement)
      elsif statement ==   "..|....."; sstack = sstack.append(statement)
      elsif statement ==  "..|......"; sstack = sstack.append(statement)
      elsif statement == "..|......."; sstack = sstack.append(statement)
      elsif statement == "..||......"; sstack = sstack.append(statement)
      elsif statement == "..|||....."; sstack = sstack.append(statement)
      elsif statement == "..||||...."; sstack = sstack.append(statement)
      elsif statement == "..|||||..."; sstack = sstack.append(statement)
      elsif statement == "..||||||.."; sstack = sstack.append(statement)
      elsif statement == "..|||||||."; sstack = sstack.append(statement)
      elsif statement == ".|.|.|...."; sstack = sstack.append(statement)
      elsif statement == ".|.|.||..."; sstack = sstack.append(statement)
      elsif statement == ".|.|..||.."; sstack = sstack.append(statement)
      elsif statement == ".|.|...||."; sstack = sstack.append(statement)
      elsif statement == "..|..|..|."; sstack = sstack.append(statement)
      elsif statement == ".||.||.||."; sstack = sstack.append(statement)
      elsif statement == "|||.|||.||"; sstack = sstack.append(statement)
      elsif statement == "||.|||.||."; sstack = sstack.append(statement)
      elsif statement == "||...||.||"; sstack = sstack.append(statement)

      ## Stack Mananagement
      elsif statement ==     "pstack";
        sstack_size = sstack.size.to_i; index = 0

        sstack_size.times do
          new_char = sstack[index]

          print new_char

          index = index + 1
        end

        puts " "
      elsif statement ==     "istack";
        sum_of = istack.sum

        puts sum_of

        istack = []

      elsif statement == "cstack"
        sstack = []

      # Checks for Non Latins.
      elsif statement[0] == "-" and statement[1] == "-";
        size_limit = statement.size.to_i
        index = 0

        size_limit.times do
          if    statement[index] == "-"
          else
          end

          index = index + 1
        end
      elsif statement[0] ==  "#";
        size_limit = statement.size.to_i
        index = 0

        size_limit.times do
          if    statement[index] == "#"
          else
          end

          index = index + 1
        end
      elsif statement[0] ==  ";";
        size_limit = statement.size.to_i
        index = 0

        size_limit.times do
          if    statement[index] == ";"
          else
          end

          index = index + 1
        end
      elsif statement ==  "."; sstack = sstack.append(statement)

      # Checks for function names and does further processing.
      elsif statement[0] == "(" and statement[-1] == ")"
        statement = statement.tr %Q("), %Q()
        statement = statement.split(" ")

        #puts statement

        if    statement[0] == "(enc"
          size_limit = statement.size.to_i
          index = 0

          size_limit.times do
            if    statement[index] == "(enc"
            elsif statement[index] == ")"
            else
              print statement[index].tr ")", ""; print " "
            end

            index = index + 1
          end

          puts " "
        elsif statement[0] == "(twn" # sum two
          int1 = statement[1].to_i; istack = istack.append(int1)

          int2 = statement[2].tr ")", ""; int2 = int2.to_i; istack = istack.append(int2)

          print "=> "
          puts istack.sum

          istack = []
        elsif statement[0] == "(dfl"
          int1 = statement[1].to_f; istack = istack.append(int1)

          int2 = statement[2].tr ")", ""; int2 = int2.to_f; istack = istack.append(int2)

          print "=> "
          puts istack.sum

          istack = []
        elsif statement[0] == "(shn"
          int1 = statement[1].to_f; istack = istack.append(int1)

          int2 = statement[2].tr ")", ""; int2 = int2.to_f; istack = istack.append(int2)

          print "=> "
          puts istack[0] / istack[1]

          istack = []
        elsif statement[0] == "(trn" # sum three
          int1 = statement[1].to_i; istack = istack.append(int1)

          int2 = statement[2].to_i; istack = istack.append(int2)

          int3 = statement[3].tr ")", ""; int3 = int3.to_i; istack = istack.append(int3)

          print "=> "
          puts istack.sum

          istack = []
        elsif statement[0] == "(tfl" # sum three
          int1 = statement[1].to_f; istack = istack.append(int1)

          int2 = statement[2].to_f; istack = istack.append(int2)

          int3 = statement[3].tr ")", ""; int3 = int3.to_f; istack = istack.append(int3)

          print "=> "
          puts istack.sum

          istack = []
      
        ## Atoll
        elsif statement[0] == "(rae"
          raiteau(statement[1], statement[2], statement[3],
                  statement[4], statement[5], statement[6])
        elsif statement[0] == "(ato"
          atoll(statement[1], statement[2], statement[3],
                statement[4], statement[5], statement[6])
        elsif statement[0] == "(gro"
          y = statement[1].to_i
          x = statement[2].to_i
          z = statement[3].to_i

          vault_one = statement[4]
          vault_two = statement[5]
          vault_tre = statement[6]

          ground_radar(y, x, z, [ vault_one, vault_two, vault_tre ])
        elsif statement[0] == "(sca)"
          Obelisk::DataRecyling.scatter_ashes

        ## Investigatif
        elsif statement[0] == "(nom"
          nom(statement[1])
        elsif statement[0] == "(but"
          buttai(statement[1])
        elsif statement[0] == "(tem"
          temps(statement[1])
        elsif statement[0] == "(fuk"
          fukin(statement[1])
        elsif statement[0] == "(mot"
          motif(statement[1])
        elsif statement[0] == "(hon"
          hono(statement[1])
        elsif statement[0] == "(jik"
          jiko(statement[1])

        ## Clothing Types
        elsif statement[0] == "(arc"
          arc(statement[1], statement[2], statement[3])
        elsif statement[0] == "(cor"
          cor(statement[1], statement[2], statement[3])
        elsif statement[0] == "(jup"
          jup(statement[1], statement[2], statement[3])
        elsif statement[0] == "(bas"
          bas(statement[1], statement[2], statement[3])
        elsif statement[0] == "(sab"
          sab(statement[1], statement[2], statement[3])

        ## Mythological processing
        elsif statement[0] == "(cer"
          p1 = statement[1].to_f
          p2 = statement[2].to_f
          p3 = statement[3].to_f
          mu = statement[4].to_f

          print Obelisk::Cerberus.cpo(p1, p2, p3, mu)
          puts " "

        ## Obelisk Mechanics
        elsif statement[0] == "(obe1"
          trimmed_token = statement[1].tr ")", ""

          Obelisk::DataRecycling.obelisk(trimmed_token)
        elsif statement[0] == "(obe2"
          trimmed_token = statement[2].tr ")", ""

          new_string = statement[1] + " " + trimmed_token

          Obelisk::DataRecycling.obelisk(new_string)
        elsif statement[0] == "(obe3"
          trimmed_token = statement[3].tr ")", ""

          new_string = statement[1] + " " + statement[2] + " " + trimmed_token

          Obelisk::DataRecycling.obelisk(new_string)
        elsif statement[0] == "(obe4"
          trimmed_token = statement[3].tr ")", ""

          new_string = statement[1] + " " + statement[2] + " " + statement[3] + " " + trimmed_token

          Obelisk::DataRecycling.obelisk(new_string)
        elsif statement[0] == "(obe5"
          trimmed_token = statement[3].tr ")", ""

          new_string = statement[1] + " " + statement[2] + " " + statement[3] + " " + statement[4] + " " + trimmed_token

          Obelisk::DataRecycling.obelisk(new_string)
        elsif statement[0] == "(obe6"
          trimmed_token = statement[3].tr ")", ""

          new_string = statement[1] + " " + statement[2] + " " + statement[3] + " " + statement[4] + " " + statement[5] + " " + trimmed_token

          Obelisk::DataRecycling.obelisk(new_string)
        elsif statement[0] == "(obe7"
          trimmed_token = statement[3].tr ")", ""

          new_string = statement[1] + " " + statement[2] + " " + statement[3] + " " + statement[4] + " " + statement[5] + " " + statement[6] + trimmed_token

          Obelisk::DataRecycling.obelisk(new_string)
        elsif statement[0] == "(sca"
          search_space = statement[1].tr ")", ""
          search_space = statement[1].size.to_i

          search_space.times do
            Obelisk::DataRecycling.scatter_ashes
          end
        elsif statement[0] == "(ext"
          abort
        else
          puts "Error: Unrecognized statement."
        end
      else
        puts "Error: Unrecognized token."
      end
    else
      puts "Erreur: Ne token genre."
    end
  end
end

def stack_script(line)
  istack_index = 0
  old_istack      = File.readlines("data/istack/istack.txt")
  old_istack_size = old_istack.size.to_i
  istack          = []

  sstack_index    = 0
  old_sstack      = File.readlines("data/sstack/sstack.txt")
  old_sstack_size = old_sstack.size.to_i
  sstack   = []

  statement = line.chomp

  if statement.class == String
    if statement == "cls"; system("clear")

    # Checks for numbers
    elsif statement ==  "0"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement ==  "1"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement ==  "2"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement ==  "3"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement ==  "4"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement ==  "5"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement ==  "6"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement ==  "7"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement ==  "8"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement ==  "9"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement == "-0"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement == "-1"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement == "-2"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement == "-3"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement == "-4"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement == "-5"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement == "-6"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement == "-7"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement == "-8"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
    elsif statement == "-9"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }

    # Checks for letters.
    elsif statement == "A"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "B"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "C"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "D"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "E"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "F"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "G"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "H"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "I"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "J"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "K"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "L"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "M"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "N"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "O"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "P"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "Q"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "R"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "S"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "T"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "U"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "V"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "W"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "X"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "Y"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "Z"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "a"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "b"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "c"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "d"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "e"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "f"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "g"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "h"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "i"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "j"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "k"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "l"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "m"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "n"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "o"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "p"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "q"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "r"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "s"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "t"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "u"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "v"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "w"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "x"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "y"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "z"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == " ";      sstack = sstack.append("\s"); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "_"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }

    ## Function names
    elsif statement == "(enc";

    elsif statement ==          "."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement ==         ".."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement ==        "..."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement ==        "..|"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement ==       "..|."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement ==      "..|.."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement ==     "..|..."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement ==    "..|...."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement ==   "..|....."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement ==  "..|......"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "..|......."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "..||......"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "..|||....."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "..||||...."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "..|||||..."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "..||||||.."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "..|||||||."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == ".|.|.|...."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == ".|.|.||..."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == ".|.|..||.."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == ".|.|...||."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "..|..|..|."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == ".||.||.||."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "|||.|||.||"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "||.|||.||."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
    elsif statement == "||...||.||"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }

    ## Stack Mananagement
    elsif statement ==     "pstack";
      old_sstack_index = 0
      old_sstack       = File.readlines("data/sstack/sstack.txt")
      old_sstack_size  = old_sstack.size.to_i

      total_values = []
      total_size   = 0
      total_index  = 0

      old_sstack_size.times do
        new_value = old_sstack[old_sstack_index]
        new_value = new_value

        total_values = total_values.append(new_value)
        total_size = total_size + 1

        old_sstack_index = old_sstack_index + 1
      end

      total_size.times do
        print total_values[total_index].chomp

        total_index = total_index + 1
      end

      puts " "
    elsif statement == "cstack"
      sstack = []
      File.open("data/sstack/sstack.txt", "w") { |f| f.puts sstack }
    elsif statement == "istack";
      old_istack_index = 0
      old_istack       = File.readlines("data/istack/istack.txt")
      old_istack_size  = old_istack.size.to_i

      total_values = []

      old_istack_size.times do
        new_value = old_istack[old_istack_index]
        new_value = new_value.to_i

        total_values = total_values.append(new_value)

        old_istack_index = old_istack_index + 1
      end

      puts total_values.sum
    elsif statement == "zstack"
      istack = []; File.open("data/istack/istack.txt", "w") { |f| f.puts istack }
    elsif statement[0] == "(ext"
      abort
    else
      puts "Error: Unrecognized statement."
    end
  else
    puts "Error: Unrecognized token."
  end
end

def stack_language
  index = 0

  system("clear")

  puts "Welcome to my stack language."

  loop do
    istack_index = 0
    old_istack      = File.readlines("data/istack/istack.txt")
    old_istack_size = old_istack.size.to_i
    istack          = []

    sstack_index    = 0
    old_sstack      = File.readlines("data/sstack/sstack.txt")
    old_sstack_size = old_sstack.size.to_i
    sstack   = []

    print " >>> "
    statement = gets.chomp

    if statement.class == String
      if statement == "cls"; system("clear")

      # Checks for numbers
      elsif statement ==  "0"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement ==  "1"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement ==  "2"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement ==  "3"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement ==  "4"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement ==  "5"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement ==  "6"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement ==  "7"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement ==  "8"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement ==  "9"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement == "-0"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement == "-1"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement == "-2"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement == "-3"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement == "-4"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement == "-5"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement == "-6"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement == "-7"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement == "-8"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }
      elsif statement == "-9"; statement = statement.to_i; istack = istack.append(statement); File.open("data/istack/istack.txt", "w") { |f| f.puts old_istack; f.puts istack }

      # Checks for letters.
      elsif statement == "A"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "B"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "C"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "D"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "E"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "F"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "G"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "H"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "I"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "J"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "K"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "L"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "M"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "N"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "O"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "P"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "Q"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "R"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "S"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "T"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "U"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "V"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "W"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "X"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "Y"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "Z"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "a"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "b"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "c"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "d"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "e"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "f"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "g"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "h"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "i"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "j"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "k"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "l"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "m"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "n"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "o"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "p"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "q"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "r"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "s"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "t"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "u"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "v"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "w"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "x"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "y"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "z"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == " "; sstack = sstack.append("\s"); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }

      elsif statement ==          "."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement ==         ".."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement ==        "..."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement ==        "..|"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement ==       "..|."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement ==      "..|.."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement ==     "..|..."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement ==    "..|...."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement ==   "..|....."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement ==  "..|......"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "..|......."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "..||......"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "..|||....."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "..||||...."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "..|||||..."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "..||||||.."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "..|||||||."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == ".|.|.|...."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == ".|.|.||..."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == ".|.|..||.."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == ".|.|...||."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "..|..|..|."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == ".||.||.||."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "|||.|||.||"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "||.|||.||."; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }
      elsif statement == "||...||.||"; sstack = sstack.append(statement); File.open("data/sstack/sstack.txt", "w") { |f| f.puts old_sstack; f.puts sstack }

      ## Stack Mananagement
      elsif statement ==     "pstack";
        old_sstack_index = 0
        old_sstack       = File.readlines("data/sstack/sstack.txt")
        old_sstack_size  = old_sstack.size.to_i

        total_values = []
        total_size   = 0
        total_index  = 0

        old_sstack_size.times do
          new_value = old_sstack[old_sstack_index]
          new_value = new_value

          total_values = total_values.append(new_value)
          total_size = total_size + 1

          old_sstack_index = old_sstack_index + 1
        end

        print " => "
        total_size.times do
          print total_values[total_index].chomp

          total_index = total_index + 1
        end

        puts " "
      elsif statement == "cstack"
        sstack = []
        File.open("data/sstack/sstack.txt", "w") { |f| f.puts sstack }
      elsif statement == "istack";
        old_istack_index = 0
        old_istack       = File.readlines("data/istack/istack.txt")
        old_istack_size  = old_istack.size.to_i

        total_values = []

        old_istack_size.times do
          new_value = old_istack[old_istack_index]
          new_value = new_value.to_i

          total_values = total_values.append(new_value)

          old_istack_index = old_istack_index + 1
        end

        print " => "
        puts total_values.sum
      elsif statement == "zstack"
        istack = []; File.open("data/istack/istack.txt", "w") { |f| f.puts istack }
      elsif statement[0] == "(ext"
        abort
      else
        puts "Error: Unrecognized statement."
      end
    else
      puts "Error: Unrecognized token."
    end
  end
end

def repl_line(line)
  type_history = []

  istack = []
  sstack = []

  type_history = []

  statement = line.strip

  if statement.is_a?(String)
    type_history = type_history.append(statement.class); type_history = type_history.shuffle.uniq.sort

    # Checks for function names and does further processing.
    if statement[0] == "(" and statement[-1] == ")"
      statement = statement.tr %Q("), %Q()
      statement = statement.split(" ")

      #puts statement

      if    statement[0] == "(enc"
        size_limit = statement.size.to_i
        index = 0

        size_limit.times do
          if    statement[index] == "(enc"
          elsif statement[index] == ")"
          else
            print statement[index].tr ")", ""; print " "
          end

          index = index + 1
        end

        puts " "
      elsif statement[0] == "(twn" # sum two
        int1 = statement[1].to_i; istack = istack.append(int1)

        int2 = statement[2].tr ")", ""; int2 = int2.to_i; istack = istack.append(int2)

        puts istack.sum

        istack = []
      elsif statement[0] == "(dfl"
        int1 = statement[1].to_f; istack = istack.append(int1)

        int2 = statement[2].tr ")", ""; int2 = int2.to_f; istack = istack.append(int2)

        puts istack.sum

        istack = []
      elsif statement[0] == "(shn"
        int1 = statement[1].to_f; istack = istack.append(int1)

        int2 = statement[2].tr ")", ""; int2 = int2.to_f; istack = istack.append(int2)

        puts istack[0] / istack[1]

        istack = []
      elsif statement[0] == "(trn" # sum three
        int1 = statement[1].to_i; istack = istack.append(int1)

        int2 = statement[2].to_i; istack = istack.append(int2)

        int3 = statement[3].tr ")", ""; int3 = int3.to_i; istack = istack.append(int3)

        puts istack.sum

        istack = []
      elsif statement[0] == "(tfl" # sum three
        int1 = statement[1].to_f; istack = istack.append(int1)

        int2 = statement[2].to_f; istack = istack.append(int2)

        int3 = statement[3].tr ")", ""; int3 = int3.to_f; istack = istack.append(int3)

        puts istack.sum

        istack = []
      
      ## Atoll
      elsif statement[0] == "(rae"
        raiteau(statement[1], statement[2], statement[3],
                statement[4], statement[5], statement[6])
      elsif statement[0] == "(ato"
        atoll(statement[1], statement[2], statement[3],
              statement[4], statement[5], statement[6])
      elsif statement[0] == "(gro"
        y = statement[1].to_i
        x = statement[2].to_i
        z = statement[3].to_i

        vault_one = statement[4]
        vault_two = statement[5]
        vault_tre = statement[6]

        ground_radar(y, x, z, [ vault_one, vault_two, vault_tre ])

      ## Investigatif
      elsif statement[0] == "(nom"
        nom(statement[1])
      elsif statement[0] == "(but"
        buttai(statement[1])
      elsif statement[0] == "(tem"
        temps(statement[1])
      elsif statement[0] == "(fuk"
        fukin(statement[1])
      elsif statement[0] == "(mot"
        motif(statement[1])
      elsif statement[0] == "(hon"
        hono(statement[1])
      elsif statement[0] == "(jik"
        jiko(statement[1])

      ## Clothing Types
      elsif statement[0] == "(arc"
        arc(statement[1], statement[2], statement[3])
      elsif statement[0] == "(cor"
        cor(statement[1], statement[2], statement[3])
      elsif statement[0] == "(jup"
        jup(statement[1], statement[2], statement[3])
      elsif statement[0] == "(bas"
        bas(statement[1], statement[2], statement[3])
      elsif statement[0] == "(sab"
        sab(statement[1], statement[2], statement[3])

      ## Mythological processing
      elsif statement[0] == "(cer"
        p1 = statement[1].to_f
        p2 = statement[2].to_f
        p3 = statement[3].to_f
        mu = statement[4].to_f

        print Obelisk::Cerberus.cpo(p1, p2, p3, mu)
        puts " "

      ## Obelisk Mechanics
      elsif statement[0] == "(obe1"
        trimmed_token = statement[1].tr ")", ""

        Obelisk::DataRecycling.obelisk(trimmed_token)
      elsif statement[0] == "(obe2"
        trimmed_token = statement[2].tr ")", ""

        new_string = statement[1] + " " + trimmed_token

        Obelisk::DataRecycling.obelisk(new_string)
      elsif statement[0] == "(obe3"
        trimmed_token = statement[3].tr ")", ""

        new_string = statement[1] + " " + statement[2] + " " + trimmed_token

        Obelisk::DataRecycling.obelisk(new_string)
      elsif statement[0] == "(obe4"
        trimmed_token = statement[3].tr ")", ""

        new_string = statement[1] + " " + statement[2] + " " + statement[3] + " " + trimmed_token

        Obelisk::DataRecycling.obelisk(new_string)
      elsif statement[0] == "(obe5"
        trimmed_token = statement[3].tr ")", ""

        new_string = statement[1] + " " + statement[2] + " " + statement[3] + " " + statement[4] + " " + trimmed_token

        Obelisk::DataRecycling.obelisk(new_string)
      elsif statement[0] == "(obe6"
        trimmed_token = statement[3].tr ")", ""

        new_string = statement[1] + " " + statement[2] + " " + statement[3] + " " + statement[4] + " " + statement[5] + " " + trimmed_token

        Obelisk::DataRecycling.obelisk(new_string)
      elsif statement[0] == "(obe7"
        trimmed_token = statement[3].tr ")", ""

        new_string = statement[1] + " " + statement[2] + " " + statement[3] + " " + statement[4] + " " + statement[5] + " " + statement[6] + trimmed_token

        Obelisk::DataRecycling.obelisk(new_string)
      elsif statement[0] == "(sca)"
        search_space = statement[1].tr ")", ""
        search_space = statement[1].size.to_i

        search_space.times do
          Obelisk::DataRecycling.scatter_ashes
        end
      elsif statement[0] == "(obp"
        search_space = statement[1].tr ")", ""
        search_space = statement[1].size.to_i

        phrase = Obelisk::Language.generate_phrase

        search_space.times do
          # Generate phrase sent to the obelisk
          Obelisk::DataRecyling.obelisk(phrase)

          # Scatter the ashes that remain in the urn.
          Obelisk::DataRecycling.scatter_ashes
        end

      ## Stack Based language
      elsif statement[0] == "(eatwn" # empile two numbers
        new_string = statement[4].tr ")", ""

        stack_script(statement[1])
        stack_script(statement[2])
        stack_script(statement[3])
        stack_script(new_string)
      elsif statement[0] == "(eatrn" # empile three numbers
        new_string = statement[5].tr ")", ""

        stack_script(statement[1])
        stack_script(statement[2])
        stack_script(statement[3])
        stack_script(statement[4])
        stack_script(new_string)
      elsif statement[0] == "(eafrn" # empile three numbers
        new_string = statement[6].tr ")", ""

        stack_script(statement[1])
        stack_script(statement[2])
        stack_script(statement[3])
        stack_script(statement[4])
        stack_script(statement[5])
        stack_script(new_string)
      elsif statement[0] == "(empstr7"
        new_document = <<-EMP
require_relative "lib/nuerisupu_bytecode.rb"

stack_script("#{statement[1]}")
stack_script("#{statement[2]}")
stack_script("#{statement[3]}")
stack_script("#{statement[4]}")
stack_script("#{statement[5]}")
stack_script("#{statement[6]}")
stack_script("#{statement[7].tr ')', ''}")
        EMP

        File.open("empile_seven.rb", "w") { |f|
          f.puts new_document
        }
      elsif statement[0] == "(empstr9"
        new_document = <<-EMP
require_relative "lib/nuerisupu_bytecode.rb"

stack_script("#{statement[1]}")
stack_script("#{statement[2]}")
stack_script("#{statement[3]}")
stack_script("#{statement[4]}")
stack_script("#{statement[5]}")
stack_script("#{statement[6]}")
stack_script("#{statement[7]}")
stack_script("#{statement[8]}")
stack_script("#{statement[9].tr ')', ''}")
        EMP

        File.open("empile_nine.rb", "w") { |f|
          f.puts new_document
        }
      elsif statement[0] == "(empstr11"
        new_document = <<-EMP
require_relative "lib/nuerisupu_bytecode.rb"

stack_script("#{statement[1]}")
stack_script("#{statement[2]}")
stack_script("#{statement[3]}")
stack_script("#{statement[4]}")
stack_script("#{statement[5]}")
stack_script("#{statement[6]}")
stack_script("#{statement[7]}")
stack_script("#{statement[8]}")
stack_script("#{statement[9]}")
stack_script("#{statement[10]}")
stack_script("#{statement[11].tr ')', ''}")
        EMP

        File.open("empile_eleven.rb", "w") { |f|
          f.puts new_document
        }
      elsif statement[0] == "(ext"
        abort
      else
        puts "Error: Unrecognized statement."
      end
    else
      puts "Error: Unrecognized token."
    end
  else
    puts "Erreur: Ne token genre."
  end
end
