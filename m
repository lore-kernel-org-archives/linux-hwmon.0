Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835503CEB85
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 20:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774037278; cv=none; b=O+P9uQMIPygzoxYmSsmzDa6/EcAFRcM6UYC6X0DNRL01Wb4jxrvDbpIKhoLyAQq6kc/Am2R9UMph9Ep5AiCdJrWsQ5cK1TN/luUqaMbvZZtou9QTBwyRKGOlPOCQ210mx1LtiynlcZPf9mGwLbL+Wgc9v6heFfHyqPlpFw3lUuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774037278; c=relaxed/simple;
	bh=KCs2JcjMH0RXYBu3NfXAwrv0K072hU3rKwA6jGlDMHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=htUPZvTD1mwVivq7cT6j0KAl/PtHcg/0T7MBOfcbo2v7apfleOh/jUauV2P+AjtimMowsvEtxNog4EiJy5uOF6mfmuDvtZ3/0TRuAbCP3TyO/cKzgBXuhmLzXU05oMi8+Nlv6jwzcioIGU26SkVvgQSaKhNomBsoDn/vtvj+HAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4PZgs7T; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4PZgs7T"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c10a2e2cd1so2742297eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 13:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774037275; x=1774642075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=k29BR/qYLc7EBuf2Es6msoD8R0ogDdsJRfnpAqA5zCE=;
        b=P4PZgs7TeeMTDfjcQsY9pmwDsSGpPH/pb0pM3xDIcsxfTuJyjWZtmMm6HVk6FQqoyl
         knWz71rE9qwXtvnrxPvfnaNt4I/LeQXEL+cUo69Vns/WGEH7v58C8syu9h7MvAhBzoMN
         iv2v5GARuSy9aXno+PxcW0u9sUk4bg7UTuOzy2a5jykQNLpGKKX5RKxg1d9k4fDMVRqz
         Oqhp8FJO54rbeSxLJskYqCiP2J1S557ZiPKY7oPaQEBeoaufaOZx6PusXaMvcA0Qbqra
         YVjjWwzgc0LEsoHhFdRohnzFRclFvIxtHgDqyVG9GNBi1y8sndrdoHQDVJgMHbmdp/qS
         kYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774037275; x=1774642075;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k29BR/qYLc7EBuf2Es6msoD8R0ogDdsJRfnpAqA5zCE=;
        b=XXvpXFywG1EiIU7w8i7FEGh8zqsIgwfBywNY8EV8tdgVko2hw1K/J/HVn2V8sDNTJm
         P5dFZhLiDLbhRhxdl6agu39/3n17vGsU9YKAm+D6NJwWAdPWJWl63gBCv9tox8JQQQx7
         C2rzDmmwsCLBzIsfQxBDF7IyiFrwOvaPuqBAFYGXw/nsh6qlxpjAoeHa8qNQvxtQgoAE
         pF24jYBtj6OcSmIEU8gH/J3Iqqyrsr05bBlje18EQxzXseVY8DefzHS5p229sboFSizN
         oAVaJ3Ar9CnFPKgo9eIyA7uVPsdNPBFL3mPTW51YyY+M8H5vI7LIqLF+/tLHlWHmW8IM
         XWBg==
X-Forwarded-Encrypted: i=1; AJvYcCUXM0WUjTjG3xskUHyrEMM2IgBUao1FYoaAyRnG/Cos/Lzbdnog0O0H5pbAY+4V+WOd6fSiFGXkFUE8HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzElB3SU+8BxSZE8y+fW3ip6Pcemkxg564JZxVSm1mEDumQ8ZVB
	YOn1vcQi9OTSmFbUL0YQfX3XfjIwJ/ttR8YU6ebMfW0Ro1t8fQBhgjt6
X-Gm-Gg: ATEYQzzq2thl9lcL/o8wCilSvwG0ptBLSWiCjcRIzX9UmKmhhF+vTteco2YfBQJy75c
	/zseVk4uoiNgjqCyNJNUhxpi+wvszgwIZp+gG1gqDV2bHaehj5d1jKW9xx3h5DvYCN9BjIXvrXp
	3i2kzNRXaizjoDUDNR2Vof12bR6xs9/2GUhWbGf7VQuPqh6Zzly9H7ICsjgJzUULcwAP38+zNI0
	PhYaX/MXD4f1kNgfWv+UElk+xRUCt2Ez4Xs58JPCItfVRPE12ZHTOTANPi3E+/r0ePB8BpnVVfP
	Q33ZlgAev5I5r9pZzofGtI0iZw7/7euD87kd6um8cPhuL0bdhcNPhDCnm8Fkc4vRNUJl8vC7CNv
	inK68m34yMs2aXfdwEtRUL4aw7vtXdClCbk0psx5r7/OjJKteVCBvz3NTC1YJ2ZFPogQozJHEzF
	A2VY+xwSgJXSxzMMKXdc0zI6Hr0LStJ90iNpbULnB0A0Pb/517ku2Z91jnb26nVSXOzYOj9cI2
