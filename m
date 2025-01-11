Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DF182899;
	Sat, 11 Jan 2025 15:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736610653; cv=none; b=k93iw5iBmW8aW7ZrpyAzKuOwXHcpWiJI3D1YYQuCIgVHxmRSTbIC+ezCE2kSlAHD9EPTfvh9ay/M9wRpwh8cNyaVD6Nu0vWWrsLCHKh1GFarZcpPMWyb1TvYKJK3n/AlK1EMXaR+9AQlwPAKNiXzXGvcs9kDKE3EQtXdR7TdzAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736610653; c=relaxed/simple;
	bh=YvRuxbeU6+KhlBdMvN6BTd1UycsZlbzIFxWi+XHbGGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tq7FgojQiT4I/BPit3Mkev0ytInsYvNsF4iWxuW/6eqYykrUrAE2yl32nszfGMGvc0vGJGZDbHrwPHsBxg/GnHJQBU5xZnoGqVvvfJhxcmwdJ0wnIc6NB2pjfz0mkfOWbwv41Yh13llJqvILPru4rm2wn59U0C2rhRTq/OfELao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSjYfTV9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSjYfTV9"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21619108a6bso50680335ad.3;
        Sat, 11 Jan 2025 07:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736610651; x=1737215451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=46ltxGjjUpmBCmNSMrDHxHqHB1s7TYzkCbsrUywtR94=;
        b=bSjYfTV9CV6Kyro2yOKNGcyWhv2R9fBJiHA+f1xSG+PdtDxW2HHeu8BE+r1IfVfGrl
         Hd2CpBhEn8mbcXY4L8GNPoCsdfbMDFzWZAxdt/2fKZH0ulQH8yDpWgZVxf/YEpPHgXqZ
         BD1mIbJn3MMS8YL4jwSBh9TCYikrHrZd3yMDz23OTlW9d8y6WYStMAWCfhNkVWOZL+EX
         6vSwQyvrgAFC6c7zc9lFOTiIgJwj1U2RZoIYjJ+YTZXofPl3nv+q4/hUkPCKiC7le18Y
         ydBtooHa+E5sUrU2CrNkO2ZfVXncJ/9WBYBcxahD2fVs7vpbIbOcqUPcyDAMQ+wXdNri
         LL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736610651; x=1737215451;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46ltxGjjUpmBCmNSMrDHxHqHB1s7TYzkCbsrUywtR94=;
        b=BK/RP6c7AWPi4SI5AEhqp9fVNvAzXRc5HSGjWmujKcfbUkxiJI0nBVPvRKtUuIOUPj
         z4sTgd9yRXIO9orOQtMG6aYQBZ6pBAEDbq9f2xFTdOGOpPLhTsnR4/WNM0rf+djHAM9/
         uD2iThRipVk0oIF/bHsyLo8hWh3cHeUddmSiVmVyiMUy3gq+ubj5WKsQgKGuLFH+m7w0
         Ho70gyVcyqpA5BIHtUZD4LlyfkUsbjhCKBDOHqBmInuUlz7rqbeum4rUeGM3BdN77K8k
         RrJmKfBrqVrJDVBLktrGD/bJ3KBfQtN2rvnDPIPIXNRxUTaw+4biusv2DtE3YTTkFkMM
         mVMA==
X-Forwarded-Encrypted: i=1; AJvYcCWOljuzhiOctTvuZvFzXjWx7srqKMOJEkn7IjKCvUVW4XcM88vkL4+2M+ly1to/gNBPPZnTIjczmVXSFO/w@vger.kernel.org, AJvYcCXWyTEz1e0j5n9wzPxzbRZwHPHFO50pDEuQU8Xoj3AyOT/nCBWnozDehnyxhdumwbHpSyM+Tpy6ofhcaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXJwjd2Y+kV1lm/UmTDK3bVMpLXNYxcEsT3HVcNBounZLiX0pT
	lz/p6ptbXZRYYdKNy+FSHGz3W2IrFBbwfcHVRqc9zb6HkehgEV34
