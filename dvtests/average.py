import sys

timesum = 0
n = 0
try:
  for line in sys.stdin:
    if line.startswith('Analyzing'):
      if n:
        print(timesum/n)
      print(line)
      timesum = 0
      n = 0
    if line.startswith('real'):
      time = line.split()[1].strip().rstrip('s')
      (min, sec) = time.split('m')
      min = int(min)
      sec = float(sec)
      timesum += min*60 + sec
      n += 1
except EOFError:
  pass

if n:
  print(timesum/n)
