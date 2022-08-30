- equality operators


RUnning code:
- 3 stages
  - compilation  (creating object files)
  - elaboration  (tool making the structure)
  - simualtion   (running the code)
     


M1 
  - M2, M3
       - M4, M5, M6, M7
           - M8, M9, M10...M20

We can elaborator at any hierarchy

- If I elaborator at M1, all initial & always blocks inside M1 & modules below
  M1 will start automatically(but not one above them)

If I elaborate at M4, initial & alwyas of M1, M2,M3, M5, M6, M7 will not run

