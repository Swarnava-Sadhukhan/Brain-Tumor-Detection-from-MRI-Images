Objective - Detection of Brain Tumor from MRI Scan Images using Image Processing in Matlab

Workflow-	First we read an image of MRI scan and then use Matlab's inbuilt function,i.e Anisodiff function to filter and preprocess the image.
		Then we resize the preprocessed image and convert it to grayscale.
		Then we use a mean value of the grayscale image to binarize it,i.e. make the pixel either white or black.
		Then we use the 'regionprops' property in Matlab's Image Processing Toolbox to find Solidity, Area and Bounding Box of the image elements.
		Then we find the Bounding Box with the maximum area. For a tumor, this area must exceed a certainn threshold value. This is used to detect tumors.
		If tumor is detected, then the Bounding Box around the tumor is displayed and the tumor is outlined.
		Then allthe images are displayed.
		In case of no tumor exceeding the size of threshold area, an appropriate message is displayed.
		
	