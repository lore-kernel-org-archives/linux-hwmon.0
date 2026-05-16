Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8A326CE2C
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 23:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778973645; cv=none; b=Mz2o9xCuYPIYbtytDD3pRQWNw/aFGeH6DVWKF1ql+k7xML/yEFmpFhVRRV2TuPC2Ogkz6vgiiBZgO1ew1zBkDccx+q3wTNl9Urr2e9kuZL/qaxRgmSAzSdJw1FEBnkNSoyqvu5ZxD6BVi9SRmW615G496RbyaZcVj0TFoP1GWso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778973645; c=relaxed/simple;
	bh=phRbajZoMxJldcA3tp1fB51c3ndTB3YmbIjPIH0IEZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMCTkK0vKyyVFkuTqYks8ByThW5kE0/gMVVTLS2Xkp2tC3Qv0l6FU3K7UJu6JRel3jXJyuG1UhZ6abb01GQRcdqbAhN4APwzzlnhndd1o+lIrojnS5rkWiZiM3zvxTMnY/IwszBiMuE6GL/jzWkPRLgWJkAgnZBuADEQ5ztKOaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsIb0Fnp; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsIb0Fnp"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f30a4601bbso906991eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 16:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778973643; x=1779578443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jbrzSYsKhGdQPEFMyRc5LNtO/lLaeNK/XZTpyuD05pw=;
        b=AsIb0FnpwV03nCHyXkw2blpZuqQXeXt6Ut6znyTeiQyyNmZbkCVGohacmHIvMhDcDq
         IwbcwXImAFG7+f0aDAxjtw0rwDLsJSH27O3HvvR08w8rA3NqsnS9Yq1UR6jao0xwV8Cd
         TEznhTlm2sUIE4ShlH5SFxHfFTILfJGD3+zXyYDMUe8dBG7kpMALrVO8oRLt4UgXy39b
         bJ0DQ6rkAAnRxYSJldDqx7LjDDom4ZGxp6kqv2nH4V3LUPJB+8n31DMVPipqymwrNcbv
         XQ83NrdPRoBI+8Cz7mqK1iqAaC9inMbXq0fephMpcgFcEDEfmB44bpXR7l5I0Rx/g75B
         8Vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778973643; x=1779578443;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbrzSYsKhGdQPEFMyRc5LNtO/lLaeNK/XZTpyuD05pw=;
        b=E4LueupghfbIyuxWiWnCqPatDW72Mxd9Phxo+DCftq/0qRKSLga/V/jbx1EzSHVxuS
         IF++i+86rv41FYjlrc/sVYZ4Eox65inTEhPY28VPpv548A5kMYLfVuThOtlPb4pnCdlX
         N3KJ4cm9ZbiGTmHELky870sFZxiR9smjy+MW4zxMEsamgIz9uz/8vbz0meEXFuM/58FN
         PZ0aU98+Hj0LyvYvaK21STz5q9ODZzPkk5o3U3Pg60OjEEpzESyMMCxaF8nJZfB8/cgy
         dmEur+/ZFN52pvcZrqD3z5JixZtjpTqJsA43AAq9CkfKFoFanUJAUdNt1A1TKx9pj/3G
         ATVg==
X-Forwarded-Encrypted: i=1; AFNElJ9RHWGgCaHHwcGEd7yYZI74vjYbkbzFKOevYES+5S7OtguZJra80xJ9dDPtk5ikiVWKdCQZhCC6DM9HRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUWhCS/TSSDPp+sqOijfhbsF9JpqiIv9hZe88/EQRa17Sdsu2l
	cWmMW4IJ5IVGnApt5W/C98i9BqgVqJMM8825Ri9igz4Zr6v/3LsWXYCH
X-Gm-Gg: Acq92OGMXtZISHk2CReJcRE9akBBf8tltdILCURpm315Y5s+RlzejnLpVsnYvQ9kNuL
	nls3VdDu4jVxjwtEW6MsU2wPbeX3j+QurvPT6T4zMsnv3U/6wWthsDmmlc1CajYjwZTxqFAkAhF
	cw0iDIUBRWrH2obTtUcfCnwUeyyQOUvwDMshuVnjodTZxMG+CWc/aEKzGC7udxLlBHY9QJ/qRth
	aM9opj56HQan+rmgKhucihSQKlDL5aFnrr8FJCgOHes0hO7pu1dOTpPZu43tGpBf1Y7o6ff6q9j
	hzqmOUhmeNCHCtKA8tq6Jver0fTTyyvRU63y3iw9J1Isfie0B42uvA7cLyYMhccdvFPkEFohppO
	hOqPwzvpD4R8uNTpgGc43UaT1Q+UNIHBdOKesHUD/KPavfjHA9DAkd9Ro2Jz/4cLPb7CuVThttM
	WVS2BHXcrSe3StzTxAaKGvu2BCJ0M5rArs93eVspMQWxvHH24n3q+mqvXFQdZzyjE5fVBu0G3W
