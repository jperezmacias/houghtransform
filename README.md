# Hough MATLAB GUI

This MATLAB code defines a graphical user interface (GUI) for performing Hough circle detection on an input image. The GUI allows the user to load an image and detect circles using the Hough transform with different radii.

![results](/img/results.png "Results")

## How to Use

1. Run the MATLAB script to open the GUI window.
2. Load an image using the "File" menu or by clicking the "Open" button.
3. Select the image processing parameters using the editable fields:
   - Edit4: Minimum circle radius
   - Edit5: Maximum circle radius
   - Edit6: Threshold for circle detection
4. Click the "Detect Circles" button (pushbutton1) to perform the Hough circle detection.
5. The detected circles will be plotted on the image.

## GUI Functions

- `hough`: The main function that initializes the GUI and handles GUI events.
- `hough_OpeningFcn`: Executes when the GUI is opened and sets up the initial plot.
- `hough_OutputFcn`: Returns the output of the GUI to the command line.
- `pushbutton1_Callback`: Executes when the "Detect Circles" button is clicked and performs circle detection.
- `FileMenu_Callback`: Executes when the "File" menu is accessed.
- `OpenMenuItem_Callback`: Executes when the "Open" menu item is selected to open an image file.
- `PrintMenuItem_Callback`: Executes when the "Print" menu item is selected to print the GUI figure.
- `CloseMenuItem_Callback`: Executes when the "Close" menu item is selected to close the GUI.
- `popupmenu1_Callback`: Executes when the popup menu selection is changed.
- `popupmenu1_CreateFcn`: Executes during the creation of the popup menu.
- `edit4_Callback`: Executes when the value in Edit4 is changed.
- `edit4_CreateFcn`: Executes during the creation of Edit4.
- `edit5_Callback`: Executes when the value in Edit5 is changed.
- `edit5_CreateFcn`: Executes during the creation of Edit5.
- `edit6_Callback`: Executes when the value in Edit6 is changed.
- `edit6_CreateFcn`: Executes during the creation of Edit6.
- `edgedetect2`: Function that performs edge detection on the input image and plots the detected circles.

## Dependencies

The code uses the MATLAB Image Processing Toolbox functions for edge detection (Canny edge detection) and Hough transform.

Note: To use this GUI, you need to have MATLAB and the Image Processing Toolbox installed.

## Authors

The GUI was created by Martin Turesson and Jose M. Pérez-Macias.

## Date

Last modified by GUIDE v2.5 on 11th December 2007.

Please make sure to properly attribute the authors and respect the license terms if applicable.
