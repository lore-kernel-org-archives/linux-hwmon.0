Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2962C4418E6
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 21:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774993299; cv=none; b=orMcfDwtZifPywpcqtROKdQD1h4yiEAIm0XffU8FwWn3xROomas2ubbBYnwMMn82xgRXdwo2/FTxmJqNEKcC1+pnnjo/9m0rdHLSf4pXeGdvdojR2zdYUqfEGxP/6CJxOVlK2YdD7myJoBRMjMIyz2rR2AZZIREBF4TWE4wx7BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774993299; c=relaxed/simple;
	bh=SIPzojMkz2wIKlfTDD94/nLbBVQB7+okLdv8YnjhIXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTKbXpUap5YnfR+NeIlmG2N9l/8RfUUDLdTlworV+EP3FvnJ0zpejImMkA72zPabIuGLIO7ir9Y+LRJQqJMjsPw9TP+rlEc4JbqYMl1ddE/lVrArQgivo66C/Y7sy4Sxr0g/NDKKJkwrWqjVbPC6LpP2DoMpgh6fA0i3lSaSrSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdgQ8rkP; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdgQ8rkP"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12a80c36350so6644719c88.1
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 14:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774993296; x=1775598096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=u2A9s1tKLohWeE1NJT/Mj0axfNd+LDLEfwiXanMqc3Y=;
        b=QdgQ8rkPDQYWZA3p2RbsGqPcgDzNuAYu6onuc5fSIcRChP74RFUZT296bALT7rn5Pl
         SGMcJqMvENs8qKOQCoWRXuHwbPJvVlXLsMiI9uQpNO+9B+KvDM7PfVPBXnsam7lek6YR
         ivxf/oBl0+koBrhhRlCPu19kQnbJPL2VuKTpTY8cm9hXiUGEV+yjnrOPDGf6nFq9znDa
         xQdvfzkTDMEgqknmF8Jutd5mZVQ5E/3UzXBua4U+KeTY1WE/6eK6clCIBkWqUMN7+lbl
         vTaNqck9S7FN5859/THLk1CSxRHo1sJ7texH+YXL3n/r7AKieeacYGH0iIgd3gZRKixM
         zlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774993296; x=1775598096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2A9s1tKLohWeE1NJT/Mj0axfNd+LDLEfwiXanMqc3Y=;
        b=Dk1AwVWVH/yHdyEdU0y8VCufnTWd4m7ADXtOK8zdOg5Va1YyilhS6Zy+UGS7AWLyZk
         amX2p+hCxajq5p6E96Dv13k4OMqrroQWpfbaGUqONQXSb7r3GQeQi3hZ6HPX4lOefv7n
         +NuA7lI/VLA0vBpok6tC/+XCvim/9nMRht+cZQe1WrhnPfljF2Jo3ojIGyxO5ONeZzcr
         tJorEUiw+90N/sh7MZt68UqysuSRzhxHvsWatU3Xt/gr81Wxl3Su115LrsHE4WGqGMW2
         d6kiUHhzZch4LQwtco+eKliO7Wi+QyUzkhiLABaM2Y+t37BN7/Ys+59pXFV2KOkdlZag
         EEHQ==
X-Gm-Message-State: AOJu0YxGUz8rQybnO6xaU4sWxbatWSloEnTJc4y5Cm5d4zncvJ5e+aFT
	iDZUv8pV0acYcmmX/D7GhAgkXn+NKV1s7KQyrcPszyLbcrNaaM1DMYF4
