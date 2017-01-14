Return-path: <jic23@kernel.org>
Subject: Re: [PATCH 6/7] mfd/iio: move the AB8500 GPADC to IIO
To: Linus Walleij <linus.walleij@linaro.org>, Lee Jones
 <lee.jones@linaro.org>, linux-iio@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, Guenter Roeck <linux@roeck-us.net>
References: <20170110234745.29691-1-linus.walleij@linaro.org>
 <20170110234745.29691-7-linus.walleij@linaro.org>
From: Jonathan Cameron <jic23@kernel.org>
Cc: Mboumba Cedric Madianga <cedric.madianga@gmail.com>,
 linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
Message-ID: <dd39e709-a07e-55e7-87f1-fe53a4a7e276@kernel.org>
Date: Sat, 14 Jan 2017 15:57:34 +0000
MIME-Version: 1.0
In-Reply-To: <20170110234745.29691-7-linus.walleij@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On 10/01/17 23:47, Linus Walleij wrote:
> The AB8500 GPADC driver is indeed a "general purpose ADC" driver,
> and while the IIO subsystem did not exist when the driver was
> first merged, it is never too late to clean things up and move it
> to the right place.
> 
> We have to cut a bunch of debugfs luggage to make this transition
> swift, but all these files to is read out the raw values of the
> ADC and the IIO subsystem already has a standard sysfs ABI for
> doing exactly this: no debugfs is needed.
> 
> We convert the present driver to IIO in the move.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Hmm. This is going to be tricky to review in this form...
Hence I'm going to paste in the result of applying the patches and review
that as if it were a new driver.

I'm sticking clear of the debugfs interface on the basis that if people
were happy with it before, it's smaller than it was but nothing new
added.

Various minor bits and pieces and questions inline.

Jonathan
> /*
>  * Copyright (C) ST-Ericsson SA 2010
>  *
>  * License Terms: GNU General Public License v2
>  * Author: Arun R Murthy <arun.murthy@stericsson.com>
>  * Author: Daniel Willerud <daniel.willerud@stericsson.com>
>  * Author: Johan Palsson <johan.palsson@stericsson.com>
>  * Author: Linus Walleij <linus.walleij@linaro.org>
>  */
> #include <linux/init.h>
> #include <linux/iio/iio.h>
> #include <linux/iio/sysfs.h>
> #include <linux/module.h>
> #include <linux/device.h>
> #include <linux/interrupt.h>
> #include <linux/spinlock.h>
Not immediately seeing any spinlocks.

> #include <linux/delay.h>
> #include <linux/pm_runtime.h>
> #include <linux/platform_device.h>
> #include <linux/completion.h>
> #include <linux/regulator/consumer.h>
> #include <linux/err.h>
> #include <linux/slab.h>
> #include <linux/mfd/abx500.h>
> #include <linux/mfd/abx500/ab8500.h>
> 
> /* GPADC source: From datasheet(ADCSwSel[4:0] in GPADCCtrl2
>  * and ADCHwSel[4:0] in GPADCCtrl3 ) */
Multiline comment syntax please.

This lot look like they might be well represented by an enum?
> #define BAT_CTRL		0x01
> #define BTEMP_BALL		0x02
> #define MAIN_CHARGER_V		0x03
> #define ACC_DETECT1		0x04
> #define ACC_DETECT2		0x05
> #define ADC_AUX1		0x06
> #define ADC_AUX2		0x07
> #define MAIN_BAT_V		0x08
> #define VBUS_V			0x09
> #define MAIN_CHARGER_C		0x0A
> #define USB_CHARGER_C		0x0B
> #define BK_BAT_V		0x0C
> #define DIE_TEMP		0x0D
> #define USB_ID			0x0E
> #define XTAL_TEMP		0x12
> #define VBAT_TRUE_MEAS		0x13
> #define BAT_CTRL_AND_IBAT	0x1C
> #define VBAT_MEAS_AND_IBAT	0x1D
> #define VBAT_TRUE_MEAS_AND_IBAT	0x1E
> #define BAT_TEMP_AND_IBAT	0x1F
> 
> /* Virtual channel used only for ibat convertion to ampere
>  * Battery current conversion (ibat) cannot be requested as a single conversion
>  *  but it is always in combination with other input requests
>  */
> #define IBAT_VIRTUAL_CHANNEL		0xFF
> 
> #define SAMPLE_1        1
> #define SAMPLE_4        4
> #define SAMPLE_8        8
> #define SAMPLE_16       16
Loose the above. They add no meaning.

> #define RISING_EDGE     0
> #define FALLING_EDGE    1
If it's one or the other then why not just have a boolean variable called
RISING_EDGE instead?

