/*
 *	PDCSTR.h
 *	Photron Device Control SDK
 *	Structure Definition
 *
 *	Copyright (C) 2006-2012 PHOTRON LIMITED
 */

#include	"PDCVALUE.h"
#include	<vfw.h>

#ifndef	_PDC_STR_H_
#define	_PDC_STR_H_

#pragma	pack(4)
/*
 *	Device detect structure
 */
typedef struct {
	/*	Device code	*/
	unsigned long	m_nDeviceCode;
	/*	Virtual device number(IP-address)	*/
	unsigned long	m_nTmpDeviceNo;
	/*	Interface code	*/
	unsigned long	m_nInterfaceCode;
} PDC_DETECT_INFO, *PPDC_DETECT_INFO;

/*
 *	Device detect integration structure
 */
typedef struct {
	/*	Detected device num	*/
	unsigned long	m_nDeviceNum;
	/*	Device detect structure	*/
	PDC_DETECT_INFO	m_DetectInfo[PDC_MAX_DEVICE];
} PDC_DETECT_NUM_INFO, *PPDC_DETECT_NUM_INFO;

/*
 *	Frame information
 */
typedef struct {
	long			m_nStart;	/*	Recording start frame number	*/
	long			m_nEnd;		/*	Recording end frame number	*/
	long			m_nTrigger;	/*	Trigger frame number	*/
	long			m_nTwoStageLowToHigh;	/*	Twostage LOW->HIGH frame number	*/
	long			m_nTwoStageHighToLow;	/*	Twostage HIGH->LOW frame number	*/
	unsigned long	m_nTwoStageTiming;		/*	Twostage LOW->HIGH timming	*/
	long			m_nEvent[10];		/*	Event frame number	*/
	unsigned long	m_nEventCount;		/*	Event frame count	*/
	unsigned long	m_nRecordedFrames;		/*	Recording frame quantity	*/
} PDC_FRAME_INFO, *PPDC_FRAME_INFO;

/*
 *	Image data information
 */
typedef struct {
	long			m_nWidth;
	long			m_nHeight;
	long			m_nBytePerLine;
	unsigned short	m_nRealBitPerPixel;
	long			m_nInterleave;	/* Buffer Interleave	*/
} PDC_IMAGE_BUFF_INFO, *PPDC_IMAGE_BUFF_INFO;

/*	Bayer Convert Information	*/
typedef struct {
	unsigned long	m_nMode;
	unsigned long	m_nDeviceCode;
	void*			m_pLUTR;
	void*			m_pLUTG;
	void*			m_pLUTB;
	unsigned long	m_nOutputInterleave;
	unsigned long	m_nEdgeEnhance;
	unsigned long	m_nColorTempR;
	unsigned long	m_nColorTempG;
	unsigned long	m_nColorTempB;
	long			m_nColorMatrixRR;
	long			m_nColorMatrixRG;
	long			m_nColorMatrixRB;
	long			m_nColorMatrixGR;
	long			m_nColorMatrixGG;
	long			m_nColorMatrixGB;
	long			m_nColorMatrixBR;
	long			m_nColorMatrixBG;
	long			m_nColorMatrixBB;
} PDC_BAYER_CONVERT_INFO, *PPDC_BAYER_CONVERT_INFO;

/*
 *	IRIG information
 */
typedef struct {
	unsigned long	m_nDayOfYear;	//	Day
	unsigned char	m_nHour;		//	Hour
	unsigned char	m_nMinute;		//	Minute
	unsigned char	m_nSecond;		//	Second
	unsigned long	m_nMicroSecond;	//	Micro second
	unsigned char	m_ExistSignal;	//	Presence of signal
	unsigned long	m_Reserve;		//	Reserved
} PDC_IRIG_INFO, *PPDC_IRIG_INFO;

/*
 *	MCDL information
 */
typedef struct {
	unsigned char	m_nDigital[10];	/*	Digital	*/
	double			m_nAnalogA[10];	/*	AnalogA	*/
	double			m_nAnalogB[10];	/*	AnalogB	*/
	double			m_nAnalogC[10];	/*	AnalogC	*/
	double			m_nAnalogD[10];	/*	AnalogD	*/
} PDC_MCDL_INFO, *PPDC_MCDL_INFO;

/*
 *	IRIG / MCDL information
 */
typedef struct {
	PDC_IRIG_INFO	m_IRIGInfo;	/*	IRIG	*/
	PDC_MCDL_INFO	m_MCDLInfo;	/*	MCDL	*/
} PDC_IRIGMCDL_INFO, *PPDC_IRIGMCDL_INFO;

/*
*	ADC information
*/
typedef struct {
	float			m_nAnalog1[10];	/*	Analog1	*/
	float			m_nAnalog2[10];	/*	Analog2	*/
} PDC_ADC_INFO, *PPDC_ADC_INFO;


/*
*	Auto Exposure information
*/
typedef struct {
	UINT32	m_nShutter;
} PDC_AUTO_EXPOSURE_INFO, *PPDC_AUTO_EXPOSURE_INFO;

/*
 *	Pre-LUT information
 */