X-Received: by 2002:a05:7301:5809:b0:2f2:6dde:df50 with SMTP id 5a478bee46e88-3039868cba3mr4710436eec.17.1778973642800;
        Sat, 16 May 2026 16:20:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6e9sm12599260eec.16.2026.05.16.16.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 16:20:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3443e6a3-4b30-4c67-94c2-8687de58d9ab@roeck-us.net>
Date: Sat, 16 May 2026 16:20:40 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: raspberrypi: Add voltage input support
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260516191555.17978-1-chakrabortyshubham66@gmail.com>
 <20260516191555.17978-3-chakrabortyshubham66@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260516191555.17978-3-chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/16/26 12:15, Shubham Chakraborty wrote:
> Extend the raspberrypi-hwmon driver to expose firmware-provided
> voltage measurements through the hwmon subsystem.
> 
> The driver now exports the following voltage inputs:
> 
>    - in0_input (core)
>    - in1_input (sdram_c)
>    - in2_input (sdram_i)
>    - in3_input (sdram_p)
> 
> Voltage values returned by firmware are converted from microvolts
> to millivolts as expected by the hwmon subsystem.
> 
> Update the documentation related to it.
> 
> The existing undervoltage sticky alarm handling is preserved and
> associated with the first voltage channel.
> 
> Tested in -
> - Raspberry Pi 3b+ (Linux raspberrypi 6.12.75+rpt-rpi-v8 #1 SMP PREEMPT
>    Debian 1:6.12.75-1+rpt1 (2026-03-11) aarch64 GNU/Linux)
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>   Documentation/hwmon/raspberrypi-hwmon.rst |  15 ++-
>   drivers/hwmon/raspberrypi-hwmon.c         | 134 +++++++++++++++++++++-
>   2 files changed, 144 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/hwmon/raspberrypi-hwmon.rst b/Documentation/hwmon/raspberrypi-hwmon.rst
> index 8038ade36490..db315184b861 100644
> --- a/Documentation/hwmon/raspberrypi-hwmon.rst
> +++ b/Documentation/hwmon/raspberrypi-hwmon.rst
> @@ -20,6 +20,17 @@ undervoltage conditions.
>   Sysfs entries
>   -------------
>   
> -======================= ==================
> +======================= ======================================================
> +in0_input		Core voltage in millivolts
> +in1_input		SDRAM controller voltage in millivolts
> +in2_input		SDRAM I/O voltage in millivolts
> +in3_input		SDRAM PHY voltage in millivolts
> +in0_label		"core"
> +in1_label		"sdram_c"
> +in2_label		"sdram_i"
> +in3_label		"sdram_p"
>   in0_lcrit_alarm		Undervoltage alarm
> -======================= ==================
> +======================= ======================================================
> +
> +The voltage inputs and labels are only exposed if the firmware reports support
> +for the corresponding voltage ID.
> diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
> index a2938881ccd2..4f96f37116f3 100644
> --- a/drivers/hwmon/raspberrypi-hwmon.c
> +++ b/drivers/hwmon/raspberrypi-hwmon.c
> @@ -5,6 +5,7 @@
>    * Based on firmware/raspberrypi.c by Noralf Trønnes
>    *
>    * Copyright (C) 2018 Stefan Wahren <stefan.wahren@i2se.com>
> + * Copyright (C) 2026 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
>    */
>   #include <linux/device.h>
>   #include <linux/devm-helpers.h>
> @@ -18,13 +19,26 @@
>   
>   #define UNDERVOLTAGE_STICKY_BIT	BIT(16)
>   
> +struct rpi_firmware_get_value {
> +	__le32 id;
> +	__le32 val;
> +} __packed;

My earlier comment is still valid: This should be defined in
the include file, and it should be query-specific, just like
struct rpi_firmware_clk_rate_request.

> +
>   struct rpi_hwmon_data {
>   	struct device *hwmon_dev;
>   	struct rpi_firmware *fw;
> +	u32 valid_inputs;
>   	u32 last_throttled;
>   	struct delayed_work get_values_poll_work;
>   };
>   
> +static const char * const rpi_hwmon_labels[] = {
> +	"core",
> +	"sdram_c",
> +	"sdram_i",
> +	"sdram_p",
> +};
> +
>   static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
>   {
>   	u32 new_uv, old_uv, value;
> @@ -56,6 +70,23 @@ static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
>   	hwmon_notify_event(data->hwmon_dev, hwmon_in, hwmon_in_lcrit_alarm, 0);
>   }
>   
> +static int rpi_firmware_get_voltage(struct rpi_hwmon_data *data, u32 id,
> +				    long *val)
> +{
> +	struct rpi_firmware_get_value packet;
> +	int ret;
> +
> +	packet.id = cpu_to_le32(id);
> +	packet.val = 0;
> +	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_VOLTAGE,
> +				    &packet, sizeof(packet));
> +	if (ret)
> +		return ret;
> +
> +	*val = le32_to_cpu(packet.val) / 1000;

I would suggest to use DIV_ROUND_CLOSEST().

