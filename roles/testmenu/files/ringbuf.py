#!/usr/bin/python3

class RingBuffer:def init(self, size):
self.size = size
self.buffer = []
self.index = 0

def add(self, number):
if number in self.buffer:
return False  # Nummer existiert bereits im Puffer
if len(self.buffer) < self.size:
self.buffer.append(number)
else:
self.buffer[self.index] = number
self.index = (self.index + 1) % self.size
return True

def str(self):
return str(self.buffer)

Erstellen eines Ringpuffers mit einer maximalen Größe von 100
ring_buffer = RingBuffer(100)

Beispielhafte Nutzung
numbers_to_add = [123456, 234567, 345678, 456789, 567890, 678901, 789012, 890123, 901234, 123456]

for number in numbers_to_add:
if ring_buffer.add(number):
print(f"Nummer {number} wurde dem Puffer hinzugefügt.")
else:
print(f"Nummer {number} existiert bereits im Puffer.")

print("Endgültiger Pufferzustand:", ring_buffer)
