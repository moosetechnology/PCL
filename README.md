# PCL

A Programmable Logic Controller is an industrial computer that has been ruggedized and adapted for the control of manufacturing processes.
As such, TPLCs are computers tolerant of more severe environmental conditions (such as dust, moisture, heat, cold).

Programmable logic controllers are intended to be used by engineers without a programming background.
As a consequence, a graphical programming language called *ladder logic* was first developed for programming PLCs.
The [IEC 61131-3](https://en.wikipedia.org/wiki/IEC_61131-3) defines three graphical and two textual programming language standards:
- Ladder diagram (LD), graphical
- Function block diagram (FBD), graphical
- Structured text (ST), textual
- Sequential function chart (SFC), has elements to organize programs for sequential and parallel control processing, graphical.
- Instruction list (IL), textual. Note: Deprecated in the third edition (2013) and removed in the fourth edition (2025).

This project contains parsers for these languages

## Loading

```st
Metacello new
  baseline: 'SCLParser';
  repository: 'github://moosetechnology/PCL';
	onConflict: [ :ex | ex allow ];
  load.
```

## Parsers

ST parser: There is a parser for Siemens' SCL language
`SCLProject on: '/path/to/SCL-files/'`

*Note: This parser was created with the help of Claude Sonnet (4.6)*