typedef struct {
	long			m_nBrightnessR;
	long			m_nBrightnessG;
	long			m_nBrightnessB;
	long			m_nContrastR;
	long			m_nContrastG;
	long			m_nContrastB;
	double			m_nGainR;
	double			m_nGainG;
	double			m_nGainB;
	double			m_nGammaR;
	double			m_nGammaG;
	double			m_nGammaB;
	unsigned char	m_nPosiNegaR;
	unsigned char	m_nPosiNegaG;
	unsigned char	m_nPosiNegaB;
	unsigned char	m_nFreeMode;
} PDC_LUT_PARAMS, *PPDC_LUT_PARAMS;

/*
 *	AVI Frame Parameter
 */
typedef struct {
	long			m_nStart;
	long			m_nEnd;
	long			m_nTotal;
	long			m_nArea_start;
	long			m_nArea_end;
	long			m_nArea_total;
	long			m_nCurrent;
	long			m_nTrigger;
	long			m_nKey;
} PDC_AVI_FRAME_PARAMS, *PPDC_AVI_FRAME_PARAMS;

/*
 *	drop Frame List
 */
typedef struct pdc_drop_frame_list
{
  long			m_nFrame;		/* drop start frame number */
  unsigned long	m_nDropFrame;	/* number of dropped frame */
} PDC_DROP_FRAME_LIST, *PPDC_DROP_FRAME_LIST;

/* 
 * Original Image data Information
 */
typedef struct {
	unsigned long	m_nDeviceCode;
	unsigned long	m_nColorType;
	unsigned short	m_nBitDepth;
	unsigned long	m_nEffectiveBits;
	unsigned long	m_n8BitSel;
} PDC_ORG_IMAGE_INFO, *PPDC_ORG_IMAGE_INFO;

/*
 * Frame information
 */
typedef struct {
	long			m_nTrigger[1024];	/*	Trigger frame number	*/
	unsigned long	m_nTriggerCount;	/*	Trigger frame count		*/
} PDC_TRIGGER_FRAME_LIST, *PPDC_TRIGGER_FRAME_LIST;


/*
* Record Info for FAST Drive and SD Card
*/
typedef struct {
	unsigned short	m_nInfoVersion;
	unsigned short	m_nSysVersion;
	unsigned long	m_nDate;
	unsigned long	m_nTime;
	unsigned long	m_nCameraType;
	unsigned short	m_nHeadType;
	unsigned short	m_nHeadNo;
	unsigned short	m_nMaxHeadNum;
	unsigned long	m_nRecordRate;
	unsigned long	m_nShutterSpeed;
	unsigned long	m_nTriggerMode;
	unsigned long	m_nManualFrames;
	unsigned long	m_nRandomFrames;
	unsigned long	m_nRandomManualFrames;
	unsigned long	m_nRandomTimes;
	unsigned long	m_nTwoStageType;
	unsigned long	m_nTwoStageLHFrame;
	unsigned long	m_nTwoStageCycle;
	unsigned long	m_nTwoStageHLFrame;
	unsigned short	m_nColorTemperature;
	unsigned short	m_nColorBalanceR;
	unsigned short	m_nColorBalanceG;
	unsigned short	m_nColorBalanceB;
	unsigned short	m_nColorBalanceBase;
	unsigned short	m_nColorBalanceMax;
	unsigned long	m_nOriginalTotalFrames;
	unsigned long	m_nTotalFrames;
	long			m_nStartFrame;
	long			m_nTriggerFrame;
	unsigned long	m_nNumOfEvent;
	long			m_nEvent[10];
	unsigned short	m_nWidth;
	unsigned short	m_nHeight;
	unsigned short	m_nSensorPosX;
	unsigned short	m_nSensorPosY;
	unsigned short	m_nSensorWidth;
	unsigned short	m_nSensorHeight;
	unsigned short	m_nColorType;
	unsigned short	m_nColorBits;
	unsigned short	m_nEffectiveBitDepth;
	unsigned short	m_nEffectiveBitSide;
	unsigned long	m_nIRIGMode;
	unsigned long	m_nShutterType2;
	short			m_nColorMatrixRR;
	short			m_nColorMatrixRG;
	short			m_nColorMatrixRB;
	short			m_nColorMatrixGR;
	short			m_nColorMatrixGG;
	short			m_nColorMatrixGB;
	short			m_nColorMatrixBR;
	short			m_nColorMatrixBG;
	short			m_nColorMatrixBB;
	unsigned short	m_nLUTBits;
	unsigned short	m_nColorEnhance;
	unsigned short	m_nEdgeEnhance;
	unsigned long	m_nLUTMode;
	unsigned short	m_nDSShutter;
	unsigned short	m_nPolarization;
	unsigned short	m_nPolarizerConfig;
	unsigned short	m_nDigitsOfFileNumber;
	unsigned short	m_nPixelGainBase;
	unsigned short	m_nPixelGainBits;
	unsigned short	m_nShadingBits;
	unsigned short	m_nBayerPattern;
	unsigned short	m_nExposeTimeNum;
	unsigned short	m_nRecOnCmdTimes;
	unsigned short	m_nPixelGainParam;
	unsigned short	m_nReserve;
	char			m_pDataName[64];
	unsigned long	m_IrigSample;
	unsigned long	m_AEExposureTimeRecordMode;
	unsigned short	m_AEModeSet;
	unsigned short	m_nDAQMode;
	unsigned long	m_nDAQRange[2];
} PDC_RECORD_INFO, *PPDC_RECORD_INFO;

#pragma pack()
#endif	/*	_PDC_STR_H_	*/

