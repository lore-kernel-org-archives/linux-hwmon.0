Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E81935E92B
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 17:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065358; cv=none; b=O8Q9pAMVwnkx129x9Aw+KEkw3wdVjR6LSrSpw7vd+Sut7dMSajSO1LNQSJivl287gCSXkVnu9s2NtUfXlN2SIlKYeQ8iZ0RtfEAL4SZP4scmFhs5GZ0PTWsZMYavpwwWQaZ+kHnkuahCzw5+IILCTdlmis9+DsqLvXF7Ftdv3C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065358; c=relaxed/simple;
	bh=Ql85TT8miDc90PJQ/zaEXWVWYXVSMbKkuP3CQSTlqKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mM17AbUXI77+utOkVgBCo98sj6VhYMnqzxI4s6XxYwsGlLAO6EeCmlTl3AxLOYv35OS9/8CbjQjdFrK1mtvoIoi1TXgSvf4/MJZU3K6165XLqGTqRtD3bd4HtMN1FeyLGH5mPEpcDBcILBaWK+y88UfexbRJrnbFKK5XKGYMYCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FiISuqx/; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FiISuqx/"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b6b0500e06so87718eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Apr 2026 10:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065356; x=1775670156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=B81X98aYa6cPFUMNHbhuzS3lIe9WvvrONsiRX2QJkf0=;
        b=FiISuqx/90wD29X2seYr7kUl/Pq5GMSL8rbZyr8A5WyeLgBAuP80KneRiOSqaY/GIY
         G9SBP2tTdDDNH6uZMuT0khlHW9kUgq3TdXSIMUEBctb0bOHNj7slDjzaTaORDF4xtjFt
         PaKWnC/91j90XqQ402Ft6LgMckqO0Zm5yFJ04dJP/X9bWZmFlPs1EocE/itLeS+dtAXZ
         ZAErjJ8mWwN0G4qiZtKDaBK/B+Ep1lgo9digcq7XFrGqbn+KeBUk999W8QjDeXo4Zw5J
         gcRasy31fXfAWsnHVRuiJk1xaSVsIJ0Qc+6iJguzvlW0gKTQvjxCSNvXSqDVect5BmGs
         6s6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065356; x=1775670156;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B81X98aYa6cPFUMNHbhuzS3lIe9WvvrONsiRX2QJkf0=;
        b=si9FMDPEuhVNaFlj/7gsPaTxS1X/k9JhyUnGQEH9N1propqFljjqt/v3Qc8jAF78cY
         V/JjwZQSONSaY13xQsp4sU6nuIND6gF9Cx8gIcFB+LfjvN57+S239kYQ+7aESdoEGnRc
         Dm4vsQ44vRVj2p+5kpZqA4LCbqb04NVXDYuMKYQ9Fn+Z0uHwBJyvjvBwUvLxtgcPnz0L
         cD1lQmlMWPuu1zEmwDDchJxZMPtm302LvudXXHZWbbJntPcrU4ucGC+xg/D1EY+ioJIS
         XufWGRN/Zyzj9fCPJf0xISZTKpEdUwJwan0iBYvH7CrmOW9CNV/+58c7Tkk+su2f13Kp
         FvpA==
X-Gm-Message-State: AOJu0YzRmZkZwEFHi5tHqzNMZevng7rj56GN1gOzkVBd3rUa+IYHH+xB
	hCNLSDhJ26p2fOryh7tLu0BinfaYC53COQMVI3NMqQ0FD6TrYwxcE5Jy
X-Gm-Gg: ATEYQzynVu4EQKONyLrXfhIewozxT/Baj0ZVNC9skLFlClXVVnHY4o+olWUrhtKOV6a
	nCqAj7amMmtTpLTo17J7VbYSprx9vL9qF3X3B7YEEDidEiJKOuUoyYP1H7M/Hi2Ygv9VtT0BXGe
	oCUfdiUTEuj7a8M/xctt8XcKOUsyaVbL4k0ze/7NFhw2P3XTUEQ49SUZQOf1ayAsBzf2cwoFaMN
	ZEEtNwllZyns3S5++dkRgkX/UK4PYQLbKx+7nY7zbRZdSVsnDA9PjZ7Dj1hW16C45+PFZxlkfDF
	XoeFoDsOUEy1IwU0fJSMnyJcC/qQDiRYBDTG76eO53YKkVQvU3rY0Hjk5o6qJhwFhKVgh+kfBdw
	KpLaJ4Dz81HubhYXFNshcoR/dbUBUJ2exJVqdDryCoynzRfydHxLFqzFAxGoeVgQ0CW8QUOE4XN
	lkx1QvXQtyvzNaAZmK1FRBr+wQ5xD5L9+JxACdm5fEKWSkgTYASxN1l99bJ0Bbow6GCEHlM3iM
