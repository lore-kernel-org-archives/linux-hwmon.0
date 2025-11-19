Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61D92F657C
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Nov 2025 04:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526040; cv=none; b=LArHrnlN2uktwgfwAu/eK7yTnZ/3EoCHKs73LGUzsVHnnBtstxYR5wc9VLXkZ0vMd5FRZemisl+R6brH6ipky1A1mmyQVmkZ0AstBTPSzjGDMxXcZo6p6TPwg+gbI+HdzJxb2/vHttx6jaBS95N47mE6R+ZMGwi1Gt6QI+xTKmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526040; c=relaxed/simple;
	bh=1jRyfi4zgDQMjBlgQB0Myifv01CW1xuI4tUMJ5TLBsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nqEpf969GxAR3QiXlwmkNgIwva4TgGCTuEWRm6OpgBhujZ0apWuKVZDhy2oGeRdbykWAHw+COF3oYseLzcLbwicgXn9u85ytq24O/baBBuz0ZdUQgemB+bBjtrAEfjHRYJU9222B859t0h0iSyoYJB68loQAMUgDUneZEF9z/g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrSyMCcj; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrSyMCcj"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7ba92341f83so2650288b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Nov 2025 20:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763526037; x=1764130837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=s42RoGmJZbzFJPOsi0pVAM0Po6O/T8xQut+en59nS5w=;
        b=NrSyMCcjhvORPBlcAghNEb1GaThaKTDrpP7P5W7JXu5R99Vs8uTPsCw935lIGSzD+m
         U+50AGmSdn+fceFJGr9+WLaEIHeIcLhsodk4gk/M0+dCtUO4wU8IazhjO1yemEcw8+FS
         4L0RdWh9juWi4Yw1U6lJu14oQgZIYXE3Suv8VB7gT7f7l2ECVGEpDOQ3HG7rBgOfukhw
         Vprj8RGB920HeZ0t9fMYRZ1rUG0+faZ2aD/DzyFY394bKoCB2Zn8yR72SwXN0vToyKcF
         yIWBJwK57RgxXKjTqxf59btuY+q+xsK4Jsvau9TIFgm2janJCcWGwCXgwzB1F2+k85za
         TNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763526037; x=1764130837;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s42RoGmJZbzFJPOsi0pVAM0Po6O/T8xQut+en59nS5w=;
        b=rx2HokK6+a3oWPJTlQbKn2F1XtUJdM1y54PZ9ATuMPDq5o/dEkCifb0RIkMUMQUTFL
         oyZ0nFTu67YvSa7lIbK3KvhQ54FBFpbUwAykQ4sNDR00I8hrNMfIlE8CtmMH3IQ7zRXB
         3Dl/wKvpCCbsd6vyZ6EpWD/Uj2qrJKNca2yZd62iajSCkRRttLCMcXnhCZZOdReE+MuS
         IZrNySicyJh53VphkDZhK1sd8PnPC0eFOwE7vB3lJGxGkv0gDPgVRnkaPyBNipvfyODC
         G89PK7MBuw1j7jbB7+RyCH34+ZLzeG81j7PGk+r9OO7Pbkuco04SOxrEG3YdxM7sZM9J
         jZtw==
X-Forwarded-Encrypted: i=1; AJvYcCXPZAHyg9RJfg4hRSJBLSedZKoup9UxYfRRFf2xCN/0zqOC8xuT440HvJ1PJ+VbouCTgbM+/bjUZ0qF+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyskDOOMtIyGnrw2BC5K61XJIMpfC/S2j65vEsoL4Ju2yC7IA5s
	H8XetC/K6qAbJz5nfiCvXz3FIY3YZpyX+MOiPyzhlejhv27k5+sUWcAC
X-Gm-Gg: ASbGncvLUWQUMmO2foyYOd4OytbRoh+YwtbouEs5Bx2/MFozw4OFwgPdosvx84j0xx0
	aqojV020AhZcYZZWe9kE7U/8CQrfhMa4g1s9/CWEnmX76oH9cNx5Yo9rvV2EJxY8mnNAdhBTgvy
	1iX1ycRmF3sEQNr7y3A1Xy0vy2j/1Xnz0KAE7vmp1hXsLiPi4J3qmL8Bls4b6/SKJ4/wA0nRazB
	lwkALAUcj+lz4TR9nESJoS/Cmme4cfYyL0vSyNMgQ+2wJywzn1kWfibZIF+dmug1rLGA5IExTAa
	4cBMIfz3i7YR7JQEM6GTCFlvxlvHb9rJwnVpy4g7nYWN2AV5lVZT/Izx+wtdF9ULSvMjBXWjwE6
	uifujP3CKjNP8H20iIE0UIsJ4h8xTmFdwb1alN0NHW8r9IpflR/xl4g5dsEJx4DTNkgLSlhC9Sv
	DnFPBjr37c0CGryq/e7GyDoDTW0swVguP5QIH6sIovfWWEZjxJR6gxQAA4hmQJ15cyd53HUdKIZ
	BB2WK+82XmnyNjwTiA=
