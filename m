Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A29E1B218B;
	Sun, 12 Jan 2025 14:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736693878; cv=none; b=klv675BPMc2A9m+z3ZyXGasQU29S/OrTPZKylnzyaDd+08tCr+kRkEWR/GZdx2D7SQu6TDKX+k7ZXTR0cCuTqDDr0Nir1l1VjB0MCAW5JO0LoH/Z1GQMNI+lxqE8w4VN19L0o3k/85Gu89RvT+2hYq/vezwoOiOxKapa0vXu2Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736693878; c=relaxed/simple;
	bh=Z7uFNBmbfd4A/P96eovSelu34bTEoRXP7RgWXEcXLMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8ibz5SONQB5sHs40AbtIi09sP2/IjCQTBL+4P/bqtSSlftr75pkvSdsba0vpewq0Cp6zMJwrGrNsyAgeyADVTYjHqHMjgb+Sc2DXvZaiLfBvl7RQX4Eqzolkj1Lwr6Y0KoDoQHkBlLgc05WAxCX/1wF+912KgzNDfuvlBMRaD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FdDgqdNh; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdDgqdNh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2163bd70069so61685315ad.0;
        Sun, 12 Jan 2025 06:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736693876; x=1737298676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lo5mGpX2jSr5hGiAaMgHHtFiY/1bJL6Db2jN8GRdjUY=;
        b=FdDgqdNh/Im7JyLcyO0wzLh7UIJUF2w9GZkzUF/sA+tkwebd+l1Skob778svIFe0ej
         uN1XcXCKMSn4jLaEViWeVAKMDMpju4G95KzAy2V9WIfIaM/RbLincV3Bgm68HkVRZ6xE
         5JigiXP2v0nu+iR/dC3bYDElxK0aHTd7KBnbGMfYmKw5gaJ/bbGDZdG2Dvx1KJf4RqF4
         0EL/iqcRHdfrlG9btm0h6fI/JBixiwGpuFRivsQk5wtoxPyVP/9cxtQZDL0aaWHkupNp
         8TvRZk9Evs0clGEyzWWdu1VlBqKpuvet4CECsI/n//AZBh5lzBLtH5AGWzL2jDdjp9/8
         hpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736693876; x=1737298676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lo5mGpX2jSr5hGiAaMgHHtFiY/1bJL6Db2jN8GRdjUY=;
        b=czuWJZvdBytpl/BTGKBsyGVvK5VlI0GC48Tyl5/mS7m7kQFeEJQ/Qftc8rIx9keiQK
         j5kGH+LJygyCPB9jXGbQSjXzCLchtxc9cBlIh3oB/jgK4nzyKW6uQTNsuFefPT7y3lMV
         ynT8FwR+kMIdvw42D1ad5tDqHZlEv9APSOgSrWvE+a6fX5U8G+/O33ZyPRAUjzsJRmoU
         wc40PerDwsrcmrlpUATrZ2okQLqkpSschxosg1w1+1C7fOS0KoW75e9kyl4U0/UvFmpK
         9lSQXEOx1w1Q2auO1ibups4ahnjueOSLVwHUzgKUo9QHl0RaQjG/uHv0Fgig0UmsdcqT
         KOAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhudilLOo5PIGdQGYvMSTtsZG11sD9HsOKKb3ZOaDKWdTjiTytXYBApUWlBh8YgqY9wgR95NlWlqSyEQ==@vger.kernel.org, AJvYcCWaO9SlEDsK9iJkkqXc4juOdojAJ6Y+r+gj+wJgUTAFNqjhsDyPwJzeY2UCyXRl4k5emzR7elCH+AFc/x3h@vger.kernel.org
X-Gm-Message-State: AOJu0YyuJabJOJMmSSpWjxnH1WwtZ1zr9T1PUzlFUyjDh8KDT0YRNZZE
	sY2OQZVhsQfl65Bs2VALGtI+STIXG+Hi/PDuxRtCs82bXOqStZeo
X-Gm-Gg: ASbGncsZffXlVzVEP4lcnezYSGvDRLjNBvcrXB6q3VLXo9OFc5p+A1fENxTWByvuNX1
	rs72o7NpuECCMRqHle6wiEhuNOCu+W3v8jyxAkupzBx5YrV8Cbv5h1bQ/gm9o0IzEEJTjZz4oAy
	HOXnjKSE3hwUzMs4bgCVh0r+oEUoaKS7KEBHxyheEx/qQ0O3pTrgGw0SLuBPdGSBV2HgsnaJcgE
	pJ9wunCyDsztw7r75VuzO28vznT62K2rVkhq3bURBWxpLjeL/MPqXBqoFHKOYKIhqPIHA==