Actually I don't think these are used anywhere any more...
> 
> /* Arbitrary ADC conversion type constants */
> #define ADC_SW				0
> #define ADC_HW				1
Enum, or a boolean if it's a case of one or the other.
> 
> /*
>  * GPADC register offsets
>  * Bank : 0x0A
>  */
> #define AB8500_GPADC_CTRL1_REG		0x00
> #define AB8500_GPADC_CTRL2_REG		0x01
> #define AB8500_GPADC_CTRL3_REG		0x02
> #define AB8500_GPADC_AUTO_TIMER_REG	0x03
> #define AB8500_GPADC_STAT_REG		0x04
> #define AB8500_GPADC_MANDATAL_REG	0x05
> #define AB8500_GPADC_MANDATAH_REG	0x06
> #define AB8500_GPADC_AUTODATAL_REG	0x07
> #define AB8500_GPADC_AUTODATAH_REG	0x08
> #define AB8500_GPADC_MUX_CTRL_REG	0x09
> #define AB8540_GPADC_MANDATA2L_REG	0x09
> #define AB8540_GPADC_MANDATA2H_REG	0x0A
> #define AB8540_GPADC_APEAAX_REG		0x10
> #define AB8540_GPADC_APEAAT_REG		0x11
> #define AB8540_GPADC_APEAAM_REG		0x12
> #define AB8540_GPADC_APEAAH_REG		0x13
> #define AB8540_GPADC_APEAAL_REG		0x14
> 
> /*
>  * OTP register offsets
>  * Bank : 0x15
>  */
> #define AB8500_GPADC_CAL_1	0x0F
> #define AB8500_GPADC_CAL_2	0x10
> #define AB8500_GPADC_CAL_3	0x11
> #define AB8500_GPADC_CAL_4	0x12
> #define AB8500_GPADC_CAL_5	0x13
> #define AB8500_GPADC_CAL_6	0x14
> #define AB8500_GPADC_CAL_7	0x15
> /* New calibration for 8540 */
> #define AB8540_GPADC_OTP4_REG_7	0x38
> #define AB8540_GPADC_OTP4_REG_6	0x39
> #define AB8540_GPADC_OTP4_REG_5	0x3A
> 
> /* gpadc constants */
I'd prefer these to all be prefixed so as to avoid clashes in future..
AVG_1 for example is way too generic!
> #define EN_VINTCORE12		0x04
> #define EN_VTVOUT		0x02
> #define EN_GPADC		0x01
> #define DIS_GPADC		0x00
> #define AVG_1			0x00
> #define AVG_4			0x20
> #define AVG_8			0x40
> #define AVG_16			0x60
> #define ADC_SW_CONV		0x04
> #define EN_ICHAR		0x80
> #define BTEMP_PULL_UP		0x08
> #define EN_BUF			0x40
> #define DIS_ZERO		0x00
> #define GPADC_BUSY		0x01
> #define EN_FALLING		0x10
> #define EN_TRIG_EDGE		0x02
> #define EN_VBIAS_XTAL_TEMP	0x02
Might be nice to drop any of these that aren't used.
> 
> /* GPADC constants from AB8500 spec, UM0836 */
> #define ADC_RESOLUTION		1024
> #define ADC_CH_BTEMP_MIN	0
> #define ADC_CH_BTEMP_MAX	1350
> #define ADC_CH_DIETEMP_MIN	0
> #define ADC_CH_DIETEMP_MAX	1350
> #define ADC_CH_CHG_V_MIN	0
> #define ADC_CH_CHG_V_MAX	20030
> #define ADC_CH_ACCDET2_MIN	0
> #define ADC_CH_ACCDET2_MAX	2500
> #define ADC_CH_VBAT_MIN		2300
> #define ADC_CH_VBAT_MAX		4800
> #define ADC_CH_CHG_I_MIN	0
> #define ADC_CH_CHG_I_MAX	1500
> #define ADC_CH_BKBAT_MIN	0
> #define ADC_CH_BKBAT_MAX	3200
> 
> /* GPADC constants from AB8540 spec */
> #define ADC_CH_IBAT_MIN		(-6000) /* mA range measured by ADC for ibat */
> #define ADC_CH_IBAT_MAX		6000
> #define ADC_CH_IBAT_MIN_V	(-60)	/* mV range measured by ADC for ibat */
> #define ADC_CH_IBAT_MAX_V	60
> #define IBAT_VDROP_L		(-56)  /* mV */
> #define IBAT_VDROP_H		56
> 
> /* This is used to not lose precision when dividing to get gain and offset */
> #define CALIB_SCALE		1000
> /*
>  * Number of bits shift used to not lose precision
>  * when dividing to get ibat gain.
>  */
> #define CALIB_SHIFT_IBAT	20
> 
> /* Time in ms before disabling regulator */
> #define GPADC_AUDOSUSPEND_DELAY		1
> 
> #define CONVERSION_TIME			500 /* ms */
> 
> enum cal_channels {
> 	ADC_INPUT_VMAIN = 0,
> 	ADC_INPUT_BTEMP,
> 	ADC_INPUT_VBAT,
> 	ADC_INPUT_IBAT,
> 	NBR_CAL_INPUTS,
> };
> 
> /**
>  * struct adc_cal_data - Table for storing gain and offset for the calibrated
>  * ADC channels
>  * @gain:		Gain of the ADC channel
>  * @offset:		Offset of the ADC channel
Full docs
>  */
> struct adc_cal_data {
> 	s64 gain;
> 	s64 offset;
> 	u16 otp_calib_hi;
> 	u16 otp_calib_lo;
> };
> 
> /**
>  * struct ab8500_gpadc_chan_info - per-channel GPADC info
>  * @name: name of the channel
>  * @id: the internal AB8500 ID number for the channel
Full docs ideally.
>  */
> struct ab8500_gpadc_chan_info {
> 	const char *name;
> 	u8 id;
> 	u8 avg_sample;
> 	u8 trig_edge;
> 	u8 trig_timer;
> 	u8 conv_type;
> };
> 
> 
> /**
>  * struct ab8500_gpadc - AB8500 GPADC device information
>  * @dev:			pointer to the struct device
>  * @ab8500:			pointer to the struct ab8500
>  * @nchans:			number of IIO channels
>  * @chans:			Internal channel information container
>  * @iio_chans:			IIO channels
>  * @ab8500_gpadc_complete:	pointer to the struct completion, to indicate
>  *				the completion of gpadc conversion
>  * @ab8500_gpadc_lock:		structure of type mutex
>  * @regu:			pointer to the struct regulator
>  * @irq_sw:			interrupt number that is used by gpadc for Sw
>  *				conversion
>  * @irq_hw:			interrupt number that is used by gpadc for Hw
>  *				conversion
>  * @cal_data			array of ADC calibration data structs
>  */
> struct ab8500_gpadc {
> 	struct device *dev;
> 	struct ab8500 *ab8500;
> 	unsigned int nchans;
> 	struct ab8500_gpadc_chan_info *chans;
> 	struct iio_chan_spec *iio_chans;
With a small reorganization the iio_chan_spec and nchans entries can
just be in the struct iio_dev rather than both places.

> 	struct completion ab8500_gpadc_complete;
> 	struct mutex ab8500_gpadc_lock;
> 	struct regulator *regu;
> 	int irq_sw;
> 	int irq_hw;
> 	struct adc_cal_data cal_data[NBR_CAL_INPUTS];
> };
> 
> static struct ab8500_gpadc_chan_info *
> ab8500_gpadc_get_channel(struct ab8500_gpadc *gpadc, u8 chan)
> {
> 	struct ab8500_gpadc_chan_info *ch;
> 	int i;
> 
> 	for (i = 0; i < gpadc->nchans; i++) {
> 		ch = &gpadc->chans[i];
> 		if (ch->id == chan)
> 			break;
> 	}
> 	if (i == gpadc->nchans)
> 		return NULL;
> 
> 	return ch;
> }
> 
> /**
>  * ab8500_gpadc_ad_to_voltage() - Convert a raw ADC value to a voltage
>  */
> static int ab8500_gpadc_ad_to_voltage(struct ab8500_gpadc *gpadc, u8 channel,
> 	int ad_value)
> {
> 	int res;
> 
> 	switch (channel) {
> 	case MAIN_CHARGER_V:
> 		/* For some reason we don't have calibrated data */
There is a lot of support for this case, without an explanation of why
it might happen.
> 		if (!gpadc->cal_data[ADC_INPUT_VMAIN].gain) {
> 			res = ADC_CH_CHG_V_MIN + (ADC_CH_CHG_V_MAX -
> 				ADC_CH_CHG_V_MIN) * ad_value /
> 				ADC_RESOLUTION;
> 			break;
> 		}
> 		/* Here we can use the calibrated data */
> 		res = (int) (ad_value * gpadc->cal_data[ADC_INPUT_VMAIN].gain +
> 			gpadc->cal_data[ADC_INPUT_VMAIN].offset) / CALIB_SCALE;
> 		break;
> 
> 	case XTAL_TEMP:
> 	case BAT_CTRL:
> 	case BTEMP_BALL:
> 	case ACC_DETECT1:
> 	case ADC_AUX1:
> 	case ADC_AUX2:
> 		/* For some reason we don't have calibrated data */
> 		if (!gpadc->cal_data[ADC_INPUT_BTEMP].gain) {
> 			res = ADC_CH_BTEMP_MIN + (ADC_CH_BTEMP_MAX -
> 				ADC_CH_BTEMP_MIN) * ad_value /
> 				ADC_RESOLUTION;
> 			break;
> 		}
> 		/* Here we can use the calibrated data */
> 		res = (int) (ad_value * gpadc->cal_data[ADC_INPUT_BTEMP].gain +
> 			gpadc->cal_data[ADC_INPUT_BTEMP].offset) / CALIB_SCALE;
> 		break;
> 
> 	case MAIN_BAT_V:
> 	case VBAT_TRUE_MEAS:
> 		/* For some reason we don't have calibrated data */
> 		if (!gpadc->cal_data[ADC_INPUT_VBAT].gain) {
> 			res = ADC_CH_VBAT_MIN + (ADC_CH_VBAT_MAX -
> 				ADC_CH_VBAT_MIN) * ad_value /
> 				ADC_RESOLUTION;
> 			break;
> 		}
> 		/* Here we can use the calibrated data */
> 		res = (int) (ad_value * gpadc->cal_data[ADC_INPUT_VBAT].gain +
> 			gpadc->cal_data[ADC_INPUT_VBAT].offset) / CALIB_SCALE;
> 		break;
> 
> 	case DIE_TEMP:
> 		res = ADC_CH_DIETEMP_MIN +
> 			(ADC_CH_DIETEMP_MAX - ADC_CH_DIETEMP_MIN) * ad_value /
> 			ADC_RESOLUTION;
> 		break;
> 
> 	case ACC_DETECT2:
> 		res = ADC_CH_ACCDET2_MIN +
> 			(ADC_CH_ACCDET2_MAX - ADC_CH_ACCDET2_MIN) * ad_value /
> 			ADC_RESOLUTION;
> 		break;
> 
> 	case VBUS_V:
> 		res = ADC_CH_CHG_V_MIN +
> 			(ADC_CH_CHG_V_MAX - ADC_CH_CHG_V_MIN) * ad_value /
> 			ADC_RESOLUTION;
> 		break;
> 
> 	case MAIN_CHARGER_C:
> 	case USB_CHARGER_C:
> 		res = ADC_CH_CHG_I_MIN +
> 			(ADC_CH_CHG_I_MAX - ADC_CH_CHG_I_MIN) * ad_value /
> 			ADC_RESOLUTION;
> 		break;
> 
> 	case BK_BAT_V:
> 		res = ADC_CH_BKBAT_MIN +
> 			(ADC_CH_BKBAT_MAX - ADC_CH_BKBAT_MIN) * ad_value /
> 			ADC_RESOLUTION;
> 		break;
> 
> 	case IBAT_VIRTUAL_CHANNEL:
> 		/* For some reason we don't have calibrated data */
> 		if (!gpadc->cal_data[ADC_INPUT_IBAT].gain) {
> 			res = ADC_CH_IBAT_MIN + (ADC_CH_IBAT_MAX -
> 				ADC_CH_IBAT_MIN) * ad_value /
> 				ADC_RESOLUTION;
> 			break;
> 		}
> 		/* Here we can use the calibrated data */
> 		res = (int) (ad_value * gpadc->cal_data[ADC_INPUT_IBAT].gain +
> 				gpadc->cal_data[ADC_INPUT_IBAT].offset)
> 				>> CALIB_SHIFT_IBAT;
> 		break;
> 
> 	default:
> 		dev_err(gpadc->dev,
> 			"unknown channel, not possible to convert\n");
> 		res = -EINVAL;
> 		break;
> 
> 	}
> 	return res;
> }
> 
> static int ab8500_gpadc_read(struct ab8500_gpadc *gpadc, u8 channel,
> 			     u8 avg_sample, u8 trig_edge,
> 			     u8 trig_timer, u8 conv_type,
> 			     int *ibat)
> {
> 	int ret;
> 	int looplimit = 0;
> 	unsigned long completion_timeout;
> 	u8 val, low_data, high_data, low_data2, high_data2;
> 	u8 val_reg1 = 0;
> 	unsigned int delay_min = 0;
> 	unsigned int delay_max = 0;
> 	u8 data_low_addr, data_high_addr;
> 
> 	if (!gpadc)
> 		return -ENODEV;
> 
> 	/* check if convertion is supported */
conversion?
> 	if ((gpadc->irq_sw < 0) && (conv_type == ADC_SW))
> 		return -ENOTSUPP;
> 	if ((gpadc->irq_hw < 0) && (conv_type == ADC_HW))
> 		return -ENOTSUPP;
> 
> 	mutex_lock(&gpadc->ab8500_gpadc_lock);
> 	/* Enable VTVout LDO this is required for GPADC */
> 	pm_runtime_get_sync(gpadc->dev);
> 
> 	/* Check if ADC is not busy, lock and proceed */
> 	do {
> 		ret = abx500_get_register_interruptible(gpadc->dev,
> 			AB8500_GPADC, AB8500_GPADC_STAT_REG, &val);
> 		if (ret < 0)
> 			goto out;
> 		if (!(val & GPADC_BUSY))
> 			break;
> 		msleep(20);
> 	} while (++looplimit < 10);
> 	if (looplimit >= 10 && (val & GPADC_BUSY)) {
> 		dev_err(gpadc->dev, "gpadc_conversion: GPADC busy");
> 		ret = -EINVAL;
> 		goto out;
> 	}
> 
> 	/* Enable GPADC */
> 	val_reg1 |= EN_GPADC;
> 
> 	/* Select the channel source and set average samples */
> 	switch (avg_sample) {
> 	case SAMPLE_1:
> 		val = channel | AVG_1;
> 		break;
> 	case SAMPLE_4:
> 		val = channel | AVG_4;
> 		break;
> 	case SAMPLE_8:
> 		val = channel | AVG_8;
> 		break;
> 	default:
> 		val = channel | AVG_16;
> 		break;
> 	}
> 
> 	if (conv_type == ADC_HW) {
> 		ret = abx500_set_register_interruptible(gpadc->dev,
> 				AB8500_GPADC, AB8500_GPADC_CTRL3_REG, val);
> 		val_reg1 |= EN_TRIG_EDGE;
> 		if (trig_edge)
> 			val_reg1 |= EN_FALLING;
> 	} else
> 		ret = abx500_set_register_interruptible(gpadc->dev,
> 				AB8500_GPADC, AB8500_GPADC_CTRL2_REG, val);
> 	if (ret < 0) {
> 		dev_err(gpadc->dev,
> 			"gpadc_conversion: set avg samples failed\n");
> 		goto out;
> 	}
> 
> 	/*
> 	 * Enable ADC, buffering, select rising edge and enable ADC path
> 	 * charging current sense if it needed, ABB 3.0 needs some special
> 	 * treatment too.
> 	 */
> 	switch (channel) {
> 	case MAIN_CHARGER_C:
> 	case USB_CHARGER_C:
> 		val_reg1 |= EN_BUF | EN_ICHAR;
> 		break;
> 	case BTEMP_BALL:
> 		if (!is_ab8500_2p0_or_earlier(gpadc->ab8500)) {
> 			val_reg1 |= EN_BUF | BTEMP_PULL_UP;
> 			/*
> 			* Delay might be needed for ABB8500 cut 3.0, if not,
> 			* remove when hardware will be availible
> 			*/
> 			delay_min = 1000; /* Delay in micro seconds */
> 			delay_max = 10000; /* large range optimises sleepmode */
> 			break;
> 		}
> 		/* Intentional fallthrough */
> 	default:
> 		val_reg1 |= EN_BUF;
> 		break;
> 	}
> 
> 	/* Write configuration to register */
> 	ret = abx500_set_register_interruptible(gpadc->dev,
> 		AB8500_GPADC, AB8500_GPADC_CTRL1_REG, val_reg1);
> 	if (ret < 0) {
> 		dev_err(gpadc->dev,
> 			"gpadc_conversion: set Control register failed\n");
> 		goto out;
> 	}
> 
> 	if (delay_min != 0)
> 		usleep_range(delay_min, delay_max);
> 
> 	if (conv_type == ADC_HW) {
> 		/* Set trigger delay timer */
> 		ret = abx500_set_register_interruptible(gpadc->dev,
> 			AB8500_GPADC, AB8500_GPADC_AUTO_TIMER_REG, trig_timer);
> 		if (ret < 0) {
> 			dev_err(gpadc->dev,
> 				"gpadc_conversion: trig timer failed\n");
> 			goto out;
> 		}
> 		completion_timeout = 2 * HZ;
> 		data_low_addr = AB8500_GPADC_AUTODATAL_REG;
> 		data_high_addr = AB8500_GPADC_AUTODATAH_REG;
> 	} else {
> 		/* Start SW conversion */
> 		ret = abx500_mask_and_set_register_interruptible(gpadc->dev,
> 			AB8500_GPADC, AB8500_GPADC_CTRL1_REG,
> 			ADC_SW_CONV, ADC_SW_CONV);
> 		if (ret < 0) {
> 			dev_err(gpadc->dev,
> 				"gpadc_conversion: start s/w conv failed\n");
> 			goto out;
> 		}
> 		completion_timeout = msecs_to_jiffies(CONVERSION_TIME);
> 		data_low_addr = AB8500_GPADC_MANDATAL_REG;
> 		data_high_addr = AB8500_GPADC_MANDATAH_REG;
> 	}
> 
> 	/* wait for completion of conversion */
> 	if (!wait_for_completion_timeout(&gpadc->ab8500_gpadc_complete,
> 			completion_timeout)) {
> 		dev_err(gpadc->dev,
> 			"timeout didn't receive GPADC conv interrupt\n");
> 		ret = -EINVAL;
> 		goto out;
> 	}
> 
> 	/* Read the converted RAW data */
> 	ret = abx500_get_register_interruptible(gpadc->dev,
> 			AB8500_GPADC, data_low_addr, &low_data);
> 	if (ret < 0) {
> 		dev_err(gpadc->dev, "gpadc_conversion: read low data failed\n");
> 		goto out;
> 	}
> 
> 	ret = abx500_get_register_interruptible(gpadc->dev,
> 		AB8500_GPADC, data_high_addr, &high_data);
> 	if (ret < 0) {
> 		dev_err(gpadc->dev, "gpadc_conversion: read high data failed\n");
> 		goto out;
> 	}
> 
> 	/* Check if double convertion is required */
> 	if ((channel == BAT_CTRL_AND_IBAT) ||
Some of this indenting seems a bit random...
> 			(channel == VBAT_MEAS_AND_IBAT) ||
> 			(channel == VBAT_TRUE_MEAS_AND_IBAT) ||
> 			(channel == BAT_TEMP_AND_IBAT)) {
> 
> 		if (conv_type == ADC_HW) {
> 			/* not supported */
> 			ret = -ENOTSUPP;
> 			dev_err(gpadc->dev,
> 				"gpadc_conversion: only SW double conversion supported\n");
> 			goto out;
> 		} else {
> 			/* Read the converted RAW data 2 */
> 			ret = abx500_get_register_interruptible(gpadc->dev,
> 				AB8500_GPADC, AB8540_GPADC_MANDATA2L_REG,
> 				&low_data2);
> 			if (ret < 0) {
> 				dev_err(gpadc->dev,
> 					"gpadc_conversion: read sw low data 2 failed\n");
> 				goto out;
> 			}
> 
> 			ret = abx500_get_register_interruptible(gpadc->dev,
> 				AB8500_GPADC, AB8540_GPADC_MANDATA2H_REG,
> 				&high_data2);
> 			if (ret < 0) {
> 				dev_err(gpadc->dev,
> 					"gpadc_conversion: read sw high data 2 failed\n");
> 				goto out;
> 			}
> 			if (ibat != NULL) {
> 				*ibat = (high_data2 << 8) | low_data2;
> 			} else {
> 				dev_warn(gpadc->dev,
> 					"gpadc_conversion: ibat not stored\n");
> 			}
> 
> 		}
> 	}
> 
> 	/* Disable GPADC */
> 	ret = abx500_set_register_interruptible(gpadc->dev, AB8500_GPADC,
> 		AB8500_GPADC_CTRL1_REG, DIS_GPADC);
> 	if (ret < 0) {
> 		dev_err(gpadc->dev, "gpadc_conversion: disable gpadc failed\n");
> 		goto out;
> 	}
> 
> 	/* Disable VTVout LDO this is required for GPADC */
> 	pm_runtime_mark_last_busy(gpadc->dev);
> 	pm_runtime_put_autosuspend(gpadc->dev);
> 
> 	mutex_unlock(&gpadc->ab8500_gpadc_lock);
> 
> 	return (high_data << 8) | low_data;
> 
> out:
> 	/*
> 	 * It has shown to be needed to turn off the GPADC if an error occurs,
> 	 * otherwise we might have problem when waiting for the busy bit in the
> 	 * GPADC status register to go low. In V1.1 there wait_for_completion
> 	 * seems to timeout when waiting for an interrupt.. Not seen in V2.0
> 	 */
> 	(void) abx500_set_register_interruptible(gpadc->dev, AB8500_GPADC,
> 		AB8500_GPADC_CTRL1_REG, DIS_GPADC);
> 	pm_runtime_put(gpadc->dev);
> 	mutex_unlock(&gpadc->ab8500_gpadc_lock);
> 	dev_err(gpadc->dev,
> 		"gpadc_conversion: Failed to AD convert channel %d\n", channel);
> 	return ret;
> }
> 
> /**
>  * ab8500_bm_gpadcconvend_handler() - isr for gpadc conversion completion
>  * @irq:	irq number
>  * @data:	pointer to the data passed during request irq
>  *
>  * This is a interrupt service routine for gpadc conversion completion.
>  * Notifies the gpadc completion is completed and the converted raw value
>  * can be read from the registers.
>  * Returns IRQ status(IRQ_HANDLED)

These interrupts are marked as shared... Sure if they are shared they
are not always ours?  In which case shouldn't we sometimes not be
returning IRQ_HANDLED?

Or are we using an interrupt that can only have one function at any
given moment?

>  */
> static irqreturn_t ab8500_bm_gpadcconvend_handler(int irq, void *data)
> {
> 	struct ab8500_gpadc *gpadc = data;
> 
> 	complete(&gpadc->ab8500_gpadc_complete);
> 
> 	return IRQ_HANDLED;
> }
> 
> static int otp_cal_regs[] = {
> 	AB8500_GPADC_CAL_1,
> 	AB8500_GPADC_CAL_2,
> 	AB8500_GPADC_CAL_3,
> 	AB8500_GPADC_CAL_4,
> 	AB8500_GPADC_CAL_5,
> 	AB8500_GPADC_CAL_6,
> 	AB8500_GPADC_CAL_7,
> };
> 
> static int otp4_cal_regs[] = {
> 	AB8540_GPADC_OTP4_REG_7,
> 	AB8540_GPADC_OTP4_REG_6,
> 	AB8540_GPADC_OTP4_REG_5,
> };
> 
> static void ab8500_gpadc_read_calibration_data(struct ab8500_gpadc *gpadc)
> {
> 	int i;
> 	int ret[ARRAY_SIZE(otp_cal_regs)];
> 	u8 gpadc_cal[ARRAY_SIZE(otp_cal_regs)];
> 	int ret_otp4[ARRAY_SIZE(otp4_cal_regs)];
> 	u8 gpadc_otp4[ARRAY_SIZE(otp4_cal_regs)];
> 	int vmain_high, vmain_low;
> 	int btemp_high, btemp_low;
> 	int vbat_high, vbat_low;
> 	int ibat_high, ibat_low;
> 	s64 V_gain, V_offset, V2A_gain, V2A_offset;
> 	struct ab8500 *ab8500;
> 
> 	ab8500 = gpadc->ab8500;
This is only used in one place.  Cleaner not to bother with the local
variable.

> 
> 	/* First we read all OTP registers and store the error code */
> 	for (i = 0; i < ARRAY_SIZE(otp_cal_regs); i++) {
> 		ret[i] = abx500_get_register_interruptible(gpadc->dev,
> 			AB8500_OTP_EMUL, otp_cal_regs[i],  &gpadc_cal[i]);
> 		if (ret[i] < 0)
> 			dev_err(gpadc->dev, "%s: read otp reg 0x%02x failed\n",
> 				__func__, otp_cal_regs[i]);
Error out rather than ploughing on regardless?

> 	}
> 
> 	/*
> 	 * The ADC calibration data is stored in OTP registers.
> 	 * The layout of the calibration data is outlined below and a more
> 	 * detailed description can be found in UM0836
> 	 *
> 	 * vm_h/l = vmain_high/low
> 	 * bt_h/l = btemp_high/low
> 	 * vb_h/l = vbat_high/low
> 	 *
> 	 * Data bits 8500/9540:
> 	 * | 7	   | 6	   | 5	   | 4	   | 3	   | 2	   | 1	   | 0
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 * |						   | vm_h9 | vm_h8
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 * |		   | vm_h7 | vm_h6 | vm_h5 | vm_h4 | vm_h3 | vm_h2
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 * | vm_h1 | vm_h0 | vm_l4 | vm_l3 | vm_l2 | vm_l1 | vm_l0 | bt_h9
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 * | bt_h8 | bt_h7 | bt_h6 | bt_h5 | bt_h4 | bt_h3 | bt_h2 | bt_h1
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 * | bt_h0 | bt_l4 | bt_l3 | bt_l2 | bt_l1 | bt_l0 | vb_h9 | vb_h8
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 * | vb_h7 | vb_h6 | vb_h5 | vb_h4 | vb_h3 | vb_h2 | vb_h1 | vb_h0
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 * | vb_l5 | vb_l4 | vb_l3 | vb_l2 | vb_l1 | vb_l0 |
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 *
> 	 * Data bits 8540:
> 	 * OTP2
> 	 * | 7	   | 6	   | 5	   | 4	   | 3	   | 2	   | 1	   | 0
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 * |
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 * | vm_h9 | vm_h8 | vm_h7 | vm_h6 | vm_h5 | vm_h4 | vm_h3 | vm_h2
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 * | vm_h1 | vm_h0 | vm_l4 | vm_l3 | vm_l2 | vm_l1 | vm_l0 | bt_h9
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 * | bt_h8 | bt_h7 | bt_h6 | bt_h5 | bt_h4 | bt_h3 | bt_h2 | bt_h1
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 * | bt_h0 | bt_l4 | bt_l3 | bt_l2 | bt_l1 | bt_l0 | vb_h9 | vb_h8
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 * | vb_h7 | vb_h6 | vb_h5 | vb_h4 | vb_h3 | vb_h2 | vb_h1 | vb_h0
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 * | vb_l5 | vb_l4 | vb_l3 | vb_l2 | vb_l1 | vb_l0 |
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 *
> 	 * Data bits 8540:
> 	 * OTP4
> 	 * | 7	   | 6	   | 5	   | 4	   | 3	   | 2	   | 1	   | 0
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 * |					   | ib_h9 | ib_h8 | ib_h7
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 * | ib_h6 | ib_h5 | ib_h4 | ib_h3 | ib_h2 | ib_h1 | ib_h0 | ib_l5
> 	 * |.......|.......|.......|.......|.......|.......|.......|.......
> 	 * | ib_l4 | ib_l3 | ib_l2 | ib_l1 | ib_l0 |
> 	 *
> 	 *
> 	 * Ideal output ADC codes corresponding to injected input voltages
> 	 * during manufacturing is:
> 	 *
> 	 * vmain_high: Vin = 19500mV / ADC ideal code = 997
> 	 * vmain_low:  Vin = 315mV   / ADC ideal code = 16
> 	 * btemp_high: Vin = 1300mV  / ADC ideal code = 985
> 	 * btemp_low:  Vin = 21mV    / ADC ideal code = 16
> 	 * vbat_high:  Vin = 4700mV  / ADC ideal code = 982
> 	 * vbat_low:   Vin = 2380mV  / ADC ideal code = 33
> 	 */
> 
> 	if (is_ab8540(ab8500)) {
> 		/* Calculate gain and offset for VMAIN if all reads succeeded*/
When would they not succeed?
> 		if (!(ret[1] < 0 || ret[2] < 0)) {
> 			vmain_high = (((gpadc_cal[1] & 0xFF) << 2) |
> 				((gpadc_cal[2] & 0xC0) >> 6));
> 			vmain_low = ((gpadc_cal[2] & 0x3E) >> 1);
> 
> 			gpadc->cal_data[ADC_INPUT_VMAIN].otp_calib_hi =
> 				(u16)vmain_high;
> 			gpadc->cal_data[ADC_INPUT_VMAIN].otp_calib_lo =
> 				(u16)vmain_low;
> 
> 			gpadc->cal_data[ADC_INPUT_VMAIN].gain = CALIB_SCALE *
> 				(19500 - 315) / (vmain_high - vmain_low);
> 			gpadc->cal_data[ADC_INPUT_VMAIN].offset = CALIB_SCALE *
> 				19500 - (CALIB_SCALE * (19500 - 315) /
> 				(vmain_high - vmain_low)) * vmain_high;
> 		} else {
> 		gpadc->cal_data[ADC_INPUT_VMAIN].gain = 0;
> 		}
> 
> 		/* Read IBAT calibration Data */
> 		for (i = 0; i < ARRAY_SIZE(otp4_cal_regs); i++) {
> 			ret_otp4[i] = abx500_get_register_interruptible(
> 					gpadc->dev, AB8500_OTP_EMUL,
> 					otp4_cal_regs[i],  &gpadc_otp4[i]);
> 			if (ret_otp4[i] < 0)
> 				dev_err(gpadc->dev,
> 					"%s: read otp4 reg 0x%02x failed\n",
> 					__func__, otp4_cal_regs[i]);
> 		}
> 
> 		/* Calculate gain and offset for IBAT if all reads succeeded */
> 		if (!(ret_otp4[0] < 0 || ret_otp4[1] < 0 || ret_otp4[2] < 0)) {
> 			ibat_high = (((gpadc_otp4[0] & 0x07) << 7) |
> 				((gpadc_otp4[1] & 0xFE) >> 1));
> 			ibat_low = (((gpadc_otp4[1] & 0x01) << 5) |
> 				((gpadc_otp4[2] & 0xF8) >> 3));
> 
> 			gpadc->cal_data[ADC_INPUT_IBAT].otp_calib_hi =
> 				(u16)ibat_high;
> 			gpadc->cal_data[ADC_INPUT_IBAT].otp_calib_lo =
> 				(u16)ibat_low;
> 
> 			V_gain = ((IBAT_VDROP_H - IBAT_VDROP_L)
> 				<< CALIB_SHIFT_IBAT) / (ibat_high - ibat_low);
> 
> 			V_offset = (IBAT_VDROP_H << CALIB_SHIFT_IBAT) -
> 				(((IBAT_VDROP_H - IBAT_VDROP_L) <<
> 				CALIB_SHIFT_IBAT) / (ibat_high - ibat_low))
> 				* ibat_high;
> 			/*
> 			 * Result obtained is in mV (at a scale factor),
> 			 * we need to calculate gain and offset to get mA
> 			 */
> 			V2A_gain = (ADC_CH_IBAT_MAX - ADC_CH_IBAT_MIN)/
> 				(ADC_CH_IBAT_MAX_V - ADC_CH_IBAT_MIN_V);
> 			V2A_offset = ((ADC_CH_IBAT_MAX_V * ADC_CH_IBAT_MIN -
> 				ADC_CH_IBAT_MAX * ADC_CH_IBAT_MIN_V)
> 				<< CALIB_SHIFT_IBAT)
> 				/ (ADC_CH_IBAT_MAX_V - ADC_CH_IBAT_MIN_V);
> 
> 			gpadc->cal_data[ADC_INPUT_IBAT].gain =
> 				V_gain * V2A_gain;
> 			gpadc->cal_data[ADC_INPUT_IBAT].offset =
> 				V_offset * V2A_gain + V2A_offset;
> 		} else {
> 			gpadc->cal_data[ADC_INPUT_IBAT].gain = 0;
> 		}
> 
> 		dev_dbg(gpadc->dev, "IBAT gain %llu offset %llu\n",
> 			gpadc->cal_data[ADC_INPUT_IBAT].gain,
> 			gpadc->cal_data[ADC_INPUT_IBAT].offset);
> 	} else {
> 		/* Calculate gain and offset for VMAIN if all reads succeeded */
> 		if (!(ret[0] < 0 || ret[1] < 0 || ret[2] < 0)) {
> 			vmain_high = (((gpadc_cal[0] & 0x03) << 8) |
> 				((gpadc_cal[1] & 0x3F) << 2) |
> 				((gpadc_cal[2] & 0xC0) >> 6));
> 			vmain_low = ((gpadc_cal[2] & 0x3E) >> 1);
> 
> 			gpadc->cal_data[ADC_INPUT_VMAIN].otp_calib_hi =
> 				(u16)vmain_high;
> 			gpadc->cal_data[ADC_INPUT_VMAIN].otp_calib_lo =
> 				(u16)vmain_low;
> 
> 			gpadc->cal_data[ADC_INPUT_VMAIN].gain = CALIB_SCALE *
> 				(19500 - 315) / (vmain_high - vmain_low);
> 
> 			gpadc->cal_data[ADC_INPUT_VMAIN].offset = CALIB_SCALE *
> 				19500 - (CALIB_SCALE * (19500 - 315) /
> 				(vmain_high - vmain_low)) * vmain_high;
> 		} else {
> 			gpadc->cal_data[ADC_INPUT_VMAIN].gain = 0;
> 		}
> 	}
> 
> 	/* Calculate gain and offset for BTEMP if all reads succeeded */
> 	if (!(ret[2] < 0 || ret[3] < 0 || ret[4] < 0)) {
> 		btemp_high = (((gpadc_cal[2] & 0x01) << 9) |
> 			(gpadc_cal[3] << 1) | ((gpadc_cal[4] & 0x80) >> 7));
> 		btemp_low = ((gpadc_cal[4] & 0x7C) >> 2);
> 
> 		gpadc->cal_data[ADC_INPUT_BTEMP].otp_calib_hi = (u16)btemp_high;
> 		gpadc->cal_data[ADC_INPUT_BTEMP].otp_calib_lo = (u16)btemp_low;
> 
> 		gpadc->cal_data[ADC_INPUT_BTEMP].gain =
> 			CALIB_SCALE * (1300 - 21) / (btemp_high - btemp_low);
> 		gpadc->cal_data[ADC_INPUT_BTEMP].offset = CALIB_SCALE * 1300 -
> 			(CALIB_SCALE * (1300 - 21) / (btemp_high - btemp_low))
> 			* btemp_high;
> 	} else {
> 		gpadc->cal_data[ADC_INPUT_BTEMP].gain = 0;
> 	}
> 
> 	/* Calculate gain and offset for VBAT if all reads succeeded */
> 	if (!(ret[4] < 0 || ret[5] < 0 || ret[6] < 0)) {
> 		vbat_high = (((gpadc_cal[4] & 0x03) << 8) | gpadc_cal[5]);
> 		vbat_low = ((gpadc_cal[6] & 0xFC) >> 2);
> 
> 		gpadc->cal_data[ADC_INPUT_VBAT].otp_calib_hi = (u16)vbat_high;
> 		gpadc->cal_data[ADC_INPUT_VBAT].otp_calib_lo = (u16)vbat_low;
> 
> 		gpadc->cal_data[ADC_INPUT_VBAT].gain = CALIB_SCALE *
> 			(4700 - 2380) /	(vbat_high - vbat_low);
> 		gpadc->cal_data[ADC_INPUT_VBAT].offset = CALIB_SCALE * 4700 -
> 			(CALIB_SCALE * (4700 - 2380) /
> 			(vbat_high - vbat_low)) * vbat_high;
> 	} else {
> 		gpadc->cal_data[ADC_INPUT_VBAT].gain = 0;
> 	}
> 
> 	dev_dbg(gpadc->dev, "VMAIN gain %llu offset %llu\n",
> 		gpadc->cal_data[ADC_INPUT_VMAIN].gain,
> 		gpadc->cal_data[ADC_INPUT_VMAIN].offset);
> 
> 	dev_dbg(gpadc->dev, "BTEMP gain %llu offset %llu\n",
> 		gpadc->cal_data[ADC_INPUT_BTEMP].gain,
> 		gpadc->cal_data[ADC_INPUT_BTEMP].offset);
> 
> 	dev_dbg(gpadc->dev, "VBAT gain %llu offset %llu\n",
> 		gpadc->cal_data[ADC_INPUT_VBAT].gain,
> 		gpadc->cal_data[ADC_INPUT_VBAT].offset);
> }
> 
> static int ab8500_gpadc_read_raw(struct iio_dev *indio_dev,
> 				  struct iio_chan_spec const *chan,
> 				  int *val, int *val2, long mask)
> {
> 	struct ab8500_gpadc *gpadc = iio_priv(indio_dev);
> 	const struct ab8500_gpadc_chan_info *ch;
> 	int raw_val;
> 	int processed;
> 
> 	ch = ab8500_gpadc_get_channel(gpadc, chan->address);
> 	if (!ch) {
> 		dev_err(gpadc->dev, "no such channel %lu\n",
> 			chan->address);
> 		return -EINVAL;
> 	}
> 
> 	dev_info(gpadc->dev, "read channel %d\n", ch->id);
> 
> 	raw_val = ab8500_gpadc_read(gpadc, ch->id, ch->avg_sample,
> 				    ch->trig_edge, ch->trig_timer,
> 				    ch->conv_type, NULL);
> 	if (raw_val < 0)
> 		return raw_val;
> 
> 	if (mask == IIO_CHAN_INFO_RAW) {
> 		*val = raw_val;
> 		return IIO_VAL_INT;
> 	}
> 
> 	processed = ab8500_gpadc_ad_to_voltage(gpadc, ch->id, raw_val);
> 	if (processed < 0)
> 		return processed;
> 
> 	/* Return millivolt or milliamps or millicentigrades */
If this is the case, we are we providing these as _raw values rather than
processed ones?

> 	*val = processed * 1000;
> 	return IIO_VAL_INT;
> }
> 
> static int ab8500_gpadc_of_xlate(struct iio_dev *indio_dev,
> 				 const struct of_phandle_args *iiospec)
> {
> 	struct ab8500_gpadc *gpadc = iio_priv(indio_dev);
> 	unsigned int i;
> 
> 	for (i = 0; i < gpadc->nchans; i++)
> 		if (gpadc->iio_chans[i].channel == iiospec->args[0])
> 			return i;
> 
> 	return -EINVAL;
> }
> 
> static const struct iio_info ab8500_gpadc_info = {
> 	.driver_module = THIS_MODULE,
> 	.of_xlate = ab8500_gpadc_of_xlate,
> 	.read_raw = ab8500_gpadc_read_raw,
> };
> 
> #ifdef CONFIG_PM
> static int ab8500_gpadc_runtime_suspend(struct device *dev)
> {
> 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> 	struct ab8500_gpadc *gpadc = iio_priv(indio_dev);
I'd roll the two above into one line. Same in similar locations.
> 
> 	regulator_disable(gpadc->regu);
> 	return 0;
> }
> 
> static int ab8500_gpadc_runtime_resume(struct device *dev)
> {
> 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> 	struct ab8500_gpadc *gpadc = iio_priv(indio_dev);
> 	int ret;
> 
> 	ret = regulator_enable(gpadc->regu);
> 	if (ret)
> 		dev_err(dev, "Failed to enable vtvout LDO: %d\n", ret);
> 	return ret;
> }
> 
> static int ab8500_gpadc_suspend(struct device *dev)
> {
> 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> 	struct ab8500_gpadc *gpadc = iio_priv(indio_dev);
> 
> 	mutex_lock(&gpadc->ab8500_gpadc_lock);
> 
> 	pm_runtime_get_sync(dev);
> 
> 	regulator_disable(gpadc->regu);
> 	return 0;
> }
> 
> static int ab8500_gpadc_resume(struct device *dev)
> {
> 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> 	struct ab8500_gpadc *gpadc = iio_priv(indio_dev);
> 	int ret;
> 
> 	ret = regulator_enable(gpadc->regu);
> 	if (ret)
> 		dev_err(dev, "Failed to enable vtvout LDO: %d\n", ret);
> 
> 	pm_runtime_mark_last_busy(gpadc->dev);
> 	pm_runtime_put_autosuspend(gpadc->dev);
> 
> 	mutex_unlock(&gpadc->ab8500_gpadc_lock);
blank line here and in similar simple return locations would be nice.
> 	return ret;
> }
> #endif
> 
> static int ab8500_gpadc_parse_channel(struct device *dev,
> 				      struct device_node *np,
> 				      struct ab8500_gpadc_chan_info *ch,
> 				      struct iio_chan_spec *iio_chan)
> {
> 	const char *name = np->name;
> 	u32 chan;
> 	int ret;
> 
> 	ret = of_property_read_u32(np, "reg", &chan);
> 	if (ret) {
> 		dev_err(dev, "invalid channel number %s\n", name);
> 		return ret;
> 	}
> 	if (chan > BAT_TEMP_AND_IBAT) {
> 		dev_err(dev, "%s too big channel number %d\n", name, chan);
> 		return -EINVAL;
> 	}
> 
> 	iio_chan->channel = chan;
> 	iio_chan->datasheet_name = name;
> 	iio_chan->indexed = 1;
> 	iio_chan->address = chan;
> 	iio_chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
> 	/* All are voltages */
We have solemnly calculated a load of calibration gains and offsets from
the otp data can we not expose them?

Looks like we are applying these inside the driver.  If so these should
be IIO_CHAN_INFO_PROCESSED.

> 	iio_chan->type = IIO_VOLTAGE;
> 
> 	ch->id = chan;
> 
> 	/* Sensible defaults */
> 	ch->avg_sample = SAMPLE_16;
> 	ch->trig_edge = RISING_EDGE;
> 	ch->conv_type = ADC_SW;
> 	ch->trig_timer = 0;
> 
> 	return 0;
> }
>
I'd pass the iio_dev in here and then loose the iio_chans pointer in gpadc.
> static int ab8500_gpadc_parse_channels(struct ab8500_gpadc *gpadc,
> 				       struct device_node *np)
> {
> 	struct device_node *child;
> 	struct ab8500_gpadc_chan_info *ch;
> 	int i;
> 
> 	gpadc->nchans = of_get_available_child_count(np);
> 	if (!gpadc->nchans) {
> 		dev_err(gpadc->dev, "no channel children\n");
> 		return -ENODEV;
> 	}
> 	dev_info(gpadc->dev, "found %d ADC channels\n", gpadc->nchans);
> 
> 	gpadc->iio_chans = devm_kcalloc(gpadc->dev, gpadc->nchans,
> 					sizeof(*gpadc->iio_chans), GFP_KERNEL);
> 	if (!gpadc->iio_chans)
> 		return -ENOMEM;
> 
> 	gpadc->chans = devm_kcalloc(gpadc->dev, gpadc->nchans,
> 				    sizeof(*gpadc->chans), GFP_KERNEL);
> 	if (!gpadc->chans)
> 		return -ENOMEM;
> 
> 	i = 0;
> 	for_each_available_child_of_node(np, child) {
> 		struct iio_chan_spec *iio_chan;
> 		int ret;
> 
> 		ch = &gpadc->chans[i];
> 		iio_chan = &gpadc->iio_chans[i];
> 
> 		ret = ab8500_gpadc_parse_channel(gpadc->dev, child, ch, iio_chan);
> 		if (ret) {
> 			of_node_put(child);
> 			return ret;
> 		}
> 		i++;
> 	}
> 
> 	return 0;
> }
> 
> static int ab8500_gpadc_probe(struct platform_device *pdev)
> {
> 	int ret = 0;
> 	struct ab8500_gpadc *gpadc;
> 	struct iio_dev *indio_dev;
> 	struct device *dev = &pdev->dev;
> 	struct device_node *np = pdev->dev.of_node;
> 
> 	indio_dev = devm_iio_device_alloc(dev, sizeof(*gpadc));
> 	if (!indio_dev)
> 		return -ENOMEM;
> 	platform_set_drvdata(pdev, indio_dev);
> 	gpadc = iio_priv(indio_dev);
> 
> 	gpadc->dev = dev;
> 	gpadc->ab8500 = dev_get_drvdata(pdev->dev.parent);
> 	mutex_init(&gpadc->ab8500_gpadc_lock);
> 
> 	ret = ab8500_gpadc_parse_channels(gpadc, np);
> 
> 	gpadc->irq_sw = platform_get_irq_byname(pdev, "SW_CONV_END");
> 	if (gpadc->irq_sw < 0) {
> 		dev_err(dev, "failed to get platform sw_conv_end irq\n");
> 		return gpadc->irq_sw;
> 	}
> 
> 	gpadc->irq_hw = platform_get_irq_byname(pdev, "HW_CONV_END");
> 	if (gpadc->irq_hw < 0) {
> 		dev_err(dev, "failed to get platform hw_conv_end irq\n");
> 		return gpadc->irq_hw;
> 	}
> 
> 	/* Initialize completion used to notify completion of conversion */
> 	init_completion(&gpadc->ab8500_gpadc_complete);
> 
> 	/* Register interrupts */
> 	ret = devm_request_threaded_irq(dev,
> 		gpadc->irq_sw, NULL,
> 		ab8500_bm_gpadcconvend_handler,
> 		IRQF_NO_SUSPEND | IRQF_SHARED | IRQF_ONESHOT,
> 		"ab8500-gpadc-sw",
> 		gpadc);
> 	if (ret < 0) {
> 		dev_err(dev,
> 			"failed to request interrupt irq %d\n",
> 			gpadc->irq_sw);
> 		return ret;
> 	}
> 
> 	ret = devm_request_threaded_irq(dev,
> 		gpadc->irq_hw, NULL,
> 		ab8500_bm_gpadcconvend_handler,
> 		IRQF_NO_SUSPEND | IRQF_SHARED | IRQF_ONESHOT,
> 		"ab8500-gpadc-hw",
> 		gpadc);
> 	if (ret < 0) {
> 		dev_err(dev,
> 			"Failed to register interrupt irq: %d\n",
> 			gpadc->irq_hw);
> 		return ret;
> 	}
> 
> 	/* The VTVout LDO used to power the AB8500 GPADC */
> 	gpadc->regu = devm_regulator_get(dev, "vddadc");
> 	if (IS_ERR(gpadc->regu)) {
> 		ret = PTR_ERR(gpadc->regu);
> 		dev_err(dev, "failed to get vtvout LDO\n");
> 		return ret;
> 	}
> 
> 	ret = regulator_enable(gpadc->regu);
> 	if (ret) {
> 		dev_err(dev, "failed to enable vtvout LDO: %d\n", ret);
> 		return ret;
> 	}
> 
> 	pm_runtime_set_autosuspend_delay(dev, GPADC_AUDOSUSPEND_DELAY);
> 	pm_runtime_use_autosuspend(dev);
> 	pm_runtime_set_active(dev);
> 	pm_runtime_enable(dev);
> 
> 	ab8500_gpadc_read_calibration_data(gpadc);
> 
> 	indio_dev->dev.parent = dev;
> 	indio_dev->dev.of_node = np;
> 	indio_dev->name = "ab8500-gpadc";
> 	indio_dev->modes = INDIO_DIRECT_MODE;
> 	indio_dev->info = &ab8500_gpadc_info;
> 	indio_dev->channels = gpadc->iio_chans;
Why this double copy of the pointer to the channels?
Seems overly complex.

> 	indio_dev->num_channels = gpadc->nchans;
> 
> 	ret = iio_device_register(indio_dev);
> 	if (ret)
> 		goto out_dis_pm;
> 
> 	dev_info(dev, "AB8500 GPADC initialized\n");
> 
> 	return 0;
> 
> out_dis_pm:
> 	pm_runtime_get_sync(dev);
> 	pm_runtime_disable(dev);
> 	regulator_disable(gpadc->regu);
> 	pm_runtime_set_suspended(dev);
> 	pm_runtime_put_noidle(dev);
> 
> 	return ret;
> }
> 
> static int ab8500_gpadc_remove(struct platform_device *pdev)
> {
> 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> 	struct ab8500_gpadc *gpadc = iio_priv(indio_dev);
> 
> 	iio_device_unregister(indio_dev);
> 
> 	pm_runtime_get_sync(gpadc->dev);
> 	pm_runtime_disable(gpadc->dev);
> 	regulator_disable(gpadc->regu);
> 	pm_runtime_set_suspended(gpadc->dev);
> 	pm_runtime_put_noidle(gpadc->dev);
> 
> 	return 0;
> }
> 
> static const struct dev_pm_ops ab8500_gpadc_pm_ops = {
> 	SET_RUNTIME_PM_OPS(ab8500_gpadc_runtime_suspend,
> 			   ab8500_gpadc_runtime_resume,
> 			   NULL)
> 	SET_SYSTEM_SLEEP_PM_OPS(ab8500_gpadc_suspend,
> 				ab8500_gpadc_resume)
> 
> };
> 
> static struct platform_driver ab8500_gpadc_driver = {
> 	.probe = ab8500_gpadc_probe,
> 	.remove = ab8500_gpadc_remove,
> 	.driver = {
> 		.name = "ab8500-gpadc",
> 		.pm = &ab8500_gpadc_pm_ops,
> 	},
> };
> 
> static int __init ab8500_gpadc_init(void)
> {
> 	return platform_driver_register(&ab8500_gpadc_driver);
> }
> 
> static void __exit ab8500_gpadc_exit(void)
> {
> 	platform_driver_unregister(&ab8500_gpadc_driver);
> }
> 
> /**
>  * ab8540_gpadc_get_otp() - returns OTP values
Why this blank line?
>  *
>  */
> void ab8540_gpadc_get_otp(struct ab8500_gpadc *gpadc,
> 			u16 *vmain_l, u16 *vmain_h, u16 *btemp_l, u16 *btemp_h,
> 			u16 *vbat_l, u16 *vbat_h, u16 *ibat_l, u16 *ibat_h)
> {
> 	*vmain_l = gpadc->cal_data[ADC_INPUT_VMAIN].otp_calib_lo;
> 	*vmain_h = gpadc->cal_data[ADC_INPUT_VMAIN].otp_calib_hi;
> 	*btemp_l = gpadc->cal_data[ADC_INPUT_BTEMP].otp_calib_lo;
> 	*btemp_h = gpadc->cal_data[ADC_INPUT_BTEMP].otp_calib_hi;
> 	*vbat_l  = gpadc->cal_data[ADC_INPUT_VBAT].otp_calib_lo;
> 	*vbat_h  = gpadc->cal_data[ADC_INPUT_VBAT].otp_calib_hi;
> 	*ibat_l  = gpadc->cal_data[ADC_INPUT_IBAT].otp_calib_lo;
> 	*ibat_h  = gpadc->cal_data[ADC_INPUT_IBAT].otp_calib_hi;
This function seems completely missplaced in the logical flow of the
driver. Perhaps move it up?
> }
> 
> subsys_initcall_sync(ab8500_gpadc_init);
This needs a comment if it's actually necessary to do it this way
still given we now have deferred probing.