X-Gm-Gg: ASbGncv46inOugqIf3Na/KlpM4NDCrtoXppy5MJOt46YJXlx5PGHgxturjvzak0DZoF
	UijZtiRsHzPuT30PkqIV8ikSEBtB9Ww3EsLFjGSYTqP7lsAAcWNEX9eIcml4aJydyaO1rK6nLgQ
	6AFtb60RfkWISkn0JMjoqdD615+Si9IGKpSEGQeRMLnsdvS0kZ/K9e8uvhlDGv7OlYomyxdRgh5
	jAj5hQFcWQAPNGNhQFNUKT63RFFjmbhMZ/Rao5mMuMtnaimtnojG5wIlYDD7a61jNwCqaHJnO85
	q7dkGY2SS2t9bq3wQLQPctcMkkLZnQ==
X-Google-Smtp-Source: AGHT+IHWa3kelQgb86nz8DnSaUjs9YZXFoEb/rbqFHH7PnK6AiGSNWi764rECu18mmeAbcitsgwvVg==
X-Received: by 2002:a17:902:cec1:b0:215:8d49:e2a7 with SMTP id d9443c01a7336-21a83ffcca3mr184973635ad.50.1736610650989;
        Sat, 11 Jan 2025 07:50:50 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219b97sm28835115ad.155.2025.01.11.07.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jan 2025 07:50:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7163d00e-6971-4a30-aeae-ff571fcb1e12@roeck-us.net>
Date: Sat, 11 Jan 2025 07:50:48 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Add T2 Mac fan control support in applesmc driver
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: Aun-Ali Zaidi <admin@kodeit.net>, Henrik Rydberg <rydberg@bitmath.org>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250111133239.3454-1-evepolonium@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250111133239.3454-1-evepolonium@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/25 05:32, Atharva Tiwari wrote:
> This patch adds support for fan control on T2 Macs in the applesmc driver.
> It introduces functions to handle floating-point fan speed values.
> The fan speed reading and writing are updated to
> 

drop empty line

> support both integer and floating-point values.
> The fan manual control is also updated to handle T2 Mac-specific keys.
> 
> Changes:
>   - Added support for floating-point fan speeds.
> 
>   - Updated fan speed functions to
>     handle both integer and floating-point values.
> 
>   - Modified fan control to support T2 Mac-specific keys.
> 
The "Changes" part duplicates the description.

> Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
> Co-developed-by: Aun-Ali Zaidi <admin@kodeit.net>
> Signed-off-by: Aun-Ali Zaidi <admin@kodeit.net>

How does this version differ from the previous version ? Or is it a resend ?
If it is a resend, why did you not tag it as resend ?

On a high and immediate level, the patch reports checkpatch issues,
and the subject line does not match subsystem expectations. On top of that,
it is complicated and difficult to review. All of that causes it to end up
at the end of my review queue.

Some comments below. This is not a complete review.

Guenter

> ---
>   drivers/hwmon/applesmc.c | 105 ++++++++++++++++++++++++++++++---------
>   1 file changed, 82 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index fc6d6a9053ce..9ce7c426a2f6 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
> @@ -510,7 +510,28 @@ static int applesmc_read_s16(const char *key, s16 *value)
>   	*value = ((s16)buffer[0] << 8) | buffer[1];
>   	return 0;
>   }

blank line here

> +static inline u32 applesmc_float_to_u32(u32 d)
> +{
> +	u8 sign = (d >> 31) & 1;
> +	s32 exp = ((d >> 23) & 0xff) - 0x7F;
> +	u32 fr = d & ((1u << 23) - 1);
> +
> +	if (sign || exp < 0)
> +		return 0;
>   
> +	return (1u << exp) + (fr >> (23 - exp));
> +}

blank line here

> +static inline u32 applesmc_u32_to_float(u32 d) > +{
> +	u32 dc = d, bc = 0, exp;

blank line here

> +	if (!d)
> +		return 0;
> +	while (dc >>= 1)
> +		++bc;
> +	exp = 0x7F + bc;
> +	return (exp << 23) |
> +		 ((d << (23 - (exp - 0x7F))) & ((1u << 23) - 1));
> +}

blank line here

