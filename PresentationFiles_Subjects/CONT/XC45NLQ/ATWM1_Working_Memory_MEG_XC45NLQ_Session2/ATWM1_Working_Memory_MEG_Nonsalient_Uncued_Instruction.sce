# ATWM1 MEG Experiment
                         
scenario = "ATWM1_Working_Memory_MEG_nonsalient_uncued_instruction";
#scenario_type = fMRI; # Fuer Scanner
#scenario_type = fMRI_emulation; # Zum Testen
scenario_type = trials;
#scan_period = 2000; # TR
#pulses_per_scan = 1;
#pulse_code = 1;
pulse_width=6;

active_buttons = 2;
response_matching = simple_matching;
button_codes = 10, 20;
default_font_size = 36;     
default_font  = "Arial"; 
default_background_color = 0 ,0 ,0 ;
write_codes=true; # for MEG only

begin;	

#Picture definitions   
box { height = 382; width = 382; color = 0, 0, 0;} frame1;
box { height = 369; width = 369; color = 255, 255, 255;} frame2;    
box { height = 30; width = 4; color = 0, 0, 0;} fix1;    
box { height = 4; width = 30; color = 0, 0, 0;} fix2;
box { height = 30; width = 4; color = 255, 0, 0;} fix3;    
box { height = 4; width = 30; color = 255, 0, 0;} fix4;  
box { height = 369; width = 369; color = 42, 42, 42;} background;

TEMPLATE "StimuliDeclaration.tem" {};


trial {
    trial_duration = 2000;
    sound sound_incorrect;
    
	picture {background_color = 0,0,0;
			 text { caption = "Falsch!"; background_color = 0,0,0;
			 font_size=50;};
			 x = 0; y =  0;
	};
		
    time = 0;
} wrong;

trial {
    trial_duration = 2000;
    sound sound_correct;
    
   	picture {background_color = 0,0,0;
		 text { caption = "Richtig!"; background_color = 0,0,0;
		 font_size=50;};
		 x = 0; y =  0;
	};
			 
    time = 0;
} right;

trial {
    trial_duration = 2000;
    sound sound_no_response;
    
    picture {background_color = 0,0,0;
			 text { caption = "Keine Reaktion!"; background_color = 0,0,0;
			 font_size=50;};
			 x = 0; y =  0;
	};
			 
    time = 0;
} miss;


# Instruction Slide 1
trial { 
   picture {
      text {
         caption = "In dieser Aufgabe wird meistens \nein nicht blinkendes Streifenmuster abgefragt.";
      } txt1;
      x = 0; y = 150;
      text {
          caption = "Es werden jedoch keine Positionen besonders markiert.";
      } txt2;
      x = 0; y = 0;
   } picIntro1;
   time = 0;  	
   duration = 10000;
   code = "Instruction_NS_UC"; 	 	 
};

# Instruction Slide 2
trial { 
   picture {
      text {
          caption = "Links: Veränderung";
      } txt3;
      x = 0; y = 150;      
      text {
          caption = "Rechts: Keine Veränderung";
      } txt4;
      x = 0; y = 0; 
   } picIntro2;
   time = 0;  	
   duration = 10000;
   code = "Instruction2"; 
};

# Instruction Slide 3
trial { 
	trial_type = first_response;
	incorrect_feedback = wrong;
   correct_feedback = right;
   no_response_feedback = miss;
   picture {
      text {
          caption = "Bitte drücken Sie die Taste für 'Veränderung'.";
      } txt5;
      x = 0; y = 0;      
   } picIntro3;
   time = 0;  	
   target_button = 1;  
	response_active = true;
   duration = response;
   code = "Instruction3"; 		 
};

# Instruction Slide 4
trial { 
	trial_type = first_response;
	incorrect_feedback = wrong;
   correct_feedback = right;
   no_response_feedback = miss;
   picture {
      text {
          caption = "Bitte drücken Sie die Taste für 'Keine Veränderung'.";
      } txt6;
      x = 0; y = 0;      
   } picIntro4;
   time = 0;  
	target_button = 2;  
	response_active = true;
	duration = response;
   code = "Instruction4"; 		 
};

