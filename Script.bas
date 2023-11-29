Attribute VB_Name = "Module1"
Sub Testing()

Dim ws As Excel.Worksheet
For Each ws In Worksheets
ws.Activate


Dim lastRow As Long
lastRow = Range("A1").End(xlDown).Row

Dim Ticker As Long
Ticker = 2

Dim oprice, cprice As Double
oprice = Cells(2, 3).Value
cprice = 0

Dim total As LongLong
total = 0

For I = 2 To lastRow
If Cells(I + 1, 1).Value = Cells(I, 1).Value Then
    total = total + Cells(I, 7).Value
   
ElseIf Cells(I + 1, 1).Value <> Cells(I, 1).Value Then
total = total + Cells(I, 7).Value

Cells(Ticker, 12).Value = total
Cells(Ticker, 9).Value = Cells(I, 1).Value
cprice = Cells(I, 6).Value

Cells(Ticker, 10).Value = cprice - oprice
If Cells(Ticker, 10).Value >= 0 Then
    Cells(Ticker, 10).Interior.ColorIndex = 4
Else
Cells(Ticker, 10).Interior.ColorIndex = 3
End If

Cells(Ticker, 11).Value = Cells(Ticker, 10).Value / oprice
oprice = Cells(I + 1, 3).Value
Ticker = Ticker + 1
total = 0

End If

Next I



Range("I1").Value = "Ticker"
Range("J1").Value = "Yearly Change"
Range("K1").Value = "Percent Change"
Range("L1").Value = "Total Stock Volume"

Range("N2").Value = "Greatest %Increase"
Range("N3").Value = "Greatest%Decrease"
Range("N4").Value = "Greatest Total Volume"

Range("O1").Value = "Ticker"
Range("P1").Value = "Value"


lastRow = Range("A1").End(xlDown).Row



Dim GI, GD As Double
Dim GV As LongLong

Dim GIT, GDT, GVT As String

GI = Cells(2, 11).Value
GD = Cells(2, 11).Value
GV = Cells(2, 12).Value
GIT = Cells(2, 9).Value
GDT = Cells(2, 9).Value
GVT = Cells(2, 9).Value


 For J = 2 To lastRow

If Cells(J + 1, 12).Value > GV Then

GV = Cells(J + 1, 12).Value
GVT = Cells(J + 1, 9).Value


 End If
 
 Next J

For I = 2 To lastRow

 
 If Cells(I + 1, 11).Value > GI Then
 
 GI = Cells(I + 1, 11).Value
GIT = Cells(I + 1, 9).Value

ElseIf Cells(I + 1, 11).Value > GD Then
 
 GD = Cells(I + 1, 11).Value
GDT = Cells(I + 1, 9).Value

End If

Next I
Range("O2").Value = GIT
Range("O3").Value = GDT
Range("O4").Value = GVT
Range("P2").Value = GI
Range("P3").Value = GD
Range("P4").Value = GV
Next ws

End Sub