>   /*
>    * applesmc_device_init - initialize the accelerometer.  Can sleep.
>    */
> @@ -842,15 +863,23 @@ static ssize_t applesmc_show_fan_speed(struct device *dev,
>   	unsigned int speed = 0;
>   	char newkey[5];
>   	u8 buffer[2];
> -
> +	const struct applesmc_entry *entry;

blank line here

>   	scnprintf(newkey, sizeof(newkey), fan_speed_fmt[to_option(attr)],
>   		  to_index(attr));
>   
> -	ret = applesmc_read_key(newkey, buffer, 2);
> +	entry = applesmc_get_entry_by_key(newkey);
> +	if (IS_ERR(entry))
> +		return PTR_ERR(entry);
> +
> +	if (!strcmp(entry->type, "flt")) {
> +		ret = applesmc_read_entry(entry, (u8 *)buffer, 4);
> +		speed = applesmc_float_to_u32(*(u32 *)buffer);
> +	} else {
> +		ret = applesmc_read_entry(entry, (u8 *)buffer, 2);
> +		speed = ((buffer[0] << 8 | buffer[1]) >> 2);
> +	}
>   	if (ret)
>   		return ret;
> -
> -	speed = ((buffer[0] << 8 | buffer[1]) >> 2);
>   	return sysfs_emit(sysfsbuf, "%u\n", speed);
>   }
>   
> @@ -861,7 +890,8 @@ static ssize_t applesmc_store_fan_speed(struct device *dev,
>   	int ret;
>   	unsigned long speed;
>   	char newkey[5];
> -	u8 buffer[2];
> +	u8 buffer[4];
> +	const struct applesmc_entry *entry;
>   
>   	if (kstrtoul(sysfsbuf, 10, &speed) < 0 || speed >= 0x4000)
>   		return -EINVAL;		/* Bigger than a 14-bit value */
> @@ -869,9 +899,18 @@ static ssize_t applesmc_store_fan_speed(struct device *dev,
>   	scnprintf(newkey, sizeof(newkey), fan_speed_fmt[to_option(attr)],
>   		  to_index(attr));
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
> +		ret = applesmc_write_entry(entry, (u8 *)buffer, 4);
> +	} else {
> +		buffer[0] = (speed >> 6) & 0xff;
> +		buffer[1] = (speed << 2) & 0xff;
> +		ret = applesmc_write_key(newkey, (u8 *)buffer, 2);

Why use applesmc_write_key here ?

> +	}
>   
>   	if (ret)
>   		return ret;
> @@ -885,12 +924,23 @@ static ssize_t applesmc_show_fan_manual(struct device *dev,
>   	int ret;
>   	u16 manual = 0;
>   	u8 buffer[2];
> +	char newkey[5];
> +	bool has_newkey = false;
> +
> +	scnprintf(newkey, sizeof(newkey), "F%dMd", to_index(attr));
> +
> +	ret = applesmc_has_key(newkey, &has_newkey);
> +	if (has_newkey) {
> +		ret = applesmc_read_key(newkey, (u8 *)buffer, 1);

buffer is already a u8 array. Why the type cast ?

> +		manual = buffer[0];
> +	} else {
> +		ret = applesmc_read_key(FANS_MANUAL, (u8 *)buffer, 2);
> +		manual = ((buffer[0] << 8 | buffer[1]) >> to_index(attr)) & 0x01;
> +	}
>   
> -	ret = applesmc_read_key(FANS_MANUAL, buffer, 2);
>   	if (ret)
>   		return ret;
>   
> -	manual = ((buffer[0] << 8 | buffer[1]) >> to_index(attr)) & 0x01;
>   	return sysfs_emit(sysfsbuf, "%d\n", manual);
>   }
>   
> @@ -900,28 +950,37 @@ static ssize_t applesmc_store_fan_manual(struct device *dev,
>   {
>   	int ret;
>   	u8 buffer[2];
> +	char newkey[5];
> +	bool has_newkey = false;
>   	unsigned long input;
>   	u16 val;
>   
>   	if (kstrtoul(sysfsbuf, 10, &input) < 0)
>   		return -EINVAL;
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
> +		ret = applesmc_write_key(newkey, (u8 *)buffer, 1);
> +	} else {
> +		ret = applesmc_read_key(FANS_MANUAL, (u8 *)buffer, 2);
> +		val = (buffer[0] << 8 | buffer[1]);
> +		if (ret)
> +			goto out;
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
>   out:
>   	if (ret)
>   		return ret;

