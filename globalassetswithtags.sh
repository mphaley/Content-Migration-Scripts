 echo "D.U.D."
 echo "DOWNLOAD UPLOAD DELETE"
 echo "(now with tags!)"




# echo "Please enter the following information..."
# echo "Subdomain:"
# read subdomain1
# echo "ClientID:"
# read clientid1
# echo "Secret:"
# read secret1

#################################
#start token timers
timer_tokenone=$SECONDS
timer_tokentwo=$SECONDS
#################################
#first token request
#################################
echo "first token: halyard" #(showpadmhtest)

raw_token=$(curl -X POST https://halyard.showpad.biz/api/v2/oauth2/token -H 'Authorization: Basic TTJObVlUUmlNbVptTkRRd1lUSTNNR015TlRneE5HUm1Nak5oTm1Gak9XSmhOMkl4TkRFM1pnPT06MmU1NjIxNzRlYWI2OTM2M2RkYTYyZDQ0YTVjZmE2ZGE2ZjYxZjhkOQ==' -H 'content-type: multipart/form-data' -F grant_type=password -F username=michael.haley@showpad.com -F password=Showpad1 | tr -d ' ')

access_token_1=$( echo "$raw_token" | jq -r .access_token) #
refresh_token_1=$( echo "$raw_token" | jq -r .refresh_token)
echo "the token ${access_token_1}"
#################################
#second token request
#################################
echo "Second Token: avanosmedical" #(mh)

raw_token_2=$(curl -X POST https://avanosmedical.showpad.biz/api/v2/oauth2/token -H 'Authorization: Basic WmpVMU5tRmpZVFJtWkRGaU9HRTBZVGd3TW1Sak9HVmhZemt3WVRWall6TmhORFZqWXpWaVl3PT06NGE4OGNmZTliMTZiYTgyZWU5MTM5NmM2NWJjZTQ5Njk5Y2Y5YTFjOA==' -H 'content-type: multipart/form-data' -F grant_type=password -F username=michael.haley@showpad.com -F password=Showpad1 | tr -d ' ')

access_token_2=$( echo "$raw_token_2" | jq -r .access_token)
refresh_token_2=$( echo "$raw_token_2" | jq -r .refresh_token)
echo "the token ${access_token_2}"
#################################
#################################

#generate a list of all assets under 1000 items
#getAssetIds=( $(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_1"'' 'https://showpadmhtest.showpad.biz/api/v3/assets.json?fields=id&isDownloadable=true&limit=1000' | jq .response.items[].id | tr -d \") )
IFS=$'\n' 
#echo "HERE IS GET ASSET IDS"
#echo "${getAssetIds[@]}"
# oldnames=("Abstract - Ahmed Case Rpt kyphosis post RF Spine Journal 2012.pdf"
# "Abstract - Kweon - Cervical Dorsal Rami and RFL- Pain Med 2014.pdf"
# "Abstract - Lord 1995 NEJM199612053352302.pdf"
# "Abstract - Lord rF in cervical z joints Neurosurgery 1995.pdf"
# "Abstract - Stoker Case Rpt Dropped Head BSD J of Spin Dis 2012.pdf"
# "Abstract - Cosman Factors Affecting Lesions Pain Medicine 2014.pdf"
# "Abstract - Ball - Science of Lesions.pdf"
# "Abstract - Salmasi - Application of CRF (Knee, Hip, SI).pdf"
# "Abstract - Wang - Injectate in Lesion Size for CRF.pdf"
# "Abstract - Vallejo - CRF vs Venom.pdf"
# "Abstract - Kawaguchi Percutaneous Radiofrequency Lesioning.pdf"
# "Abstract - Malik RF of Hip Pain Physician 2003.pdf"
# "Abstract - Rivera RF OA Hip.pdf"
# "A Cross-Sectional Survey on Prevalence and Risk Factors.pdf"
# "Abstract - Gossec - Non-Surgical - OA hip and knee 2010 TJR.pdf"
# "Abstract - Hamel - Post Surgery - OA hip and knee.pdf"
# "OA hip and knee.pdf"
# "Post Surgical Pain Prevalence.pdf"
# "Abstract - Application of cooled radiofrequency.pdf"
# "Abstract - Bellini M et al Cooled radiofrequency system relieves chronic knee.pdf"
# "Abstract - Cheng Complications of Injections Tech reg Anest 2007 (1).pdf"
# "Abstract - Choi, RF for Chronic Knee Osteoarthritis Pain 152 (2011) 481-487.pdf"
# "Abstract - Franco CD Innervation of the Anterior Capsule of the Human Knee  Implications for Radiofrequency Ablation.pdf"
# "Abstract - Ikeuchi Percutaneous RF for Anteromedial Pain Pain Med 2011;12;546-551.pdf"
# "Abstract - Karaman Pulsed RF for Knee J Chinese Med Assoc 2011.pdf"
# "Abstract - Menzies RD Analgesia and Improved Performance in a Patient Treated by Cooled Radiofrequency.pdf"
# "Abstract - Telhan - ASRA 2014.pdf"
# "Abstract - RF for Knee Pain Study Results 07May13.pdf"
# "Abstract - Rojhani - CRF for Knee OA.pdf"
# "ASRA 2016 OA Poster - 6 Month Genicular Poster 10142016.ppt"
# "ASRA 2016 OA Abstract - Cooled RF Superior to Steroid Injections.pdf"
# "Abstract - Bogduk et al -Pain Med - 10-6 - pp1035-1045 2009.pdf"
# "Abstract - Dreyfuss Pain Proc 2 pp 395-420 (2000).pdf"
# "Abstract - Dreyfuss Spine 25(10) pp 1270-1277 (2000).pdf"
# "Abstract - McCormick- CRFA for Lumbar - Phys Med Rehab 2015.pdf"
# "Abstract - Nath Zjoint RCT Spine 1976.pdf"
# "Abstract - Cohen - RCT RF for SIJ, Anesth 2008.pdf"
# "Abstract - Cohen_Outcome Predictors for SI Joint_Reg Anest Pain 2009.pdf"
# "Abstract - Cox Lateral Sacral Branch Anatomy - Pain Physician 2014.pdf"
# "Abstract - Dreyfuss_Multi-Site LBB for SIJ_Pain Medicine 2009.pdf"
# "Abstract - Dreyfuss_Single Site LBBs for SIJ_Pain Medicine 2008.pdf"
# "Abstract - Hansen_Systematic Eval of SIJ interventions_Pain Phys 2012.pdf"
# "Abstract - Ho_Singapore_20 pt SI Retro_2 Yrs_j Pain Research 2013.pdf"
# "Abstract - Kapural -  cRFA for the Sacroiliitis, First Case _WIP, Pain Practice 2008.pdf"
# "Abstract - Karaman SIJ_EU Journal of Neuro 2011.pdf"
# "Abstract - Patel Twelve Month follow up of a randomized trial assessing cooled radiofrequency denervation.pdf"
# "Abstract - Patel_Coastal RCT vs Sham 9 Mo data Pain Medicine 2012.pdf"
# "Abstract - Ramasubba, Cohen_cRFA for SI Cancer_Pain Physician 2013 (16,1-8).pdf"
# "Abstract - Roberts SIJ Innervation - Regional Anesthesia 2014.pdf"
# "Abstract - Stelzer_SI Retro_Pain Medicine 2012Dec28.pdf"
# "Abstract - Stolzenberg- Incidence of Neuropathic Pain after CRF ablation of Sacral Lateral Branch Nerves- Pain Medicine 2014.pdf"
# "Abstract - Vanelderen_SI J Pain, WIP, Pain Practice 2010.pdf"
# "Abstract - Yin_Sensory Guided SIJ RF_Spine 2003.pdf"
# "Abstract - Simopoulis - SIJ Systematic Review.pdf"
# "Abstract - Adams- Biomechanics of compression fractures_Arch Orth trauma 2011.pdf"
# "Abstract - Bogduk- Compression Fracture Pain_pain Medicine 2010 (1).pdf"
# "Abstract - Mitra-Facet pain in Thoracic Fracture_Pain Med 2010.pdf"
# "Abstract - Wilson-FJI before vertebroplasty_Eur Radiol 2011.pdf"
# "Absrtact - Kapural_Histology and temp map in discs_Pain Med 2008.pdf"
# "Abstract - Desai TD Temp Mapping Pain Physician 2015.pdf"
# "Abstract - Kapural-TD 12 month - Pain Medicine pp1-7 2014.pdf"
# "Abstract - Kapural_6 TD Pilot 6 Month_Pain Medicine 2008.pdf"
# "Abstract - Karaman_6 Mo. TD_Int J Med Sci 8(1) pp1-8 (2011).pdf"
# "Abstract - Lu Non-Op management of discogenic pain systematic review  Spine 2014.pdf"
# "Dr. Kapural IDB Poster_ASRA 2012.pptx.pptx"
# "TD 12-Month Paper_Pain Med 2016-Desai-pm.pdf"
# "Abstract - Desai - TD 12 Month Results.pdf"
# "COOLIEF* Static Brochure.pdf"
# "COOLIEF* Interactive Brochure.zip"

oldnames=("CAREfully Made Surgical Gowns.mp4"
"QuikBloc Brochure MK-00747.pdf"
"Dr. Fisk Total Knee MK-00422.mov"
"ON-Q Catheter & Introducer IFU 15-H1-763-0-00.pdf"
"ON-Q Pump with Fixed Flow Rate IFU 15-H1-775-0-00.pdf"
"QuikBloc OTN Catheter IFU 14-60-798-0-02.pdf"
"ON-Q Pump with Select-A-Flow & ONDEMAND IFU 15-H1-798-0-00.pdf"
"ON-Q Pump with Select-A-Flow IFU 15-H1-904-0-00.pdf"
"Competition Pumps_Jan2016 Ambu_LMA_DosiFuser.pdf"
"Competition ElecMech Pumps_Jan 2016_Ambit_InfuSystem.pdf"
"ON-Q Catheter Patient Guidelines 15-H1-841-0-00.pdf"
"ON-Q* QuikBloc* Sales Tool MK-00883.pdf"
"Orthopedic Surgery Pocket Guide MK-00717_Rev4.pdf"
"ON-Q Patient Video-SAF without Dial Instructions MK-00909.mp4"
"510K Letter - Havel's EchoTuohy Needle - K961152.pdf"
"Needles & Catheters Tab MK-00492 rev2.pdf"
"Clinical Summary Vaughan MK-00815.pdf"
"ON-Q T-bloc Tab MK-00491 rev2.pdf"
"PNB Therapy Brochure MK-00380 rev2.pdf"
"Raghavendra Clinical Article MK-00671.pdf"
"Sakai Article MK-00672.pdf"
"T-bloc Catheter Securement MK-00347 rev3.pdf"
"Dr. Bux Continuous Nerve Block MK-00419.mp4"
"Catheter Securement In-Service MK-00418.mp4"
"Internal Use Only - ON-Q T-bloc Training Deck.pdf"
"ON-Q* QuikBloc* Over-the-Needle Catheter - Supraclavicular MK-00784.mp4"
"Clinical Summary Frenk MK-00820.pdf"
"Educational Tools Tab MK-00490 rev1.pdf"
"Anesthesiologist Testimonial MK-00406.mp4"
"Internal Use Only - PNB Accessories Training Deck.pdf"
"Internal Use Only - Needle Catheter Cross Reference.pdf"
"Internal Use Only - T-bloc Tray Comparison.pdf"
"ON-Q Ordering Brochure MK-00315 rev2.pdf"
"ON-Q Clinical Bibliography MK-00493.pdf"
"Bagsby Clinical Article MK-00682.pdf"
"Hospital Pharmacy Review of Exparel MK-00683.pdf"
"2015 ASRA Poster Vaughan MK-00823.pdf"
"Complaint Reporting Card MK-00124 rev4.pdf"
"ON-Q Incisional Patient Brochure - Spanish MK-00323 rev1.pdf"
"Sentinel Event Alert - Article - MK-00436.pdf"
"ON-Q Pump FAQs MK-00813.pdf"
"Pharmacy Prefill - Advanced Pharma MK-00655 rev1.pdf"
"2015 ASRA Poster Kasper MK-00817.pdf"
"ONDEMAND Red Tab TB MK-00825_Rev1.pdf"
"Patient Brochure with New SAF MK-00866.pdf"
"Patient Brochure - ONDEMAND MK-00451 rev1.pdf"
"Patient Brochure - General MK-00453 rev1.pdf"
"Patient Brochure - Fixed Flow MK-00454 rev1.pdf"
"Patient Brochure - Catheter Removal MK-00456 rev1.pdf"
"ON-Q Patient Video-SAF MK-00841.mp4"
"MK-00842 ON-Q Patient Video-SAF & ONDEMAND.mp4"
"MK-00843 ON-Q Patient Video-ONDEMAND.mp4"
"MK-00844 ON-Q Patient Video-Fixed Flow.mp4"
"MK-00845 ON-Q Patient Video-Catheter Removal.mp4"
"ON-Q Incisional Brochure MK-00392 rev2.pdf"
"ON-Q Pumps Tab MK-00489 rev1.pdf"
"Trauma Brochure MK-00781.pdf"
"Clinical Summary Kasper MK-00817.pdf"
"Dr Lukins Testimonial MK-00407.mp4"
"Sherry Testimonial MK-00408.mov"
"Caesar Karen Testimonial MK-00409.mp4"
"Ronald Testimonial MK-00410.mp4"
"Dale Testimonial MK-00428.mp4"
"Linda Incisional Patient Video Mk-00434_.mp4"
"Laura Incisional Patient Video MK-00433.mov"
"Fill Port Sterility Testing TB MK-00005 rev3.pdf"
"ON-Q Latex Sensitivity TB MK-00004 rev2.pdf"
"Latex Bladder Color Variation TB MK-00008 rev3.pdf"
"Pump Filling Technique TB MK-00010 rev3.pdf"
"ON-Q with ONDEMAND TB MK-00011 rev3.pdf"
"Pump Priming,FFrate TB MK-00012 rev3.pdf"
"Chondrolysis TB MK-00015 rev1.pdf"
"Periop Autologous Trans TB MK-00016 rev1.pdf"
"Prior to Use Storage TB MK-00018 rev2.pdf"
"Pediatric TB MK-00020 rev3.pdf"
"Preventing Insitu Catheter Breakage TB MK-00021 rev3.pdf"
"Hand and Foot Surgery TB MK-00029 rev3.pdf"
"Storage Requirements SilverSoaker Catheters TB MK-00379 rev2.pdf"
"ON-Q in the MR Env TB MK-00462 rev1.pdf"
"SAF Drug Dose Info TB MK-00505 rev3.pdf"
"Storage Times on Flow Rate of Prefilled Pumps TB MK-00508 rev2.pdf"
"TB_Stability Data for Pain Management COPY-01840.pdf"
"DEHP in ON-Q Products MK-00516 rev2.pdf"
"Soft Shell Pump TB MK-00702 rev1.pdf"
"Thoracotomy Detterbeck MK-00085_Rev2.mp4"
"Dr. Fisk Hip Fracture MK-00420.mp4"
"Tunneling Approach MK-00435.mp4"
"ON-Q Pain Relief System MK-00442.mp4"
"ON-Q Dose CrossReference Card MK-00498 rev1.pdf"
"ON-Q Pump with ONDEMAND Nursing Assessment MK-00777 rev1.pdf"
"PNB Catheter Removal Nursing Assessment Form MK-00779.pdf"
"ON-Q Fixed Flow Pump Nursing Assessment MK-00780 rev1.pdf"
"ON-Q with SAF Quick Reference Card MK-00810.pdf"
"ON-Q Pump with New SAF & ONDEMAND Nursing Assessment MK-00811 rev1.pdf"
"ON-Q Pump with New SAF Nursing Assessment MK-00812 rev1.pdf"
"ON-Q Pump FAQs MK-00813.pdf"
"Nursing InService_New SAF presentation MK-00826 rev1.pdf"
"CPNB InService with New SAF presentation MK-00831.pdf"
"ON-Q with SAF Quick Reference Pocket-sized Card MK-00870.pdf"
"Patient Brochure - Combo New SAF MK-00872.pdf"
"CP_Transversus Abdominis - Gonzales COPY-01861.pdf"
"CP_Popliteal - Camp COPY-01813.pdf"
"CP_Szlyk_US Interscalene Block COPY-01480.pdf"
"COPY-01830  CP_Continuous TAP Block – Vaughan.pdf"
"CP_Thoracic Paravertebral Block - Auerbach COPY-01831.pdf"
"CP_ACL Reconstruction – Hickman COPY-01832.pdf"
"CP_Adductor Canal - Zimmerman COPY-01815.pdf"
"CP_Adductor Canal Block - Bommarito COPY-01814.pdf"
"CP_DaVinci Robotic CABG - Harrington COPY-01816.pdf"
"CP-Mitral Valve Repair - Owen COPY-01817.pdf"
"CP_Midline Laparotomy - Lamont COPY-01818.pdf"
"CP_C-Section - Adefris COPY-01819.pdf"
"CP_Breast Augmentation – Geldner COPY-01821.pdf"
"CP_Inguinal Hernia – Sanford COPY-01820.pdf"
"CP_Abdominoplasty – Geldner COPY-01823.pdf"
"CP_Mastectomy – Hadley COPY-01822.pdf"
"CP_Total Knee Arthroplasty – Mokris COPY-01825.pdf"
"CP_Total Hip Replacement – Britt COPY-01824.pdf"
"CP_Spinal Fusion – Mesiwala COPY-01826.pdf"
"Truitt Rib Fracture MK-00138_Rev2.mp4"
"CP_Rib Fracture – Truitt COPY-01827.pdf"
"Dr. Fisk Interscalene Procedure MK-00421.mov"
"ON-Q Patient Guidelines 15-H1-832-0-00.pdf"
"Challenger Corner,April 2016.jpg"
"Challenger Corner,May 2016.jpg"
"All Pumps CPNB ON-Q Nursing Inservice presentation MK-00831 rev1.pdf"
"ONDEMAND-SAF CPNB ON-Q Nursing Inservice presentation MK-00831 rev1.pdf"
"SAF CPNB ON-Q Nursing InService presentation MK-00831 rev1.pdf"
"Challenger Corner,March 2016.jpg"
"CP_Universal Tunneling Abdominal Approach – Saba COPY-01828.pdf"
"Duration of Therapy MK-00869 rev 1 TB.pdf"
"ON-Q Nursing Skills Checklist_all pumps MK-00906.pdf"
"MK-00826_rev1_Fixed Flow_Surgical Site ON-Q Nursing Inservice.pdf"
"MK-00826_rev1_Fixed Flow-SAF_Surgical Site ON-Q Nursing Inservice.pdf"
"MK-00826_rev1_SAF_Surgical Site ON-Q Nursing Inservice.pdf"
"MK-00818_rev1_Nursing Reference.pdf"
"Nerve Block Catheter Removal COPY-00608.pdf"
"ON-Q Trac Hospital Admin Infographic COPY-00668.pdf"
"ON-Q Trac Hospital Admin Sales Deck COPY-00670.pdf"
"ON-Q Trac Hospital Admin Talk Track COPY-00671.pdf"
"ON-Q Trac Physician Infographic COPY-00672.pdf"
"ON-Q Trac Physician Sales Deck COPY-00674.pdf"
"ON-Q Trac Physician Talk Track COPY-00675.pdf"
"ON-Q HA Sales Deck_PPT_090816_COPY-00703.pdf"
"ON-Q HA Talk Tracks_PDF_083116_ETQ Submission.pdf"
"ON-Q Solution Brochure COPY-00676_DRAFT.pdf"
"Pre Call Checklist 2.0 (10-7-16).docx"
"ON-Q HA Training Deck.pdf"
"Challenger Mock Sales Call.mp4"
"Internal HYH Online Ordering System Overview for Sales Reps_September 2016.pptx"
"Sales Rep and CSR Talking Points for Portal Online Ordering with Credit Card Option 9.12.16.docx"
"ON-Q Trac HIPAA COPY-00713.pdf"
"Form-24423 ON-Q TRAC Customer On-Boarding Letter v1.2.pdf"
"Dr. Saba Incisional Video MK-00432.mov"
"ON-Q HA Clinical Infographics COPY-00705.pdf"
"ON-Q HA Financial Infographic COPY-00708.pdf"
"Challenger Corner,June 2016.pdf"
"Challenger Corner,Sept 2016.pdf"
"ON-Q Patient Guidelines Multi-language 15-H1-825-0-00.pdf.pdf"
"CP_Valve Repair - Lamelas COPY-01829.pdf"
"Challenger Corner,November 2016.pdf"
"micmobALL.zip"
"CAREfully Made Exam Gloves.mp4"
"ASTM Specialty Surgical Mask Sell Sheet.pdf"
"ASTM Face Mask Infographic.pdf"
)


# oldtags=("EMEA,UKEN,Articles,CERVICAL"
# "EMEA,UKEN,Articles,CERVICAL"
# "EMEA,UKEN,Articles,CERVICAL"
# "EMEA,UKEN,Articles,CERVICAL"
# "EMEA,UKEN,Articles,CERVICAL"
# "EMEA,UKEN,Articles,CERVICAL,HIP,KNEE,LUMBAR,SACRUM,THORACIC,TRANSDISCAL"
# "EMEA,UKEN,Articles,CERVICAL,HIP,KNEE,LUMBAR,SACRUM,THORACIC,TRANSDISCAL"
# "EMEA,UKEN,Articles,CERVICAL,HIP,KNEE,LUMBAR,SACRUM,THORACIC,TRANSDISCAL"
# "EMEA,UKEN,Articles,CERVICAL,HIP,KNEE,LUMBAR,SACRUM,THORACIC,TRANSDISCAL"
# "EMEA,UKEN,Articles,CERVICAL,HIP,KNEE,LUMBAR,SACRUM,THORACIC,TRANSDISCAL,PMG"
# "EMEA,UKEN,Articles,HIP"
# "EMEA,UKEN,Articles,HIP"
# "EMEA,UKEN,Articles,HIP"
# "EMEA,UKEN,Articles,HIP,KNEE"
# "EMEA,UKEN,Articles,HIP,KNEE"
# "EMEA,UKEN,Articles,HIP,KNEE"
# "EMEA,UKEN,Articles,HIP,KNEE"
# "EMEA,UKEN,Articles,HIP,KNEE"
# "EMEA,UKEN,Articles,HIP,KNEE,SACRUM"
# "EMEA,UKEN,Articles,KNEE"
# "EMEA,UKEN,Articles,KNEE"
# "EMEA,UKEN,Articles,KNEE"
# "EMEA,UKEN,Articles,KNEE"
# "EMEA,UKEN,Articles,KNEE"
# "EMEA,UKEN,Articles,KNEE"
# "EMEA,UKEN,Articles,KNEE"
# "EMEA,UKEN,Articles,KNEE"
# "EMEA,UKEN,Articles,KNEE"
# "EMEA,UKEN,Articles,KNEE"
# "EMEA,UKEN,Articles,KNEE"
# "EMEA,UKEN,Articles,KNEE"
# "EMEA,UKEN,Articles,LUMBAR"
# "EMEA,UKEN,Articles,LUMBAR"
# "EMEA,UKEN,Articles,LUMBAR"
# "EMEA,UKEN,Articles,LUMBAR"
# "EMEA,UKEN,Articles,LUMBAR"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,SACRUM"
# "EMEA,UKEN,Articles,THORACIC"
# "EMEA,UKEN,Articles,THORACIC"
# "EMEA,UKEN,Articles,THORACIC"
# "EMEA,UKEN,Articles,THORACIC"
# "EMEA,UKEN,Articles,TRANSDISCAL"
# "EMEA,UKEN,Articles,TRANSDISCAL"
# "EMEA,UKEN,Articles,TRANSDISCAL"
# "EMEA,UKEN,Articles,TRANSDISCAL"
# "EMEA,UKEN,Articles,TRANSDISCAL"
# "EMEA,UKEN,Articles,TRANSDISCAL"
# "EMEA,UKEN,Articles,TRANSDISCAL"
# "EMEA,UKEN,Articles,TRANSDISCAL"
# "EMEA,UKEN,Articles,TRANSDISCAL"
# "EMEA,UKEN,Brochures,CERVICAL,HIP,KNEE,LUMBAR,SACRUM,THORACIC,TRANSDISCAL,PMG"
# "EMEA,UKEN,Brochures,CERVICAL,HIP,KNEE,LUMBAR,SACRUM,THORACIC,TRANSDISCAL,PMG"

oldtags=("ANZ,English,Surgical Gowns,AAMI 4 - MICROOOL*,India"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"APAC"
"Asia,cortrak,Distributor"
"Exam Gloves,PURPLE NITRILE*,STERLING*,LAVENDER*,Vinyl,India"
"Facial Protection,ASTM Masks,Asia"
"Facial Protection,ASTM Masks,Asia"
)

echo "Here's the first one, here we go! ${getAssetIds[0]}"

count=0

for id in ${oldnames[@]}
do
	#check token 1 refresh here
	###########################
	duration1=$(( SECONDS - timer_tokenone ))
	echo "Duration: ${duration1}"
	if [ ${duration1} -gt 2700 ]
	then
		echo "We're generating a new token y'all"
		#generate new token
		new_token1=$(curl -X POST https://halyard.showpad.biz/api/v2/oauth2/token -H 'Authorization: Basic TTJObVlUUmlNbVptTkRRd1lUSTNNR015TlRneE5HUm1Nak5oTm1Gak9XSmhOMkl4TkRFM1pnPT06MmU1NjIxNzRlYWI2OTM2M2RkYTYyZDQ0YTVjZmE2ZGE2ZjYxZjhkOQ==' -H 'content-type: multipart/form-data' -F grant_type=refresh_token -F refresh_token="$refresh_token_1" | tr -d ' ' )

		access_token_1=$( echo "$new_token1" | jq -r .access_token)
		refresh_token_1=$( echo "$new_token1" | jq -r .refresh_token)

		echo "new tokens:"
		echo "$access_token_1"
		echo "$refresh_token_1"

		#reset timer
		timer_tokenone=$SECONDS
	fi

	# #get the download link of the old asset
	# downloadLinks=$(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_1"'' 'https://showpadmhtest.showpad.biz/api/v3/assets/'"${id}"'.json?fields=shortLivedDownloadLink' | jq -r .response.shortLivedDownloadLink) 
	
	# #get the old asset's name
	# oldassetname=$(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_1"'' 'https://showpadmhtest.showpad.biz/api/v3/assets/'"${id}"'.json?fields=name' | jq -r .response.name)

	 # #get an array of tags
	 # oldtags=( $(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_1"'' 'https://showpadmhtest.showpad.biz/api/v3/assets/'"${id}"'.json?expand=tags' | jq -r .response.tags.items[].name) )

	# #global status of old asset
	# isglobal=$(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_1"'' 'https://showpadmhtest.showpad.biz/api/v3/assets/'"${id}"'.json?fields=isDivisionShared' | jq -r .response.isDivisionShared)
	# #echo "Global?: ${isglobal}"
	#echo "${id}"
	#rawdoc=$(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_1"'' 'https://halyard.showpad.biz/api/v3/assets/'"${id}"'.json?expand=tags&fields=shortLivedDownloadLink,name,tags,isDivisionShared,isShareable,isAnnotatable,archivedAt,isSensitive' )
	

	#get asset id using the name in avanos instance
	echo "before ${id}"
	unset thisname
	unset newid
	thisname=$(echo "${id}" | sed 's/ /%20/g' )
	thisname=$(echo "${thisname}" | sed 's/&/%26/g' )
	thisname=$(echo "${thisname}" | sed 's/+/%2B/g' )
#	thisname=$(echo "${thisname}" | sed 's/-/%2D/g' )
#	thisname=$(echo "${thisname}" | sed 's/./%2E/g' )


	#newid=$(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_2"'' 'https://avanosmedical.showpad.biz/api/v3/assets.json?name='"${thisname}"'' | jq -r .response.items[].id)
	echo "URL ready: ${thisname}"
	newid=$(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_2"'' 'https://avanos.showpad.biz/api/v3/divisions/3efaf0e6d0e19e6487e71a0f409c25c1/assets.json?name='"${thisname}"'' ) #| jq -r .response.items[].id)

	echo "after ${newid}"
	echo "PROCESS DOC"
	break
	# istrash=$(echo "$rawdoc" | jq -r .response.archivedAt)
	
	# if [ ${istrash} == "null" ]
	# then

	# 	downloadLinks=$( echo "$rawdoc" | jq -r .response.shortLivedDownloadLink)
	# 	echo "${downloadLinks}"
	# 	oldassetname=$( echo "$rawdoc" | jq -r .response.name)
	# 	echo "${oldassetname}"
		
	# 	unset oldtags
	# 	oldtags=$( echo "$rawdoc" | jq -r .response.tags.items[].name)
	# 	echo "${oldtags[@]}"

	# 	oldtags=( ${oldtags[@]} )
		
		
	# 	isglobal=$( echo "$rawdoc" | jq -r .response.isDivisionShared)
	# 	echo "${isglobal}"
	# 	sharable=$( echo "$rawdoc" | jq -r .response.isShareable)
	# 	echo "${sharable}"
	# 	isannotate=$( echo "$rawdoc" | jq -r .response.isAnnotatable)
	# 	echo "${isannotate}"
	# 	iskiosk=$( echo "$rawdoc" | jq -r .response.isSensitive)
		


	# 	echo "Download..."
	# 	wget "${downloadLinks}" -O "${oldassetname}"
	# 	echo "Now upload...."

		#check refresh token 2 here
		###########################
		duration2=$(( SECONDS - timer_tokentwo ))
			if [ $duration2 -gt 2700 ]
			then
				echo "We're generating that other new token y'all"
				#generate new token
				new_token2=$(curl -X POST https://avanosmedical.showpad.biz/api/v2/oauth2/token -H 'Authorization: Basic WmpVMU5tRmpZVFJtWkRGaU9HRTBZVGd3TW1Sak9HVmhZemt3WVRWall6TmhORFZqWXpWaVl3PT06NGE4OGNmZTliMTZiYTgyZWU5MTM5NmM2NWJjZTQ5Njk5Y2Y5YTFjOA==' -H 'content-type: multipart/form-data' -F grant_type=refresh_token -F refresh_token="$refresh_token_2" | tr -d ' ' )

				access_token_2=$( echo "$new_token2" | jq -r .access_token)
				refresh_token_2=$( echo "$new_token2" | jq -r .refresh_token)
				
				echo "new tokens:"
				echo "$access_token_2"
				echo "$refresh_token_2"

				#reset timer
				timer_tokentwo=$SECONDS
			fi

		#gather new tag IDs
		IFS=$',' 
		#echo "${index[id]}"
		unset tags

		tags=( "${oldtags[${count}]}" )

		echo "${tags[@]}"
		#echo "Tags: ${tags[@]}"
		taglink="<"

		for tid in ${tags[@]}
		do
			echo "Tag: ${tid}"
			thistag=$(echo "${tid}" | sed 's/ /%20/g' )
			thistag=$(echo "${thistag}" | sed 's/&/%26/g' )
			thistag=$(echo "${thistag}" | sed 's/+/%2B/g' )
			echo "processed tag ${thistag} "

			onetag=$(curl -X GET --header 'Accept: application/json' --header 'Authorization: Bearer '"$access_token_2"'' 'https://avanos.showpad.biz/api/v3/divisions/84fac3c59cbab4e884ee9943c389c772/tags.json?name='"${thistag}"'' | jq -r .response.items[].id)
			taglink="${taglink}${onetag}>; rel=\"Tag\",<"

		done

		#remove last two characters ",<" of taglink variable for next call
		taglink2=${taglink%?}
		taglinkfinal=${taglink2%?}
		#echo "FINAL TAGS READY FOR CALL: ${taglinkfinal}"
		
		
		echo "$taglinkfinal"
		
		#oldassetname=$(echo "${oldassetname}" | sed 's/,/%2C/g')
		#oldassetname=$(echo "${oldassetname}" | sed 's/+/%2B/g')

		#upload that sucka'!
		#upload=$(curl -X POST --header 'Content-Type: multipart/form-data' --header 'Accept: application/json' --header 'Link: '"$taglinkfinal"'' --header 'Authorization: Bearer '"$access_token_2"'' 'https://avanosmedical.showpad.biz/api/v3/divisions/3efaf0e6d0e19e6487e71a0f409c25c1/assets.json' -F 'file=@"'"$oldassetname"'"' -F 'isDivisionShared='"$isglobal"'' -F 'isShareable='"$sharable"'' -F 'isAnnotatable='"$isannotate"'' -F 'isSensitive='"$iskiosk"'')

		#LINK NEW DIVISION TAGS
		echo "heres the id ${newid}"


		upload=$(curl -X LINK --header 'Accept: application/json' --header 'Link: '"$taglinkfinal"'' --header 'Authorization: Bearer '"$access_token_2"'' 'https://avanosmedical.showpad.biz/api/v3/assets/'"${newid}"'.json')


		 echo "${upload}"
		 error=$(echo "${upload}" | jq -r .meta.code)
		
		 echo "${error}"
		if [[ ${error} != "200" ]]
			then
			echo "This file FAILED TO TAG. ID: ${newid} name: ${thisname}"
			echo "${id}" >> errorlogglobaltags.txt
		fi
		
		# echo "Delete..."
		# rm "${oldassetname}"


	#else	
	#	echo "This file is TRASH: ${id}"
	#fi

	echo "end of loop"

	count=$((count + 1))
	

done