X-Received: by 2002:a05:7300:e208:b0:2bd:f280:58d4 with SMTP id 5a478bee46e88-2c109585241mr2319894eec.6.1774037274491;
        Fri, 20 Mar 2026 13:07:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b1b8sm4822629eec.8.2026.03.20.13.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 13:07:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <db707904-2ec3-4169-9cb6-59d80415dec4@roeck-us.net>
Date: Fri, 20 Mar 2026 13:07:52 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (it87) Add support for IT8689E
To: Markus Hoffmann <markus@thehoffs.at>, linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com, linux-kernel@vger.kernel.org
References: <20260309223103.175443-1-markus@thehoffs.at>
 <20260320144323.4870-1-markus@thehoffs.at>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260320144323.4870-1-markus@thehoffs.at>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/26 07:43, Markus Hoffmann wrote:
> Add support for the ITE IT8689E Super I/O chip. The IT8689E supports
> newer autopwm, 12mV ADC, 16-bit fans, six fans, six PWM channels,
> PWM frequency 2, six temperature inputs, and AVCC3.
> 
> Signed-off-by: Markus Hoffmann <markus@thehoffs.at>
> ---
> Changes in v2:
>    - Add it8689 to the it8620/it8628 GPIO pin multiplexing checks in
>      it87_find() to avoid exposing ghost fans, garbage tachometer data,
>      and non-functional PWM controls on boards where those pins are
>      multiplexed as general-purpose I/O.
> 

Sashiko still finds some problems:

https://sashiko.dev/#/patchset/20260320144323.4870-1-markus%40thehoffs.at

Thanks,
Guenter

>   drivers/hwmon/it87.c | 18 ++++++++++++++++--
>   1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 5cfb98a05..0dcf6bbac 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -16,6 +16,7 @@
>    *            IT8622E  Super I/O chip w/LPC interface
>    *            IT8623E  Super I/O chip w/LPC interface
>    *            IT8628E  Super I/O chip w/LPC interface
> + *            IT8689E  Super I/O chip w/LPC interface
>    *            IT8705F  Super I/O chip w/LPC interface
>    *            IT8712F  Super I/O chip w/LPC interface
>    *            IT8716F  Super I/O chip w/LPC interface
> @@ -64,7 +65,7 @@
>   
>   enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
>   	     it8771, it8772, it8781, it8782, it8783, it8786, it8790,
> -	     it8792, it8603, it8620, it8622, it8628, it87952 };
> +	     it8792, it8603, it8620, it8622, it8628, it8689, it87952 };
>   
>   static struct platform_device *it87_pdev[2];
>   
> @@ -162,6 +163,7 @@ static inline void superio_exit(int ioreg, bool noexit)
>   #define IT8622E_DEVID 0x8622
>   #define IT8623E_DEVID 0x8623
>   #define IT8628E_DEVID 0x8628
> +#define IT8689E_DEVID 0x8689
>   #define IT87952E_DEVID 0x8695
>   
>   /* Logical device 4 (Environmental Monitor) registers */
> @@ -502,6 +504,14 @@ static const struct it87_devices it87_devices[] = {
>   		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
>   		.peci_mask = 0x07,
>   	},
> +	[it8689] = {
> +		.name = "it8689",
> +		.model = "IT8689E",
> +		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
> +		  | FEAT_SIX_FANS | FEAT_IN7_INTERNAL | FEAT_SIX_PWM
> +		  | FEAT_PWM_FREQ2 | FEAT_SIX_TEMP | FEAT_AVCC3,
> +		.smbus_bitmap = BIT(1) | BIT(2),
> +	},
>   	[it87952] = {
>   		.name = "it87952",
>   		.model = "IT87952E",
> @@ -2785,6 +2795,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>   	case IT8628E_DEVID:
>   		sio_data->type = it8628;
>   		break;
> +	case IT8689E_DEVID:
> +		sio_data->type = it8689;
> +		break;
>   	case IT87952E_DEVID:
>   		sio_data->type = it87952;
>   		break;
> @@ -2952,7 +2965,8 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>   
>   		sio_data->beep_pin = superio_inb(sioaddr,
>   						 IT87_SIO_BEEP_PIN_REG) & 0x3f;
> -	} else if (sio_data->type == it8620 || sio_data->type == it8628) {
> +	} else if (sio_data->type == it8620 || sio_data->type == it8628 ||
> +		   sio_data->type == it8689) {
>   		int reg;
>   
>   		superio_select(sioaddr, GPIO);

