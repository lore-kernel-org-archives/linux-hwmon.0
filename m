Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935399;
	b=T8d+QME4i99y8ZbewObgcEhC6B4ARpJoVM0zMe70szbFEzWs+yEmmZg32HT5fdl6Cfy5
	 OzBPlTSBWzLJLGwqRSSH4NwT/6J/1+SYyeo2N6xBI2S++ZaElBoSoek6ZDeHtWZNPKXFw
	 dBhYf1MG2Zaj3iatjvOpdTIokOb+4IMbu2wZAjX5M9wIve/F50dspatOgE5WEyK4qGBRp
	 G/Q3iAR21DH35qcu6zflJGwi8y5Tc+6bn0j8RDVKTg/cnb0QxL3w0LjWm+KlEUpwhi6aA
	 ggjRxgyIPdNM2GgoHzpU94+Kr4Rt3ySTZ/xnc0dmuSFNu/kVZyVm1VeC62p3RxRgfzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935399;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=IAAW06hQvyC0ObtIJYYxsiy/Ceen+vPpb7XOrrYEKLI=;
	b=FnlakTpTwun+wP/U8a4OnqNTxjmuiLQJ6qME8qu16/akL5G7mJYyUgUjiF1QEio1DX4i
	 kNWny0hQRldL4pvwuq0WKrdL2x3ca2RmI9XtzOI2F1TArh2SLUUtSBfKG760P/n/Um3RG
	 VngI06D5pMzCQhHlyunLFAxLJdaVvruSm5iFALTc78tMwIUMk14vlfwqLfMpWpc5DNbvT
	 hfBnim1YJBOGnMk2A4mkKEl9NwwMMiwurfLrtqXmuVp5hjV80EiU0Xs5NJh/4uyfyBR22
	 IslxHgtIgyzejcUxKj42xu7fAjUt7i1kwjAFIgqSkDmVQSAYGt0TqdzMfNS2/iwdJsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="i/GVHIqw";
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E769606A333
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 17:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E769606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=i/GVHIqw
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id TKOgxoaA9OOJnTMgxxISgX; Tue, 17 Nov 2026 17:09:59 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id TMgtxyk1pxmi7TMgtx0aXk; Tue, 17 Nov 2026 17:09:55 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6afc8a66
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=R5edV8YtZwCzHGDMwkIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=IAAW06hQvyC0ObtIJYYxsiy/Ceen+vPpb7XOrrYEKLI=; b=i/GVHIqwJWgw
	FNAv6Dx2viwRozmojmM76xH3yBrGc0KvofgbStIu0rDayf+UeJGmFigV0CvCYsXpq+/wfym2Men/w
	Ooek219JKD5zQ+E1P3rfv0pBLsBAHVEoaCjcHxFsjXbF2gPA15Llb5c7WdsYdGiwYiys2CaT1s8QM
	ri5CNc98q3DOSOl4w13u5MFVfW2SDs+zDOzXiSxhlosN+T0YGn/TPB2VaNCPdAieUju9RayJBqKSq
	rRt/3trSirUwd2N+3JdEiIh9oR5DfycnuJ5lbfHBxKJdX5sCfGtsLj8B9UVDdfsNI5zy7hXv40fQL
	vN++ZJ9/5TLeiJ1N+n+kiA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53262)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTMgs-00000003oeY-3UGJ;
	Tue, 17 Nov 2026 22:39:54 +0530
Message-ID: <be16d42f-e6bf-45d5-83a8-28afbe54e3f8@roeck-us.net>
Date: Tue, 17 Nov 2026 09:09:53 -0800
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: add Raspberry Pi DA9091 PMIC driver
To: Sander Speetjens <sander.speetjens@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org
References: <20261117-hwmon-da9091-v1-1-f55f0af9c6a3@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261117-hwmon-da9091-v1-1-f55f0af9c6a3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xTMgs-00000003oeY-3UGJ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:53262
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfODhfEfjeOfRm3c4KUzr5U4pNGT4rUV7NO/bVQcb3XQ3uv3guWazYQ/J6LzGyTEB05/IXYzDPzv+mY/iPVn22VNRY6RvLdi8f0lFARX5AnDFrGXbuAsX
 YuYk79Y6IPaT8YDX4D9CtMP+Qoz3kPQ10rk9dQSV473Bv+GW4JtIh/GQOQA6+WYZhcC6eygkJU/5e5JOYGoSGZtxmC7P5eWphJYo/dTIVYv0sYLzpgJ7Gq4m

On 11/17/26 04:52, Sander Speetjens wrote:
> Add a hwmon driver for the DA9091 PMIC found on the Raspberry Pi 5.
> The PMIC exposes voltages, currents and temperatures exclusively
> through the VideoCore firmware mailbox interface (property
> 0x0003009f).
> 

None of the other Raspberry Pi drivers mentions the actual chip,
so that should not be done here either. Please drop all mention
of DA9091 and just name the driver raspberrypi-pmic-hwmon
(or possibly raspberrypi-pmic-adc).

There could be a separate "pmic" driver, for the power management
subsystem, so we need the extension.

> Requires a sufficiently recent Raspberry Pi firmware that
> implements the structured PMIC ADC property.
> 
> The driver:
> - is instantiated at runtime by the raspberrypi-firmware driver
>    (same pattern as the Pi 5 RTC driver)
> - reads all channels in a single batch mailbox call
> - uses a short refresh-on-read cache
> - exposes the sensors via the standard hwmon sysfs interface
> 
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
> ---
> This patch adds an hwmon driver for the DA9091 PMIC used on the
> Raspberry Pi 5.
> 
> The DA9091 exposes a set of voltage, current and temperature sensors.
> Access is only available through the VideoCore firmware mailbox
> interface; there is no direct register access from the ARM side.
> 
> A structured property tag (0x0003009f) was recently added to the
> firmware. It returns the ADC values in binary form (index + length +
> array of values), which is much cleaner for a kernel driver than
> parsing the text output of the existing gencmd interface.
> 
> The driver follows the same instantiation pattern as the Raspberry Pi 5
> RTC driver: the raspberrypi-firmware driver creates a platform device
> at runtime, and this driver binds to it. All channels are read in a
> single mailbox call and a short refresh-on-read cache is used.
> 
> The sensors are exposed through the standard hwmon sysfs interface so
> tools such as `sensors`, collectd and node-exporter work without
> modification.
> 
> Dependencies:
> - Raspberry Pi firmware that implements property 0x0003009f
> - CONFIG_RASPBERRYPI_FIRMWARE
> 
> Tested on a Raspberry Pi 5 with recent firmware.
> ---
>   drivers/firmware/raspberrypi.c             |  21 ++

Separate patch, please.

>   drivers/hwmon/Kconfig                      |  11 +
>   drivers/hwmon/Makefile                     |   1 +
>   drivers/hwmon/raspberrypi-da9091.c         | 339 +++++++++++++++++++++++++++++

This needs to be documented.

Also, on a higher level, the driver does not apply,
meanign Sashiko could not test it. Please ensure that
it applies to the upstream kernel.


