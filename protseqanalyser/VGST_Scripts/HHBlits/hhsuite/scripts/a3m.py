#!/usr/bin/env python

class A3MFormatError(Exception):
  def __init__(self, value):
    self.value = "ERROR:"+value
    
  def __str__(self):
    return repr(self.value)


class A3M_Container:
  def __init__(self):
    self.header = None
    self.annotations = dict()
    self.consensus = None
    self.sequences = []
    self.nr_match_states = None
  
  def get_number_sequences(self):
    return len(self.sequences)
  
  
  def check_and_add_sequence(self, header, sequence):
    try:
      if(self.check_and_add_annotation(header, sequence)): 
        pass
      elif(self.check_and_add_consensus(header,sequence)):
        pass
      else:
        match_states = self.check_sequence(sequence)
        self.check_match_states(match_states)
        self.sequences.append((header, sequence))
    except A3MFormatError as e:
      print(header)
      print(sequence)
      raise e
  
  
  def check_and_add_consensus(self, header, sequence):
    tokens = header[1:].split()
    header_name = header[1:].split()[0]
    if header_name.endswith("_consensus"):
      if self.consensus:
        raise A3MFormatError("Multiple definitions of consensus!")
      else:
        match_states = self.check_sequence(sequence)
        self.check_match_states(match_states)
        consensus = (header, sequence)
        return True
    else:
      return False
  
  
  def check_and_add_annotation(self, header, sequence):
    annotation_classes = [("ss_conf", self.check_ss_conf), ("ss_pred", self.check_ss_pred), ("ss_dssp", self.check_dssp)]
    for annotation_class in annotation_classes:
      if(header[1:].startswith(annotation_class[0])):
        if(annotation_class in self.annotations):
          raise A3MFormatError("Multiple definitions of "+annotation_class+"!")
        else:
          match_states = annotation_class[1](sequence)
          self.check_match_states(match_states)
          self.annotations[annotation_class[0]] = sequence
          return True
        
    return False 


  def check_match_states(self, match_states):
    if match_states == 0:
      raise A3MFormatError("Sequence with zero match states!")
    elif self.nr_match_states and match_states != self.nr_match_states:
      raise A3MFormatError("Sequence with diverging number of match states ("+str(match_states)+" vs. "+str(self.nr_match_states)+")!")
    else:
      self.nr_match_states = match_states

  
  def check_ss_conf(self, sequence):
    allowed_ss_conf_states = set({"0","1","2","3","4","5","6","7","8","9"})
    allowed_gap_states = set({"-", "."})
    
    match_states = 0

    for c in sequence:    
      if c in allowed_ss_conf_states:
        match_states += 1
      elif c not in allowed_gap_states:
        raise A3MFormatError("Undefined character '"+c+"' in predicted secondary structure confidence!")
    
    return match_states


  def check_ss_pred(self, sequence):
    allowed_ss_states = set({"E","C","H"})
    allowed_gap_states = set({"-", "."})
    
    match_states = 0
    
    for c in sequence:
      if c in allowed_ss_states:
        match_states += 1
      elif c not in allowed_gap_states:
        raise A3MFormatError("Undefined character '"+c+"' in predicted secondary structure!")
    
    return match_states


  def check_dssp(self, sequence):
    """
    H = α-helix
    B = residue in isolated β-bridge
    E = extended strand, participates in β ladder
    G = 3-helix (310 helix)
    I = 5 helix (π-helix)
    T = hydrogen bonded turn
    S = bend
    """
    allowed_dssp_states = set({"C", "H", "B", "E", "G", "I", "T", "S", "-"})
    
    match_states = 0
    
    for c in sequence:
      if not c in allowed_dssp_states:
        raise A3MFormatError("Undefined character '"+c+"' in dssp annotation!")
      else:
        match_states += 1
        
    return match_states
  
  
  def check_sequence(self, sequence):
    allowed_match_states = set({'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'})
    allowed_insertion_states = set({'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'})
    allowed_gap_states = set({"-", "."})
    
    match_states = 0
    
    for c in sequence:
      if c in allowed_match_states:
        match_states += 1
      elif c in allowed_gap_states:
        match_states += 1
      elif (c not in allowed_insertion_states):
        raise A3MFormatError("Undefined character '"+c+"' in protein sequence!")
    
    return match_states
  
  def get_sub_sequence(self, sequence, limits):
    allowed_match_states = set({'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'})
    allowed_gap_states = set({"-", "."})

    sub_sequence = ""
    
    for (start, end) in limits:
      start_pos = 0
      pos = -1
      for i in range(len(sequence)):
        if sequence[i] in allowed_match_states or sequence[i] in allowed_gap_states:
          pos += 1
          if pos + 1 == start:
            start_pos = i
            break
          
      end_pos = 0
      pos = -1
      for i in range(len(sequence)):
        if sequence[i] in allowed_match_states  or sequence[i] in allowed_gap_states:
          pos += 1
          if pos + 1 == end:
            end_pos = i
            break
      sub_sequence += sequence[start_pos:end_pos+1]
      
    return sub_sequence
  
  
  def get_content(self):
    content = ""

    if self.header:
      content += self.header+"\n"

    if self.consensus:
      content += self.consensus[0]+"\n"
      content += self.consensus[1]+"\n"
    
    for (header, sequence) in self.sequences:
      content += header+"\n"
      content += sequence+"\n"
      
    return content
    
  
  def split_a3m(self, limits):
    new_a3m = A3M_Container()
    
    if self.consensus:    
      new_consensus_sequence = self.get_sub_sequence(self.consensus[1], limits)
      new_a3m.consensus = ((self.consensus[0], new_consensus_sequence))

    for (header, sequence) in self.sequences:
      new_sequence = self.get_sub_sequence(sequence, limits)
      new_a3m.sequences.append((header, new_sequence))
    
    return new_a3m


  def read_a3m(self, fh):
    lines = fh.readlines()
    self.read_a3m_from_lines(lines)
    fh.close()
    
  def read_a3m_from_lines(self, lines):
    sequence_header = None
    sequence = ""
    
    is_first_line = True
    
    for line in lines:
      line = line.strip()
      if len(line) == 0:
        continue
      elif line[0] == "#":
        if is_first_line:
          self.header = line
        else:
          #skip line
          pass
      elif line[0] == ">":
        if sequence_header:
          self.check_and_add_sequence(sequence_header, sequence)
          sequence_header = None
          sequence = ""
          
        sequence_header = line.rstrip()
      else:
        sequence += line.strip().strip("\x00")
        
      is_first_line = False
    
    if sequence_header:
      self.check_and_add_sequence(sequence_header, sequence)