> +	return 0;
> +}
> +
>   static void get_values_poll(struct work_struct *work)
>   {
>   	struct rpi_hwmon_data *data;
> @@ -77,19 +108,94 @@ static int rpi_read(struct device *dev, enum hwmon_sensor_types type,
>   {
>   	struct rpi_hwmon_data *data = dev_get_drvdata(dev);
>   
> -	*val = !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
> +	if (type == hwmon_in) {
> +		switch (attr) {
> +		case hwmon_in_input:
> +			switch (channel) {
> +			case 0:
> +				return rpi_firmware_get_voltage(data,
> +						RPI_FIRMWARE_VOLT_ID_CORE,
> +						val);
> +			case 1:
> +				return rpi_firmware_get_voltage(data,
> +						RPI_FIRMWARE_VOLT_ID_SDRAM_C,
> +						val);
> +			case 2:
> +				return rpi_firmware_get_voltage(data,
> +						RPI_FIRMWARE_VOLT_ID_SDRAM_I,
> +						val);
> +			case 3:
> +				return rpi_firmware_get_voltage(data,
> +						RPI_FIRMWARE_VOLT_ID_SDRAM_P,
> +						val);
> +			default:
> +				return -EOPNOTSUPP;

With

static const int voltage_regs[] = {
	RPI_FIRMWARE_VOLT_ID_CORE, RPI_FIRMWARE_VOLT_ID_SDRAM_C, RPI_FIRMWARE_VOLT_ID_SDRAM_I,
	RPI_FIRMWARE_VOLT_ID_SDRAM_P };

this can be simplified to
	return rpi_firmware_get_voltage(data, voltage_regs[channel];

> +			}
> +		case hwmon_in_lcrit_alarm:
> +			if (channel == 0) {
> +				*val = !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
> +				return 0;
> +			}

The channel check is not really necessary.

> +			return -EOPNOTSUPP;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int rpi_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, const char **str)
> +{
> +	if (type == hwmon_in && attr == hwmon_in_label) {
> +		if (channel >= ARRAY_SIZE(rpi_hwmon_labels))
> +			return -EOPNOTSUPP;

Unnecessary check.

> +
> +		*str = rpi_hwmon_labels[channel];
> +		return 0;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static umode_t rpi_is_visible(const void *_data, enum hwmon_sensor_types type,
> +			      u32 attr, int channel)
> +{
> +	const struct rpi_hwmon_data *data = _data;
> +
> +	if (type == hwmon_in) {
> +		switch (attr) {
> +		case hwmon_in_input:
> +		case hwmon_in_label:
> +			if (!(data->valid_inputs & BIT(channel)))
> +				return 0;
> +			return 0444;
> +		case hwmon_in_lcrit_alarm:
> +			if (channel == 0)
> +				return 0444;
> +			return 0;
> +		default:
> +			return 0;
> +		}
> +	}
> +
>   	return 0;
>   }
>   
>   static const struct hwmon_channel_info * const rpi_info[] = {
>   	HWMON_CHANNEL_INFO(in,
> -			   HWMON_I_LCRIT_ALARM),
> +			   HWMON_I_INPUT | HWMON_I_LABEL | HWMON_I_LCRIT_ALARM,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL),
>   	NULL
>   };
>   
>   static const struct hwmon_ops rpi_hwmon_ops = {
> -	.visible = 0444,
> +	.is_visible = rpi_is_visible,
>   	.read = rpi_read,
> +	.read_string = rpi_read_string,
>   };
>   
>   static const struct hwmon_chip_info rpi_chip_info = {
> @@ -101,6 +207,7 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct rpi_hwmon_data *data;
> +	long voltage;
>   	int ret;
>   
>   	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> @@ -110,6 +217,26 @@ static int rpi_hwmon_probe(struct platform_device *pdev)
>   	/* Parent driver assure that firmware is correct */
>   	data->fw = dev_get_drvdata(dev->parent);
>   
> +	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_CORE,
> +				       &voltage);
> +	if (!ret)
> +		data->valid_inputs |= BIT(0);
> +
> +	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_C,
> +				       &voltage);
> +	if (!ret)
> +		data->valid_inputs |= BIT(1);
> +
> +	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_I,
> +				       &voltage);
> +	if (!ret)
> +		data->valid_inputs |= BIT(2);
> +
> +	ret = rpi_firmware_get_voltage(data, RPI_FIRMWARE_VOLT_ID_SDRAM_P,
> +				       &voltage);
> +	if (!ret)
> +		data->valid_inputs |= BIT(3);
> +

This can be implemented in a loop, using the above voltage_regs array.

Thanks,
Guenter

>   	data->hwmon_dev = devm_hwmon_device_register_with_info(dev, "rpi_volt",
>   							       data,
>   							       &rpi_chip_info,
> @@ -159,6 +286,7 @@ static struct platform_driver rpi_hwmon_driver = {
>   module_platform_driver(rpi_hwmon_driver);
>   
>   MODULE_AUTHOR("Stefan Wahren <wahrenst@gmx.net>");
> +MODULE_AUTHOR("Shubham Chakraborty <chakrabortyshubham66@gmail.com>");
>   MODULE_DESCRIPTION("Raspberry Pi voltage sensor driver");
>   MODULE_LICENSE("GPL v2");
>   MODULE_ALIAS("platform:raspberrypi-hwmon");

