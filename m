Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C3B3C198A
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 11:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857897; cv=none; b=HvebXVMloRBoen0yvohsJHxIyj9FKAx7cNv2O4eQ/V17CBSmQH25EBng1Z0+WapfAUGbX5ZmST7NBkNZvClVR+fEwDQL+YFP3EdXqVswCr+JSAHSS4/atqRbmmF3WpLzipd+cv8YyK5PoMVnRhDYP98uJT2nWCNBegwH3pDogWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857897; c=relaxed/simple;
	bh=1ChudyhB9PrLpcu1ausyxcm+qbBvu52Jj1i2wzV2bJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIqugLEDvjBirSIXblZugQcHrbRFpON8yM1CsoWqVHP3Bx5byJXxF6N7068NYeU/7I//IbdwTzGaSVzoOxiS+CJFhnZUgfkBwc2Eg6MDAGKfSm7g2apA7QzJC9TfrUlGWKaq6ukTKHk4hKwfVDod5CAmRHTJShHA2BS8fINIHSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTT2R4tp; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTT2R4tp"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ab46931cf1so44401265ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 04:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776857894; x=1777462694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJmY/r8RzL8DJnHS2RBIb1cZGOshnBGPhFGVPd8dc78=;
        b=PTT2R4tpCdazxftLT+38Iyl+CxmAn8tW/uq4nsewovkiF2G3qa2pWHExg2CMMh0MuN
         fGUs0Hxb9oargoFlZgL5Lsb0f455lXfwetXYelzarIlvpvtw5rDYbYMuJ0rnIZaFw1Vg
         zPms/SqXytZ0Huuf04rUr+3v2/mTEaZXGPz+oIU640Qckj36rQE1iaNEZi9copfbAqmk
         YvC5a5UQ88B86Qw02RfH1t2z4W+qIApdxG8O4he/SlkqfKBGhSx+WO5LJNGFB0MIK4l2
         WcFZvZztEnKD3T50r6qzI6V2eVraTcPg8gobecxGzmLkup0uapLGL0qwDUZU+JjC/uPU
         7cXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776857894; x=1777462694;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJmY/r8RzL8DJnHS2RBIb1cZGOshnBGPhFGVPd8dc78=;
        b=hEIxgZWewvTIb7VAojyHE5PIL7nsYm3WmZVaX7VjvcWx8K4KbfHNARGTO4nByy+NyB
         /jNthZo+3QumdLK8nX96ODUMw99M+yvToDx5fR9eFBN+NCJh/gpwLwBmj/EN/+9Yql2k
         jNzFnDA6ZNMRSiDzSChV6AaqxAV+LqHFFm17xGM6L+DT743l8fIyn6g7/mHf+f2I7O6k
         8ZDje9uGwknq5+gM8OSYBJ59hZ06YgGu3z6Z3LqnVCO3FCaCJ4Xs2THGSlb/mCtj3jOB
         nF3ZSfTbcMOKSCjMUhB669eSZk8YUGsTTBFNT41Ae8iTuqMjcDNwUe3h4ttFDTJ++9ol
         4zTQ==
X-Gm-Message-State: AOJu0Ywc5QuEftYU/7brsr2NwtjxiQ/gAvKinDhIUEj0MhmTdMYVrUMs
	kVtThhcgeGErH/5ixu4SOlVrHUyb3lUiMYUhStvPfk/iJ7cJtVDvd4+0
X-Gm-Gg: AeBDiett/h0JIcOyvZPpyeFXelp4Mo1fdJF515jY642Mzvkbp39O1WHQJbrXI3Ir1tz
	b5OwOGRjWWfwnTKJROQsXCBFI0WwUbXNI8TPm0iZHewiyekL2/OFh8NEJKNEX4FlBOgqWGgy2PW
	jlEURfIA4Ri0WOoyj3i+vk814xhLlc3LqlymMM5y7808zCWrTO4PV5L8ExMC/acQRgLEZLcDa3b
	AUIWl8U5zdz0b09DVRCM3grApsILdGWXNnS/Kcjt5DTZZ02TPRfFQ/siNwAVS6khe1OdJjhnryo
	JYfAvzI7U3zCbfJIhOCSIaaV7CGPlDdm0AhjGC5AWjoHD3k9sPcypRqCPyVOXhrxGrRvyuJud3v
	ql/KeNXsATiqaQfDoprrT3cQ7eDRUYXJaxoYRxa7VuF5vvhgc7qiJ2dpvGM0PRGIR/WEkHp94To
	ywYOqV2a88TN86xhYMvHKdHbKpi1vmi4mXnS+k6gya4eAfoUMmT/DpBg3dyHAK3mamtJr3CaOFH
	5G7kA47Lo8=
