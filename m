Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D425322B81
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Feb 2026 22:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770244783; cv=none; b=nDYcCHxyXSFdp6Hl2U0YgxKCBs925FZjBSo83xq1UKlU7lCj6wkPKAE3RESjq7uIiioLWTHozQwR3sucYb5ALO/xlgbVVYEgjB8ASPnU9dsGRjnlPs0NTwnVIiJZbgiKqFAgWXSX69MNFKuOJtDqGdzMAYlCHbNE9PTr5Y5Jz2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770244783; c=relaxed/simple;
	bh=MRs7o+uspEhuovBWK8vduZqW4n6QnZk/Xj9aL67trwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZS6O4pctiXBrVcQX5OyYtvHOTa4612VVbr4PLYMk26sGl16Tqu6EEsp7gnObMSrSBFaX8XbrfoEbIaq0sZ9hNAkQcS18SLniktzOnUPLzmJKqoSPzLwpzTwfTfzNbdzzPJ8zyYlRVuikPpGwYnUmX9g9XVyofGVGJCLcYjKSqxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuGBHJ9e; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuGBHJ9e"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-823c56765fdso222061b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Feb 2026 14:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770244783; x=1770849583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mxZo7zqeqh9dI/ONOGvDxhP7HYC4stTlFPIR/ife04U=;
        b=AuGBHJ9eaiiS0gLonAOarDI0QlxY7RbnDDX+It6IjZv8wkziZI2zfx4RilyZ2mBd3f
         yJWEjO3Kl8ovmbBfYbwg6SqTu3uPwWV6/8onaYM8zkQNMjIFYn9PGJl3S4FU/OHSpWYi
         cN2wKqDv387CoVY6bJub47qzpMDavo3X+FeY2alXJS5J2IBLwLAnvxUQupuvKzAs8y0i
         zifopJ7YqjJDx1t9r5eVDbpEdfq43CZU89tlwkhJrNHcSBYf7x1uZ6jRFAEiwmxkRYcG
         a+Uxy3xgZ2IXDOVWNDaBw2vay2wxVMJjnrdlSGVCwsPwZw521qZkJH4jbaTqghdeyQoU
         WiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770244783; x=1770849583;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxZo7zqeqh9dI/ONOGvDxhP7HYC4stTlFPIR/ife04U=;
        b=Llrf3D41cpksMLgHPKzIE4pwGjspGxueyn7z23CyGF64BLxt4HWnFvU+nfHarKlbGB
         +nppSTdTHA/SKMxvMNjS3Norgk97ZIe3uPFiVoKYvmZ6jlXg14hoJ8l5HuZURrNjbr8B
         Fx7mjhm/XXSHF0QCTZrxtDJtBzKJJrkpwLj7Ss5dkh3+S+oyrqJWNxnYPqJW5By1HbmZ
         /dVTzMiQmyBobFLkFHQOBGZRgOKpTG6T5+1LEYMkhEk/DPqWVRLA0hgLl+hPzbJvEdqp
         vZ2XhS1Gur32wb2IuO9lYpEDb1H+ooU657zXd8HlN/llDifvZD94bmWj7KYWfvMCBVql
         d9Vw==
X-Gm-Message-State: AOJu0Yyof2yMObhXgucoRKRwCNPHi4/wg6qXFXGPOOc7oWzH8iIBhwZQ
	HDvtSHmeMrzrYd9/Bb29AhgMBRlkSRQ3tuxSdoqo6zW0xfQmcAO2WQmrns5yT3kL
X-Gm-Gg: AZuq6aJJoJC7Tz0cFnZwhnK4oqNBPvPQ3zvgho68zTD1lUWnpn+ZlmMne1gfmHjj6vz
	3l44wMjCt0/PoT1csyGSxwDHIFL5ypVB7FG8sRJahkAlSRipMqhLGi4RbcwgLQMIvmhWo7xsX62
	C5x9sEDLb85VIJWtKUWADhmipo1RIFKhLqFWRXJDPrBdGfFBC6SrIt65lB7XkHI9WDkW2pbOzmH
	GbpHC9kSTM/pXaMIRvgDhOoZ+yVXDIAXpOzXKomsZS55TzKb/KNPy6nRTKV9NHzm8JE58TSYMlS
	7t+vfr3CXIzwwAT81jYVjUk7BRiw/4785JUGdpf4MtTpJBotgqpYR7iWibDXARp1s/+G/uSqHxZ
	6t7QvCiPpDgTgNKE8jKWgQsIRHk32vz7AC4Ur7mXEXhzkITTorjYWjuz9kQb9DGRGovIFHFQ3WA
	HJ/EJBmQyKYQLvG1G6r4nteItQ61NDECeL+YYKaJOr4MtL+2vAJc8D4VS+dS0l