# Instruction Slide 5
trial { 
	trial_type = first_response;
	incorrect_feedback = wrong;
   correct_feedback = right;
   no_response_feedback = miss;
   picture {
      text {
          caption = "Bitte drücken Sie die Taste für 'Veränderung'.";
      } txt7;
      x = 0; y = 0;      
   } picIntro5;
   time = 0;  	
   target_button = 1;  
	response_active = true;
   duration = response;
   code = "Instruction5"; 		 
};

# Instruction Slide 6
trial { 
	trial_type = first_response;
	incorrect_feedback = wrong;
   correct_feedback = right;
   no_response_feedback = miss;
   picture {
      text {
          caption = "Bitte drücken Sie die Taste für 'Keine Veränderung'.";
      } txt8;
      x = 0; y = 0;      
   } picIntro6;
   time = 0;  	
   target_button = 2;  
	response_active = true;
   duration = response;
   code = "Instruction4"; 		 
};

# Instruction Slide 7
trial { 
	trial_type = first_response;
	incorrect_feedback = wrong;
   correct_feedback = right;
   no_response_feedback = miss;
   picture {
      text {
          caption = "Bitte drücken Sie die Taste für 'Veränderung'.";
      } txt9;
      x = 0; y = 0;      
   } picIntro7;
   time = 0;  	
   target_button = 1;  
	response_active = true;
   duration = response;
   code = "Instruction3"; 		 
};

# Instruction Slide 8
trial { 
	trial_type = first_response;
	incorrect_feedback = wrong;
   correct_feedback = right;
   no_response_feedback = miss;
   picture {
      text {
          caption = "Bitte drücken Sie die Taste für 'Keine Veränderung'.";
      } txt10;
      x = 0; y = 0;      
   } picIntro8;
   time = 0;  	
   target_button = 2;  
   response_active = true;
   duration = response;
   code = "Instruction4"; 		 
};

# Instruction Slide 9
trial { 
   picture {
      text {
         caption = "In dieser Aufgabe wird meistens \nein nicht blinkendes Streifenmuster abgefragt.";
      } txt11;
      x = 0; y = 150;
      text {
          caption = "Es werden jedoch keine Positionen besonders markiert.";
      } txt12;
      x = 0; y = 0;
      text {
          caption = "Bitte machen Sie sich bereit, \ngleich beginnt ein kurzer Probelauf.";
      } txt13;
      x = 0; y = -150;      
   } picIntro9;
   time = 0;  	
   duration = 10000;
   code = "Instruction_NS_UC_TestTrials"; 	 	 
};