X-Google-Smtp-Source: AGHT+IGGDLMViNJR/U/cFc1anqOd4HBklQAvLXYjk/wHgsmw9uLUX57cQ3aguxKxDKBdRjMcXSI82g==
X-Received: by 2002:a05:6a00:e83:b0:725:b7dd:e668 with SMTP id d2e1a72fcca58-72d2201700cmr22593029b3a.17.1736693875630;
        Sun, 12 Jan 2025 06:57:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d406a57dcsm4505643b3a.170.2025.01.12.06.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 06:57:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Jan 2025 06:57:53 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: Aun-Ali Zaidi <admin@kodeit.net>, Henrik Rydberg <rydberg@bitmath.org>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: Add T2 Mac fan control support in applesmc
 driver
Message-ID: <517da43f-6a94-43c2-8a1a-3fa2acffdec2@roeck-us.net>
References: <20250111193700.37201-1-evepolonium@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111193700.37201-1-evepolonium@gmail.com>

On Sun, Jan 12, 2025 at 01:06:59AM +0530, Atharva Tiwari wrote:
> This patch adds support for fan control on T2 Macs in the applesmc driver.
> It introduces functions to handle floating-point fan speed values (which are required by t2 chips).
> The fan speed reading and writing are updated to support both integer and floating-point values.
> The fan manual control is also updated to handle T2 Mac-specific keys.
> 
> and also Guenter Roeck asked me "Why use applesmc_write_key here?" (line: 917)
> The use of applesmc_write_key is to directly update specific SMC keys
> for controlling hardware parameters like fan speeds or sensor calibration
> Changes since v1:
> -- added spaces as Guenter Roeck asked me
> -- also removed the type casting for buffer
> 

Change log should be after "---".

The subject line should start with "hwmon: (applesmc)".

Again, please run checkpatch on your patches. There are (still) two warnings.