X-Received: by 2002:a05:6a00:4fc3:b0:81f:5263:eeee with SMTP id d2e1a72fcca58-8241c1deddfmr4038620b3a.21.1770244782541;
        Wed, 04 Feb 2026 14:39:42 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d49cabdsm3214825b3a.60.2026.02.04.14.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 14:39:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <30bad12b-13a3-46b1-b03f-877729fb01e5@roeck-us.net>
Date: Wed, 4 Feb 2026 14:39:41 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: pmbus: tda38640: Add identification for
 PMBUS_VOUT_MODE
To: Kyle Hsieh <kylehsieh1995@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260204-tda38640_direct_mode-v1-1-72511cd87b41@gmail.com>
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
In-Reply-To: <20260204-tda38640_direct_mode-v1-1-72511cd87b41@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/26 23:04, Kyle Hsieh wrote:
> Add support for detecting the PMBUS_VOUT_MODE for tda38640. Both
> linear and direct modes are now handled. Previously, only linear
> mode was assumed, which could trigger "Failed to identify chip
> capabilities" for chips in direct mode.
> 
> This change ensures proper identification of the chip regardless
> of its VOUT mode.
> 
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> ---
> This patch adds proper detection of the PMBUS_VOUT_MODE for the
> tda38640 PMBus driver. Previously, the driver assumed linear mode
> only, which would trigger "Failed to identify chip capabilities"
> for chips operating in direct mode.
> 
> Changes:
> - Add support to identify both linear and direct VOUT modes.
> - Prevent misidentification and improve robustness of the driver.
> ---
>   drivers/hwmon/pmbus/tda38640.c | 26 +++++++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/tda38640.c b/drivers/hwmon/pmbus/tda38640.c
> index d902d39f49f4..410b7fc5aef5 100644
> --- a/drivers/hwmon/pmbus/tda38640.c
> +++ b/drivers/hwmon/pmbus/tda38640.c
> @@ -23,6 +23,30 @@ struct tda38640_data {
>   	u32 en_pin_lvl;
>   };
>   
> +static int tda38640_identify(struct i2c_client *client,
> +			     struct pmbus_driver_info *info)
> +{
> +	int vout_mode;
> +
> +	vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
> +	if (vout_mode < 0 || vout_mode == 0xff)

This is odd for a chip supposedly supporting the command. Why check
for 0xff ?

> +		return vout_mode < 0 ? vout_mode : -ENODEV;
> +	switch (vout_mode >> 5) {
> +	case 0: /* Linear */
> +		info->format[PSC_VOLTAGE_OUT] = linear;

This is already set, so there no need to update it.

> +		break;
> +	case 2: /* Direct */
> +		info->format[PSC_VOLTAGE_OUT] = direct;
> +		info->m[PSC_VOLTAGE_OUT] = 1;
> +		info->b[PSC_VOLTAGE_OUT] = 0;
> +		info->R[PSC_VOLTAGE_OUT] = 3;
> +		break;

The datasheet doesn't claim support for direct mode. Where is this documented,
and where do the coefficients come from ?

Also, I am concerned that this interferes with svid mode.
We'll have to ensure that this is not the case before proceeding.

Thanks,
Guenter

> +	default:
> +		return -ENODEV;
> +	}
> +	return 0;
> +}
> +
>   #define to_tda38640_data(x)  container_of(x, struct tda38640_data, info)
>   
>   /*
> @@ -142,7 +166,6 @@ static int svid_mode(struct i2c_client *client, struct tda38640_data *data)
>   static struct pmbus_driver_info tda38640_info = {
>   	.pages = 1,
>   	.format[PSC_VOLTAGE_IN] = linear,
> -	.format[PSC_VOLTAGE_OUT] = linear,
>   	.format[PSC_CURRENT_OUT] = linear,
>   	.format[PSC_CURRENT_IN] = linear,
>   	.format[PSC_POWER] = linear,
> @@ -153,6 +176,7 @@ static struct pmbus_driver_info tda38640_info = {
>   	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
>   	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
>   	    | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
> +	.identify = tda38640_identify,
>   #if IS_ENABLED(CONFIG_SENSORS_TDA38640_REGULATOR)
>   	.num_regulators = 1,
>   	.reg_desc = tda38640_reg_desc,
> 
> ---
> base-commit: 5fd0a1df5d05ad066e5618ccdd3d0fa6cb686c27
> change-id: 20260204-tda38640_direct_mode-d6e47121a259
> 
> Best regards,

