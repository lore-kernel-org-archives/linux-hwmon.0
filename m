Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB70F2F7F1B
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 17:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778951614; cv=none; b=jgwB2KCo77feBAdw5yhVtZ0p2q6NLJPuf1twJYTlYkOS3h7fN/v9YjxuYHj11JURKfaxQ3zQfoT7I++f/FCTV9BFN7wL4QLhHK7ubGJX754K0KmZxCtQPKlqWxJ+zi1HiyhaKAIeO091hkrgjwx17k4AMbsiPfHZHdZLA42DNu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778951614; c=relaxed/simple;
	bh=0v0OBialKxWQ9/+oBz3WrRi2gCB7d+ddoCB1sT9KbE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Chxu4HekoGN6pE13XiCvBmtxtlT4ZdJ7TB/F0ZcVpahxdabjdd4EsC/IrSS74SfgGkLyb81y0PySilvyhyDhClBtC0wp7+nx5ugf6jxhx1UHVwgqhur/KC88Df7FDXb3uyJfiSrCbmRijA85CXqoKW7nxwlA+Mc+T3Z/blNC+Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9pEAth+; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9pEAth+"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so452293a91.1
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 10:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778951612; x=1779556412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9jLh/dQOJWE3RHARPvqgKATVrj4A2zOic50j7GN9J7A=;
        b=a9pEAth+DWshvIws2019jKzLdh91Ys2IpbBS5d6wRfLJEbJQHKUVFrljH3mJmHamAN
         +Ik/BYxfkVX5Ts/X6PITkdn824kPZss5vqIXb8/KRJHGP6y+5qFya1ygnU/HbaXkZ9L4
         vR5FPkVXa4Tb9fcXCe5kqKJrelMIx8twEcDCMJ1nXcXitppRgYoTFaCNw0FMZsYwRlyQ
         DuxLDKd/o4QgV3fsoBVHDPur+b6CXG4mCcEOMtBd6JlFWrLfm9GctA/4JWE9hNJAsaj+
         IRKZKQHnBVCwpI/P+jt/D5DlEJGXh2o1opTPkQjk9XWC1TlajiBINtTfuQYKFhIaaDfn
         mH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778951612; x=1779556412;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9jLh/dQOJWE3RHARPvqgKATVrj4A2zOic50j7GN9J7A=;
        b=WbuVyVrFV2cXj6522la4dhkTK6drP4BKWZefLsQnn34gN5CkialKab6RX01iD+LbAG
         LWwgbXwL5eaFeUVnbYTCcjX1yII1mk7px3sh+NwUDb4NzQr8IJkpFlBKMuJJ1adFzke3
         KISjbrxUYk7H5265jKKNMCHCKMHzpmUHOKvVK4zsjIOnN284P+BKZdmSTWTW76Up+K1y
         +TlcaBs+knxIeMrX2fn9MIP1/ElKhyvWsPL/6+TuGi57IPxYDoem35kMDZMq7QmTR1ML
         dyJtvvusVi6w1fmoB1yAQpnEOhT5TBt0pOfn3l/+G1VteI32GLsmreSYEiX/Kg8GBp03
         x25w==
X-Forwarded-Encrypted: i=1; AFNElJ/DNsYsekd8OyX03tma2FugVFX2NHZOhfCGK4l5C3kKQmI2rc4HQX8LSqPR/dCkjyyDpky7KWaT7eeW/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7BAo4eNoDSINE5E++VKaqmXDtsa5nv017Z3QDPh+rUeW2Bx2w
	QoErnSKSSmUb0h+7BLLryq2jGtOHuBWTVXjWKH+hol9Y5bu2Wu+51mtuVaO5qFeh
X-Gm-Gg: Acq92OHv+R+qjwQwItaPpBplIN/Z55yF2nWfDMHsbdjKw477CefC+BTYgigmlXri6kk
	4asRG+VTjR+YTvLEmVED+qVMi/TNT7oJmDO15v1FPGdOvsflc0yfkNpkSxl9HGD8UlS2zZwOe1+
	KiQfneUzNsC4H49L/C/QFCDzlBLkVr4zLEqJBDxAq67En82RWkpjkiBXElafqRSBEyRh9nUztS3
	VyNnafiEQh35EZfyEc7Awa1dzxYkinLZWxpSIXUEtn0bTLIgSDGvB7QvPvUOcPN73wiCNBvApAW
	/DIxCkEiVVnr1tRqN7hDxaBftI3u8izZ53lutSpBiwPE34wHEHgUEMBU1UTONnKddq+ct0BQs9U
	ppteofhUVqSGAuHrrT1KNpPJ2klSJ0tdL4aKgRRLsKyqD4dIbQUpG8u/sgwm6su+5x6GKnMve3n
	hWujml0LOBpXFQC+K66ZhLUdsGXHE9RwkR/ljcxTEvKzt/Oc8C03hO1rJSUwlEidOgFauyrg8U