X-Received: by 2002:a05:7301:4591:b0:2c4:dd55:ffc1 with SMTP id 5a478bee46e88-2ca8d48874cmr135376eec.2.1775065356333;
        Wed, 01 Apr 2026 10:42:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c0c2sm403497eec.17.2026.04.01.10.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 10:42:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5244d23e-41bf-4673-98e6-aa745cba5ffa@roeck-us.net>
Date: Wed, 1 Apr 2026 10:42:33 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (tmp102) add support for update interval
To: Flaviu Nistor <flaviu.nistor@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260401164701.18456-1-flaviu.nistor@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260401164701.18456-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/26 09:47, Flaviu Nistor wrote:
> Since the sensor supports different sampling intervals via
> bits CR0 and CR1 from the CONFIG register, add support in
> order for the conversion rate to be changed from user space.
> Default is 4 conv/sec.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Please address the feedback at:

https://sashiko.dev/#/patchset/20260401164701.18456-1-flaviu.nistor%40gmail.com

sample_times should be static, and the concern about the mask seems real.

Additional feedback inline.

Thanks,
Guenter

> ---
> Changes in v2:
> - Implement all changes suggested inline by Guenter Roeck.
> - Fixed identified issues from link provided by Guenter Roeck:
> https://sashiko.dev/#/patchset/20260331175418.16145-1-flaviu.nistor%40gmail.com	
> - Link to v1: https://lore.kernel.org/all/20260331175418.16145-1-flaviu.nistor@gmail.com/
> 
>   Documentation/hwmon/tmp102.rst |  19 ++++-
>   drivers/hwmon/tmp102.c         | 137 ++++++++++++++++++++++++++-------
>   2 files changed, 125 insertions(+), 31 deletions(-)
> 
> diff --git a/Documentation/hwmon/tmp102.rst b/Documentation/hwmon/tmp102.rst
> index 3c2cb5bab1e9..425a09a3c9b3 100644
> --- a/Documentation/hwmon/tmp102.rst
> +++ b/Documentation/hwmon/tmp102.rst
> @@ -41,12 +41,25 @@ degree from -40 to +125 C. Resolution of the sensor is 0.0625 degree.  The
>   operating temperature has a minimum of -55 C and a maximum of +150 C.
>   
>   The TMP102 has a programmable update rate that can select between 8, 4, 1, and
> -0.5 Hz. (Currently the driver only supports the default of 4 Hz).
> +0.25 Hz.
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
> +=============================== ======= ===========================================
> +Name                            Perm    Description
> +=============================== ======= ===========================================
> +temp1_input:                    RO      Temperature input
> +temp1_label:                    RO      Descriptive name for the sensor
> +temp1_max:                      RW      Maximum temperature
> +temp1_max_hyst:                 RW      Maximum hysteresis temperature
> +update_interval                 RW      Update conversions interval in milliseconds
> +=============================== ======= ===========================================
> diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
> index 5b10c395a84d..7d3ef64bd28c 100644
> --- a/drivers/hwmon/tmp102.c
> +++ b/drivers/hwmon/tmp102.c
> @@ -50,11 +50,16 @@
>   
>   #define CONVERSION_TIME_MS		35	/* in milli-seconds */
>   
> +#define NUM_SAMPLE_TIMES 4
> +#define DEFAULT_SAMPLE_TIME_MS 250

Please use

#define<space>NAME<tab>value

and align with the CONVERSION_TIME_MS definition.