> module_exit(ab8500_gpadc_exit);
> 
> MODULE_LICENSE("GPL v2");
> MODULE_AUTHOR("Arun R Murthy");
> MODULE_AUTHOR("Daniel Willerud");
> MODULE_AUTHOR("Johan Palsson");
> MODULE_AUTHOR("M'boumba Cedric Madianga");
> MODULE_ALIAS("platform:ab8500_gpadc");
> MODULE_DESCRIPTION("AB8500 GPADC driver");

<END OF PASTED IN FILE>


> ---
>  drivers/iio/adc/Kconfig                 |    7 +
>  drivers/iio/adc/Makefile                |    1 +
>  drivers/{mfd => iio/adc}/ab8500-gpadc.c |  469 ++++++----
>  drivers/mfd/Kconfig                     |    7 -
>  drivers/mfd/Makefile                    |    1 -
>  drivers/mfd/ab8500-debugfs.c            | 1448 +++++--------------------------
>  include/linux/mfd/abx500/ab8500-gpadc.h |   75 --
>  7 files changed, 511 insertions(+), 1497 deletions(-)
>  rename drivers/{mfd => iio/adc}/ab8500-gpadc.c (76%)
>  delete mode 100644 include/linux/mfd/abx500/ab8500-gpadc.h
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 38bc319904c4..e524bdeb3e27 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -5,6 +5,13 @@
>  
>  menu "Analog to digital converters"
>  
> +config AB8500_GPADC
> +	bool "ST-Ericsson AB8500 GPADC driver"
> +	depends on AB8500_CORE && REGULATOR_AB8500
> +	default y
Default of y? Justify this please.