> Signed-off-by: Aun-Ali Zaidi <admin@kodeit.net>
> Co-developed-by: Aun-Ali Zaidi <admin@kodeit.net>
> 
> Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
> ---
>  drivers/hwmon/applesmc.c | 108 +++++++++++++++++++++++++++++++--------
>  1 file changed, 86 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index fc6d6a9053ce..1f60776fe56a 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
> @@ -511,6 +511,31 @@ static int applesmc_read_s16(const char *key, s16 *value)
>  	return 0;
>  }
>  
> +static inline u32 applesmc_float_to_u32(u32 d)
> +{
> +	u8 sign = (d >> 31) & 1;
> +	s32 exp = ((d >> 23) & 0xff) - 0x7F;
> +	u32 fr = d & ((1u << 23) - 1);
> +
> +	if (sign || exp < 0)
> +		return 0;
> +
> +	return (1u << exp) + (fr >> (23 - exp));

Using BIT(), FIELD_GET(), and BIT_MASK() would make this much more readable.

> +}
> +
> +static inline u32 applesmc_u32_to_float(u32 d)
> +{
> +	u32 dc = d, bc = 0, exp;
> +
> +	if (!d)
> +		return 0;
> +	while (dc >>= 1)
> +		++bc;
> +	exp = 0x7F + bc;
> +	return (exp << 23) |
> +		 ((d << (23 - (exp - 0x7F))) & ((1u << 23) - 1));
> +}
> +
>  /*
>   * applesmc_device_init - initialize the accelerometer.  Can sleep.
>   */
> @@ -842,15 +867,24 @@ static ssize_t applesmc_show_fan_speed(struct device *dev,
>  	unsigned int speed = 0;
>  	char newkey[5];
>  	u8 buffer[2];
> +	const struct applesmc_entry *entry;
>  
>  	scnprintf(newkey, sizeof(newkey), fan_speed_fmt[to_option(attr)],
>  		  to_index(attr));
>  
> -	ret = applesmc_read_key(newkey, buffer, 2);
> +	entry = applesmc_get_entry_by_key(newkey);
> +	if (IS_ERR(entry))
> +		return PTR_ERR(entry);
> +
> +	if (!strcmp(entry->type, "flt")) {
> +		ret = applesmc_read_entry(entry, buffer, 4);
> +		speed = applesmc_float_to_u32(*(u32 *)buffer);

Buffer size is 2 bytes.

Missing error handling will end up running calculations on uninitialized data.

> +	} else {
> +		ret = applesmc_read_entry(entry, buffer, 2);
> +		speed = ((buffer[0] << 8 | buffer[1]) >> 2);
> +	}
>  	if (ret)
>  		return ret;
> -
> -	speed = ((buffer[0] << 8 | buffer[1]) >> 2);
>  	return sysfs_emit(sysfsbuf, "%u\n", speed);
>  }
>  
> @@ -861,7 +895,8 @@ static ssize_t applesmc_store_fan_speed(struct device *dev,
>  	int ret;
>  	unsigned long speed;
>  	char newkey[5];
> -	u8 buffer[2];
> +	u8 buffer[4];
> +	const struct applesmc_entry *entry;
>  
>  	if (kstrtoul(sysfsbuf, 10, &speed) < 0 || speed >= 0x4000)
>  		return -EINVAL;		/* Bigger than a 14-bit value */

Does this limit still apply ?

> @@ -869,9 +904,18 @@ static ssize_t applesmc_store_fan_speed(struct device *dev,
>  	scnprintf(newkey, sizeof(newkey), fan_speed_fmt[to_option(attr)],
>  		  to_index(attr));
>  
> -	buffer[0] = (speed >> 6) & 0xff;
> -	buffer[1] = (speed << 2) & 0xff;
> -	ret = applesmc_write_key(newkey, buffer, 2);
> +	entry = applesmc_get_entry_by_key(newkey);
> +	if (IS_ERR(entry))
> +		return PTR_ERR(entry);
> +
> +	if (!strcmp(entry->type, "flt")) {
> +		*(u32 *)buffer = applesmc_u32_to_float(speed);
> +		ret = applesmc_write_entry(entry, buffer, 4);
> +	} else {
> +		buffer[0] = (speed >> 6) & 0xff;
> +		buffer[1] = (speed << 2) & 0xff;
> +		ret = applesmc_write_key(newkey, buffer, 2);

Again, why not use applesmc_write_entry() here ?

Either case, the entire code repeatedly checks if the data type
is float. This seems excessive. Is there a reason to not check this
once and then use a flag such as has_accelerometer or has_accelerometer ?

> +	}
>  
>  	if (ret)
>  		return ret;
> @@ -885,12 +929,23 @@ static ssize_t applesmc_show_fan_manual(struct device *dev,
>  	int ret;
>  	u16 manual = 0;
>  	u8 buffer[2];
> +	char newkey[5];
> +	bool has_newkey = false;
> +
> +	scnprintf(newkey, sizeof(newkey), "F%dMd", to_index(attr));

Other keys use a define. Please do the same.

> +
> +	ret = applesmc_has_key(newkey, &has_newkey);
> +	if (has_newkey) {
> +		ret = applesmc_read_key(newkey, buffer, 1);
> +		manual = buffer[0];

Is this guaranteed to be a single bit ? No mask needed ?

> +	} else {
> +		ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
> +		manual = ((buffer[0] << 8 | buffer[1]) >> to_index(attr)) & 0x01;
> +	}

Similar to float detection, it might be desirable to check once
if FANS_MANUAL or "F%dMd" is used and then use a flag instead of
checking each and every time if "F%dMd" exists.

>  
> -	ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
>  	if (ret)
>  		return ret;
>  
> -	manual = ((buffer[0] << 8 | buffer[1]) >> to_index(attr)) & 0x01;
>  	return sysfs_emit(sysfsbuf, "%d\n", manual);
>  }
>  
> @@ -900,28 +955,37 @@ static ssize_t applesmc_store_fan_manual(struct device *dev,
>  {
>  	int ret;
>  	u8 buffer[2];
> +	char newkey[5];
> +	bool has_newkey = false;
>  	unsigned long input;
>  	u16 val;
>  
>  	if (kstrtoul(sysfsbuf, 10, &input) < 0)
>  		return -EINVAL;
>  
> -	ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
> -	if (ret)
> -		goto out;
> -
> -	val = (buffer[0] << 8 | buffer[1]);
> +	scnprintf(newkey, sizeof(newkey), "F%dMd", to_index(attr));
>  
> -	if (input)
> -		val = val | (0x01 << to_index(attr));
> -	else
> -		val = val & ~(0x01 << to_index(attr));
> -
> -	buffer[0] = (val >> 8) & 0xFF;
> -	buffer[1] = val & 0xFF;
> +	ret = applesmc_has_key(newkey, &has_newkey);
> +	if (ret)
> +		return ret;
> +	if (has_newkey) {
> +		buffer[0] = input & 1;

This is a significant semantics change. Previously a value != 0
meant that the bit is to be set. With this, all odd values mean that
the bit is set, and even values mean that it is clear. That is
unacceptable, sorry.

> +		ret = applesmc_write_key(newkey, buffer, 1);
> +	} else {
> +		ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
> +		val = (buffer[0] << 8 | buffer[1]);
> +		if (ret)
> +			goto out;

Error check should precede value assignment.

Please be consistent. The gotos are completely unnecessary,
and you replaced it with a return above. Either always use the
(unnecessary) gotos, or always return immediately. Yes, I know,
that means to drop the label below, but that is unnecessary
to start with (as is else after return).

> +		if (input)
> +			val = val | (0x01 << to_index(attr));
> +		else
> +			val = val & ~(0x01 << to_index(attr));
>  
> -	ret = applesmc_write_key(FANS_MANUAL, buffer, 2);
> +		buffer[0] = (val >> 8) & 0xFF;
> +		buffer[1] = val & 0xFF;
>  
> +		ret = applesmc_write_key(FANS_MANUAL, buffer, 2);
> +	}
>  out:
>  	if (ret)
>  		return ret;
