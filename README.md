# Position-Weight-Matrices - position weight matrix frequencies for Transcription Factor Binding Sites (TFBS)

The process of transcription, is influenced by the interaction of proteins called transcription factors (TFs) that bind to specific sites called Transcription Factor Binding Sites (TFBSs), which are proximal or distal to a transcription starting site. TFs generally have distinct binding preferences towards specific TFBSs, however TFs can tolerate variations in the target TFBS. Thus to model a TFBS, the nucleotides are weighted accordingly, to the tolerance of the TF. One common way to represent this is by using a position weight matrix (PWM), also called position-specific weight matrix (PSWM) or position-specific scoring matrix (PSSM), which is a commonly used representation of motifs (in our case TFBS) in biological sequences.

Here I have written a simple code for calculating PWM scores and creating sequence logos. 
