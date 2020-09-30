Return-Path: <SRS0=ye16=DH=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B52C4727C
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Sep 2020 20:39:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 560022075F
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Sep 2020 20:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPbBoZcq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgI3Ujx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Sep 2020 16:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3Ujw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Sep 2020 16:39:52 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3096C061755;
        Wed, 30 Sep 2020 13:39:52 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id m12so3217167otr.0;
        Wed, 30 Sep 2020 13:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=PC4sK9WU0RjHSb2/HnUhf0CKCc813IEebOWL6I9XVsg=;
        b=mPbBoZcqg5EPEdclRWLOTs9V0hNPZp5KXjN7gTvjsQKZ6HwF40AeDJPjyg4WyFyyQs
         NoGI8MW910SwgVDVKYn1dhMBV0BzgSvhb3fNsZoaUop8r40tQgjhf/qSoYcWniBjvzQF
         smTFvi+GoDvjZ7AQ+LoRx7TinQ/UqxPvAXL+0J/xBFMgmQQTJlzgYKWMAqqcIhjaA5w0
         uWWdQ0lLiEvDzn5m56FKFJAJpA+dLHLujIe3qqMyS56fcossA4JTwjSpkca3IdCFgonQ
         IsdbQi2Z1vNtoHgaBqsFG1EMHjC0XiKOifSpdK4qFbRkDi+yUb5OZffUXyf2F7fy0/9d
         P6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=PC4sK9WU0RjHSb2/HnUhf0CKCc813IEebOWL6I9XVsg=;
        b=PULav40vKMdzTHHfD4RlWjAr4WJDVncobWUcNYvHJ6i4LQxy3LVPx1AP1Y52tIrfCJ
         ueeqWoC5EO5F0rq1FGMBXXq/2PpkmzywgJfp74twrsPRtITHB9VKm8nODngdAM7zFPC3
         Dgcc+V/peTO3mZABh/HcyXDn2RDVdQs1Q6fgJb0ORXipGvT12azMWnpuNQDzXe/AQGY9
         QUXB+X8n7ynepBB1XwvJ/Ws+sN81gvBjISnlKOXhJ7OGa7H8jo4mKWbg6/ok5A+92JlQ
         j00Yg37TvdcBXmUEiIWL7VxdjLR2fLqPFtNzXOX2A1K4rrIKV2BCJDFUWynOFW0DXcyg
         DdlA==
X-Gm-Message-State: AOAM533omtXobrsNYyrLfLpn2xBS7DExrlHD9NeB5mL+7cTpncpfFZlQ
        VWXfRjgjMOpDJj1BQJLQv2I=
X-Google-Smtp-Source: ABdhPJwO6FaADdIiZQkn93EPfgiPHYGIFcqrvogB6NN86jRdQOSygeaPbtzHC6/ZYPEBs/InYO5vgg==
X-Received: by 2002:a9d:3a34:: with SMTP id j49mr2783409otc.52.1601498391655;
        Wed, 30 Sep 2020 13:39:51 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g23sm678418oop.46.2020.09.30.13.39.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 13:39:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 30 Sep 2020 13:39:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH hwmon-next v4 1/2] hwmon: (pmbus) Add support for MPS
 Multi-phase mp2975 controller
Message-ID: <20200930203949.GA241666@roeck-us.net>
References: <20200926204957.10268-1-vadimp@nvidia.com>
 <20200926204957.10268-2-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200926204957.10268-2-vadimp@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Sep 26, 2020 at 11:49:56PM +0300, Vadim Pasternak wrote:
> Add support for mp295 device from Monolithic Power Systems, Inc. (MPS)
> vendor. This is a dual-loop, digital, multi-phase controller.
> This device:
> - Supports two power rail.
> - Provides 8 pulse-width modulations (PWMs), and can be configured up
>   to 8-phase operation for rail 1 and up to 4-phase operation for rail
>   2.
> - Supports two pages 0 and 1 for telemetry and also pages 2 and 3 for
>   configuration.
> - Can configured VOUT readout in direct or VID format and allows
>   setting of different formats on rails 1 and 2. For VID the following
>   protocols are available: VR13 mode with 5-mV DAC; VR13 mode with
>   10-mV DAC, IMVP9 mode with 5-mV DAC.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied, with changes as discussed.

Thanks,
Guenter