X-Gm-Gg: ATEYQzxle2s+g4JgMDzueh84pv4Yx157s32zHN05tAjQTW/HRDNk5SSjV0KBdPmlDAY
	ujU/s03evrluZHkHtQEwrsQ+Itc6vUxh5tfQKTs9T1C7ZQrYnzctvbl8g+dBKOeDytMVrkNt86X
	qibeQnQRRiQj40aj+abQr7Tvq3a7QJ3twvkl1gRE1q8GAglMOmF2TiToo/QOk6JkKsjhlgUy7SD
	7ky6sg8OX6Yt5LTFr8MgvWc24xsjH8AvgImWkGXdnI+Oy/XzE9bqicZDehIOjU0K27fHCrpkIyy
	mxUFkVzOz6yh7Tag5whb0SUwKpIoMRm6wZCxpcNg78bUK+QEHI3VsiAXtVWrfhL2G3pcdrLNv9w
	3G5CuPo2wD89kKC0eU6phKrfo0/SSIcpiVifHswN6T9Q0xiy06Zxq/viGoXM8zfd8UVviSmh3E3
	Tgy6p8VuwAHl0sqBYTsiSA2ZWGJH2/+tdNnEArhyk1AYX/o9xwsuXoh3dAVkKwAVDcLnmBSTJT
X-Received: by 2002:a05:7301:3d06:b0:2c4:6bbc:1a46 with SMTP id 5a478bee46e88-2c9325b096amr476953eec.17.1774993296049;
        Tue, 31 Mar 2026 14:41:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c747e3fasm10683090eec.24.2026.03.31.14.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 14:41:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <31fb6f19-7f44-4edc-b59f-806a07f097b5@roeck-us.net>
Date: Tue, 31 Mar 2026 14:41:34 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon:tmp102: add support for update interval
To: Flaviu Nistor <flaviu.nistor@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331175418.16145-1-flaviu.nistor@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260331175418.16145-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/31/26 10:54, Flaviu Nistor wrote:
> Since the sensor supports different sampling intervals via
> bits CR0 and CR1 from the CONFIG register, add support in
> order for the conversion rate to be changed from user space.
> Default is 4 conv/sec.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

The subject line should start with "hwmon: (tmp102) " to match the common
subject line format used in hwmon drivers.

Other than that, please check

https://sashiko.dev/#/patchset/20260331175418.16145-1-flaviu.nistor%40gmail.com

and fix the identified issues.

Additional comments inline.

Thanks,
Guenter

> ---
>   Documentation/hwmon/tmp102.rst |  19 +++-
>   drivers/hwmon/tmp102.c         | 165 ++++++++++++++++++++++++---------
>   2 files changed, 139 insertions(+), 45 deletions(-)
> 
> diff --git a/Documentation/hwmon/tmp102.rst b/Documentation/hwmon/tmp102.rst
> index 3c2cb5bab1e9..7ed649ac4cd0 100644
> --- a/Documentation/hwmon/tmp102.rst
> +++ b/Documentation/hwmon/tmp102.rst
> @@ -41,12 +41,25 @@ degree from -40 to +125 C. Resolution of the sensor is 0.0625 degree.  The
>   operating temperature has a minimum of -55 C and a maximum of +150 C.
>   
>   The TMP102 has a programmable update rate that can select between 8, 4, 1, and
> -0.5 Hz. (Currently the driver only supports the default of 4 Hz).
> +0.5 Hz.
>   
>   The TMP110 and TMP113 are software compatible with TMP102, but have different
>   accuracy (maximum error) specifications. The TMP110 has an accuracy (maximum error)
>   of 1.0 degree, TMP113 has an accuracy (maximum error) of 0.3 degree, while TMP102
>   has an accuracy (maximum error) of 2.0 degree.
>   
> -The driver provides the common sysfs-interface for temperatures (see
> -Documentation/hwmon/sysfs-interface.rst under Temperatures).
> +sysfs-Interface
> +---------------
> +
> +The following list includes the sysfs attributes that the driver provides, their
> +permissions and a short description:
> +
> +=============================== ======= ========================================
> +Name                            Perm    Description
> +=============================== ======= ========================================
> +temp1_input:                    RO      Temperature input
> +temp1_label:                    RO      Descriptive name for the sensor
> +temp1_max:                      RW      Maximum temperature
> +temp1_max_hyst:                 RW      Maximum hysteresis temperature
> +update_interval                 RW      Update conversions interval in milliseconds
> +=============================== ======= ========================================