# baselinePre (before test trials)
trial { 
   picture {
      box frame1; x=0; y=0;
      box frame2; x=0; y=0;
		box background; x=0; y=0;
      bitmap fixation_cross_black; x=0; y=0;
   }default;	
   time = 0;  	
   duration = 2000;	
   #mri_pulse = 1;
   code = "BaselinePre"; 	
   port_code = 1;   
};    
       
               
TEMPLATE "ATWM1_Working_Memory_MEG.tem" {
trigger_encoding trigger_retrieval cue_time preparation_time encoding_time single_stimulus_presentation_time delay_time retrieval_time intertrial_interval alerting_cross   stim_enc1 stim_enc2 stim_enc3 stim_enc4 	stim_enc_alt1 stim_enc_alt2 stim_enc_alt3 stim_enc_alt4    trial_code   stim_retr1 stim_retr2 stim_retr3 stim_retr4   stim_cue1 stim_cue2 stim_cue3 stim_cue4 fixationcross_cued     retr_code    the_target_button   posX1 posY1 posX2 posY2 posX3 posY3 posX4 posY4;
   44    61   292   292   399   125  1742  2992  1992      fixation_cross    gabor_093 gabor_129 gabor_018 gabor_066    gabor_093 gabor_129_alt gabor_018_alt gabor_066      "2_1_Encoding_Working_Memory_MEG_P2_RL_Nonsalient_DoChange_CuedRetrieval_300_300_399_1750_3000_2000_gabor_patch_orientation_093_129_018_066_target_position_1_4_retrieval_position_1"       gabor_045_framed gabor_circ gabor_circ gabor_circ    blank blank blank blank    fixation_cross_white     "2_1_Retrieval_Working_Memory_MEG_P2_RL_Nonsalient_DoChange_CuedRetrieval_retrieval_patch_orientation_045_retrieval_position_1"   1    58.69 58.69 -58.69 58.69 -58.69 -58.69 58.69 -58.69;
   44    62   292   292   399   125  1892  2992  2042      fixation_cross    gabor_036 gabor_102 gabor_152 gabor_068    gabor_036 gabor_102 gabor_152_alt gabor_068_alt      "2_2_Encoding_Working_Memory_MEG_P2_RL_Nonsalient_NoChange_CuedRetrieval_300_300_399_1900_3000_2050_gabor_patch_orientation_036_102_152_068_target_position_1_2_retrieval_position_1"       gabor_036_framed gabor_circ gabor_circ gabor_circ    blank blank blank blank    fixation_cross_white     "2_2_Retrieval_Working_Memory_MEG_P2_RL_Nonsalient_NoChange_CuedRetrieval_retrieval_patch_orientation_036_retrieval_position_1"   2    58.69 58.69 -58.69 58.69 -58.69 -58.69 58.69 -58.69;
   44    62   292   292   399   125  1792  2992  1892      fixation_cross    gabor_037 gabor_142 gabor_157 gabor_125    gabor_037 gabor_142 gabor_157_alt gabor_125_alt      "2_3_Encoding_Working_Memory_MEG_P2_RL_Nonsalient_NoChange_CuedRetrieval_300_300_399_1800_3000_1900_gabor_patch_orientation_037_142_157_125_target_position_1_2_retrieval_position_1"       gabor_037_framed gabor_circ gabor_circ gabor_circ    blank blank blank blank    fixation_cross_white     "2_3_Retrieval_Working_Memory_MEG_P2_RL_Nonsalient_NoChange_CuedRetrieval_retrieval_patch_orientation_037_retrieval_position_1"   2    58.69 58.69 -58.69 58.69 -58.69 -58.69 58.69 -58.69;
   44    61   292   292   399   125  1842  2992  1942      fixation_cross    gabor_110 gabor_070 gabor_175 gabor_136    gabor_110 gabor_070 gabor_175_alt gabor_136_alt      "2_4_Encoding_Working_Memory_MEG_P2_RL_Nonsalient_DoChange_CuedRetrieval_300_300_399_1850_3000_1950_gabor_patch_orientation_110_070_175_136_target_position_1_2_retrieval_position_1"       gabor_155_framed gabor_circ gabor_circ gabor_circ    blank blank blank blank    fixation_cross_white     "2_4_Retrieval_Working_Memory_MEG_P2_RL_Nonsalient_DoChange_CuedRetrieval_retrieval_patch_orientation_155_retrieval_position_1"   1    58.69 58.69 -58.69 58.69 -58.69 -58.69 58.69 -58.69;

};

# baselinePost (after test trials)
trial {   
   picture {
      box frame1; x=0; y=0;
      box frame2; x=0; y=0;
		box background; x=0; y=0;
      bitmap fixation_cross_black; x=0; y=0;
      };	
   time = 0;  	
   duration = 2000;
   code = "BaselinePost"; 	 
   port_code = 2;  
}; 

# Instruction Slide 10
trial { 
   picture {
      text {
         caption = "Bitte machen Sie sich bereit, \ngleich beginnt die eigentliche Aufgabe.";
      } txt14;
      x = 0; y = 0;
      } picIntro10;
   time = 0;  	
   duration=5000;
   code = "Instruction_NS_UC"; 	
	 
};