> +const unsigned int *sample_times = (const unsigned int []){ 125, 250, 1000, 4000 };
> +
>   struct tmp102 {
>   	const char *label;
>   	struct regmap *regmap;
>   	u16 config_orig;
>   	unsigned long ready_time;
> +	u16 sample_time;
>   };
>   
>   /* convert left adjusted 13-bit TMP102 register value to milliCelsius */
> @@ -79,8 +84,20 @@ static int tmp102_read_string(struct device *dev, enum hwmon_sensor_types type,
>   	return 0;
>   }
>   
> -static int tmp102_read(struct device *dev, enum hwmon_sensor_types type,
> -		       u32 attr, int channel, long *temp)
> +static int tmp102_read_chip(struct device *dev, u32 attr, long *val)
> +{
> +	struct tmp102 *tmp102 = dev_get_drvdata(dev);
> +
> +	switch (attr) {
> +	case hwmon_chip_update_interval:
> +		*val = tmp102->sample_time;
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int tmp102_read_temp(struct device *dev, u32 attr, long *val)
>   {
>   	struct tmp102 *tmp102 = dev_get_drvdata(dev);
>   	unsigned int regval;
> @@ -108,30 +125,80 @@ static int tmp102_read(struct device *dev, enum hwmon_sensor_types type,
>   	err = regmap_read(tmp102->regmap, reg, &regval);
>   	if (err < 0)
>   		return err;
> -	*temp = tmp102_reg_to_mC(regval);
> +
> +	*val = tmp102_reg_to_mC(regval);
>   
>   	return 0;
>   }
>   
> -static int tmp102_write(struct device *dev, enum hwmon_sensor_types type,
> -			u32 attr, int channel, long temp)
> +static int tmp102_read(struct device *dev, enum hwmon_sensor_types type,
> +		       u32 attr, int channel, long *val)
> +{
> +	switch (type) {
> +	case hwmon_chip:
> +		return tmp102_read_chip(dev, attr, val);
> +	case hwmon_temp:
> +		return tmp102_read_temp(dev, attr, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int tmp102_update_interval(struct device *dev, long val)
>   {
>   	struct tmp102 *tmp102 = dev_get_drvdata(dev);
> -	int reg;
> +	u8 index;
> +	s32 err;
> +
> +	index = find_closest(val, sample_times, NUM_SAMPLE_TIMES);
> +
> +	err = regmap_update_bits(tmp102->regmap, TMP102_CONF_REG,
> +				 0xc000, (3 - index) << 14);
> +	if (err < 0)
> +		return err;
> +	tmp102->sample_time = sample_times[index];
> +
> +	return 0;
> +}
>   
> +static int tmp102_write_chip(struct device *dev, u32 attr, long val)
> +{
>   	switch (attr) {
> -	case hwmon_temp_max_hyst:
> -		reg = TMP102_TLOW_REG;
> -		break;
> -	case hwmon_temp_max:
> -		reg = TMP102_THIGH_REG;
> -		break;
> +	case hwmon_chip_update_interval:
> +		return tmp102_update_interval(dev, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> +	return 0;
> +}
> +
> +static int tmp102_write(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long val)
> +{
> +	struct tmp102 *tmp102 = dev_get_drvdata(dev);
> +	int reg;
> +
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
>   

Please add separate tmp102_write_temp() function.

> -	temp = clamp_val(temp, -256000, 255000);
> -	return regmap_write(tmp102->regmap, reg, tmp102_mC_to_reg(temp));
> +		val = clamp_val(val, -256000, 255000);
> +		return regmap_write(tmp102->regmap, reg, tmp102_mC_to_reg(val));
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +	return 0;
>   }
>   
>   static umode_t tmp102_is_visible(const void *data, enum hwmon_sensor_types type,
> @@ -139,27 +206,39 @@ static umode_t tmp102_is_visible(const void *data, enum hwmon_sensor_types type,
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
> +		default:
> +			break;
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
> +		default:
> +			break;
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
> @@ -237,6 +316,8 @@ static int tmp102_probe(struct i2c_client *client)
>   	if (IS_ERR(tmp102->regmap))
>   		return PTR_ERR(tmp102->regmap);
>   
> +	tmp102->sample_time = DEFAULT_SAMPLE_TIME_MS;
> +
>   	err = regmap_read(tmp102->regmap, TMP102_CONF_REG, &regval);
>   	if (err < 0) {
>   		dev_err(dev, "error reading config register\n");