>   include/soc/bcm2835/raspberrypi-firmware.h |   1 +
>   5 files changed, 373 insertions(+)
> 
> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
> index 68512224e3ce..c6834dfa4dae 100644
> --- a/drivers/firmware/raspberrypi.c
> +++ b/drivers/firmware/raspberrypi.c
> @@ -34,6 +34,7 @@ struct rpi_firmware {
>   
>   	struct platform_device *hwmon_dev;
>   	struct platform_device *clk_dev;
> +	struct platform_device *pmic_dev;
>   	struct platform_device *rtc_dev;
>   };
>   
> @@ -249,6 +250,23 @@ static void rpi_register_clk_driver(struct device *dev, struct rpi_firmware *fw)
>   	fw->clk_dev = pdev;
>   }
>   
> +static void rpi_register_pmic_driver(struct device *dev, struct rpi_firmware *fw)
> +{
> +	struct platform_device *pdev;
> +
> +	/* Only present on Pi 5 (bcm2712) */
> +	if (!(of_machine_is_compatible("brcm,bcm2712") ||
> +	      of_machine_is_compatible("brcm,bcm2712-d0")))
> +		return;
> +
> +	pdev = platform_device_register_data(dev, "raspberrypi-da9091",

raspberrypi-pmic-hwmon

> +					     -1, NULL, 0);
> +	if (IS_ERR(pdev))
> +		return;
> +
> +	fw->pmic_dev = pdev;
> +}
> +
>   static void rpi_register_rtc_driver(struct device *dev, struct rpi_firmware *fw)
>   {
>   	struct platform_device *pdev;
> @@ -371,6 +389,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
>   	rpi_firmware_print_firmware_revision(fw);
>   	rpi_register_hwmon_driver(dev, fw);
>   	rpi_register_clk_driver(dev, fw);
> +	rpi_register_pmic_driver(dev, fw);
>   	rpi_register_rtc_driver(dev, fw);
>   	rpi_register_reboot_mode(dev, fw);
>   
> @@ -395,6 +414,8 @@ static void rpi_firmware_remove(struct platform_device *pdev)
>   	fw->hwmon_dev = NULL;
>   	platform_device_unregister(fw->clk_dev);
>   	fw->clk_dev = NULL;
> +	platform_device_unregister(fw->pmic_dev);
> +	fw->pmic_dev = NULL;
>   	platform_device_unregister(fw->rtc_dev);
>   	fw->rtc_dev = NULL;
>   
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 18c682e1a475..ad5f23fb86ac 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2020,6 +2020,17 @@ config SENSORS_RASPBERRYPI_HWMON
>   	  This driver can also be built as a module. If so, the module
>   	  will be called raspberrypi-hwmon.
>   
> +config SENSORS_RASPBERRYPI_DA9091
> +	tristate "Raspberry Pi DA9091 PMIC monitor"
> +	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^
                                                         Pointless.

> +	help
> +	  If you say yes here you get support for the DA9091 PMIC
> +	  voltage, current and temperature sensors on the Raspberry Pi 5,
> +	  accessed via the firmware mailbox interface.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called raspberrypi-da9091.
> +
>   config SENSORS_SL28CPLD
>   	tristate "Kontron sl28cpld hardware monitoring driver"
>   	depends on MFD_SL28CPLD || COMPILE_TEST
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index d4c345ed7261..107bb5d29a94 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -211,6 +211,7 @@ obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
>   obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
>   obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
>   obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
> +obj-$(CONFIG_SENSORS_RASPBERRYPI_DA9091) += raspberrypi-da9091.o
>   obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
>   obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
>   obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
> diff --git a/drivers/hwmon/raspberrypi-da9091.c b/drivers/hwmon/raspberrypi-da9091.c
> new file mode 100644
> index 000000000000..a021ca596658
> --- /dev/null
> +++ b/drivers/hwmon/raspberrypi-da9091.c
> @@ -0,0 +1,339 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Raspberry Pi 5 DA9091 PMIC hwmon driver
> + *
> + * Reads voltages, currents and temperatures through the VideoCore
> + * firmware mailbox property
> + */
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <soc/bcm2835/raspberrypi-firmware.h>
> +
> +#define RPI_PMIC_NUM_CHANNELS	35	/* 0..34 */
> +#define RPI_PMIC_CACHE_MS	500
> +
> +struct rpi_pmic_data {
> +	struct rpi_firmware *fw;
> +	struct device *hwmon_dev;
> +	u32 values[RPI_PMIC_NUM_CHANNELS];
> +	unsigned long last_update;
> +	struct mutex lock; /* protects values[] and last_update */

Why is the hardware monitoring subsystem lock insufficient ?

> +};
> +
> +struct rpi_pmic_adc_msg {
> +	__le32 index;
> +	__le32 length;
> +	__le32 values[RPI_PMIC_NUM_CHANNELS];
> +} __packed;
> +
> +static const char * const rpi_pmic_labels[RPI_PMIC_NUM_CHANNELS] = {
> +	/* Currents 0-7 */
> +	[0]  = "3V7_WL_SW",
> +	[1]  = "3V3_SYS",
> +	[2]  = "1V8_SYS",
> +	[3]  = "DDR_VDD2",
> +	[4]  = "DDR_VDDQ",
> +	[5]  = "1V1_SYS",
> +	[6]  = "0V8_SW",
> +	[7]  = "VDD_CORE",
> +	/* Voltages 8-15 */
> +	[8]  = "3V7_WL_SW",
> +	[9]  = "3V3_SYS",
> +	[10] = "1V8_SYS",
> +	[11] = "DDR_VDD2",
> +	[12] = "DDR_VDDQ",
> +	[13] = "1V1_SYS",
> +	[14] = "0V8_SW",
> +	[15] = "VDD_CORE",
> +	/* More currents / voltages */
> +	[16] = "0V8_AON",
> +	[17] = "3V3_DAC",
> +	[18] = "3V3_ADC",
> +	[19] = "0V8_AON",
> +	[20] = "3V3_DAC",
> +	[21] = "3V3_ADC",
> +	[22] = "HDMI",
> +	[23] = "HDMI",
> +	[24] = "EXT5V",
> +	[25] = "BATT",
> +	/* Temperatures 26-34 (µ°C) */
> +	[26] = "TEMP1",
> +	[27] = "TEMP2",
> +	[28] = "TEMP3",
> +	[29] = "TEMP4",
> +	[30] = "TEMP5",
> +	[31] = "TEMP6",
> +	[32] = "TEMP7",
> +	[33] = "TEMP8",
> +	[34] = "TEMP_BG",
> +};
> +
> +/* Firmware ADC indices for each hwmon channel */
> +static const u8 rpi_pmic_curr_idx[] = {
> +	0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 22
> +};
> +
> +static const u8 rpi_pmic_in_idx[] = {
> +	8, 9, 10, 11, 12, 13, 14, 15, 19, 20, 21, 23, 24, 25
> +};
> +
> +static const u8 rpi_pmic_temp_idx[] = {
> +	26, 27, 28, 29, 30, 31, 32, 33, 34
> +};
> +
> +static int rpi_pmic_fw_index(enum hwmon_sensor_types type, int channel)
> +{
> +	switch (type) {
> +	case hwmon_curr:
> +		if (channel < 0 || channel >= ARRAY_SIZE(rpi_pmic_curr_idx))
> +			return -EINVAL;

Those range checks should be handled in is_visible if needed and
are otherwise unnecessary. Channel numbers are expected to be correct
here. Besides, channel < 0 is more than theoretic.

If you don't trust your code, add the check to the is_visible() function
(but not the < 0 check).

> +		return rpi_pmic_curr_idx[channel];
> +	case hwmon_in:
> +		if (channel < 0 || channel >= ARRAY_SIZE(rpi_pmic_in_idx))
> +			return -EINVAL;
> +		return rpi_pmic_in_idx[channel];
> +	case hwmon_temp:
> +		if (channel < 0 || channel >= ARRAY_SIZE(rpi_pmic_temp_idx))
> +			return -EINVAL;
> +		return rpi_pmic_temp_idx[channel];
> +	default:
> +		return -EINVAL;

-EOPNOTSUPP

I really don't think the function is necessary, though, since the
callers could simply access rpi_pmic_XXX_idx[channel] directly.

> +	}
> +}
> +
> +static int rpi_pmic_update(struct rpi_pmic_data *data)
> +{
> +	struct rpi_pmic_adc_msg msg = {
> +		.index  = cpu_to_le32(0),
> +		.length = cpu_to_le32(RPI_PMIC_NUM_CHANNELS),
> +	};
> +	int ret;
> +	unsigned int i;
> +
> +	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_PMIC_ADC,
> +				    &msg, sizeof(msg));
> +	if (ret)
> +		return ret;
> +
> +	// Sanity-check the response
> +	if (le32_to_cpu(msg.length) != RPI_PMIC_NUM_CHANNELS)
> +		return -EIO;
> +
> +	for (i = 0; i < RPI_PMIC_NUM_CHANNELS; i++)
> +		data->values[i] = le32_to_cpu(msg.values[i]);
> +
> +	data->last_update = jiffies;
> +	return 0;
> +}
> +
> +static int rpi_pmic_read(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long *val)
> +{
> +	struct rpi_pmic_data *data = dev_get_drvdata(dev);
> +	int fw_idx = rpi_pmic_fw_index(type, channel);
> +	int ret = 0;
> +
> +	if (fw_idx < 0)
> +		return fw_idx;
> +
> +	mutex_lock(&data->lock);
> +
> +	if (time_after(jiffies,

Consider using 64-bit jiffies and operations.
> +		       data->last_update + msecs_to_jiffies(RPI_PMIC_CACHE_MS))) {
> +		ret = rpi_pmic_update(data);
> +		if (ret)
> +			goto out;
> +	}
> +
> +	switch (type) {
> +	case hwmon_in:
> +		if (attr == hwmon_in_input)
> +			*val = data->values[fw_idx] / 1000;	/* µV → mV */
> +		else
> +			ret = -EOPNOTSUPP;

Unnecessary checks. Something like
		fw_idx = rpi_pmic_in_idx[channel];
		*val = data->values[fw_idx] / 1000;	/* µV → mV */

or even
		*val = data->values[rpi_pmic_in_idx[channel]];

would do.
> +		break;
> +	case hwmon_curr:
> +		if (attr == hwmon_curr_input)
> +			*val = data->values[fw_idx] / 1000;	/* µA → mA */
> +		else
> +			ret = -EOPNOTSUPP;
> +		break;
> +	case hwmon_temp:
> +		if (attr == hwmon_temp_input)
> +			*val = data->values[fw_idx] / 1000;	/* µ°C → m°C */
> +		else
> +			ret = -EOPNOTSUPP;
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;

This one is acceptable to make the compiler happy, but not the others.

> +	}
> +
> +out:
> +	mutex_unlock(&data->lock);
> +	return ret;
> +}
> +
> +static int rpi_pmic_read_string(struct device *dev,
> +				enum hwmon_sensor_types type, u32 attr,
> +				int channel, const char **str)
> +{
> +	int fw_idx = rpi_pmic_fw_index(type, channel);
> +
> +	if (fw_idx < 0)
> +		return fw_idx;
> +
> +	if ((type == hwmon_in   && attr == hwmon_in_label)   ||
> +	    (type == hwmon_curr && attr == hwmon_curr_label) ||
> +	    (type == hwmon_temp && attr == hwmon_temp_label)) {
> +		*str = rpi_pmic_labels[fw_idx];
> +		return 0;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static umode_t rpi_pmic_is_visible(const void *data,
> +				   enum hwmon_sensor_types type,
> +				   u32 attr, int channel)
> +{
> +	int fw_idx = rpi_pmic_fw_index(type, channel);
> +
> +	if (fw_idx < 0)
> +		return 0;
> +
> +	switch (type) {
> +	case hwmon_in:
> +		if (attr == hwmon_in_input || attr == hwmon_in_label)
> +			return 0444;
> +		break;
> +	case hwmon_curr:
> +		if (attr == hwmon_curr_input || attr == hwmon_curr_label)
> +			return 0444;
> +		break;
> +	case hwmon_temp:
> +		if (attr == hwmon_temp_input || attr == hwmon_temp_label)
> +			return 0444;
> +		break;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static const struct hwmon_ops rpi_pmic_ops = {
> +	.is_visible	= rpi_pmic_is_visible,
> +	.read		= rpi_pmic_read,
> +	.read_string	= rpi_pmic_read_string,
> +};
> +
> +static const struct hwmon_channel_info * const rpi_pmic_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,	/*  8 */
> +			   HWMON_I_INPUT | HWMON_I_LABEL,	/*  9 */
> +			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 10 */
> +			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 11 */
> +			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 12 */
> +			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 13 */
> +			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 14 */
> +			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 15 */
> +			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 19 */
> +			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 20 */
> +			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 21 */
> +			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 23 */
> +			   HWMON_I_INPUT | HWMON_I_LABEL,	/* 24 */
> +			   HWMON_I_INPUT | HWMON_I_LABEL	/* 25 */
> +	),
> +	HWMON_CHANNEL_INFO(curr,
> +			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  0 */
> +			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  1 */
> +			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  2 */
> +			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  3 */
> +			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  4 */
> +			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  5 */
> +			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  6 */
> +			   HWMON_C_INPUT | HWMON_C_LABEL,	/*  7 */
> +			   HWMON_C_INPUT | HWMON_C_LABEL,	/* 16 */
> +			   HWMON_C_INPUT | HWMON_C_LABEL,	/* 17 */
> +			   HWMON_C_INPUT | HWMON_C_LABEL,	/* 18 */
> +			   HWMON_C_INPUT | HWMON_C_LABEL	/* 22 */
> +	),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 26 TEMP1 */
> +			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 27 TEMP2 */
> +			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 28 TEMP3 */
> +			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 29 TEMP4 */
> +			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 30 TEMP5 */
> +			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 31 TEMP6 */
> +			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 32 TEMP7 */
> +			   HWMON_T_INPUT | HWMON_T_LABEL,	/* 33 TEMP8 */
> +			   HWMON_T_INPUT | HWMON_T_LABEL	/* 34 TEMP_BG */
> +	),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info rpi_pmic_chip_info = {
> +	.ops	= &rpi_pmic_ops,
> +	.info	= rpi_pmic_info,
> +};
> +
> +static int rpi_pmic_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rpi_pmic_data *data;
> +	struct rpi_firmware *fw;
> +	int ret;
> +
> +	fw = devm_rpi_firmware_get(dev, dev->parent->of_node);
> +	if (!fw)
> +		return -EPROBE_DEFER;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->fw = fw;
> +	mutex_init(&data->lock);
> +	data->last_update = jiffies - msecs_to_jiffies(RPI_PMIC_CACHE_MS);
> +
> +	ret = rpi_pmic_update(data);
> +	if (ret) {
> +		dev_err(dev, "Failed to read PMIC ADC property: %d\n", ret);
> +		return ret;

		return dev_err_probe(...);

However, it looks like that will be the only means to detect if the firmware
supports this functionality. If so, this needs to fail silently with -ENODEV.

> +	}
> +
> +	data->hwmon_dev =
> +		devm_hwmon_device_register_with_info(dev,
> +						     "da9091", data, &rpi_pmic_chip_info, NULL);
> +	if (IS_ERR(data->hwmon_dev))
> +		return PTR_ERR(data->hwmon_dev);
> +
> +	platform_set_drvdata(pdev, data);

I do not see where this is used.

> +	dev_info(dev, "Raspberry Pi DA9091 PMIC hwmon registered\n");

Please drop. Just make it
	return PTR_ERR_OR_ZERO(data->hwmon_dev);

> +	return 0;
> +}
> +
> +static const struct platform_device_id rpi_pmic_id[] = {
> +	{ "raspberrypi-da9091", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(platform, rpi_pmic_id);
> +
> +static struct platform_driver rpi_pmic_driver = {
> +	.probe = rpi_pmic_probe,
> +	.driver = {
> +		.name = "raspberrypi-da9091",
> +	},
> +	.id_table = rpi_pmic_id,
> +};
> +module_platform_driver(rpi_pmic_driver);
> +
> +MODULE_AUTHOR("Sander Speetjens <sander.speetjens@gmail.com>");
> +MODULE_DESCRIPTION("Raspberry Pi 5 DA9091 PMIC hwmon driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
> index 20141eb2cb67..90d7b66b96e3 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> @@ -84,6 +84,7 @@ enum rpi_firmware_property_tag {
>   	RPI_FIRMWARE_GET_REBOOT_FLAGS =                       0x00030064,
>   	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
>   	RPI_FIRMWARE_GET_RTC_REG =                            0x00030087,
> +	RPI_FIRMWARE_GET_PMIC_ADC =                           0x0003009f,
>   	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
>   	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
>   	RPI_FIRMWARE_SET_VOLTAGE =                            0x00038003,
> 
> ---
> base-commit: 5f29d1b881a5d5187237290c5e1f19886aa294db
> change-id: 20261117-hwmon-da9091-7aeeac6d8ef8
> 
> Best regards,