X-Received: by 2002:a17:90a:602:b0:369:96e8:c8ae with SMTP id 98e67ed59e1d1-36996e8d08dmr802988a91.19.1778951611932;
        Sat, 16 May 2026 10:13:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695a1494f1sm2014014a91.13.2026.05.16.10.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 10:13:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ff7bf6f8-0090-4aea-ba60-3477cc81a458@roeck-us.net>
Date: Sat, 16 May 2026 10:13:30 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: raspberrypi: Add voltage input support
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-hwmon@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260516164407.25255-2-chakrabortyshubham66@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260516164407.25255-2-chakrabortyshubham66@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/16/26 09:44, Shubham Chakraborty wrote:
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
> The existing undervoltage sticky alarm handling is preserved and
> associated with the first voltage channel.
> 
> Tested in -
> - Raspberry Pi 3b+ (Linux raspberrypi 6.12.75+rpt-rpi-v8 #1 SMP PREEMPT
>    Debian 1:6.12.75-1+rpt1 (2026-03-11) aarch64 GNU/Linux)
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

I wasn't copied on patch 1/2, so I have no idea what is in there
and how it is related to this patch. Either way it seems unlikely that
the new functionality is supported by all versions of Raspberry Pi supported
by this driver. Just returning an error when the user tries to read a sensor
that is not supported is unacceptable. This needs either evidence that the
sensors are supported by all board variants and firmware versions supported
by this driver, or the is_visible function needs to selectively enable the
supported sensors.

> ---
>   drivers/hwmon/raspberrypi-hwmon.c | 112 +++++++++++++++++++++++++++++-

Documentation/hwmon/raspberrypi-hwmon.rst needs to be updated as well.

>   1 file changed, 109 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
> index a2938881ccd2..c73a970db025 100644
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
> @@ -18,6 +19,11 @@
>   
>   #define UNDERVOLTAGE_STICKY_BIT	BIT(16)
>   
> +struct rpi_firmware_get_value {
> +	__le32 id;
> +	__le32 val;
> +} __packed;
> +
>   struct rpi_hwmon_data {
>   	struct device *hwmon_dev;
>   	struct rpi_firmware *fw;
> @@ -56,6 +62,23 @@ static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
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
> +	return 0;
> +}
> +
>   static void get_values_poll(struct work_struct *work)
>   {
>   	struct rpi_hwmon_data *data;
> @@ -77,19 +100,101 @@ static int rpi_read(struct device *dev, enum hwmon_sensor_types type,
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
> +			}
> +		case hwmon_in_lcrit_alarm:
> +			if (channel == 0) {
> +				*val = !!(data->last_throttled & UNDERVOLTAGE_STICKY_BIT);
> +				return 0;
> +			}
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
> +		switch (channel) {
> +		case 0:
> +			*str = "core";
> +			return 0;
> +		case 1:
> +			*str = "sdram_c";
> +			return 0;
> +		case 2:
> +			*str = "sdram_i";
> +			return 0;
> +		case 3:
> +			*str = "sdram_p";
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}

This can be implemented as string array.

> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static umode_t rpi_is_visible(const void *_data, enum hwmon_sensor_types type,
> +			      u32 attr, int channel)
> +{
> +	if (type == hwmon_in) {
> +		switch (attr) {
> +		case hwmon_in_input:
> +		case hwmon_in_label:
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
> @@ -159,6 +264,7 @@ static struct platform_driver rpi_hwmon_driver = {
>   module_platform_driver(rpi_hwmon_driver);
>   
>   MODULE_AUTHOR("Stefan Wahren <wahrenst@gmx.net>");
> +MODULE_AUTHOR("Shubham Chakraborty <chakrabortyshubham66@gmail.com>");
>   MODULE_DESCRIPTION("Raspberry Pi voltage sensor driver");
>   MODULE_LICENSE("GPL v2");
>   MODULE_ALIAS("platform:raspberrypi-hwmon");