> ---
> v3->v4
>  Comments pointed out by Guenter:
>  - Drop redundant 'return' from mp2975_identify_multiphase_rail2().
>  - Fix phases assignment in mp2975_set_phase_rail2().
>  - Fix range for the number of phases in mp2975_set_multiphase_rail2().
>  - Drop mp2975_set_multiphase_rail2, call instead directly
>    mp2975_set_phase_rail2(), since the phases range is already
>    validated for rail 2.
>  - Fix handling for the case of zero number of phases for rail 1 in
>    mp2975_identify_multiphase(), which is valid case.
>  - Simplify logic for rail1 and rail2 setting handling in
>    mp2975_identify_multiphase().
>  - Line length limit is now 100, but 'checkpatch' scripts is still
>    consider it as error.
>  - Modify 'switch' statement in mp2975_current_sense_gain_get().
>  - Fix misspelled comment in mp2975_probe().
> v1->v2
>  Comments pointed out by Guenter:
>  - Add doc fail to the patch#1 (it was sent as separate patch).
>  - Use standard define for VOUT mode format.
>  - Simplify logic in mp2975_read_phase().
>  - Simplify calculation of phase current in mp2975_read_phase().
>  - Modify return code handling in mp2975_read_word_data().
>  - Add missed error handling in mp2975_read_word_data().
>  - Drop 'fallthrough;' in  mp2975_read_word_data().
>  - Handle error code in mp2975_identify_multiphase_rail2().
>  - Handle error code in mp2975_identify_multiphase().
>  - Drop 'goto' in mp2975_vout_per_rail_config_get() and mp2975_probe().
> ---
>  Documentation/hwmon/mp2975.rst | 116 +++++++
>  drivers/hwmon/pmbus/Kconfig    |   9 +
>  drivers/hwmon/pmbus/Makefile   |   1 +
>  drivers/hwmon/pmbus/mp2975.c   | 772 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 898 insertions(+)
>  create mode 100644 Documentation/hwmon/mp2975.rst
>  create mode 100644 drivers/hwmon/pmbus/mp2975.c
> 
> diff --git a/Documentation/hwmon/mp2975.rst b/Documentation/hwmon/mp2975.rst
> new file mode 100644
> index 000000000000..5b0609c62f48
> --- /dev/null
> +++ b/Documentation/hwmon/mp2975.rst
> @@ -0,0 +1,116 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver mp2975
> +====================
> +
> +Supported chips:
> +
> +  * MPS MP12254
> +
> +    Prefix: 'mp2975'
> +
> +Author:
> +
> +	Vadim Pasternak <vadimp@nvidia.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Monolithic Power Systems, Inc. (MPS)
> +vendor dual-loop, digital, multi-phase controller MP2975.
> +
> +This device:
> +- Supports up to two power rail.
> +- Provides 8 pulse-width modulations (PWMs), and can be configured up
> +  to 8-phase operation for rail 1 and up to 4-phase operation for rail
> +  2.
> +- Supports two pages 0 and 1 for telemetry and also pages 2 and 3 for
> +  configuration.
> +- Can configured VOUT readout in direct or VID format and allows
> +  setting of different formats on rails 1 and 2. For VID the following
> +  protocols are available: VR13 mode with 5-mV DAC; VR13 mode with
> +  10-mV DAC, IMVP9 mode with 5-mV DAC.
> +
> +Device supports:
> +- SVID interface.
> +- AVSBus interface.
> +
> +Device complaint with:
> +- PMBus rev 1.3 interface.
> +
> +Device supports direct format for reading output current, output voltage,
> +input and output power and temperature.
> +Device supports linear format for reading input voltage and input power.
> +Device supports VID and direct formats for reading output voltage.
> +The below VID modes are supported: VR12, VR13, IMVP9.
> +
> +The driver provides the next attributes for the current:
> +- for current in: input, maximum alarm;
> +- for current out input, maximum alarm and highest values;
> +- for phase current: input and label.
> +attributes.
> +The driver exports the following attributes via the 'sysfs' files, where
> +- 'n' is number of telemetry pages (from 1 to 2);
> +- 'k' is number of configured phases (from 1 to 8);
> +- indexes 1, 1*n for "iin";
> +- indexes n+1, n+2 for "iout";
> +- indexes 2*n+1 ... 2*n + k for phases.
> +
> +**curr[1-{2n}]_alarm**
> +
> +**curr[{n+1}-{n+2}]_highest**
> +
> +**curr[1-{2n+k}]_input**
> +
> +**curr[1-{2n+k}]_label**
> +
> +The driver provides the next attributes for the voltage:
> +- for voltage in: input, high critical threshold, high critical alarm, all only
> +  from page 0;
> +- for voltage out: input, low and high critical thresholds, low and high
> +  critical alarms, from pages 0 and 1;
> +The driver exports the following attributes via the 'sysfs' files, where
> +- 'n' is number of telemetry pages (from 1 to 2);
> +- indexes 1 for "iin";
> +- indexes n+1, n+2 for "vout";
> +
> +**in[1-{2n+1}]_crit**
> +
> +**in[1-{2n+1}]_crit_alarm**
> +
> +**in[1-{2n+1}]_input**
> +
> +**in[1-{2n+1}]_label**
> +
> +**in[2-{n+1}]_lcrit**
> +
> +**in[2-{n+1}1_lcrit_alarm**
> +
> +The driver provides the next attributes for the power:
> +- for power in alarm and input.
> +- for power out: highest and input.
> +The driver exports the following attributes via the 'sysfs' files, where
> +- 'n' is number of telemetry pages (from 1 to 2);
> +- indexes 1 for "pin";
> +- indexes n+1, n+2 for "pout";
> +
> +**power1_alarm**
> +
> +**power[2-{n+1}]_highest**
> +
> +**power[1-{2n+1}]_input**
> +
> +**power[1-{2n+1}]_label**
> +
> +The driver provides the next attributes for the temperature (only from page 0):
> +
> +
> +**temp1_crit**
> +
> +**temp1_crit_alarm**
> +
> +**temp1_input**
> +
> +**temp1_max**
> +
> +**temp1_max_alarm**
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index e35db489b76f..1e6157e85437 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -200,6 +200,15 @@ config SENSORS_MAX8688
>  	  This driver can also be built as a module. If so, the module will
>  	  be called max8688.
>  
> +config SENSORS_MP2975
> +	tristate "MPS MP2975"
> +	help
> +	  If you say yes here you get hardware monitoring support for MPS
> +	  MP2975 Dual Loop Digital Multi-Phase Controller.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called mp2975.
> +
>  config SENSORS_PXE1610
>  	tristate "Infineon PXE1610"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index c4b15db996ad..0e2832e73cfc 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
>  obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
>  obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
>  obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
> +obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
>  obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
>  obj-$(CONFIG_SENSORS_TPS40422)	+= tps40422.o
>  obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
> diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
> new file mode 100644
> index 000000000000..f2f3e74c4953
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp2975.c
> @@ -0,0 +1,772 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for MPS Multi-phase Digital VR Controllers
> + *
> + * Copyright (C) 2020 Nvidia Technologies Ltd.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +/* Vendor specific registers. */
> +#define MP2975_MFR_APS_HYS_R2		0x0d
> +#define MP2975_MFR_SLOPE_TRIM3		0x1d
> +#define MP2975_MFR_VR_MULTI_CONFIG_R1	0x0d
> +#define MP2975_MFR_VR_MULTI_CONFIG_R2	0x1d
> +#define MP2975_MFR_APS_DECAY_ADV	0x56
> +#define MP2975_MFR_DC_LOOP_CTRL		0x59
> +#define MP2975_MFR_OCP_UCP_PHASE_SET	0x65
> +#define MP2975_MFR_VR_CONFIG1		0x68
> +#define MP2975_MFR_READ_CS1_2		0x82
> +#define MP2975_MFR_READ_CS3_4		0x83
> +#define MP2975_MFR_READ_CS5_6		0x84
> +#define MP2975_MFR_READ_CS7_8		0x85
> +#define MP2975_MFR_READ_CS9_10		0x86
> +#define MP2975_MFR_READ_CS11_12		0x87
> +#define MP2975_MFR_READ_IOUT_PK		0x90
> +#define MP2975_MFR_READ_POUT_PK		0x91
> +#define MP2975_MFR_READ_VREF_R1		0xa1
> +#define MP2975_MFR_READ_VREF_R2		0xa3
> +#define MP2975_MFR_OVP_TH_SET		0xe5
> +#define MP2975_MFR_UVP_SET		0xe6
> +
> +#define MP2975_VOUT_FORMAT		BIT(15)
> +#define MP2975_VID_STEP_SEL_R1		BIT(4)
> +#define MP2975_IMVP9_EN_R1		BIT(13)
> +#define MP2975_VID_STEP_SEL_R2		BIT(3)
> +#define MP2975_IMVP9_EN_R2		BIT(12)
> +#define MP2975_PRT_THRES_DIV_OV_EN	BIT(14)
> +#define MP2975_DRMOS_KCS		GENMASK(13, 12)
> +#define MP2975_PROT_DEV_OV_OFF		10
> +#define MP2975_PROT_DEV_OV_ON		5
> +#define MP2975_SENSE_AMPL		BIT(11)
> +#define MP2975_SENSE_AMPL_UNIT		1
> +#define MP2975_SENSE_AMPL_HALF		2
> +#define MP2975_VIN_UV_LIMIT_UNIT	8
> +
> +#define MP2975_MAX_PHASE_RAIL1	8
> +#define MP2975_MAX_PHASE_RAIL2	4
> +#define MP2975_PAGE_NUM		2
> +
> +#define MP2975_RAIL2_FUNC	(PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | \
> +				 PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | \
> +				 PMBUS_PHASE_VIRTUAL)
> +
> +struct mp2975_data {
> +	struct pmbus_driver_info info;
> +	int vout_scale;
> +	int vid_step[MP2975_PAGE_NUM];
> +	int vref[MP2975_PAGE_NUM];
> +	int vref_off[MP2975_PAGE_NUM];
> +	int vout_max[MP2975_PAGE_NUM];
> +	int vout_ov_fixed[MP2975_PAGE_NUM];
> +	int vout_format[MP2975_PAGE_NUM];
> +	int curr_sense_gain[MP2975_PAGE_NUM];
> +};
> +
> +#define to_mp2975_data(x)  container_of(x, struct mp2975_data, info)
> +
> +static int mp2975_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +	switch (reg) {
> +	case PMBUS_VOUT_MODE:
> +		/*
> +		 * Enforce VOUT direct format, since device allows to set the
> +		 * different formats for the different rails. Conversion from
> +		 * VID to direct provided by driver internally, in case it is
> +		 * necessary.
> +		 */
> +		return PB_VOUT_MODE_DIRECT;
> +	default:
> +		return -ENODATA;
> +	}
> +}
> +
> +static int
> +mp2975_read_word_helper(struct i2c_client *client, int page, int phase, u8 reg,
> +			u16 mask)
> +{
> +	int ret = pmbus_read_word_data(client, page, phase, reg);
> +
> +	return (ret > 0) ? ret & mask : ret;
> +}
> +
> +static int
> +mp2975_vid2direct(int vrf, int val)
> +{
> +	switch (vrf) {
> +	case vr12:
> +		if (val >= 0x01)
> +			return 250 + (val - 1) * 5;
> +		break;
> +	case vr13:
> +		if (val >= 0x01)
> +			return 500 + (val - 1) * 10;
> +		break;
> +	case imvp9:
> +		if (val >= 0x01)
> +			return 200 + (val - 1) * 10;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int
> +mp2975_read_phase(struct i2c_client *client, struct mp2975_data *data,
> +		  int page, int phase, u8 reg)
> +{
> +	int ph_curr, ret;
> +
> +	ret = pmbus_read_word_data(client, page, phase, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!((phase + 1) % MP2975_PAGE_NUM))
> +		ret >>= 8;
> +	ret &= 0xff;
> +
> +	/*
> +	 * Output value is calculated as: (READ_CSx / 80 – 1.23) / (Kcs * Rcs)
> +	 * where:
> +	 * - Kcs is the DrMOS current sense gain of power stage, which is
> +	 *   obtained from the register MP2975_MFR_VR_CONFIG1, bits 13-12 with
> +	 *   the following selection of DrMOS (data->curr_sense_gain[page]):
> +	 *   00b - 5µA/A, 01b - 8.5µA/A, 10b - 9.7µA/A, 11b - 10µA/A.
> +	 * - Rcs is the internal phase current sense resistor which is constant
> +	 *   value 1kΩ.
> +	 */
> +	ph_curr = ret * 100 - 9800;
> +
> +	/*
> +	 * Current phase sensing, providing by the device is not accurate
> +	 * for the light load. This because sampling of current occurrence of
> +	 * bit weight has a big deviation for light load. For handling such
> +	 * case phase current is represented as the maximum between the value
> +	 * calculated  above and total rail current divided by number phases.
> +	 */
> +	ret = pmbus_read_word_data(client, page, phase, PMBUS_READ_IOUT);
> +	if (ret < 0)
> +		return ret;
> +
> +	return max_t(int, DIV_ROUND_CLOSEST(ret, data->info.phases[page]),
> +		     DIV_ROUND_CLOSEST(ph_curr, data->curr_sense_gain[page]));
> +}
> +
> +static int
> +mp2975_read_phases(struct i2c_client *client, struct mp2975_data *data,
> +		   int page, int phase)
> +{
> +	int ret;
> +
> +	if (page) {
> +		switch (phase) {
> +		case 0 ... 1:
> +			ret = mp2975_read_phase(client, data, page, phase,
> +						MP2975_MFR_READ_CS7_8);
> +			break;
> +		case 2 ... 3:
> +			ret = mp2975_read_phase(client, data, page, phase,
> +						MP2975_MFR_READ_CS9_10);
> +			break;
> +		case 4 ... 5:
> +			ret = mp2975_read_phase(client, data, page, phase,
> +						MP2975_MFR_READ_CS11_12);
> +			break;
> +		default:
> +			return -ENODATA;
> +		}
> +	} else {
> +		switch (phase) {
> +		case 0 ... 1:
> +			ret = mp2975_read_phase(client, data, page, phase,
> +						MP2975_MFR_READ_CS1_2);
> +			break;
> +		case 2 ... 3:
> +			ret = mp2975_read_phase(client, data, page, phase,
> +						MP2975_MFR_READ_CS3_4);
> +			break;
> +		case 4 ... 5:
> +			ret = mp2975_read_phase(client, data, page, phase,
> +						MP2975_MFR_READ_CS5_6);
> +			break;
> +		case 6 ... 7:
> +			ret = mp2975_read_phase(client, data, page, phase,
> +						MP2975_MFR_READ_CS7_8);
> +			break;
> +		case 8 ... 9:
> +			ret = mp2975_read_phase(client, data, page, phase,
> +						MP2975_MFR_READ_CS9_10);
> +			break;
> +		case 10 ... 11:
> +			ret = mp2975_read_phase(client, data, page, phase,
> +						MP2975_MFR_READ_CS11_12);
> +			break;
> +		default:
> +			return -ENODATA;
> +		}
> +	}
> +	return ret;
> +}
> +
> +static int mp2975_read_word_data(struct i2c_client *client, int page,
> +				 int phase, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct mp2975_data *data = to_mp2975_data(info);
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_OT_FAULT_LIMIT:
> +		ret = mp2975_read_word_helper(client, page, phase, reg,
> +					      GENMASK(7, 0));
> +		break;
> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> +		ret = mp2975_read_word_helper(client, page, phase, reg,
> +					      GENMASK(7, 0));
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = DIV_ROUND_CLOSEST(ret, MP2975_VIN_UV_LIMIT_UNIT);
> +		break;
> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> +		/*
> +		 * Register provides two values for over-voltage protection
> +		 * threshold for fixed (ovp2) and tracking (ovp1) modes. The
> +		 * minimum of these two values is provided as over-voltage
> +		 * fault alarm.
> +		 */
> +		ret = mp2975_read_word_helper(client, page, phase,
> +					      MP2975_MFR_OVP_TH_SET,
> +					      GENMASK(2, 0));
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = min_t(int, data->vout_max[page] + 50 * (ret + 1),
> +			    data->vout_ov_fixed[page]);
> +		break;
> +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> +		ret = mp2975_read_word_helper(client, page, phase,
> +					      MP2975_MFR_UVP_SET,
> +					      GENMASK(2, 0));
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = DIV_ROUND_CLOSEST(data->vref[page] * 10 - 50 *
> +					(ret + 1) * data->vout_scale, 10);
> +		break;
> +	case PMBUS_READ_VOUT:
> +		ret = mp2975_read_word_helper(client, page, phase, reg,
> +					      GENMASK(11, 0));
> +		if (ret < 0)
> +			return ret;
> +
> +		/*
> +		 * READ_VOUT can be provided in VID or direct format. The
> +		 * format type is specified by bit 15 of the register
> +		 * MP2975_MFR_DC_LOOP_CTRL. The driver enforces VOUT direct
> +		 * format, since device allows to set the different formats for
> +		 * the different rails and also all VOUT limits registers are
> +		 * provided in a direct format. In case format is VID - convert
> +		 * to direct.
> +		 */
> +		if (data->vout_format[page] == vid)
> +			ret = mp2975_vid2direct(info->vrm_version[page], ret);
> +		break;
> +	case PMBUS_VIRT_READ_POUT_MAX:
> +		ret = mp2975_read_word_helper(client, page, phase,
> +					      MP2975_MFR_READ_POUT_PK,
> +					      GENMASK(12, 0));
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = DIV_ROUND_CLOSEST(ret, 4);
> +		break;
> +	case PMBUS_VIRT_READ_IOUT_MAX:
> +		ret = mp2975_read_word_helper(client, page, phase,
> +					      MP2975_MFR_READ_IOUT_PK,
> +					      GENMASK(12, 0));
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = DIV_ROUND_CLOSEST(ret, 4);
> +		break;
> +	case PMBUS_READ_IOUT:
> +		ret = mp2975_read_phases(client, data, page, phase);
> +		if (ret < 0)
> +			return ret;
> +
> +		break;
> +	case PMBUS_UT_WARN_LIMIT:
> +	case PMBUS_UT_FAULT_LIMIT:
> +	case PMBUS_VIN_UV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_FAULT_LIMIT:
> +	case PMBUS_VOUT_UV_WARN_LIMIT:
> +	case PMBUS_VOUT_OV_WARN_LIMIT:
> +	case PMBUS_VIN_OV_WARN_LIMIT:
> +	case PMBUS_IIN_OC_FAULT_LIMIT:
> +	case PMBUS_IOUT_OC_LV_FAULT_LIMIT:
> +	case PMBUS_IIN_OC_WARN_LIMIT:
> +	case PMBUS_IOUT_OC_WARN_LIMIT:
> +	case PMBUS_IOUT_OC_FAULT_LIMIT:
> +	case PMBUS_IOUT_UC_FAULT_LIMIT:
> +	case PMBUS_POUT_OP_FAULT_LIMIT:
> +	case PMBUS_POUT_OP_WARN_LIMIT:
> +	case PMBUS_PIN_OP_WARN_LIMIT:
> +		return -ENXIO;
> +	default:
> +		return -ENODATA;
> +	}
> +
> +	return ret;
> +}
> +
> +static int mp2975_identify_multiphase_rail2(struct i2c_client *client)
> +{
> +	int ret;
> +
> +	/*
> +	 * Identify multiphase for rail 2 - could be from 0 to 4.
> +	 * In case phase number is zero – only page zero is supported
> +	 */
> +	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Identify multiphase for rail 2 - could be from 0 to 4. */
> +	ret = i2c_smbus_read_word_data(client, MP2975_MFR_VR_MULTI_CONFIG_R2);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret &= GENMASK(2, 0);
> +	return (ret >= 4) ? 4 : ret;
> +}
> +
> +static void mp2975_set_phase_rail1(struct pmbus_driver_info *info)
> +{
> +	int i;
> +
> +	for (i = 0 ; i < info->phases[0]; i++)
> +		info->pfunc[i] = PMBUS_HAVE_IOUT;
> +}
> +
> +static void
> +mp2975_set_phase_rail2(struct pmbus_driver_info *info, int num_phases)
> +{
> +	int i;
> +
> +	/* Set phases for rail 2 from upper to lower. */
> +	for (i = 1; i <= num_phases; i++)
> +		info->pfunc[MP2975_MAX_PHASE_RAIL1 - i] = PMBUS_HAVE_IOUT;
> +}
> +
> +static int
> +mp2975_identify_multiphase(struct i2c_client *client, struct mp2975_data *data,
> +			   struct pmbus_driver_info *info)
> +{
> +	int num_phases2, ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Identify multiphase for rail 1 - could be from 1 to 8. */
> +	ret = i2c_smbus_read_word_data(client, MP2975_MFR_VR_MULTI_CONFIG_R1);
> +	if (ret <= 0)
> +		return ret;
> +
> +	info->phases[0] = ret & GENMASK(3, 0);
> +
> +	/*
> +	 * The device provides a total of 8 PWM pins, and can be configured
> +	 * to different phase count applications for rail 1 and rail 2.
> +	 * Rail 1 can be set to 8 phases, while rail 2 can only be set to 4
> +	 * phases at most. When rail 1’s phase count is configured as 0, rail
> +	 * 1 operates with 1-phase DCM. When rail 2 phase count is configured
> +	 * as 0, rail 2 is disabled.
> +	 */
> +	if (info->phases[0] > MP2975_MAX_PHASE_RAIL1)
> +		return -EINVAL;
> +
> +	mp2975_set_phase_rail1(info);
> +	num_phases2 = min(MP2975_MAX_PHASE_RAIL1 - info->phases[0],
> +			  MP2975_MAX_PHASE_RAIL2);
> +	if (info->phases[1] && info->phases[1] <= num_phases2)
> +		mp2975_set_phase_rail2(info, num_phases2);
> +
> +	return 0;
> +}
> +
> +static int
> +mp2975_identify_vid(struct i2c_client *client, struct mp2975_data *data,
> +		    struct pmbus_driver_info *info, u32 reg, int page,
> +		    u32 imvp_bit, u32 vr_bit)
> +{
> +	int ret;
> +
> +	/* Identify VID mode and step selection. */
> +	ret = i2c_smbus_read_word_data(client, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret & imvp_bit) {
> +		info->vrm_version[page] = imvp9;
> +		data->vid_step[page] = MP2975_PROT_DEV_OV_OFF;
> +	} else if (ret & vr_bit) {
> +		info->vrm_version[page] = vr12;
> +		data->vid_step[page] = MP2975_PROT_DEV_OV_ON;
> +	} else {
> +		info->vrm_version[page] = vr13;
> +		data->vid_step[page] = MP2975_PROT_DEV_OV_OFF;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +mp2975_identify_rails_vid(struct i2c_client *client, struct mp2975_data *data,
> +			  struct pmbus_driver_info *info)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Identify VID mode for rail 1. */
> +	ret = mp2975_identify_vid(client, data, info,
> +				  MP2975_MFR_VR_MULTI_CONFIG_R1, 0,
> +				  MP2975_IMVP9_EN_R1, MP2975_VID_STEP_SEL_R1);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Identify VID mode for rail 2, if connected. */
> +	if (info->phases[1])
> +		ret = mp2975_identify_vid(client, data, info,
> +					  MP2975_MFR_VR_MULTI_CONFIG_R2, 1,
> +					  MP2975_IMVP9_EN_R2,
> +					  MP2975_VID_STEP_SEL_R2);
> +	return ret;
> +}
> +
> +static int
> +mp2975_current_sense_gain_get(struct i2c_client *client,
> +			      struct mp2975_data *data)
> +{
> +	int i, ret;
> +
> +	/*
> +	 * Obtain DrMOS current sense gain of power stage from the register
> +	 * MP2975_MFR_VR_CONFIG1, bits 13-12. The value is selected as below:
> +	 * 00b - 5µA/A, 01b - 8.5µA/A, 10b - 9.7µA/A, 11b - 10µA/A. Other
> +	 * values are invalid.
> +	 */
> +	for (i = 0 ; i < data->info.pages; i++) {
> +		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
> +		if (ret < 0)
> +			return ret;
> +		ret = i2c_smbus_read_word_data(client,
> +					       MP2975_MFR_VR_CONFIG1);
> +		if (ret < 0)
> +			return ret;
> +
> +		switch ((ret & MP2975_DRMOS_KCS) >> 12) {
> +		case 0:
> +			data->curr_sense_gain[i] = 50;
> +			break;
> +		case 1:
> +			data->curr_sense_gain[i] = 85;
> +			break;
> +		case 2:
> +			data->curr_sense_gain[i] = 97;
> +			break;
> +		default:
> +			data->curr_sense_gain[i] = 100;
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +mp2975_vref_get(struct i2c_client *client, struct mp2975_data *data,
> +		struct pmbus_driver_info *info)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 3);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Get voltage reference value for rail 1. */
> +	ret = i2c_smbus_read_word_data(client, MP2975_MFR_READ_VREF_R1);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->vref[0] = ret * data->vid_step[0];
> +
> +	/* Get voltage reference value for rail 2, if connected. */
> +	if (data->info.pages == MP2975_PAGE_NUM) {
> +		ret = i2c_smbus_read_word_data(client, MP2975_MFR_READ_VREF_R2);
> +		if (ret < 0)
> +			return ret;
> +
> +		data->vref[1] = ret * data->vid_step[1];
> +	}
> +	return 0;
> +}
> +
> +static int
> +mp2975_vref_offset_get(struct i2c_client *client, struct mp2975_data *data,
> +		       int page)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_read_word_data(client, MP2975_MFR_OVP_TH_SET);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch ((ret & GENMASK(5, 3)) >> 3) {
> +	case 1:
> +		data->vref_off[page] = 140;
> +		break;
> +	case 2:
> +		data->vref_off[page] = 220;
> +		break;
> +	case 4:
> +		data->vref_off[page] = 400;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int
> +mp2975_vout_max_get(struct i2c_client *client, struct mp2975_data *data,
> +		    struct pmbus_driver_info *info, int page)
> +{
> +	int ret;
> +
> +	/* Get maximum reference voltage of VID-DAC in VID format. */
> +	ret = i2c_smbus_read_word_data(client, PMBUS_VOUT_MAX);
> +	if (ret < 0)
> +		return ret;
> +
> +	data->vout_max[page] = mp2975_vid2direct(info->vrm_version[page], ret &
> +						 GENMASK(8, 0));
> +	return 0;
> +}
> +
> +static int
> +mp2975_identify_vout_format(struct i2c_client *client,
> +			    struct mp2975_data *data, int page)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_read_word_data(client, MP2975_MFR_DC_LOOP_CTRL);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret & MP2975_VOUT_FORMAT)
> +		data->vout_format[page] = vid;
> +	else
> +		data->vout_format[page] = direct;
> +	return 0;
> +}
> +
> +static int
> +mp2975_vout_ov_scale_get(struct i2c_client *client, struct mp2975_data *data,
> +			 struct pmbus_driver_info *info)
> +{
> +	int thres_dev, sense_ampl, ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * Get divider for over- and under-voltage protection thresholds
> +	 * configuration from the Advanced Options of Auto Phase Shedding and
> +	 * decay register.
> +	 */
> +	ret = i2c_smbus_read_word_data(client, MP2975_MFR_APS_DECAY_ADV);
> +	if (ret >= 0)
> +		thres_dev = ret & MP2975_PRT_THRES_DIV_OV_EN ?
> +			    MP2975_PROT_DEV_OV_ON : MP2975_PROT_DEV_OV_OFF;
> +	else
> +		return ret;
> +
> +	/* Select the gain of remote sense amplifier. */
> +	ret = i2c_smbus_read_word_data(client, PMBUS_VOUT_SCALE_LOOP);
> +	if (ret >= 0)
> +		sense_ampl = ret & MP2975_SENSE_AMPL ? MP2975_SENSE_AMPL_HALF :
> +			     MP2975_SENSE_AMPL_UNIT;
> +	else
> +		return ret;
> +
> +	data->vout_scale = sense_ampl * thres_dev;
> +
> +	return 0;
> +}
> +
> +static int
> +mp2975_vout_per_rail_config_get(struct i2c_client *client,
> +				struct mp2975_data *data,
> +				struct pmbus_driver_info *info)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < data->info.pages; i++) {
> +		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Obtain voltage reference offsets. */
> +		ret = mp2975_vref_offset_get(client, data, i);
> +		if (ret < 0)
> +			return ret;
> +
> +		/* Obtain maximum voltage values. */
> +		ret = mp2975_vout_max_get(client, data, info, i);
> +		if (ret < 0)
> +			return ret;
> +
> +		/*
> +		 * Get VOUT format for READ_VOUT command : VID or direct.
> +		 * Pages on same device can be configured with different
> +		 * formats.
> +		 */
> +		ret = mp2975_identify_vout_format(client, data, i);
> +		if (ret < 0)
> +			return ret;
> +
> +		/*
> +		 * Set over-voltage fixed value. Thresholds are provided as
> +		 * fixed value, and tracking value. The minimum of them are
> +		 * exposed as over-voltage critical threshold.
> +		 */
> +		data->vout_ov_fixed[i] = data->vref[i] +
> +					 DIV_ROUND_CLOSEST(data->vref_off[i] *
> +							   data->vout_scale,
> +							   10);
> +	}
> +
> +	return 0;
> +}
> +
> +static struct pmbus_driver_info mp2975_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.format[PSC_TEMPERATURE] = direct,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_CURRENT_OUT] = direct,
> +	.format[PSC_POWER] = direct,
> +	.m[PSC_TEMPERATURE] = 1,
> +	.m[PSC_VOLTAGE_OUT] = 1,
> +	.R[PSC_VOLTAGE_OUT] = 3,
> +	.m[PSC_CURRENT_OUT] = 1,
> +	.m[PSC_POWER] = 1,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_POUT |
> +		PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT | PMBUS_PHASE_VIRTUAL,
> +	.read_byte_data = mp2975_read_byte_data,
> +	.read_word_data = mp2975_read_word_data,
> +};
> +
> +static int mp2975_probe(struct i2c_client *client,
> +			const struct i2c_device_id *id)
> +{
> +	struct pmbus_driver_info *info;
> +	struct mp2975_data *data;
> +	int ret;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(struct mp2975_data),
> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	memcpy(&data->info, &mp2975_info, sizeof(*info));
> +	info = &data->info;
> +
> +	/* Identify multiphase configuration for rail 2. */
> +	ret = mp2975_identify_multiphase_rail2(client);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret) {
> +		/* Two rails are connected. */
> +		data->info.pages = MP2975_PAGE_NUM;
> +		data->info.phases[1] = ret;
> +		data->info.func[1] = MP2975_RAIL2_FUNC;
> +	}
> +
> +	/* Identify multiphase configuration. */
> +	ret = mp2975_identify_multiphase(client, data, info);
> +	if (ret)
> +		return ret;
> +
> +	/* Identify VID setting per rail. */
> +	ret = mp2975_identify_rails_vid(client, data, info);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Obtain current sense gain of power stage. */
> +	ret = mp2975_current_sense_gain_get(client, data);
> +	if (ret)
> +		return ret;
> +
> +	/* Obtain voltage reference values. */
> +	ret = mp2975_vref_get(client, data, info);
> +	if (ret)
> +		return ret;
> +
> +	/* Obtain vout over-voltage scales. */
> +	ret = mp2975_vout_ov_scale_get(client, data, info);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Obtain offsets, maximum and format for vout. */
> +	ret = mp2975_vout_per_rail_config_get(client, data, info);
> +	if (ret)
> +		return ret;
> +
> +	return pmbus_do_probe(client, id, info);
> +}
> +
> +static const struct i2c_device_id mp2975_id[] = {
> +	{"mp2975", 0},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, mp2975_id);
> +
> +static const struct of_device_id __maybe_unused mp2975_of_match[] = {
> +	{.compatible = "mps,mp2975"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mp2975_of_match);
> +
> +static struct i2c_driver mp2975_driver = {
> +	.driver = {
> +		.name = "mp2975",
> +		.of_match_table = of_match_ptr(mp2975_of_match),
> +	},
> +	.probe = mp2975_probe,
> +	.remove = pmbus_do_remove,
> +	.id_table = mp2975_id,
> +};
> +
> +module_i2c_driver(mp2975_driver);
> +
> +MODULE_AUTHOR("Vadim Pasternak <vadimp@nvidia.com>");
> +MODULE_DESCRIPTION("PMBus driver for MPS MP2975 device");
> +MODULE_LICENSE("GPL");