X-Received: by 2002:a17:903:bd0:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2b5f9e8d873mr141633755ad.16.1776857894485;
        Wed, 22 Apr 2026 04:38:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab40786sm175528755ad.79.2026.04.22.04.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 04:38:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <aefd2450-9b60-4a15-9e34-6eb435b48b8c@roeck-us.net>
Date: Wed, 22 Apr 2026 04:38:12 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: mcp9982: Add external diode fault read
To: Victor Duicu <victor.duicu@microchip.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 marius.cristea@microchip.com
References: <20260422-add-external-diode-fault-read-v1-1-bb28e03a0766@microchip.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260422-add-external-diode-fault-read-v1-1-bb28e03a0766@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/22/26 01:43, Victor Duicu wrote:
> This patch adds external diode fault read capability
> to the MCP998X/33 and MCP998XD/33D driver.
> 
> Signed-off-by: Victor Duicu <victor.duicu@microchip.com>
> ---
>   drivers/hwmon/mcp9982.c | 21 +++++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/mcp9982.c b/drivers/hwmon/mcp9982.c
> index 26c69e3388ab..2e75ade20118 100644
> --- a/drivers/hwmon/mcp9982.c
> +++ b/drivers/hwmon/mcp9982.c
> @@ -92,19 +92,19 @@ static const struct hwmon_channel_info * const mcp9985_info[] = {
>   			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
>   			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
>   			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
> -			   HWMON_T_CRIT_HYST,
> +			   HWMON_T_CRIT_HYST | HWMON_T_FAULT,
>   			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
>   			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
>   			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
> -			   HWMON_T_CRIT_HYST,
> +			   HWMON_T_CRIT_HYST | HWMON_T_FAULT,
>   			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
>   			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
>   			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
> -			   HWMON_T_CRIT_HYST,
> +			   HWMON_T_CRIT_HYST | HWMON_T_FAULT,
>   			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MIN |
>   			   HWMON_T_MIN_ALARM | HWMON_T_MAX | HWMON_T_MAX_ALARM |
>   			   HWMON_T_MAX_HYST | HWMON_T_CRIT | HWMON_T_CRIT_ALARM |
> -			   HWMON_T_CRIT_HYST),
> +			   HWMON_T_CRIT_HYST | HWMON_T_FAULT),
>   	HWMON_CHANNEL_INFO(chip,
>   			   HWMON_C_UPDATE_INTERVAL),
>   	NULL
> @@ -510,6 +510,18 @@ static int mcp9982_read(struct device *dev, enum hwmon_sensor_types type, u32 at
>   
>   			*val -= hyst * 1000;
>   
> +			return 0;
> +		case hwmon_temp_fault:
> +			/*
> +			 * Because the ALERT/THERM pin is set in Therm(Comparator)
> +			 * mode, the external diode fault status register
> +			 * does not clear the bits after reading.
> +			 */


What does that mean ? How does this behavior differ from other alarm
bits to warrant that comment ?

Thanks,
Guenter

> +			*val = regmap_test_bits(priv->regmap, MCP9982_EXT_FAULT_STATUS_ADDR,
> +						BIT(channel));
> +			if (*val < 0)
> +				return *val;
> +
>   			return 0;
>   		default:
>   			return -EINVAL;
> @@ -681,6 +693,7 @@ static umode_t mcp9982_is_visible(const void *_data, enum hwmon_sensor_types typ
>   		case hwmon_temp_max_alarm:
>   		case hwmon_temp_max_hyst:
>   		case hwmon_temp_crit_alarm:
> +		case hwmon_temp_fault:
>   			return 0444;
>   		case hwmon_temp_min:
>   		case hwmon_temp_max:
> 
> ---
> base-commit: fb447217c59a13b2fff22d94de2498c185cd9032
> change-id: 20260422-add-external-diode-fault-read-a0c3cd1a4761
> 
> Best regards,