This will likely trigger a documentation error since the "===" line is expected to
match the longest text in the table.


> diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
> index 5b10c395a84d..c0805f6271b9 100644
> --- a/drivers/hwmon/tmp102.c
> +++ b/drivers/hwmon/tmp102.c
> @@ -50,11 +50,25 @@
>   
>   #define CONVERSION_TIME_MS		35	/* in milli-seconds */
>   
> +struct tmp102_params {
> +	u16 default_sample_time;
> +	u8 num_sample_times;
> +	const unsigned int *sample_times;
> +};
> +
>   struct tmp102 {
>   	const char *label;
>   	struct regmap *regmap;
>   	u16 config_orig;
>   	unsigned long ready_time;
> +	u16 sample_time;
> +	const struct tmp102_params *params;
> +};
> +
> +static const struct tmp102_params device_params = {
> +	.default_sample_time = 125,

Why change the default ?

> +	.num_sample_times = 4,
> +	.sample_times = (unsigned int []){ 125, 250, 1000, 4000 },
>   };
>   
>   /* convert left adjusted 13-bit TMP102 register value to milliCelsius */
> @@ -80,58 +94,113 @@ static int tmp102_read_string(struct device *dev, enum hwmon_sensor_types type,
>   }
>   
>   static int tmp102_read(struct device *dev, enum hwmon_sensor_types type,
> -		       u32 attr, int channel, long *temp)
> +		       u32 attr, int channel, long *val)
>   {
>   	struct tmp102 *tmp102 = dev_get_drvdata(dev);
>   	unsigned int regval;
>   	int err, reg;
>   
> -	switch (attr) {
> -	case hwmon_temp_input:
> -		/* Is it too early to return a conversion ? */
> -		if (time_before(jiffies, tmp102->ready_time)) {
> -			dev_dbg(dev, "%s: Conversion not ready yet..\n", __func__);
> -			return -EAGAIN;
> +	switch (type) {
> +	case hwmon_chip:

Please split into separate functions for handling chip and temperature data.

> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			*val = tmp102->sample_time;
> +			break;
> +		default:
> +			return -EINVAL;

-EOPNOTSUPP

>   		}
> -		reg = TMP102_TEMP_REG;
>   		break;
> -	case hwmon_temp_max_hyst:
> -		reg = TMP102_TLOW_REG;
> -		break;
> -	case hwmon_temp_max:
> -		reg = TMP102_THIGH_REG;
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			/* Is it too early to return a conversion ? */
> +			if (time_before(jiffies, tmp102->ready_time)) {
> +				dev_dbg(dev, "%s: Conversion not ready yet..\n", __func__);
> +				return -EAGAIN;
> +			}
> +			reg = TMP102_TEMP_REG;
> +			break;
> +		case hwmon_temp_max_hyst:
> +			reg = TMP102_TLOW_REG;
> +			break;
> +		case hwmon_temp_max:
> +			reg = TMP102_THIGH_REG;
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		err = regmap_read(tmp102->regmap, reg, &regval);
> +		if (err < 0)
> +			return err;
> +		*val = tmp102_reg_to_mC(regval);
>   		break;
>   	default:
> -		return -EOPNOTSUPP;
> +		return -EINVAL;

Do not change this.

>   	}
> +	return 0;
> +}
> +
> +static int tmp102_update_interval(struct device *dev, long val)
> +{
> +	struct tmp102 *tmp102 = dev_get_drvdata(dev);
> +	unsigned int reg;
> +	u8 index;
> +	s32 err;
> +
> +	index = find_closest(val, tmp102->params->sample_times,
> +			     (int)tmp102->params->num_sample_times);
>   
> -	err = regmap_read(tmp102->regmap, reg, &regval);
> +	err = regmap_read(tmp102->regmap, TMP102_CONF_REG, &reg);
> +	if (err < 0)
> +		return err;
> +	reg &= ~0x00c0;
> +	reg |= (3 - index) << 6;
> +	err = regmap_write(tmp102->regmap, TMP102_CONF_REG, reg);
>   	if (err < 0)
>   		return err;
> -	*temp = tmp102_reg_to_mC(regval);
> +	tmp102->sample_time = tmp102->params->sample_times[index];
>   
>   	return 0;
>   }
>   
> +static int tmp102_write_chip(struct device *dev, u32 attr, long val)
> +{
> +	switch (attr) {
> +	case hwmon_chip_update_interval:
> +		return tmp102_update_interval(dev, val);
> +	default:
> +		return -EINVAL;

-EOPNOTSUPP. This is not an "Invalid Argument" provided by the user.

> +	}
> +	return 0;
> +}
> +
>   static int tmp102_write(struct device *dev, enum hwmon_sensor_types type,
> -			u32 attr, int channel, long temp)
> +			u32 attr, int channel, long val)
>   {
>   	struct tmp102 *tmp102 = dev_get_drvdata(dev);
>   	int reg;
>   
> -	switch (attr) {
> -	case hwmon_temp_max_hyst:
> -		reg = TMP102_TLOW_REG;
> -		break;
> -	case hwmon_temp_max:
> -		reg = TMP102_THIGH_REG;
> -		break;
> +	switch (type) {
> +	case hwmon_chip:
> +		return tmp102_write_chip(dev, attr, val);
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_max_hyst:
> +			reg = TMP102_TLOW_REG;
> +			break;
> +		case hwmon_temp_max:
> +			reg = TMP102_THIGH_REG;
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +
> +		val = clamp_val(val, -256000, 255000);
> +		return regmap_write(tmp102->regmap, reg, tmp102_mC_to_reg(val));
>   	default:
> -		return -EOPNOTSUPP;
> +		return -EINVAL;

Sigh.

>   	}
> -
> -	temp = clamp_val(temp, -256000, 255000);
> -	return regmap_write(tmp102->regmap, reg, tmp102_mC_to_reg(temp));
> +	return 0;
>   }
>   
>   static umode_t tmp102_is_visible(const void *data, enum hwmon_sensor_types type,
> @@ -139,27 +208,35 @@ static umode_t tmp102_is_visible(const void *data, enum hwmon_sensor_types type,
>   {
>   	const struct tmp102 *tmp102 = data;
>   
> -	if (type != hwmon_temp)
> -		return 0;
> -
> -	switch (attr) {
> -	case hwmon_temp_input:
> -		return 0444;
> -	case hwmon_temp_label:
> -		if (tmp102->label)
> +	switch (type) {
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			return 0644;
> +		}
> +		break;
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
>   			return 0444;
> -		return 0;
> -	case hwmon_temp_max_hyst:
> -	case hwmon_temp_max:
> -		return 0644;
> +		case hwmon_temp_label:
> +			if (tmp102->label)
> +				return 0444;
> +			return 0;
> +		case hwmon_temp_max_hyst:
> +		case hwmon_temp_max:
> +			return 0644;

Please add "default:" to all those case statements.

> +		}
> +		break;
>   	default:
> -		return 0;
> +		break;
>   	}
> +	return 0;
>   }
>   
>   static const struct hwmon_channel_info * const tmp102_info[] = {
>   	HWMON_CHANNEL_INFO(chip,
> -			   HWMON_C_REGISTER_TZ),
> +			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
>   	HWMON_CHANNEL_INFO(temp,
>   			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST),
>   	NULL
> @@ -237,6 +314,10 @@ static int tmp102_probe(struct i2c_client *client)
>   	if (IS_ERR(tmp102->regmap))
>   		return PTR_ERR(tmp102->regmap);
>   
> +	tmp102->params = &device_params;

Why have "params" in the first place ? I don't see the point unless
the driver supports more than one chip.

> +
> +	tmp102->sample_time = tmp102->params->default_sample_time;
> +
>   	err = regmap_read(tmp102->regmap, TMP102_CONF_REG, &regval);
>   	if (err < 0) {
>   		dev_err(dev, "error reading config register\n");

