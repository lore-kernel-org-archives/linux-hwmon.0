Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0842E54D1
	for <linux-hwmon@vger.kernel.org>; Sat,  8 Aug 2026 14:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786200538; cv=none; b=fX4feujOHL9nq+YT+75vew+sfgqVSMontGT6T522rjiIfqXCV9Y595VJqhCAR/sKYyNmsvlFWUjcW4EtL8aux4orxXLbmMYqDyxt0wTPECcgI+V3nFg9bC1KUQ2H7Ob0KCn2zaOVf6JSpfiC3En5s7DRitSq4qtsTa87u5+VFLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786200538; c=relaxed/simple;
	bh=viL2/S2aHDtjU7pxNmbHbRLH6lZLq8qNSh04QFM3TGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOkGwwDyoiJQyU90Ii1sSdAgF8w/8Px86PwZS/RAhJ5RWv+RHEQfXiXObLMce/l3GrcJ7JqeBxyvY/+VY0wh+huKtlVIQ2Or6t+vEseG1munfWsNXP10tDgxjPfyR9O9vSKVRKLYvtlK7/ZhWe86tIPnpg1Cl0xRT/WWIEJKIdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHjUx6gw; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHjUx6gw"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so298085a91.2
        for <linux-hwmon@vger.kernel.org>; Sat, 08 Aug 2026 07:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786200536; x=1786805336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQasgB+Q7GTnDcHKAVsgkMHK+/3jVcRc2dZRnUCKkRc=;
        b=AHjUx6gwsqzwxxqz2Rm9+NkY3hT8dZi/8XiaZBltajGj+hXP7n9cGutYxvaETzO1rP
         m4S2ZXJNefuRYNNNUIilYCXd0JQBmHs/lieK756nZDAmGIJB7QZZGzQQs4YydElNr5Vd
         T2Bm/oOpcjDiVKkiLO88H6oRwqle00bT99mGq5mmpRGTlV1slfqH9kp98sgSOos4zs2y
         tLuLnnXl96RnULlDz7izv9vFOj8lrE30augFCxrXw8pq7RRllZogC/cf3vjfxz6TzEAF
         nu5OR+FLoNSbbGbOT4GsN4tzJjOxT7Eb3PtTiThUZbaAT8jsNiZTRi1iitnKDcYDsrGx
         pacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786200536; x=1786805336;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CQasgB+Q7GTnDcHKAVsgkMHK+/3jVcRc2dZRnUCKkRc=;
        b=inTQO5B7NFBtMTeQ1yKJBCLhBOE1I9e4me/D62IiEhkHiJECta8Wq0i661Zldy7pKK
         s7ciVaRp61frWqZ5w3laVzPVrVVaXA/ajnpefFVZOtOLBrFxPeUCSRUdIqwb5ngYk659
         0Xw79AP1TgaRsId/sIeesO2BRopByH1d5OlGEW7MgRuR/hIkH7jdLbe1R5D/UwFw0Rmw
         VRrsjdLjqa1ojF7ofABWujC09PBUfG6txTvCzL5vo3pJR/+hbo7StkMmq57YM/te1iMt
         txrG8vYqnHWIcpaVGgzs/REefMmWzO3+e6d81QWMo7By2zv/kPMOdsotk/o3T2hTzLlj
         2e5g==
X-Gm-Message-State: AOJu0Yw8HJADiTYPpbdth7PB/6F92M5/z2FDrnFnt49+XU/GJgnipcLt
	0ywDSdytyOYE2zu2LUgt0ZhtB2nkHJsoXs+Ef5zoVN7mI38fvcUQk6R9
X-Gm-Gg: AR+sD13VrLVl3p0KC0KpAnsQZf3lNCNGSnA47vhVdzp9HMHicBgDbyUguiWeW1RbR2p
	OB4d6zvjZuHB/Ixh7cByWsk7BkDyDdOf/DGQ7lUfOO3Xyw6iNSESmtZT24rigVOHRDcrWIUc37P
	jtHgXrPHgNBAqDnUgyxahaWCGl2H8k7wZseSvey8aX+fJoxuuChBiatWZOq0Lf1cEO9IMQa4vC6
	5wlq5Nh7UqqaXy9JguZGYLAbj0CNycVY+gdw6M+Kli8bc3We5iZyTx3HpaXLD6QZ2+4GI8ljQxN
	JAU9PYXXEepsC2DEYTO2dn28BL4kwCP5aUlmGFxM4kqw/MDldOULTLSC9iP3pKFn1WncGO2DjMQ
	4goTmH/1HfDKn/FT1AQAtfSZ4kiTl9buvwtADhykVbC2Vgs5o9yw5IJC6IlOCA6SMwZQbemOqDv
	kQnURCm5Qf6Y93BA2mbipLH+nHTlv4keEQPeaoQ1fiPP5ilysx2G3p3ZW8jMJQUHiXg6DF/5ByS
	lE/eJh60M/vUMDB9uMQPrLuiUCwzagbaQ6N/g==