X-Google-Smtp-Source: AGHT+IFEEygBCPdVKmJib45Q9YBW7YTsVf1Ci9WjUjW1O+tImgyJ3G+cjc3UtuOfrjShEATDo3siGw==
X-Received: by 2002:a05:7022:388e:b0:11b:12ef:967d with SMTP id a92af1059eb24-11b40e84a98mr7724332c88.7.1763526036934;
        Tue, 18 Nov 2025 20:20:36 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49d695821sm72975603eec.0.2025.11.18.20.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 20:20:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5b84260d-b8bc-48d7-8334-2ea662e82421@roeck-us.net>
Date: Tue, 18 Nov 2025 20:20:34 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] hwmon: (ina3221) Support for writing alert limit
 values and modify the 'ina3221_read_value' function.
To: Wenliang Yan <wenliang202407@163.com>, Jean Delvare <jdelvare@suse.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251118125148.95603-1-wenliang202407@163.com>
 <20251118125148.95603-7-wenliang202407@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251118125148.95603-7-wenliang202407@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/25 04:51, Wenliang Yan wrote:
> SQ52210 adds power, current, and limit registers. The ina3221_read_value
> function has been refactored to adapt to the new register data reading
> format.
> 
> Each channel supports four new alert trigger modes, but only one trigger
> mode can be active at any given time. Alert values are stored in the same
> register. The sq52210_alert_limit_write function has been added to write
> alert threshold values and configure alert source type.
> 
> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
> ---
>   drivers/hwmon/ina3221.c | 150 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 147 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index 1d589d402b52..9a25a1b40856 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -66,6 +66,14 @@
>   #define INA3221_MASK_ENABLE_SCC_MASK	GENMASK(14, 12)
>   
>   #define SQ52210_ALERT_CONFIG_MASK	GENMASK(15, 4)
> +#define SQ52210_MASK_ALERT_CHANNEL1 (BIT(15) | BIT(12) | BIT(9) | BIT(6))
> +#define SQ52210_MASK_ALERT_CHANNEL2 (BIT(14) | BIT(11) | BIT(8) | BIT(5))
> +#define SQ52210_MASK_ALERT_CHANNEL3 (BIT(13) | BIT(10) | BIT(7) | BIT(4))
> +
> +#define SQ52210_ALERT_ALL_SUL_MASK	(BIT(15) | BIT(14) | BIT(13))
> +#define SQ52210_ALERT_ALL_BOL_MASK	(BIT(12) | BIT(11) | BIT(10))
> +#define SQ52210_ALERT_ALL_BUL_MASK	(BIT(9) | BIT(8) | BIT(7))
> +#define SQ52210_ALERT_ALL_POL_MASK	(BIT(6) | BIT(5) | BIT(4))
>   
>   #define INA3221_CONFIG_DEFAULT		0x7127
>   #define INA3221_RSHUNT_DEFAULT		10000
> @@ -272,6 +280,18 @@ static inline int ina3221_wait_for_data(struct ina3221_data *ina)
>   					      cvrf, cvrf, wait, wait * 2);
>   }
>   
> +static const u32 alert_groups[] = {
> +	SQ52210_MASK_ALERT_CHANNEL1,
> +	SQ52210_MASK_ALERT_CHANNEL2,
> +	SQ52210_MASK_ALERT_CHANNEL3,
> +};
> +
> +static const u8 limit_regs[] = {
> +	SQ52210_ALERT_LIMIT1,
> +	SQ52210_ALERT_LIMIT2,
> +	SQ52210_ALERT_LIMIT3,
> +};
> +
>   static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
>   			      int *val)
>   {
> @@ -284,13 +304,55 @@ static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
>   
>   	/*
>   	 * Shunt Voltage Sum register has 14-bit value with 1-bit shift
> +	 * Current registers have 15-bit value
> +	 * Power registers have 16-bit value
> +	 * ALERT_LIMIT registers have 16-bit value with 3-bit shift
>   	 * Other Shunt Voltage registers have 12 bits with 3-bit shift
>   	 */
> -	if (reg == INA3221_SHUNT_SUM || reg == INA3221_CRIT_SUM)
> +	switch (reg) {
> +	case INA3221_SHUNT_SUM:
> +	case INA3221_CRIT_SUM:
>   		*val = sign_extend32(regval >> 1, 14);
> -	else
> +		break;
> +	case SQ52210_CURRENT1:
> +	case SQ52210_CURRENT2:
> +	case SQ52210_CURRENT3:
> +		*val = sign_extend32(regval, 15);
> +		break;
> +	case SQ52210_POWER1:
> +	case SQ52210_POWER2:
> +	case SQ52210_POWER3:
> +		*val = regval;
> +		break;
> +	case INA3221_BUS1:
> +	case INA3221_BUS2:
> +	case INA3221_BUS3:
> +	case INA3221_SHUNT1:
> +	case INA3221_SHUNT2:
> +	case INA3221_SHUNT3:
> +	case INA3221_WARN1:
> +	case INA3221_WARN2:
> +	case INA3221_WARN3:
> +	case INA3221_CRIT1:
> +	case INA3221_CRIT2:
> +	case INA3221_CRIT3:
>   		*val = sign_extend32(regval >> 3, 12);
> -
> +		break;
> +	case SQ52210_ALERT_LIMIT1:
> +	case SQ52210_ALERT_LIMIT2:
> +	case SQ52210_ALERT_LIMIT3:
> +		if (ina->alert_type_select & SQ52210_ALERT_ALL_SUL_MASK)
> +			*val = sign_extend32(regval, 15);
> +		else if (ina->alert_type_select & (SQ52210_ALERT_ALL_BOL_MASK
> +					| SQ52210_ALERT_ALL_BUL_MASK))
> +			*val = regval >> 3;
> +		else if (ina->alert_type_select & SQ52210_ALERT_ALL_POL_MASK)
> +			*val = regval;
> +		break;
> +	default:
> +		*val = 0;
> +		return -EOPNOTSUPP;
> +	};
>   	return 0;
>   }
>   
> @@ -443,6 +505,88 @@ static int ina3221_read_curr(struct device *dev, u32 attr,
>   	}
>   }
>   
> +static int sq52210_alert_limit_write(struct ina3221_data *ina, u32 attr, int channel, long val)
> +{
> +	struct regmap *regmap = ina->regmap;
> +	int item = channel % INA3221_NUM_CHANNELS;
> +	u8 limit_reg;
> +	u32 alert_group, alert_mask = 0;
> +	int regval = 0;
> +	int ret;
> +
> +	if (item >= ARRAY_SIZE(alert_groups) || val < 0)
> +		return -EINVAL;
> +
> +	alert_group = alert_groups[item];
> +	limit_reg = limit_regs[item];
> +
> +	/* Clear alerts for this channel group first */
> +	ret = regmap_update_bits(regmap, SQ52210_ALERT_CONFIG, alert_group, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* Determine alert type and calculate register value */
> +	switch (attr) {
> +	/*
> +	 * The alert warning logic is implemented by comparing the limit register values
> +	 * with the corresponding alert source register values. Since the current register
> +	 * is a 15-bit signed register and the power register is a 16-bit unsigned
> +	 * register, but the lower 3 bits of the limit register default to 0, the lower
> +	 * 3 bits will be forced to 0 when setting SUL and POL warning values.
> +	 * Formula to convert register value:
> +	 *     bus_voltage: (regval / 8mV) << 3
> +	 *     current: (regval / current_lsb) & 0xfff8
> +	 *     power: (regval / current_lsb) & 0xfff8
> +	 */
> +	case hwmon_curr_lcrit:
> +		/* SUL: Shunt Under Limit - BIT(15), BIT(14), BIT(13) */
> +		alert_mask = BIT(15 - item);
> +		/* Current Register, signed register, result in mA */
> +		regval = DIV_ROUND_CLOSEST(val * 1000, ina->current_lsb_uA) & 0xfff8;
> +		regval = clamp_val(regval, -32760, 32760);
> +		break;
> +	case hwmon_in_crit:
> +		/* BOL: Bus Over Limit - BIT(12), BIT(11), BIT(10) */
> +		alert_mask = BIT(12 - item);
> +		/* Bus Register, signed register, result in mV */
> +		regval = clamp_val(val, -32760, 32760);
> +		break;
> +	case hwmon_in_lcrit:
> +		/* BUL: Bus Under Limit - BIT(9), BIT(8), BIT(7) */
> +		alert_mask = BIT(9 - item);
> +		/* Bus Register, signed register, result in mV */
> +		regval = clamp_val(val, -32760, 32760);
> +		break;
> +	case hwmon_power_crit:

Didn't I say this before ? The number space for each sensor type overlaps.
Sensor attributes for different types can not be used in the same case statement.

Did you even compile this ? I would be quite surprised if there is a compiler
that would accept this code.

Guenter