> +	help
> +	  AB8500 GPADC driver used to convert Acc and battery/ac/usb voltage
> +
>  config AD_SIGMA_DELTA
>  	tristate
>  	select IIO_BUFFER
> diff --git a/drivers/iio/adc/Makefile b/drivers/iio/adc/Makefile
> index d36c4be8d1fc..025ec9a547a8 100644
> --- a/drivers/iio/adc/Makefile
> +++ b/drivers/iio/adc/Makefile
> @@ -3,6 +3,7 @@
>  #
>  
>  # When adding new entries keep the list in alphabetical order
> +obj-$(CONFIG_AB8500_GPADC) += ab8500-gpadc.o
>  obj-$(CONFIG_AD_SIGMA_DELTA) += ad_sigma_delta.o
>  obj-$(CONFIG_AD7266) += ad7266.o
>  obj-$(CONFIG_AD7291) += ad7291.o
> diff --git a/drivers/mfd/ab8500-gpadc.c b/drivers/iio/adc/ab8500-gpadc.c
> similarity index 76%
> rename from drivers/mfd/ab8500-gpadc.c
> rename to drivers/iio/adc/ab8500-gpadc.c
> index f4e94869d612..ba4e6f5a6cb9 100644
> --- a/drivers/mfd/ab8500-gpadc.c
> +++ b/drivers/iio/adc/ab8500-gpadc.c
> @@ -6,8 +6,11 @@
>   * Author: Daniel Willerud <daniel.willerud@stericsson.com>
>   * Author: Johan Palsson <johan.palsson@stericsson.com>
>   * Author: M'boumba Cedric Madianga
> + * Author: Linus Walleij <linus.walleij@linaro.org>
>   */
>  #include <linux/init.h>
> +#include <linux/iio/iio.h>
> +#include <linux/iio/sysfs.h>
>  #include <linux/device.h>
>  #include <linux/interrupt.h>
>  #include <linux/spinlock.h>
> @@ -18,10 +21,48 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/err.h>
>  #include <linux/slab.h>
> -#include <linux/list.h>
>  #include <linux/mfd/abx500.h>
>  #include <linux/mfd/abx500/ab8500.h>
> -#include <linux/mfd/abx500/ab8500-gpadc.h>
> +
> +/* GPADC source: From datasheet(ADCSwSel[4:0] in GPADCCtrl2
> + * and ADCHwSel[4:0] in GPADCCtrl3 ) */
> +#define BAT_CTRL		0x01
> +#define BTEMP_BALL		0x02
> +#define MAIN_CHARGER_V		0x03
> +#define ACC_DETECT1		0x04
> +#define ACC_DETECT2		0x05
> +#define ADC_AUX1		0x06
> +#define ADC_AUX2		0x07
> +#define MAIN_BAT_V		0x08
> +#define VBUS_V			0x09
> +#define MAIN_CHARGER_C		0x0A
> +#define USB_CHARGER_C		0x0B
> +#define BK_BAT_V		0x0C
> +#define DIE_TEMP		0x0D
> +#define USB_ID			0x0E
> +#define XTAL_TEMP		0x12
> +#define VBAT_TRUE_MEAS		0x13
> +#define BAT_CTRL_AND_IBAT	0x1C
> +#define VBAT_MEAS_AND_IBAT	0x1D
> +#define VBAT_TRUE_MEAS_AND_IBAT	0x1E
> +#define BAT_TEMP_AND_IBAT	0x1F
> +
> +/* Virtual channel used only for ibat convertion to ampere
> + * Battery current conversion (ibat) cannot be requested as a single conversion
> + *  but it is always in combination with other input requests
> + */
> +#define IBAT_VIRTUAL_CHANNEL		0xFF
> +
> +#define SAMPLE_1        1
> +#define SAMPLE_4        4
> +#define SAMPLE_8        8
> +#define SAMPLE_16       16
> +#define RISING_EDGE     0
> +#define FALLING_EDGE    1

> +
> +/* Arbitrary ADC conversion type constants */
> +#define ADC_SW				0
> +#define ADC_HW				1
>  
>  /*
>   * GPADC register offsets
> @@ -140,11 +181,27 @@ struct adc_cal_data {
>  };
>  
>  /**
> + * struct ab8500_gpadc_chan_info - per-channel GPADC info
> + * @name: name of the channel
> + * @id: the internal AB8500 ID number for the channel
> + */
> +struct ab8500_gpadc_chan_info {
> +	const char *name;
> +	u8 id;
> +	u8 avg_sample;
> +	u8 trig_edge;
> +	u8 trig_timer;
> +	u8 conv_type;
> +};
> +
> +
> +/**
>   * struct ab8500_gpadc - AB8500 GPADC device information
>   * @dev:			pointer to the struct device
> - * @node:			a list of AB8500 GPADCs, hence prepared for
> -				reentrance
> - * @parent:			pointer to the struct ab8500
> + * @ab8500:			pointer to the struct ab8500
> + * @nchans:			number of IIO channels
> + * @chans:			Internal channel information container
> + * @iio_chans:			IIO channels
>   * @ab8500_gpadc_complete:	pointer to the struct completion, to indicate
>   *				the completion of gpadc conversion
>   * @ab8500_gpadc_lock:		structure of type mutex
> @@ -157,8 +214,10 @@ struct adc_cal_data {
>   */
>  struct ab8500_gpadc {
>  	struct device *dev;
> -	struct list_head node;
> -	struct ab8500 *parent;
> +	struct ab8500 *ab8500;
> +	unsigned int nchans;
> +	struct ab8500_gpadc_chan_info *chans;
> +	struct iio_chan_spec *iio_chans;
>  	struct completion ab8500_gpadc_complete;
>  	struct mutex ab8500_gpadc_lock;
>  	struct regulator *regu;
> @@ -167,29 +226,27 @@ struct ab8500_gpadc {
>  	struct adc_cal_data cal_data[NBR_CAL_INPUTS];
>  };
>  
> -static LIST_HEAD(ab8500_gpadc_list);
> -
> -/**
> - * ab8500_gpadc_get() - returns a reference to the primary AB8500 GPADC
> - * (i.e. the first GPADC in the instance list)
> - */
> -struct ab8500_gpadc *ab8500_gpadc_get(char *name)
> +static struct ab8500_gpadc_chan_info *
> +ab8500_gpadc_get_channel(struct ab8500_gpadc *gpadc, u8 chan)
>  {
> -	struct ab8500_gpadc *gpadc;
> +	struct ab8500_gpadc_chan_info *ch;
> +	int i;
>  
> -	list_for_each_entry(gpadc, &ab8500_gpadc_list, node) {
> -		if (!strcmp(name, dev_name(gpadc->dev)))
> -			return gpadc;
> +	for (i = 0; i < gpadc->nchans; i++) {
> +		ch = &gpadc->chans[i];
> +		if (ch->id == chan)
> +			break;
>  	}
> +	if (i == gpadc->nchans)
> +		return NULL;
>  
> -	return ERR_PTR(-ENOENT);
> +	return ch;
>  }
> -EXPORT_SYMBOL(ab8500_gpadc_get);
>  
>  /**
>   * ab8500_gpadc_ad_to_voltage() - Convert a raw ADC value to a voltage
>   */
> -int ab8500_gpadc_ad_to_voltage(struct ab8500_gpadc *gpadc, u8 channel,
> +static int ab8500_gpadc_ad_to_voltage(struct ab8500_gpadc *gpadc, u8 channel,
>  	int ad_value)
>  {
>  	int res;
> @@ -294,70 +351,11 @@ int ab8500_gpadc_ad_to_voltage(struct ab8500_gpadc *gpadc, u8 channel,
>  	}
>  	return res;
>  }
> -EXPORT_SYMBOL(ab8500_gpadc_ad_to_voltage);
> -
> -/**
> - * ab8500_gpadc_sw_hw_convert() - gpadc conversion
> - * @channel:	analog channel to be converted to digital data
> - * @avg_sample:  number of ADC sample to average
> - * @trig_egde:  selected ADC trig edge
> - * @trig_timer: selected ADC trigger delay timer
> - * @conv_type: selected conversion type (HW or SW conversion)
> - *
> - * This function converts the selected analog i/p to digital
> - * data.
> - */
> -int ab8500_gpadc_sw_hw_convert(struct ab8500_gpadc *gpadc, u8 channel,
> -		u8 avg_sample, u8 trig_edge, u8 trig_timer, u8 conv_type)
> -{
> -	int ad_value;
> -	int voltage;
> -
> -	ad_value = ab8500_gpadc_read_raw(gpadc, channel, avg_sample,
> -			trig_edge, trig_timer, conv_type);
> -
> -	/* On failure retry a second time */
> -	if (ad_value < 0)
> -		ad_value = ab8500_gpadc_read_raw(gpadc, channel, avg_sample,
> -			trig_edge, trig_timer, conv_type);
> -	if (ad_value < 0) {
> -		dev_err(gpadc->dev, "GPADC raw value failed ch: %d\n",
> -				channel);
> -		return ad_value;
> -	}
> -
> -	voltage = ab8500_gpadc_ad_to_voltage(gpadc, channel, ad_value);
> -	if (voltage < 0)
> -		dev_err(gpadc->dev,
> -			"GPADC to voltage conversion failed ch: %d AD: 0x%x\n",
> -			channel, ad_value);
> -
> -	return voltage;
> -}
> -EXPORT_SYMBOL(ab8500_gpadc_sw_hw_convert);
> -
> -/**
> - * ab8500_gpadc_read_raw() - gpadc read
> - * @channel:	analog channel to be read
> - * @avg_sample:  number of ADC sample to average
> - * @trig_edge:  selected trig edge
> - * @trig_timer: selected ADC trigger delay timer
> - * @conv_type: selected conversion type (HW or SW conversion)
> - *
> - * This function obtains the raw ADC value for an hardware conversion,
> - * this then needs to be converted by calling ab8500_gpadc_ad_to_voltage()
> - */
> -int ab8500_gpadc_read_raw(struct ab8500_gpadc *gpadc, u8 channel,
> -		u8 avg_sample, u8 trig_edge, u8 trig_timer, u8 conv_type)
> -{
> -	return ab8500_gpadc_double_read_raw(gpadc, channel, avg_sample,
> -					    trig_edge, trig_timer, conv_type,
> -					    NULL);
> -}
>  
> -int ab8500_gpadc_double_read_raw(struct ab8500_gpadc *gpadc, u8 channel,
> -		u8 avg_sample, u8 trig_edge, u8 trig_timer, u8 conv_type,
> -		int *ibat)
> +static int ab8500_gpadc_read(struct ab8500_gpadc *gpadc, u8 channel,
> +			     u8 avg_sample, u8 trig_edge,
> +			     u8 trig_timer, u8 conv_type,
> +			     int *ibat)
>  {
>  	int ret;
>  	int looplimit = 0;
> @@ -442,7 +440,7 @@ int ab8500_gpadc_double_read_raw(struct ab8500_gpadc *gpadc, u8 channel,
>  		val_reg1 |= EN_BUF | EN_ICHAR;
>  		break;
>  	case BTEMP_BALL:
> -		if (!is_ab8500_2p0_or_earlier(gpadc->parent)) {
> +		if (!is_ab8500_2p0_or_earlier(gpadc->ab8500)) {
>  			val_reg1 |= EN_BUF | BTEMP_PULL_UP;
>  			/*
>  			* Delay might be needed for ABB8500 cut 3.0, if not,
> @@ -593,7 +591,6 @@ int ab8500_gpadc_double_read_raw(struct ab8500_gpadc *gpadc, u8 channel,
>  		"gpadc_conversion: Failed to AD convert channel %d\n", channel);
>  	return ret;
>  }
> -EXPORT_SYMBOL(ab8500_gpadc_read_raw);
>  
>  /**
>   * ab8500_bm_gpadcconvend_handler() - isr for gpadc conversion completion
> @@ -605,9 +602,9 @@ EXPORT_SYMBOL(ab8500_gpadc_read_raw);
>   * can be read from the registers.
>   * Returns IRQ status(IRQ_HANDLED)
>   */
> -static irqreturn_t ab8500_bm_gpadcconvend_handler(int irq, void *_gpadc)
> +static irqreturn_t ab8500_bm_gpadcconvend_handler(int irq, void *data)
>  {
> -	struct ab8500_gpadc *gpadc = _gpadc;
> +	struct ab8500_gpadc *gpadc = data;
>  
>  	complete(&gpadc->ab8500_gpadc_complete);
>  
> @@ -644,7 +641,7 @@ static void ab8500_gpadc_read_calibration_data(struct ab8500_gpadc *gpadc)
>  	s64 V_gain, V_offset, V2A_gain, V2A_offset;
>  	struct ab8500 *ab8500;
>  
> -	ab8500 = gpadc->parent;
> +	ab8500 = gpadc->ab8500;
>  
>  	/* First we read all OTP registers and store the error code */
>  	for (i = 0; i < ARRAY_SIZE(otp_cal_regs); i++) {
> @@ -868,10 +865,68 @@ static void ab8500_gpadc_read_calibration_data(struct ab8500_gpadc *gpadc)
>  		gpadc->cal_data[ADC_INPUT_VBAT].offset);
>  }
>  
> +static int ab8500_gpadc_read_raw(struct iio_dev *indio_dev,
> +				  struct iio_chan_spec const *chan,
> +				  int *val, int *val2, long mask)
> +{
> +	struct ab8500_gpadc *gpadc = iio_priv(indio_dev);
> +	const struct ab8500_gpadc_chan_info *ch;
> +	int raw_val;
> +	int processed;
> +
> +	ch = ab8500_gpadc_get_channel(gpadc, chan->address);
> +	if (!ch) {
> +		dev_err(gpadc->dev, "no such channel %lu\n",
> +			chan->address);
> +		return -EINVAL;
> +	}
> +
> +	dev_info(gpadc->dev, "read channel %d\n", ch->id);
> +
> +	raw_val = ab8500_gpadc_read(gpadc, ch->id, ch->avg_sample,
> +				    ch->trig_edge, ch->trig_timer,
> +				    ch->conv_type, NULL);
> +	if (raw_val < 0)
> +		return raw_val;
> +
> +	if (mask == IIO_CHAN_INFO_RAW) {
> +		*val = raw_val;
> +		return IIO_VAL_INT;
> +	}
> +
> +	processed = ab8500_gpadc_ad_to_voltage(gpadc, ch->id, raw_val);
> +	if (processed < 0)
> +		return processed;
> +
> +	/* Return millivolt or milliamps or millicentigrades */
> +	*val = processed * 1000;
> +	return IIO_VAL_INT;
> +}
> +
> +static int ab8500_gpadc_of_xlate(struct iio_dev *indio_dev,
> +				 const struct of_phandle_args *iiospec)
> +{
> +	struct ab8500_gpadc *gpadc = iio_priv(indio_dev);
> +	unsigned int i;
> +
> +	for (i = 0; i < gpadc->nchans; i++)
> +		if (gpadc->iio_chans[i].channel == iiospec->args[0])
> +			return i;
> +
> +	return -EINVAL;
> +}
> +
> +static const struct iio_info ab8500_gpadc_info = {
> +	.driver_module = THIS_MODULE,
> +	.of_xlate = ab8500_gpadc_of_xlate,
> +	.read_raw = ab8500_gpadc_read_raw,
> +};
> +
>  #ifdef CONFIG_PM
>  static int ab8500_gpadc_runtime_suspend(struct device *dev)
>  {
> -	struct ab8500_gpadc *gpadc = dev_get_drvdata(dev);
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> +	struct ab8500_gpadc *gpadc = iio_priv(indio_dev);
>  
>  	regulator_disable(gpadc->regu);
>  	return 0;
> @@ -879,7 +934,8 @@ static int ab8500_gpadc_runtime_suspend(struct device *dev)
>  
>  static int ab8500_gpadc_runtime_resume(struct device *dev)
>  {
> -	struct ab8500_gpadc *gpadc = dev_get_drvdata(dev);
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> +	struct ab8500_gpadc *gpadc = iio_priv(indio_dev);
>  	int ret;
>  
>  	ret = regulator_enable(gpadc->regu);
> @@ -887,12 +943,11 @@ static int ab8500_gpadc_runtime_resume(struct device *dev)
>  		dev_err(dev, "Failed to enable vtvout LDO: %d\n", ret);
>  	return ret;
>  }
> -#endif
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int ab8500_gpadc_suspend(struct device *dev)
>  {
> -	struct ab8500_gpadc *gpadc = dev_get_drvdata(dev);
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> +	struct ab8500_gpadc *gpadc = iio_priv(indio_dev);
>  
>  	mutex_lock(&gpadc->ab8500_gpadc_lock);
>  
> @@ -904,7 +959,8 @@ static int ab8500_gpadc_suspend(struct device *dev)
>  
>  static int ab8500_gpadc_resume(struct device *dev)
>  {
> -	struct ab8500_gpadc *gpadc = dev_get_drvdata(dev);
> +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> +	struct ab8500_gpadc *gpadc = iio_priv(indio_dev);
>  	int ret;
>  
>  	ret = regulator_enable(gpadc->regu);
> @@ -919,114 +975,207 @@ static int ab8500_gpadc_resume(struct device *dev)
>  }
>  #endif
>  
> +static int ab8500_gpadc_parse_channel(struct device *dev,
> +				      struct device_node *np,
> +				      struct ab8500_gpadc_chan_info *ch,
> +				      struct iio_chan_spec *iio_chan)
> +{
> +	const char *name = np->name;
> +	u32 chan;
> +	int ret;
> +
> +	ret = of_property_read_u32(np, "reg", &chan);
> +	if (ret) {
> +		dev_err(dev, "invalid channel number %s\n", name);
> +		return ret;
> +	}
> +	if (chan > BAT_TEMP_AND_IBAT) {
> +		dev_err(dev, "%s too big channel number %d\n", name, chan);
> +		return -EINVAL;
> +	}
> +
> +	iio_chan->channel = chan;
> +	iio_chan->datasheet_name = name;
> +	iio_chan->indexed = 1;
> +	iio_chan->address = chan;
> +	iio_chan->info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
> +	/* All are voltages */
> +	iio_chan->type = IIO_VOLTAGE;
> +
> +	ch->id = chan;
> +
> +	/* Sensible defaults */
> +	ch->avg_sample = SAMPLE_16;
> +	ch->trig_edge = RISING_EDGE;
> +	ch->conv_type = ADC_SW;
> +	ch->trig_timer = 0;
> +
> +	return 0;
> +}
> +
> +static int ab8500_gpadc_parse_channels(struct ab8500_gpadc *gpadc,
> +				       struct device_node *np)
> +{
> +	struct device_node *child;
> +	struct ab8500_gpadc_chan_info *ch;
> +	int i;
> +
> +	gpadc->nchans = of_get_available_child_count(np);
> +	if (!gpadc->nchans) {
> +		dev_err(gpadc->dev, "no channel children\n");
> +		return -ENODEV;
> +	}
> +	dev_info(gpadc->dev, "found %d ADC channels\n", gpadc->nchans);
> +
> +	gpadc->iio_chans = devm_kcalloc(gpadc->dev, gpadc->nchans,
> +					sizeof(*gpadc->iio_chans), GFP_KERNEL);
> +	if (!gpadc->iio_chans)
> +		return -ENOMEM;
> +
> +	gpadc->chans = devm_kcalloc(gpadc->dev, gpadc->nchans,
> +				    sizeof(*gpadc->chans), GFP_KERNEL);
> +	if (!gpadc->chans)
> +		return -ENOMEM;
> +
> +	i = 0;
> +	for_each_available_child_of_node(np, child) {
> +		struct iio_chan_spec *iio_chan;
> +		int ret;
> +
> +		ch = &gpadc->chans[i];
> +		iio_chan = &gpadc->iio_chans[i];
> +
> +		ret = ab8500_gpadc_parse_channel(gpadc->dev, child, ch, iio_chan);
> +		if (ret) {
> +			of_node_put(child);
> +			return ret;
> +		}
> +		i++;
> +	}
> +
> +	return 0;
> +}
> +
>  static int ab8500_gpadc_probe(struct platform_device *pdev)
>  {
>  	int ret = 0;
>  	struct ab8500_gpadc *gpadc;
> +	struct iio_dev *indio_dev;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = pdev->dev.of_node;
>  
> -	gpadc = devm_kzalloc(&pdev->dev,
> -			     sizeof(struct ab8500_gpadc), GFP_KERNEL);
> -	if (!gpadc)
> +	indio_dev = devm_iio_device_alloc(dev, sizeof(*gpadc));
> +	if (!indio_dev)
>  		return -ENOMEM;
> +	platform_set_drvdata(pdev, indio_dev);
> +	gpadc = iio_priv(indio_dev);
> +
> +	gpadc->dev = dev;
> +	gpadc->ab8500 = dev_get_drvdata(pdev->dev.parent);
> +	mutex_init(&gpadc->ab8500_gpadc_lock);
> +
> +	ret = ab8500_gpadc_parse_channels(gpadc, np);
>  
>  	gpadc->irq_sw = platform_get_irq_byname(pdev, "SW_CONV_END");
> -	if (gpadc->irq_sw < 0)
> -		dev_err(gpadc->dev, "failed to get platform sw_conv_end irq\n");
> +	if (gpadc->irq_sw < 0) {
> +		dev_err(dev, "failed to get platform sw_conv_end irq\n");
> +		return gpadc->irq_sw;
> +	}
>  
>  	gpadc->irq_hw = platform_get_irq_byname(pdev, "HW_CONV_END");
> -	if (gpadc->irq_hw < 0)
> -		dev_err(gpadc->dev, "failed to get platform hw_conv_end irq\n");
> -
> -	gpadc->dev = &pdev->dev;
> -	gpadc->parent = dev_get_drvdata(pdev->dev.parent);
> -	mutex_init(&gpadc->ab8500_gpadc_lock);
> +	if (gpadc->irq_hw < 0) {
> +		dev_err(dev, "failed to get platform hw_conv_end irq\n");
> +		return gpadc->irq_hw;
> +	}
>  
>  	/* Initialize completion used to notify completion of conversion */
>  	init_completion(&gpadc->ab8500_gpadc_complete);
>  
>  	/* Register interrupts */
> -	if (gpadc->irq_sw >= 0) {
> -		ret = request_threaded_irq(gpadc->irq_sw, NULL,
> -			ab8500_bm_gpadcconvend_handler,
> -			IRQF_NO_SUSPEND | IRQF_SHARED | IRQF_ONESHOT,
> -			"ab8500-gpadc-sw",
> -			gpadc);
> -		if (ret < 0) {
> -			dev_err(gpadc->dev,
> -				"Failed to register interrupt irq: %d\n",
> -				gpadc->irq_sw);
> -			goto fail;
> -		}
> +	ret = devm_request_threaded_irq(dev,
> +		gpadc->irq_sw, NULL,
> +		ab8500_bm_gpadcconvend_handler,
> +		IRQF_NO_SUSPEND | IRQF_SHARED | IRQF_ONESHOT,
> +		"ab8500-gpadc-sw",
> +		gpadc);
> +	if (ret < 0) {
> +		dev_err(dev,
> +			"failed to request interrupt irq %d\n",
> +			gpadc->irq_sw);
> +		return ret;
>  	}
>  
> -	if (gpadc->irq_hw >= 0) {
> -		ret = request_threaded_irq(gpadc->irq_hw, NULL,
> -			ab8500_bm_gpadcconvend_handler,
> -			IRQF_NO_SUSPEND | IRQF_SHARED | IRQF_ONESHOT,
> -			"ab8500-gpadc-hw",
> -			gpadc);
> -		if (ret < 0) {
> -			dev_err(gpadc->dev,
> -				"Failed to register interrupt irq: %d\n",
> -				gpadc->irq_hw);
> -			goto fail_irq;
> -		}
> +	ret = devm_request_threaded_irq(dev,
> +		gpadc->irq_hw, NULL,
> +		ab8500_bm_gpadcconvend_handler,
> +		IRQF_NO_SUSPEND | IRQF_SHARED | IRQF_ONESHOT,
> +		"ab8500-gpadc-hw",
> +		gpadc);
> +	if (ret < 0) {
> +		dev_err(dev,
> +			"Failed to register interrupt irq: %d\n",
> +			gpadc->irq_hw);
> +		return ret;
>  	}
>  
> -	/* VTVout LDO used to power up ab8500-GPADC */
> -	gpadc->regu = devm_regulator_get(&pdev->dev, "vddadc");
> +	/* The VTVout LDO used to power the AB8500 GPADC */
> +	gpadc->regu = devm_regulator_get(dev, "vddadc");
>  	if (IS_ERR(gpadc->regu)) {
>  		ret = PTR_ERR(gpadc->regu);
> -		dev_err(gpadc->dev, "failed to get vtvout LDO\n");
> -		goto fail_irq;
> +		dev_err(dev, "failed to get vtvout LDO\n");
> +		return ret;
>  	}
>  
> -	platform_set_drvdata(pdev, gpadc);
> -
>  	ret = regulator_enable(gpadc->regu);
>  	if (ret) {
> -		dev_err(gpadc->dev, "Failed to enable vtvout LDO: %d\n", ret);
> -		goto fail_enable;
> +		dev_err(dev, "failed to enable vtvout LDO: %d\n", ret);
> +		return ret;
>  	}
>  
> -	pm_runtime_set_autosuspend_delay(gpadc->dev, GPADC_AUDOSUSPEND_DELAY);
> -	pm_runtime_use_autosuspend(gpadc->dev);
> -	pm_runtime_set_active(gpadc->dev);
> -	pm_runtime_enable(gpadc->dev);
> +	pm_runtime_set_autosuspend_delay(dev, GPADC_AUDOSUSPEND_DELAY);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
>  
>  	ab8500_gpadc_read_calibration_data(gpadc);
> -	list_add_tail(&gpadc->node, &ab8500_gpadc_list);
> -	dev_dbg(gpadc->dev, "probe success\n");
> +
> +	indio_dev->dev.parent = dev;
> +	indio_dev->dev.of_node = np;
> +	indio_dev->name = "ab8500-gpadc";
> +	indio_dev->modes = INDIO_DIRECT_MODE;
> +	indio_dev->info = &ab8500_gpadc_info;
> +	indio_dev->channels = gpadc->iio_chans;
> +	indio_dev->num_channels = gpadc->nchans;
> +
> +	ret = iio_device_register(indio_dev);
> +	if (ret)
> +		goto out_dis_pm;
> +
> +	dev_info(dev, "AB8500 GPADC initialized\n");
>  
>  	return 0;
>  
> -fail_enable:
> -fail_irq:
> -	free_irq(gpadc->irq_sw, gpadc);
> -	free_irq(gpadc->irq_hw, gpadc);
> -fail:
> +out_dis_pm:
> +	pm_runtime_get_sync(dev);
> +	pm_runtime_disable(dev);
> +	regulator_disable(gpadc->regu);
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_put_noidle(dev);
> +
>  	return ret;
>  }
>  
>  static int ab8500_gpadc_remove(struct platform_device *pdev)
>  {
> -	struct ab8500_gpadc *gpadc = platform_get_drvdata(pdev);
> +	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> +	struct ab8500_gpadc *gpadc = iio_priv(indio_dev);
>  
> -	/* remove this gpadc entry from the list */
> -	list_del(&gpadc->node);
> -	/* remove interrupt  - completion of Sw ADC conversion */
> -	if (gpadc->irq_sw >= 0)
> -		free_irq(gpadc->irq_sw, gpadc);
> -	if (gpadc->irq_hw >= 0)
> -		free_irq(gpadc->irq_hw, gpadc);
> +	iio_device_unregister(indio_dev);
>  
>  	pm_runtime_get_sync(gpadc->dev);
>  	pm_runtime_disable(gpadc->dev);
> -
>  	regulator_disable(gpadc->regu);
> -
>  	pm_runtime_set_suspended(gpadc->dev);
> -
>  	pm_runtime_put_noidle(gpadc->dev);
>  
>  	return 0;
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 4ce3b6f11830..d64a2447c963 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1022,13 +1022,6 @@ config AB8500_DEBUG
>           Select this option if you want debug information using the debug
>           filesystem, debugfs.
>  
> -config AB8500_GPADC
> -	bool "ST-Ericsson AB8500 GPADC driver"
> -	depends on AB8500_CORE && REGULATOR_AB8500
> -	default y
> -	help
> -	  AB8500 GPADC driver used to convert Acc and battery/ac/usb voltage
> -
>  config MFD_DB8500_PRCMU
>  	bool "ST-Ericsson DB8500 Power Reset Control Management Unit"
>  	depends on UX500_SOC_DB8500
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index dda4d4f73ad7..9870e2b1777a 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -150,7 +150,6 @@ obj-$(CONFIG_ABX500_CORE)	+= abx500-core.o
>  obj-$(CONFIG_AB3100_CORE)	+= ab3100-core.o
>  obj-$(CONFIG_AB3100_OTP)	+= ab3100-otp.o
>  obj-$(CONFIG_AB8500_DEBUG)	+= ab8500-debugfs.o
> -obj-$(CONFIG_AB8500_GPADC)	+= ab8500-gpadc.o
>  obj-$(CONFIG_MFD_DB8500_PRCMU)	+= db8500-prcmu.o
>  # ab8500-core need to come after db8500-prcmu (which provides the channel)
>  obj-$(CONFIG_AB8500_CORE)	+= ab8500-core.o ab8500-sysctrl.o
> diff --git a/drivers/mfd/ab8500-debugfs.c b/drivers/mfd/ab8500-debugfs.c
> index c1c815241e02..cdb6cdc1002b 100644
> --- a/drivers/mfd/ab8500-debugfs.c
> +++ b/drivers/mfd/ab8500-debugfs.c
> @@ -84,7 +84,6 @@
>  
>  #include <linux/mfd/abx500.h>
>  #include <linux/mfd/abx500/ab8500.h>
> -#include <linux/mfd/abx500/ab8500-gpadc.h>
>  
>  #ifdef CONFIG_DEBUG_FS
>  #include <linux/string.h>
> @@ -103,11 +102,6 @@ static int num_irqs;
>  static struct device_attribute **dev_attr;
>  static char **event_name;
>  
> -static u8 avg_sample = SAMPLE_16;
> -static u8 trig_edge = RISING_EDGE;
> -static u8 conv_type = ADC_SW;
> -static u8 trig_timer;
> -
>  /**
>   * struct ab8500_reg_range
>   * @first: the first address of the range
> @@ -152,7 +146,6 @@ static struct hwreg_cfg hwreg_cfg = {
>  };
>  
>  #define AB8500_NAME_STRING "ab8500"
> -#define AB8500_ADC_NAME_STRING "gpadc"
>  #define AB8500_NUM_BANKS AB8500_DEBUG_FIELD_LAST
>  
>  #define AB8500_REV_REG 0x80
> @@ -1670,1130 +1663,242 @@ static const struct file_operations ab8500_modem_fops = {
>  	.owner = THIS_MODULE,
>  };
>  
> -static int ab8500_gpadc_bat_ctrl_print(struct seq_file *s, void *p)
> +/*
> + * return length of an ASCII numerical value, 0 is string is not a
> + * numerical value.
> + * string shall start at value 1st char.
> + * string can be tailed with \0 or space or newline chars only.
> + * value can be decimal or hexadecimal (prefixed 0x or 0X).
> + */
Diff special ;) Take two completely different functions and intersperse
the one being removed with the one being added.

Doesn't feel like this should really be burried deep in a driver.
> +static int strval_len(char *b)
>  {
> -	int bat_ctrl_raw;
> -	int bat_ctrl_convert;
> -	struct ab8500_gpadc *gpadc;
> -
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	bat_ctrl_raw = ab8500_gpadc_read_raw(gpadc, BAT_CTRL,
> -		avg_sample, trig_edge, trig_timer, conv_type);
> -	bat_ctrl_convert = ab8500_gpadc_ad_to_voltage(gpadc,
> -		BAT_CTRL, bat_ctrl_raw);
> -
> -	seq_printf(s, "%d,0x%X\n", bat_ctrl_convert, bat_ctrl_raw);
> +	char *s = b;
>  
> -	return 0;
Comments in here to say what hte purpose of each step is would be
good as well.
> +	if ((*s == '0') && ((*(s+1) == 'x') || (*(s+1) == 'X'))) {
> +		s += 2;
> +		for (; *s && (*s != ' ') && (*s != '\n'); s++) {
> +			if (!isxdigit(*s))
> +				return 0;
> +		}
> +	} else {
> +		if (*s == '-')
> +			s++;
> +		for (; *s && (*s != ' ') && (*s != '\n'); s++) {
> +			if (!isdigit(*s))
> +				return 0;
> +		}
> +	}
> +	return (int) (s-b);
>  }
>  
> -static int ab8500_gpadc_bat_ctrl_open(struct inode *inode, struct file *file)
> +/*
> + * parse hwreg input data.
> + * update global hwreg_cfg only if input data syntax is ok.
> + */
> +static ssize_t hwreg_common_write(char *b, struct hwreg_cfg *cfg,
> +		struct device *dev)
>  {
> -	return single_open(file, ab8500_gpadc_bat_ctrl_print,
> -			   inode->i_private);
> -}
> -
> -static const struct file_operations ab8500_gpadc_bat_ctrl_fops = {
> -	.open = ab8500_gpadc_bat_ctrl_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> +	uint write, val = 0;
> +	u8  regvalue;
> +	int ret;
> +	struct hwreg_cfg loc = {
> +		.bank = 0,          /* default: invalid phys addr */
> +		.addr = 0,          /* default: invalid phys addr */
> +		.fmt = 0,           /* default: 32bit access, hex output */
> +		.mask = 0xFFFFFFFF, /* default: no mask */
> +		.shift = 0,         /* default: no bit shift */
> +	};
>  
> -static int ab8500_gpadc_btemp_ball_print(struct seq_file *s, void *p)
> -{
> -	int btemp_ball_raw;
> -	int btemp_ball_convert;
> -	struct ab8500_gpadc *gpadc;
> +	/* read or write ? */
> +	if (!strncmp(b, "read ", 5)) {
> +		write = 0;
> +		b += 5;
> +	} else if (!strncmp(b, "write ", 6)) {
> +		write = 1;
> +		b += 6;
> +	} else
> +		return -EINVAL;
>  
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	btemp_ball_raw = ab8500_gpadc_read_raw(gpadc, BTEMP_BALL,
> -		avg_sample, trig_edge, trig_timer, conv_type);
> -	btemp_ball_convert = ab8500_gpadc_ad_to_voltage(gpadc, BTEMP_BALL,
> -		btemp_ball_raw);
> +	/* OPTIONS -l|-w|-b -s -m -o */
> +	while ((*b == ' ') || (*b == '-')) {
> +		if (*(b-1) != ' ') {
> +			b++;
> +			continue;
> +		}
> +		if ((!strncmp(b, "-d ", 3)) ||
> +				(!strncmp(b, "-dec ", 5))) {
> +			b += (*(b+2) == ' ') ? 3 : 5;
> +			loc.fmt |= (1<<0);
> +		} else if ((!strncmp(b, "-h ", 3)) ||
> +				(!strncmp(b, "-hex ", 5))) {
> +			b += (*(b+2) == ' ') ? 3 : 5;
> +			loc.fmt &= ~(1<<0);
> +		} else if ((!strncmp(b, "-m ", 3)) ||
> +				(!strncmp(b, "-mask ", 6))) {
> +			b += (*(b+2) == ' ') ? 3 : 6;
> +			if (strval_len(b) == 0)
> +				return -EINVAL;
> +			ret = kstrtoul(b, 0, &loc.mask);
> +			if (ret)
> +				return ret;
> +		} else if ((!strncmp(b, "-s ", 3)) ||
> +				(!strncmp(b, "-shift ", 7))) {
> +			b += (*(b+2) == ' ') ? 3 : 7;
> +			if (strval_len(b) == 0)
> +				return -EINVAL;
> +			ret = kstrtol(b, 0, &loc.shift);
> +			if (ret)
> +				return ret;
> +		} else {
> +			return -EINVAL;
> +		}
> +	}
> +	/* get arg BANK and ADDRESS */
> +	if (strval_len(b) == 0)
> +		return -EINVAL;
> +	ret = kstrtouint(b, 0, &loc.bank);
> +	if (ret)
> +		return ret;
> +	while (*b == ' ')
> +		b++;
> +	if (strval_len(b) == 0)
> +		return -EINVAL;
> +	ret = kstrtoul(b, 0, &loc.addr);
> +	if (ret)
> +		return ret;
>  
> -	seq_printf(s, "%d,0x%X\n", btemp_ball_convert, btemp_ball_raw);
> +	if (write) {
> +		while (*b == ' ')
> +			b++;
> +		if (strval_len(b) == 0)
> +			return -EINVAL;
> +		ret = kstrtouint(b, 0, &val);
> +		if (ret)
> +			return ret;
> +	}
>  
> -	return 0;
> -}
> +	/* args are ok, update target cfg (mainly for read) */
> +	*cfg = loc;
>  
> -static int ab8500_gpadc_btemp_ball_open(struct inode *inode,
> -					struct file *file)
> -{
> -	return single_open(file, ab8500_gpadc_btemp_ball_print,
> -			   inode->i_private);
> -}
> +#ifdef ABB_HWREG_DEBUG
> +	pr_warn("HWREG request: %s, %s,\n", (write) ? "write" : "read",
> +		REG_FMT_DEC(cfg) ? "decimal" : "hexa");
> +	pr_warn("  addr=0x%08X, mask=0x%X, shift=%d" "value=0x%X\n",
> +		cfg->addr, cfg->mask, cfg->shift, val);
> +#endif
>  
> -static const struct file_operations ab8500_gpadc_btemp_ball_fops = {
> -	.open = ab8500_gpadc_btemp_ball_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> +	if (!write)
> +		return 0;
>  
> -static int ab8500_gpadc_main_charger_v_print(struct seq_file *s, void *p)
> -{
> -	int main_charger_v_raw;
> -	int main_charger_v_convert;
> -	struct ab8500_gpadc *gpadc;
> +	ret = abx500_get_register_interruptible(dev,
> +			(u8)cfg->bank, (u8)cfg->addr, &regvalue);
> +	if (ret < 0) {
> +		dev_err(dev, "abx500_get_reg fail %d, %d\n",
> +			ret, __LINE__);
> +		return -EINVAL;
> +	}
>  
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	main_charger_v_raw = ab8500_gpadc_read_raw(gpadc, MAIN_CHARGER_V,
> -		avg_sample, trig_edge, trig_timer, conv_type);
> -	main_charger_v_convert = ab8500_gpadc_ad_to_voltage(gpadc,
> -		MAIN_CHARGER_V, main_charger_v_raw);
> +	if (cfg->shift >= 0) {
> +		regvalue &= ~(cfg->mask << (cfg->shift));
> +		val = (val & cfg->mask) << (cfg->shift);
> +	} else {
> +		regvalue &= ~(cfg->mask >> (-cfg->shift));
> +		val = (val & cfg->mask) >> (-cfg->shift);
> +	}
> +	val = val | regvalue;
>  
> -	seq_printf(s, "%d,0x%X\n", main_charger_v_convert, main_charger_v_raw);
> +	ret = abx500_set_register_interruptible(dev,
> +			(u8)cfg->bank, (u8)cfg->addr, (u8)val);
> +	if (ret < 0) {
> +		pr_err("abx500_set_reg failed %d, %d", ret, __LINE__);
> +		return -EINVAL;
> +	}
>  
>  	return 0;
>  }
>  
> -static int ab8500_gpadc_main_charger_v_open(struct inode *inode,
> -					    struct file *file)
> -{
> -	return single_open(file, ab8500_gpadc_main_charger_v_print,
> -		inode->i_private);
> -}
> -
> -static const struct file_operations ab8500_gpadc_main_charger_v_fops = {
> -	.open = ab8500_gpadc_main_charger_v_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8500_gpadc_acc_detect1_print(struct seq_file *s, void *p)
> +static ssize_t ab8500_hwreg_write(struct file *file,
> +	const char __user *user_buf, size_t count, loff_t *ppos)
>  {
> -	int acc_detect1_raw;
> -	int acc_detect1_convert;
> -	struct ab8500_gpadc *gpadc;
> -
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	acc_detect1_raw = ab8500_gpadc_read_raw(gpadc, ACC_DETECT1,
> -		avg_sample, trig_edge, trig_timer, conv_type);
> -	acc_detect1_convert = ab8500_gpadc_ad_to_voltage(gpadc, ACC_DETECT1,
> -		acc_detect1_raw);
> -
> -	seq_printf(s, "%d,0x%X\n", acc_detect1_convert, acc_detect1_raw);
> +	struct device *dev = ((struct seq_file *)(file->private_data))->private;
> +	char buf[128];
> +	int buf_size, ret;
>  
> -	return 0;
> -}
> +	/* Get userspace string and assure termination */
> +	buf_size = min(count, (sizeof(buf)-1));
> +	if (copy_from_user(buf, user_buf, buf_size))
> +		return -EFAULT;
> +	buf[buf_size] = 0;
>  
> -static int ab8500_gpadc_acc_detect1_open(struct inode *inode,
> -					 struct file *file)
> -{
> -	return single_open(file, ab8500_gpadc_acc_detect1_print,
> -		inode->i_private);
> +	/* get args and process */
> +	ret = hwreg_common_write(buf, &hwreg_cfg, dev);
> +	return (ret) ? ret : buf_size;
>  }
>  
> -static const struct file_operations ab8500_gpadc_acc_detect1_fops = {
> -	.open = ab8500_gpadc_acc_detect1_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8500_gpadc_acc_detect2_print(struct seq_file *s, void *p)
> +/*
> + * - irq subscribe/unsubscribe stuff
> + */
> +static int ab8500_subscribe_unsubscribe_print(struct seq_file *s, void *p)
>  {
> -	int acc_detect2_raw;
> -	int acc_detect2_convert;
> -	struct ab8500_gpadc *gpadc;
> -
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	acc_detect2_raw = ab8500_gpadc_read_raw(gpadc, ACC_DETECT2,
> -		avg_sample, trig_edge, trig_timer, conv_type);
> -	acc_detect2_convert = ab8500_gpadc_ad_to_voltage(gpadc,
> -		ACC_DETECT2, acc_detect2_raw);
> -
> -	seq_printf(s, "%d,0x%X\n", acc_detect2_convert, acc_detect2_raw);
> +	seq_printf(s, "%d\n", irq_first);
>  
>  	return 0;
>  }
>  
> -static int ab8500_gpadc_acc_detect2_open(struct inode *inode,
> -		struct file *file)
> +static int ab8500_subscribe_unsubscribe_open(struct inode *inode,
> +					     struct file *file)
>  {
> -	return single_open(file, ab8500_gpadc_acc_detect2_print,
> +	return single_open(file, ab8500_subscribe_unsubscribe_print,
>  		inode->i_private);
>  }
>  
> -static const struct file_operations ab8500_gpadc_acc_detect2_fops = {
> -	.open = ab8500_gpadc_acc_detect2_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8500_gpadc_aux1_print(struct seq_file *s, void *p)
> +/*
> + * Userspace should use poll() on this file. When an event occur
> + * the blocking poll will be released.
> + */
> +static ssize_t show_irq(struct device *dev,
> +			struct device_attribute *attr, char *buf)
>  {
> -	int aux1_raw;
> -	int aux1_convert;
> -	struct ab8500_gpadc *gpadc;
> +	unsigned long name;
> +	unsigned int irq_index;
> +	int err;
>  
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	aux1_raw = ab8500_gpadc_read_raw(gpadc, ADC_AUX1,
> -		avg_sample, trig_edge, trig_timer, conv_type);
> -	aux1_convert = ab8500_gpadc_ad_to_voltage(gpadc, ADC_AUX1,
> -		aux1_raw);
> +	err = kstrtoul(attr->attr.name, 0, &name);
> +	if (err)
> +		return err;
>  
> -	seq_printf(s, "%d,0x%X\n", aux1_convert, aux1_raw);
> +	irq_index = name - irq_first;
> +	if (irq_index >= num_irqs)
> +		return -EINVAL;
>  
> -	return 0;
> +	return sprintf(buf, "%u\n", irq_count[irq_index]);
>  }
>  
> -static int ab8500_gpadc_aux1_open(struct inode *inode, struct file *file)
> +static ssize_t ab8500_subscribe_write(struct file *file,
> +				      const char __user *user_buf,
> +				      size_t count, loff_t *ppos)
>  {
> -	return single_open(file, ab8500_gpadc_aux1_print, inode->i_private);
> -}
> +	struct device *dev = ((struct seq_file *)(file->private_data))->private;
> +	unsigned long user_val;
> +	int err;
> +	unsigned int irq_index;
>  
> -static const struct file_operations ab8500_gpadc_aux1_fops = {
> -	.open = ab8500_gpadc_aux1_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> +	err = kstrtoul_from_user(user_buf, count, 0, &user_val);
> +	if (err)
> +		return err;
>  
> -static int ab8500_gpadc_aux2_print(struct seq_file *s, void *p)
> -{
> -	int aux2_raw;
> -	int aux2_convert;
> -	struct ab8500_gpadc *gpadc;
> +	if (user_val < irq_first) {
> +		dev_err(dev, "debugfs error input < %d\n", irq_first);
> +		return -EINVAL;
> +	}
> +	if (user_val > irq_last) {
> +		dev_err(dev, "debugfs error input > %d\n", irq_last);
> +		return -EINVAL;
> +	}
>  
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	aux2_raw = ab8500_gpadc_read_raw(gpadc, ADC_AUX2,
> -		avg_sample, trig_edge, trig_timer, conv_type);
> -	aux2_convert = ab8500_gpadc_ad_to_voltage(gpadc, ADC_AUX2,
> -		aux2_raw);
> -
> -	seq_printf(s, "%d,0x%X\n", aux2_convert, aux2_raw);
> -
> -	return 0;
> -}
> -
> -static int ab8500_gpadc_aux2_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, ab8500_gpadc_aux2_print, inode->i_private);
> -}
> -
> -static const struct file_operations ab8500_gpadc_aux2_fops = {
> -	.open = ab8500_gpadc_aux2_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8500_gpadc_main_bat_v_print(struct seq_file *s, void *p)
> -{
> -	int main_bat_v_raw;
> -	int main_bat_v_convert;
> -	struct ab8500_gpadc *gpadc;
> -
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	main_bat_v_raw = ab8500_gpadc_read_raw(gpadc, MAIN_BAT_V,
> -		avg_sample, trig_edge, trig_timer, conv_type);
> -	main_bat_v_convert = ab8500_gpadc_ad_to_voltage(gpadc, MAIN_BAT_V,
> -		main_bat_v_raw);
> -
> -	seq_printf(s, "%d,0x%X\n", main_bat_v_convert, main_bat_v_raw);
> -
> -	return 0;
> -}
> -
> -static int ab8500_gpadc_main_bat_v_open(struct inode *inode,
> -					struct file *file)
> -{
> -	return single_open(file, ab8500_gpadc_main_bat_v_print,
> -			   inode->i_private);
> -}
> -
> -static const struct file_operations ab8500_gpadc_main_bat_v_fops = {
> -	.open = ab8500_gpadc_main_bat_v_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8500_gpadc_vbus_v_print(struct seq_file *s, void *p)
> -{
> -	int vbus_v_raw;
> -	int vbus_v_convert;
> -	struct ab8500_gpadc *gpadc;
> -
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	vbus_v_raw =  ab8500_gpadc_read_raw(gpadc, VBUS_V,
> -		avg_sample, trig_edge, trig_timer, conv_type);
> -	vbus_v_convert = ab8500_gpadc_ad_to_voltage(gpadc, VBUS_V,
> -		vbus_v_raw);
> -
> -	seq_printf(s, "%d,0x%X\n", vbus_v_convert, vbus_v_raw);
> -
> -	return 0;
> -}
> -
> -static int ab8500_gpadc_vbus_v_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, ab8500_gpadc_vbus_v_print, inode->i_private);
> -}
> -
> -static const struct file_operations ab8500_gpadc_vbus_v_fops = {
> -	.open = ab8500_gpadc_vbus_v_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8500_gpadc_main_charger_c_print(struct seq_file *s, void *p)
> -{
> -	int main_charger_c_raw;
> -	int main_charger_c_convert;
> -	struct ab8500_gpadc *gpadc;
> -
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	main_charger_c_raw = ab8500_gpadc_read_raw(gpadc, MAIN_CHARGER_C,
> -		avg_sample, trig_edge, trig_timer, conv_type);
> -	main_charger_c_convert = ab8500_gpadc_ad_to_voltage(gpadc,
> -		MAIN_CHARGER_C, main_charger_c_raw);
> -
> -	seq_printf(s, "%d,0x%X\n", main_charger_c_convert, main_charger_c_raw);
> -
> -	return 0;
> -}
> -
> -static int ab8500_gpadc_main_charger_c_open(struct inode *inode,
> -		struct file *file)
> -{
> -	return single_open(file, ab8500_gpadc_main_charger_c_print,
> -		inode->i_private);
> -}
> -
> -static const struct file_operations ab8500_gpadc_main_charger_c_fops = {
> -	.open = ab8500_gpadc_main_charger_c_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8500_gpadc_usb_charger_c_print(struct seq_file *s, void *p)
> -{
> -	int usb_charger_c_raw;
> -	int usb_charger_c_convert;
> -	struct ab8500_gpadc *gpadc;
> -
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	usb_charger_c_raw = ab8500_gpadc_read_raw(gpadc, USB_CHARGER_C,
> -		avg_sample, trig_edge, trig_timer, conv_type);
> -	usb_charger_c_convert = ab8500_gpadc_ad_to_voltage(gpadc,
> -		USB_CHARGER_C, usb_charger_c_raw);
> -
> -	seq_printf(s, "%d,0x%X\n", usb_charger_c_convert, usb_charger_c_raw);
> -
> -	return 0;
> -}
> -
> -static int ab8500_gpadc_usb_charger_c_open(struct inode *inode,
> -		struct file *file)
> -{
> -	return single_open(file, ab8500_gpadc_usb_charger_c_print,
> -		inode->i_private);
> -}
> -
> -static const struct file_operations ab8500_gpadc_usb_charger_c_fops = {
> -	.open = ab8500_gpadc_usb_charger_c_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8500_gpadc_bk_bat_v_print(struct seq_file *s, void *p)
> -{
> -	int bk_bat_v_raw;
> -	int bk_bat_v_convert;
> -	struct ab8500_gpadc *gpadc;
> -
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	bk_bat_v_raw = ab8500_gpadc_read_raw(gpadc, BK_BAT_V,
> -		avg_sample, trig_edge, trig_timer, conv_type);
> -	bk_bat_v_convert = ab8500_gpadc_ad_to_voltage(gpadc,
> -		BK_BAT_V, bk_bat_v_raw);
> -
> -	seq_printf(s, "%d,0x%X\n", bk_bat_v_convert, bk_bat_v_raw);
> -
> -	return 0;
> -}
> -
> -static int ab8500_gpadc_bk_bat_v_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, ab8500_gpadc_bk_bat_v_print,
> -			   inode->i_private);
> -}
> -
> -static const struct file_operations ab8500_gpadc_bk_bat_v_fops = {
> -	.open = ab8500_gpadc_bk_bat_v_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8500_gpadc_die_temp_print(struct seq_file *s, void *p)
> -{
> -	int die_temp_raw;
> -	int die_temp_convert;
> -	struct ab8500_gpadc *gpadc;
> -
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	die_temp_raw = ab8500_gpadc_read_raw(gpadc, DIE_TEMP,
> -		avg_sample, trig_edge, trig_timer, conv_type);
> -	die_temp_convert = ab8500_gpadc_ad_to_voltage(gpadc, DIE_TEMP,
> -		die_temp_raw);
> -
> -	seq_printf(s, "%d,0x%X\n", die_temp_convert, die_temp_raw);
> -
> -	return 0;
> -}
> -
> -static int ab8500_gpadc_die_temp_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, ab8500_gpadc_die_temp_print,
> -			   inode->i_private);
> -}
> -
> -static const struct file_operations ab8500_gpadc_die_temp_fops = {
> -	.open = ab8500_gpadc_die_temp_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8500_gpadc_usb_id_print(struct seq_file *s, void *p)
> -{
> -	int usb_id_raw;
> -	int usb_id_convert;
> -	struct ab8500_gpadc *gpadc;
> -
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	usb_id_raw = ab8500_gpadc_read_raw(gpadc, USB_ID,
> -		avg_sample, trig_edge, trig_timer, conv_type);
> -	usb_id_convert = ab8500_gpadc_ad_to_voltage(gpadc, USB_ID,
> -		usb_id_raw);
> -
> -	seq_printf(s, "%d,0x%X\n", usb_id_convert, usb_id_raw);
> -
> -	return 0;
> -}
> -
> -static int ab8500_gpadc_usb_id_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, ab8500_gpadc_usb_id_print, inode->i_private);
> -}
> -
> -static const struct file_operations ab8500_gpadc_usb_id_fops = {
> -	.open = ab8500_gpadc_usb_id_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8540_gpadc_xtal_temp_print(struct seq_file *s, void *p)
> -{
> -	int xtal_temp_raw;
> -	int xtal_temp_convert;
> -	struct ab8500_gpadc *gpadc;
> -
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	xtal_temp_raw = ab8500_gpadc_read_raw(gpadc, XTAL_TEMP,
> -		avg_sample, trig_edge, trig_timer, conv_type);
> -	xtal_temp_convert = ab8500_gpadc_ad_to_voltage(gpadc, XTAL_TEMP,
> -		xtal_temp_raw);
> -
> -	seq_printf(s, "%d,0x%X\n", xtal_temp_convert, xtal_temp_raw);
> -
> -	return 0;
> -}
> -
> -static int ab8540_gpadc_xtal_temp_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, ab8540_gpadc_xtal_temp_print,
> -		inode->i_private);
> -}
> -
> -static const struct file_operations ab8540_gpadc_xtal_temp_fops = {
> -	.open = ab8540_gpadc_xtal_temp_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8540_gpadc_vbat_true_meas_print(struct seq_file *s, void *p)
> -{
> -	int vbat_true_meas_raw;
> -	int vbat_true_meas_convert;
> -	struct ab8500_gpadc *gpadc;
> -
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	vbat_true_meas_raw = ab8500_gpadc_read_raw(gpadc, VBAT_TRUE_MEAS,
> -		avg_sample, trig_edge, trig_timer, conv_type);
> -	vbat_true_meas_convert =
> -		ab8500_gpadc_ad_to_voltage(gpadc, VBAT_TRUE_MEAS,
> -					   vbat_true_meas_raw);
> -
> -	seq_printf(s, "%d,0x%X\n", vbat_true_meas_convert, vbat_true_meas_raw);
> -
> -	return 0;
> -}
> -
> -static int ab8540_gpadc_vbat_true_meas_open(struct inode *inode,
> -		struct file *file)
> -{
> -	return single_open(file, ab8540_gpadc_vbat_true_meas_print,
> -		inode->i_private);
> -}
> -
> -static const struct file_operations ab8540_gpadc_vbat_true_meas_fops = {
> -	.open = ab8540_gpadc_vbat_true_meas_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8540_gpadc_bat_ctrl_and_ibat_print(struct seq_file *s, void *p)
> -{
> -	int bat_ctrl_raw;
> -	int bat_ctrl_convert;
> -	int ibat_raw;
> -	int ibat_convert;
> -	struct ab8500_gpadc *gpadc;
> -
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	bat_ctrl_raw = ab8500_gpadc_double_read_raw(gpadc, BAT_CTRL_AND_IBAT,
> -		avg_sample, trig_edge, trig_timer, conv_type, &ibat_raw);
> -
> -	bat_ctrl_convert = ab8500_gpadc_ad_to_voltage(gpadc, BAT_CTRL,
> -		bat_ctrl_raw);
> -	ibat_convert = ab8500_gpadc_ad_to_voltage(gpadc, IBAT_VIRTUAL_CHANNEL,
> -		ibat_raw);
> -
> -	seq_printf(s,
> -		   "%d,0x%X\n"
> -		   "%d,0x%X\n",
> -		   bat_ctrl_convert, bat_ctrl_raw,
> -		   ibat_convert, ibat_raw);
> -
> -	return 0;
> -}
> -
> -static int ab8540_gpadc_bat_ctrl_and_ibat_open(struct inode *inode,
> -		struct file *file)
> -{
> -	return single_open(file, ab8540_gpadc_bat_ctrl_and_ibat_print,
> -		inode->i_private);
> -}
> -
> -static const struct file_operations ab8540_gpadc_bat_ctrl_and_ibat_fops = {
> -	.open = ab8540_gpadc_bat_ctrl_and_ibat_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8540_gpadc_vbat_meas_and_ibat_print(struct seq_file *s, void *p)
> -{
> -	int vbat_meas_raw;
> -	int vbat_meas_convert;
> -	int ibat_raw;
> -	int ibat_convert;
> -	struct ab8500_gpadc *gpadc;
> -
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	vbat_meas_raw = ab8500_gpadc_double_read_raw(gpadc, VBAT_MEAS_AND_IBAT,
> -		avg_sample, trig_edge, trig_timer, conv_type, &ibat_raw);
> -	vbat_meas_convert = ab8500_gpadc_ad_to_voltage(gpadc, MAIN_BAT_V,
> -		vbat_meas_raw);
> -	ibat_convert = ab8500_gpadc_ad_to_voltage(gpadc, IBAT_VIRTUAL_CHANNEL,
> -		ibat_raw);
> -
> -	seq_printf(s,
> -		   "%d,0x%X\n"
> -		   "%d,0x%X\n",
> -		   vbat_meas_convert, vbat_meas_raw,
> -		   ibat_convert, ibat_raw);
> -
> -	return 0;
> -}
> -
> -static int ab8540_gpadc_vbat_meas_and_ibat_open(struct inode *inode,
> -		struct file *file)
> -{
> -	return single_open(file, ab8540_gpadc_vbat_meas_and_ibat_print,
> -		inode->i_private);
> -}
> -
> -static const struct file_operations ab8540_gpadc_vbat_meas_and_ibat_fops = {
> -	.open = ab8540_gpadc_vbat_meas_and_ibat_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8540_gpadc_vbat_true_meas_and_ibat_print(struct seq_file *s,
> -						      void *p)
> -{
> -	int vbat_true_meas_raw;
> -	int vbat_true_meas_convert;
> -	int ibat_raw;
> -	int ibat_convert;
> -	struct ab8500_gpadc *gpadc;
> -
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	vbat_true_meas_raw = ab8500_gpadc_double_read_raw(gpadc,
> -			VBAT_TRUE_MEAS_AND_IBAT, avg_sample, trig_edge,
> -			trig_timer, conv_type, &ibat_raw);
> -	vbat_true_meas_convert = ab8500_gpadc_ad_to_voltage(gpadc,
> -			VBAT_TRUE_MEAS, vbat_true_meas_raw);
> -	ibat_convert = ab8500_gpadc_ad_to_voltage(gpadc, IBAT_VIRTUAL_CHANNEL,
> -		ibat_raw);
> -
> -	seq_printf(s,
> -		   "%d,0x%X\n"
> -		   "%d,0x%X\n",
> -		   vbat_true_meas_convert, vbat_true_meas_raw,
> -		   ibat_convert, ibat_raw);
> -
> -	return 0;
> -}
> -
> -static int ab8540_gpadc_vbat_true_meas_and_ibat_open(struct inode *inode,
> -		struct file *file)
> -{
> -	return single_open(file, ab8540_gpadc_vbat_true_meas_and_ibat_print,
> -		inode->i_private);
> -}
> -
> -static const struct file_operations
> -ab8540_gpadc_vbat_true_meas_and_ibat_fops = {
> -	.open = ab8540_gpadc_vbat_true_meas_and_ibat_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8540_gpadc_bat_temp_and_ibat_print(struct seq_file *s, void *p)
> -{
> -	int bat_temp_raw;
> -	int bat_temp_convert;
> -	int ibat_raw;
> -	int ibat_convert;
> -	struct ab8500_gpadc *gpadc;
> -
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	bat_temp_raw = ab8500_gpadc_double_read_raw(gpadc, BAT_TEMP_AND_IBAT,
> -		avg_sample, trig_edge, trig_timer, conv_type, &ibat_raw);
> -	bat_temp_convert = ab8500_gpadc_ad_to_voltage(gpadc, BTEMP_BALL,
> -		bat_temp_raw);
> -	ibat_convert = ab8500_gpadc_ad_to_voltage(gpadc, IBAT_VIRTUAL_CHANNEL,
> -		ibat_raw);
> -
> -	seq_printf(s,
> -		   "%d,0x%X\n"
> -		   "%d,0x%X\n",
> -		   bat_temp_convert, bat_temp_raw,
> -		   ibat_convert, ibat_raw);
> -
> -	return 0;
> -}
> -
> -static int ab8540_gpadc_bat_temp_and_ibat_open(struct inode *inode,
> -		struct file *file)
> -{
> -	return single_open(file, ab8540_gpadc_bat_temp_and_ibat_print,
> -		inode->i_private);
> -}
> -
> -static const struct file_operations ab8540_gpadc_bat_temp_and_ibat_fops = {
> -	.open = ab8540_gpadc_bat_temp_and_ibat_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8540_gpadc_otp_cal_print(struct seq_file *s, void *p)
> -{
> -	struct ab8500_gpadc *gpadc;
> -	u16 vmain_l, vmain_h, btemp_l, btemp_h;
> -	u16 vbat_l, vbat_h, ibat_l, ibat_h;
> -
> -	gpadc = ab8500_gpadc_get("ab8500-gpadc.0");
> -	ab8540_gpadc_get_otp(gpadc, &vmain_l, &vmain_h, &btemp_l, &btemp_h,
> -			&vbat_l, &vbat_h, &ibat_l, &ibat_h);
> -	seq_printf(s,
> -		   "VMAIN_L:0x%X\n"
> -		   "VMAIN_H:0x%X\n"
> -		   "BTEMP_L:0x%X\n"
> -		   "BTEMP_H:0x%X\n"
> -		   "VBAT_L:0x%X\n"
> -		   "VBAT_H:0x%X\n"
> -		   "IBAT_L:0x%X\n"
> -		   "IBAT_H:0x%X\n",
> -		   vmain_l, vmain_h, btemp_l, btemp_h,
> -		   vbat_l, vbat_h, ibat_l, ibat_h);
> -
> -	return 0;
> -}
> -
> -static int ab8540_gpadc_otp_cal_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, ab8540_gpadc_otp_cal_print, inode->i_private);
> -}
> -
> -static const struct file_operations ab8540_gpadc_otp_calib_fops = {
> -	.open = ab8540_gpadc_otp_cal_open,
> -	.read = seq_read,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8500_gpadc_avg_sample_print(struct seq_file *s, void *p)
> -{
> -	seq_printf(s, "%d\n", avg_sample);
> -
> -	return 0;
> -}
> -
> -static int ab8500_gpadc_avg_sample_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, ab8500_gpadc_avg_sample_print,
> -		inode->i_private);
> -}
> -
> -static ssize_t ab8500_gpadc_avg_sample_write(struct file *file,
> -	const char __user *user_buf,
> -	size_t count, loff_t *ppos)
> -{
> -	struct device *dev = ((struct seq_file *)(file->private_data))->private;
> -	unsigned long user_avg_sample;
> -	int err;
> -
> -	err = kstrtoul_from_user(user_buf, count, 0, &user_avg_sample);
> -	if (err)
> -		return err;
> -
> -	if ((user_avg_sample == SAMPLE_1) || (user_avg_sample == SAMPLE_4)
> -			|| (user_avg_sample == SAMPLE_8)
> -			|| (user_avg_sample == SAMPLE_16)) {
> -		avg_sample = (u8) user_avg_sample;
> -	} else {
> -		dev_err(dev,
> -			"debugfs err input: should be egal to 1, 4, 8 or 16\n");
> -		return -EINVAL;
> -	}
> -
> -	return count;
> -}
> -
> -static const struct file_operations ab8500_gpadc_avg_sample_fops = {
> -	.open = ab8500_gpadc_avg_sample_open,
> -	.read = seq_read,
> -	.write = ab8500_gpadc_avg_sample_write,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8500_gpadc_trig_edge_print(struct seq_file *s, void *p)
> -{
> -	seq_printf(s, "%d\n", trig_edge);
> -
> -	return 0;
> -}
> -
> -static int ab8500_gpadc_trig_edge_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, ab8500_gpadc_trig_edge_print,
> -		inode->i_private);
> -}
> -
> -static ssize_t ab8500_gpadc_trig_edge_write(struct file *file,
> -	const char __user *user_buf,
> -	size_t count, loff_t *ppos)
> -{
> -	struct device *dev = ((struct seq_file *)(file->private_data))->private;
> -	unsigned long user_trig_edge;
> -	int err;
> -
> -	err = kstrtoul_from_user(user_buf, count, 0, &user_trig_edge);
> -	if (err)
> -		return err;
> -
> -	if ((user_trig_edge == RISING_EDGE)
> -			|| (user_trig_edge == FALLING_EDGE)) {
> -		trig_edge = (u8) user_trig_edge;
> -	} else {
> -		dev_err(dev, "Wrong input:\n"
> -			"Enter 0. Rising edge\n"
> -			"Enter 1. Falling edge\n");
> -		return -EINVAL;
> -	}
> -
> -	return count;
> -}
> -
> -static const struct file_operations ab8500_gpadc_trig_edge_fops = {
> -	.open = ab8500_gpadc_trig_edge_open,
> -	.read = seq_read,
> -	.write = ab8500_gpadc_trig_edge_write,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8500_gpadc_trig_timer_print(struct seq_file *s, void *p)
> -{
> -	seq_printf(s, "%d\n", trig_timer);
> -
> -	return 0;
> -}
> -
> -static int ab8500_gpadc_trig_timer_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, ab8500_gpadc_trig_timer_print,
> -		inode->i_private);
> -}
> -
> -static ssize_t ab8500_gpadc_trig_timer_write(struct file *file,
> -	const char __user *user_buf,
> -	size_t count, loff_t *ppos)
> -{
> -	struct device *dev = ((struct seq_file *)(file->private_data))->private;
> -	unsigned long user_trig_timer;
> -	int err;
> -
> -	err = kstrtoul_from_user(user_buf, count, 0, &user_trig_timer);
> -	if (err)
> -		return err;
> -
> -	if (user_trig_timer & ~0xFF) {
> -		dev_err(dev,
> -			"debugfs error input: should be between 0 to 255\n");
> -		return -EINVAL;
> -	}
> -
> -	trig_timer = (u8) user_trig_timer;
> -
> -	return count;
> -}
> -
> -static const struct file_operations ab8500_gpadc_trig_timer_fops = {
> -	.open = ab8500_gpadc_trig_timer_open,
> -	.read = seq_read,
> -	.write = ab8500_gpadc_trig_timer_write,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -static int ab8500_gpadc_conv_type_print(struct seq_file *s, void *p)
> -{
> -	seq_printf(s, "%d\n", conv_type);
> -
> -	return 0;
> -}
> -
> -static int ab8500_gpadc_conv_type_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, ab8500_gpadc_conv_type_print,
> -		inode->i_private);
> -}
> -
> -static ssize_t ab8500_gpadc_conv_type_write(struct file *file,
> -	const char __user *user_buf,
> -	size_t count, loff_t *ppos)
> -{
> -	struct device *dev = ((struct seq_file *)(file->private_data))->private;
> -	unsigned long user_conv_type;
> -	int err;
> -
> -	err = kstrtoul_from_user(user_buf, count, 0, &user_conv_type);
> -	if (err)
> -		return err;
> -
> -	if ((user_conv_type == ADC_SW)
> -			|| (user_conv_type == ADC_HW)) {
> -		conv_type = (u8) user_conv_type;
> -	} else {
> -		dev_err(dev, "Wrong input:\n"
> -			"Enter 0. ADC SW conversion\n"
> -			"Enter 1. ADC HW conversion\n");
> -		return -EINVAL;
> -	}
> -
> -	return count;
> -}
> -
> -static const struct file_operations ab8500_gpadc_conv_type_fops = {
> -	.open = ab8500_gpadc_conv_type_open,
> -	.read = seq_read,
> -	.write = ab8500_gpadc_conv_type_write,
> -	.llseek = seq_lseek,
> -	.release = single_release,
> -	.owner = THIS_MODULE,
> -};
> -
> -/*
> - * return length of an ASCII numerical value, 0 is string is not a
> - * numerical value.
> - * string shall start at value 1st char.
> - * string can be tailed with \0 or space or newline chars only.
> - * value can be decimal or hexadecimal (prefixed 0x or 0X).
> - */
> -static int strval_len(char *b)
> -{
> -	char *s = b;
> -
> -	if ((*s == '0') && ((*(s+1) == 'x') || (*(s+1) == 'X'))) {
> -		s += 2;
> -		for (; *s && (*s != ' ') && (*s != '\n'); s++) {
> -			if (!isxdigit(*s))
> -				return 0;
> -		}
> -	} else {
> -		if (*s == '-')
> -			s++;
> -		for (; *s && (*s != ' ') && (*s != '\n'); s++) {
> -			if (!isdigit(*s))
> -				return 0;
> -		}
> -	}
> -	return (int) (s-b);
> -}
> -
> -/*
> - * parse hwreg input data.
> - * update global hwreg_cfg only if input data syntax is ok.
> - */
> -static ssize_t hwreg_common_write(char *b, struct hwreg_cfg *cfg,
> -		struct device *dev)
> -{
> -	uint write, val = 0;
> -	u8  regvalue;
> -	int ret;
> -	struct hwreg_cfg loc = {
> -		.bank = 0,          /* default: invalid phys addr */
> -		.addr = 0,          /* default: invalid phys addr */
> -		.fmt = 0,           /* default: 32bit access, hex output */
> -		.mask = 0xFFFFFFFF, /* default: no mask */
> -		.shift = 0,         /* default: no bit shift */
> -	};
> -
> -	/* read or write ? */
> -	if (!strncmp(b, "read ", 5)) {
> -		write = 0;
> -		b += 5;
> -	} else if (!strncmp(b, "write ", 6)) {
> -		write = 1;
> -		b += 6;
> -	} else
> -		return -EINVAL;
> -
> -	/* OPTIONS -l|-w|-b -s -m -o */
> -	while ((*b == ' ') || (*b == '-')) {
> -		if (*(b-1) != ' ') {
> -			b++;
> -			continue;
> -		}
> -		if ((!strncmp(b, "-d ", 3)) ||
> -				(!strncmp(b, "-dec ", 5))) {
> -			b += (*(b+2) == ' ') ? 3 : 5;
> -			loc.fmt |= (1<<0);
> -		} else if ((!strncmp(b, "-h ", 3)) ||
> -				(!strncmp(b, "-hex ", 5))) {
> -			b += (*(b+2) == ' ') ? 3 : 5;
> -			loc.fmt &= ~(1<<0);
> -		} else if ((!strncmp(b, "-m ", 3)) ||
> -				(!strncmp(b, "-mask ", 6))) {
> -			b += (*(b+2) == ' ') ? 3 : 6;
> -			if (strval_len(b) == 0)
> -				return -EINVAL;
> -			ret = kstrtoul(b, 0, &loc.mask);
> -			if (ret)
> -				return ret;
> -		} else if ((!strncmp(b, "-s ", 3)) ||
> -				(!strncmp(b, "-shift ", 7))) {
> -			b += (*(b+2) == ' ') ? 3 : 7;
> -			if (strval_len(b) == 0)
> -				return -EINVAL;
> -			ret = kstrtol(b, 0, &loc.shift);
> -			if (ret)
> -				return ret;
> -		} else {
> -			return -EINVAL;
> -		}
> -	}
> -	/* get arg BANK and ADDRESS */
> -	if (strval_len(b) == 0)
> -		return -EINVAL;
> -	ret = kstrtouint(b, 0, &loc.bank);
> -	if (ret)
> -		return ret;
> -	while (*b == ' ')
> -		b++;
> -	if (strval_len(b) == 0)
> -		return -EINVAL;
> -	ret = kstrtoul(b, 0, &loc.addr);
> -	if (ret)
> -		return ret;
> -
> -	if (write) {
> -		while (*b == ' ')
> -			b++;
> -		if (strval_len(b) == 0)
> -			return -EINVAL;
> -		ret = kstrtouint(b, 0, &val);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	/* args are ok, update target cfg (mainly for read) */
> -	*cfg = loc;
> -
> -#ifdef ABB_HWREG_DEBUG
> -	pr_warn("HWREG request: %s, %s,\n", (write) ? "write" : "read",
> -		REG_FMT_DEC(cfg) ? "decimal" : "hexa");
> -	pr_warn("  addr=0x%08X, mask=0x%X, shift=%d" "value=0x%X\n",
> -		cfg->addr, cfg->mask, cfg->shift, val);
> -#endif
> -
> -	if (!write)
> -		return 0;
> -
> -	ret = abx500_get_register_interruptible(dev,
> -			(u8)cfg->bank, (u8)cfg->addr, &regvalue);
> -	if (ret < 0) {
> -		dev_err(dev, "abx500_get_reg fail %d, %d\n",
> -			ret, __LINE__);
> -		return -EINVAL;
> -	}
> -
> -	if (cfg->shift >= 0) {
> -		regvalue &= ~(cfg->mask << (cfg->shift));
> -		val = (val & cfg->mask) << (cfg->shift);
> -	} else {
> -		regvalue &= ~(cfg->mask >> (-cfg->shift));
> -		val = (val & cfg->mask) >> (-cfg->shift);
> -	}
> -	val = val | regvalue;
> -
> -	ret = abx500_set_register_interruptible(dev,
> -			(u8)cfg->bank, (u8)cfg->addr, (u8)val);
> -	if (ret < 0) {
> -		pr_err("abx500_set_reg failed %d, %d", ret, __LINE__);
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -static ssize_t ab8500_hwreg_write(struct file *file,
> -	const char __user *user_buf, size_t count, loff_t *ppos)
> -{
> -	struct device *dev = ((struct seq_file *)(file->private_data))->private;
> -	char buf[128];
> -	int buf_size, ret;
> -
> -	/* Get userspace string and assure termination */
> -	buf_size = min(count, (sizeof(buf)-1));
> -	if (copy_from_user(buf, user_buf, buf_size))
> -		return -EFAULT;
> -	buf[buf_size] = 0;
> -
> -	/* get args and process */
> -	ret = hwreg_common_write(buf, &hwreg_cfg, dev);
> -	return (ret) ? ret : buf_size;
> -}
> -
> -/*
> - * - irq subscribe/unsubscribe stuff
> - */
> -static int ab8500_subscribe_unsubscribe_print(struct seq_file *s, void *p)
> -{
> -	seq_printf(s, "%d\n", irq_first);
> -
> -	return 0;
> -}
> -
> -static int ab8500_subscribe_unsubscribe_open(struct inode *inode,
> -					     struct file *file)
> -{
> -	return single_open(file, ab8500_subscribe_unsubscribe_print,
> -		inode->i_private);
> -}
> -
> -/*
> - * Userspace should use poll() on this file. When an event occur
> - * the blocking poll will be released.
> - */
> -static ssize_t show_irq(struct device *dev,
> -			struct device_attribute *attr, char *buf)
> -{
> -	unsigned long name;
> -	unsigned int irq_index;
> -	int err;
> -
> -	err = kstrtoul(attr->attr.name, 0, &name);
> -	if (err)
> -		return err;
> -
> -	irq_index = name - irq_first;
> -	if (irq_index >= num_irqs)
> -		return -EINVAL;
> -
> -	return sprintf(buf, "%u\n", irq_count[irq_index]);
> -}
> -
> -static ssize_t ab8500_subscribe_write(struct file *file,
> -				      const char __user *user_buf,
> -				      size_t count, loff_t *ppos)
> -{
> -	struct device *dev = ((struct seq_file *)(file->private_data))->private;
> -	unsigned long user_val;
> -	int err;
> -	unsigned int irq_index;
> -
> -	err = kstrtoul_from_user(user_buf, count, 0, &user_val);
> -	if (err)
> -		return err;
> -
> -	if (user_val < irq_first) {
> -		dev_err(dev, "debugfs error input < %d\n", irq_first);
> -		return -EINVAL;
> -	}
> -	if (user_val > irq_last) {
> -		dev_err(dev, "debugfs error input > %d\n", irq_last);
> -		return -EINVAL;
> -	}
> -
> -	irq_index = user_val - irq_first;
> -	if (irq_index >= num_irqs)
> -		return -EINVAL;
> +	irq_index = user_val - irq_first;
> +	if (irq_index >= num_irqs)
> +		return -EINVAL;
>  
>  	/*
>  	 * This will create a sysfs file named <irq-nr> which userspace can
> @@ -2939,7 +2044,6 @@ static const struct file_operations ab8500_hwreg_fops = {
>  };
>  
>  static struct dentry *ab8500_dir;
> -static struct dentry *ab8500_gpadc_dir;
>  
>  static int ab8500_debug_probe(struct platform_device *plf)
>  {
> @@ -2991,11 +2095,6 @@ static int ab8500_debug_probe(struct platform_device *plf)
>  	if (!ab8500_dir)
>  		goto err;
>  
> -	ab8500_gpadc_dir = debugfs_create_dir(AB8500_ADC_NAME_STRING,
> -					      ab8500_dir);
> -	if (!ab8500_gpadc_dir)
> -		goto err;
> -
>  	file = debugfs_create_file("all-bank-registers", S_IRUGO, ab8500_dir,
>  				   &plf->dev, &ab8500_registers_fops);
>  	if (!file)
> @@ -3066,165 +2165,6 @@ static int ab8500_debug_probe(struct platform_device *plf)
>  	if (!file)
>  		goto err;
>  
> -	file = debugfs_create_file("bat_ctrl", (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir, &plf->dev,
> -				   &ab8500_gpadc_bat_ctrl_fops);
> -	if (!file)
> -		goto err;
> -
> -	file = debugfs_create_file("btemp_ball", (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir,
> -				   &plf->dev, &ab8500_gpadc_btemp_ball_fops);
> -	if (!file)
> -		goto err;
> -
> -	file = debugfs_create_file("main_charger_v",
> -				   (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir, &plf->dev,
> -				   &ab8500_gpadc_main_charger_v_fops);
> -	if (!file)
> -		goto err;
> -
> -	file = debugfs_create_file("acc_detect1",
> -				   (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir, &plf->dev,
> -				   &ab8500_gpadc_acc_detect1_fops);
> -	if (!file)
> -		goto err;
> -
> -	file = debugfs_create_file("acc_detect2",
> -				   (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir, &plf->dev,
> -				   &ab8500_gpadc_acc_detect2_fops);
> -	if (!file)
> -		goto err;
> -
> -	file = debugfs_create_file("adc_aux1", (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir, &plf->dev,
> -				   &ab8500_gpadc_aux1_fops);
> -	if (!file)
> -		goto err;
> -
> -	file = debugfs_create_file("adc_aux2", (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir, &plf->dev,
> -				   &ab8500_gpadc_aux2_fops);
> -	if (!file)
> -		goto err;
> -
> -	file = debugfs_create_file("main_bat_v", (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir, &plf->dev,
> -				   &ab8500_gpadc_main_bat_v_fops);
> -	if (!file)
> -		goto err;
> -
> -	file = debugfs_create_file("vbus_v", (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir, &plf->dev,
> -				   &ab8500_gpadc_vbus_v_fops);
> -	if (!file)
> -		goto err;
> -
> -	file = debugfs_create_file("main_charger_c",
> -				   (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir, &plf->dev,
> -				   &ab8500_gpadc_main_charger_c_fops);
> -	if (!file)
> -		goto err;
> -
> -	file = debugfs_create_file("usb_charger_c",
> -				   (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir,
> -				   &plf->dev, &ab8500_gpadc_usb_charger_c_fops);
> -	if (!file)
> -		goto err;
> -
> -	file = debugfs_create_file("bk_bat_v", (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir, &plf->dev,
> -				   &ab8500_gpadc_bk_bat_v_fops);
> -	if (!file)
> -		goto err;
> -
> -	file = debugfs_create_file("die_temp", (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir, &plf->dev,
> -				   &ab8500_gpadc_die_temp_fops);
> -	if (!file)
> -		goto err;
> -
> -	file = debugfs_create_file("usb_id", (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir, &plf->dev,
> -				   &ab8500_gpadc_usb_id_fops);
> -	if (!file)
> -		goto err;
> -
> -	if (is_ab8540(ab8500)) {
> -		file = debugfs_create_file("xtal_temp",
> -					   (S_IRUGO | S_IWUSR | S_IWGRP),
> -					   ab8500_gpadc_dir, &plf->dev,
> -					   &ab8540_gpadc_xtal_temp_fops);
> -		if (!file)
> -			goto err;
> -		file = debugfs_create_file("vbattruemeas",
> -					   (S_IRUGO | S_IWUSR | S_IWGRP),
> -					   ab8500_gpadc_dir, &plf->dev,
> -					   &ab8540_gpadc_vbat_true_meas_fops);
> -		if (!file)
> -			goto err;
> -		file = debugfs_create_file("batctrl_and_ibat",
> -					(S_IRUGO | S_IWUGO),
> -					ab8500_gpadc_dir,
> -					&plf->dev,
> -					&ab8540_gpadc_bat_ctrl_and_ibat_fops);
> -		if (!file)
> -			goto err;
> -		file = debugfs_create_file("vbatmeas_and_ibat",
> -					(S_IRUGO | S_IWUGO),
> -					ab8500_gpadc_dir, &plf->dev,
> -					&ab8540_gpadc_vbat_meas_and_ibat_fops);
> -		if (!file)
> -			goto err;
> -		file = debugfs_create_file("vbattruemeas_and_ibat",
> -				(S_IRUGO | S_IWUGO),
> -				ab8500_gpadc_dir,
> -				&plf->dev,
> -				&ab8540_gpadc_vbat_true_meas_and_ibat_fops);
> -		if (!file)
> -			goto err;
> -		file = debugfs_create_file("battemp_and_ibat",
> -			(S_IRUGO | S_IWUGO),
> -			ab8500_gpadc_dir,
> -			&plf->dev, &ab8540_gpadc_bat_temp_and_ibat_fops);
> -		if (!file)
> -			goto err;
> -		file = debugfs_create_file("otp_calib",
> -				(S_IRUGO | S_IWUSR | S_IWGRP),
> -				ab8500_gpadc_dir,
> -				&plf->dev, &ab8540_gpadc_otp_calib_fops);
> -		if (!file)
> -			goto err;
> -	}
> -	file = debugfs_create_file("avg_sample", (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir, &plf->dev,
> -				   &ab8500_gpadc_avg_sample_fops);
> -	if (!file)
> -		goto err;
> -
> -	file = debugfs_create_file("trig_edge", (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir, &plf->dev,
> -				   &ab8500_gpadc_trig_edge_fops);
> -	if (!file)
> -		goto err;
> -
> -	file = debugfs_create_file("trig_timer", (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir, &plf->dev,
> -				   &ab8500_gpadc_trig_timer_fops);
> -	if (!file)
> -		goto err;
> -
> -	file = debugfs_create_file("conv_type", (S_IRUGO | S_IWUSR | S_IWGRP),
> -				   ab8500_gpadc_dir, &plf->dev,
> -				   &ab8500_gpadc_conv_type_fops);
> -	if (!file)
> -		goto err;
> -
>  	return 0;
>  
>  err:
> diff --git a/include/linux/mfd/abx500/ab8500-gpadc.h b/include/linux/mfd/abx500/ab8500-gpadc.h
> deleted file mode 100644
> index 49ded001049b..000000000000
> --- a/include/linux/mfd/abx500/ab8500-gpadc.h
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -/*
> - * Copyright (C) 2010 ST-Ericsson SA
> - * Licensed under GPLv2.
> - *
> - * Author: Arun R Murthy <arun.murthy@stericsson.com>
> - * Author: Daniel Willerud <daniel.willerud@stericsson.com>
> - * Author: M'boumba Cedric Madianga <cedric.madianga@stericsson.com>
> - */
> -
> -#ifndef	_AB8500_GPADC_H
> -#define _AB8500_GPADC_H
> -
> -/* GPADC source: From datasheet(ADCSwSel[4:0] in GPADCCtrl2
> - * and ADCHwSel[4:0] in GPADCCtrl3 ) */
> -#define BAT_CTRL		0x01
> -#define BTEMP_BALL		0x02
> -#define MAIN_CHARGER_V		0x03
> -#define ACC_DETECT1		0x04
> -#define ACC_DETECT2		0x05
> -#define ADC_AUX1		0x06
> -#define ADC_AUX2		0x07
> -#define MAIN_BAT_V		0x08
> -#define VBUS_V			0x09
> -#define MAIN_CHARGER_C		0x0A
> -#define USB_CHARGER_C		0x0B
> -#define BK_BAT_V		0x0C
> -#define DIE_TEMP		0x0D
> -#define USB_ID			0x0E
> -#define XTAL_TEMP		0x12
> -#define VBAT_TRUE_MEAS		0x13
> -#define BAT_CTRL_AND_IBAT	0x1C
> -#define VBAT_MEAS_AND_IBAT	0x1D
> -#define VBAT_TRUE_MEAS_AND_IBAT	0x1E
> -#define BAT_TEMP_AND_IBAT	0x1F
> -
> -/* Virtual channel used only for ibat convertion to ampere
> - * Battery current conversion (ibat) cannot be requested as a single conversion
> - *  but it is always in combination with other input requests
> - */
> -#define IBAT_VIRTUAL_CHANNEL		0xFF
> -
> -#define SAMPLE_1        1
> -#define SAMPLE_4        4
> -#define SAMPLE_8        8
> -#define SAMPLE_16       16
> -#define RISING_EDGE     0
> -#define FALLING_EDGE    1
> -
> -/* Arbitrary ADC conversion type constants */
> -#define ADC_SW				0
> -#define ADC_HW				1
> -
> -struct ab8500_gpadc;
> -
> -struct ab8500_gpadc *ab8500_gpadc_get(char *name);
> -int ab8500_gpadc_sw_hw_convert(struct ab8500_gpadc *gpadc, u8 channel,
> -		u8 avg_sample, u8 trig_edge, u8 trig_timer, u8 conv_type);
> -static inline int ab8500_gpadc_convert(struct ab8500_gpadc *gpadc, u8 channel)
> -{
> -	return ab8500_gpadc_sw_hw_convert(gpadc, channel,
> -			SAMPLE_16, 0, 0, ADC_SW);
> -}
> -
> -int ab8500_gpadc_read_raw(struct ab8500_gpadc *gpadc, u8 channel,
> -		u8 avg_sample, u8 trig_edge, u8 trig_timer, u8 conv_type);
> -int ab8500_gpadc_double_read_raw(struct ab8500_gpadc *gpadc, u8 channel,
> -		u8 avg_sample, u8 trig_edge, u8 trig_timer, u8 conv_type,
> -		int *ibat);
> -int ab8500_gpadc_ad_to_voltage(struct ab8500_gpadc *gpadc,
> -		u8 channel, int ad_value);
> -void ab8540_gpadc_get_otp(struct ab8500_gpadc *gpadc,
> -			u16 *vmain_l, u16 *vmain_h, u16 *btemp_l, u16 *btemp_h,
> -			u16 *vbat_l, u16 *vbat_h, u16 *ibat_l, u16 *ibat_h);
> -
> -#endif /* _AB8500_GPADC_H */
> 