X-Received: by 2002:a17:90b:2b8e:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-3909d8c5a4emr16622579a91.14.1786200535541;
        Sat, 08 Aug 2026 07:48:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6c13asm6342088a91.2.2026.08.08.07.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 07:48:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2651758d-e588-4c2e-aa1d-13772e09874b@roeck-us.net>
Date: Sat, 8 Aug 2026 07:48:54 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (max6621) fix negative temperature offset and crit
 readings
To: Cong Nguyen <congnt264@gmail.com>, Vadim Pasternak <vadimp@mellanox.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260808083718.2612205-1-congnt264@gmail.com>
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
In-Reply-To: <20260808083718.2612205-1-congnt264@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/8/26 01:37, Cong Nguyen wrote:
> max6621_read() reads the temperature input, offset and critical alert
> registers into a u32 and assigns them to the output without sign
> extension. The device reports these values in two's complement (the
> driver comment and the write path, which clamps to
> MAX6621_TEMP_INPUT_MIN == -127000 and encodes negatives, both rely on
> this), so negative values are misreported as large positive numbers:
> 
>    - temp_offset: *val = (regval >> MAX6621_REG_TEMP_SHIFT) * 1000, an
>      unsigned shift, so e.g. a -10 degrees C offset (register 0xfd80)
>      reads back as ~+1014000 millidegrees.
>    - temp_crit: *val = regval * 1000, so a negative critical threshold
>      reads back as a large positive value.
>    - temp_input used an s8 intermediate, which is correct for the
>      -127..127 range but reports the documented +128 degrees C maximum as
>      -128 degrees C.
>

This problem does not exist. The AI is hallucinating a bit. There is no mention
of +128 degrees C in the datasheet.

The problem here is that MAX6621_TEMP_INPUT_MIN (-127) and MAX6621_TEMP_INPUT_MAX (128)
are wrong. That should be -128 and (+)127. I guess the AI doesn't see that.

> The registers are 16-bit (the driver's own PECI error codes occupy
> 0x8000-0x80ff), so sign-extend from bit 15 before scaling. This fixes
> all three reads and drops the now-unused s8 intermediate.
> 

The PECI error code reference is just confusing AI slop and completely irrelevant
for the patch.

> Fixes: 92b64580f14b ("hwmon: (max6621) Add support for Maxim MAX6621 temperature sensor")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> ---
>   drivers/hwmon/max6621.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
> index a7066f3a0bb4..03ac3eb5a594 100644
> --- a/drivers/hwmon/max6621.c
> +++ b/drivers/hwmon/max6621.c
> @@ -204,7 +204,6 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	struct max6621_data *data = dev_get_drvdata(dev);
>   	u32 regval;
>   	int reg;
> -	s8 temp;
>   	int ret;
>   
>   	switch (type) {
> @@ -225,8 +224,8 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   			 * The temperature is given in two's complement and 8
>   			 * bits is used for the register conversion.
>   			 */
> -			temp = (regval >> MAX6621_REG_TEMP_SHIFT);
> -			*val = temp * 1000L;
> +			*val = (sign_extend32(regval, 15) >>
> +				MAX6621_REG_TEMP_SHIFT) * 1000L;

			*val = ((s16)regval >> MAX6621_REG_TEMP_SHIFT) * 1000L;

However, as mentioned above, this is not a problem in the first place
but AI not understanding the code and the real problem..

Guenter

>   
>   			break;
>   		case hwmon_temp_offset:
> @@ -239,8 +238,8 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   			if (ret)
>   				return ret;
>   
> -			*val = (regval >> MAX6621_REG_TEMP_SHIFT) *
> -			       1000L;
> +			*val = (sign_extend32(regval, 15) >>
> +				MAX6621_REG_TEMP_SHIFT) * 1000L;
>   
>   			break;
>   		case hwmon_temp_crit:
> @@ -254,7 +253,7 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   			if (ret)
>   				return ret;
>   
> -			*val = regval * 1000L;
> +			*val = sign_extend32(regval, 15) * 1000L;
>   
>   			break;
>   		case hwmon_temp_crit_alarm:

