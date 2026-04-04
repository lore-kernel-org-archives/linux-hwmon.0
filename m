Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644E0352F88
	for <linux-hwmon@vger.kernel.org>; Sat,  4 Apr 2026 04:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775277539; cv=none; b=FldyUnQrSrAAQ6LmPhIxWuRKTPjYnk3NbYyx1DHtJINh7TnrdoPT7vCBQ0YJjit0oEnNXmcVC2MN0RT873mB2hnaPRqcAqf/OIVDAwfywq8cz+WDqwJD7bWoU9mbpZTdFJSuLcn8ikgyi3N8rnMRh19ppWIY/4ny0KSkq/x370U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775277539; c=relaxed/simple;
	bh=ZnY1oKkfBMpeFGDJCrqrINelAiDtExE8teTkrzYTWm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJaZf1M6Qf9cE3eXd5/cbEID+2Dyr1X8KDZxsd0w9xmbMqi/RZ228VZC/inMC7/kb0IOEetaI8DPDHKMEsC8D1lFuJZkIcv+El/gHsQKdvbN5m1tDMhKoyUvOqkWTfZ6eOAjh3Mi7Ex4YBAW1Hd9Sh+MCw+wI3gOdi/7izonU00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pdlly7uK; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pdlly7uK"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c54c68db4dso4771617eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Apr 2026 21:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775277536; x=1775882336; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YbuPCNQYcJW+qZcFX5gTzWFidS8EC1Zyv0TOtbtAk/w=;
        b=Pdlly7uKrzh3PmD8TWWeSMOwalaVXhPa/ogFmW4vKjLTmuvzGuYrMiXx7/U4UqGQLi
         2Z4uVoXrBU3dXVfXAC7qZOOtHbdHzi2uTz0kCJZvCUlK/2diu0e3KcLRy+t5r1ykuqdM
         fGeJRLO5ybc9H3nS9vVDzY6hN6qNkQXu2XfhDgltmhLE5nvsDRq22XJ3PoZqBMhoJpYy
         BEj1PAVXFu/XybO8uy/gzNLiGNjBua3xxY+oKkT2Yxiv9pve0axFDO0UiE1vZN7YNCmU
         7Ney5yOsU0+1SWASNvMToS0QZb5VhNsl67PK7JWjKe43PgCNwTmzNFaNHuf0otH83q8H
         GMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775277536; x=1775882336;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbuPCNQYcJW+qZcFX5gTzWFidS8EC1Zyv0TOtbtAk/w=;
        b=JAu3F/5f+AvuwvsZGu6PjNTmjQ0FU7F5mpjDyqcbE9mDA9FqP2QNFUSYIjFj1iOGZr
         QEwQIVEreHNr+peL5+8B21wCA+hqyVWky24gQwnzqkdaLWzE2+RlScNxnFWp3s1x4RFo
         XSro+2hScPD9yQUF5SIX/eoLfHvR+p3o7o5XqaS5VyPQCUva4RGp8SOro/RiEunWxKFo
         l3dHtofeYzY2mt2NUbEe54Lh0iULryw6CAR6uRH9BB4JT+b5R1YhaWUa8HfNc6ggnWJh
         Qfxn5RnsofmqW2XjDmNCUP4xPk5/WSMV3OQIqkWLNcXwzjAG93fXjB5Y5Ka8gp2Hp1nL
         HNxA==
X-Forwarded-Encrypted: i=1; AJvYcCX4vy76/plaavKHaw79FpnYmw3JOYDKzMg3ZbE8a6Cz6wghV3Cl9Jh2PG9O+Z0FDTYsndAMixeWinDOCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJEnjSPjOnouXq+f928qy02qZmCEDzhKdZ8GL4UHx4NRDgP3Fz
	yMQi6RBwoKnwiBSSZhkGe57CpdByYQ7jrEJHonzcPswaG1r9klJmyvZu
X-Gm-Gg: AeBDieurbeemvPI5yfDSdmLMb1wdgd5d8Qej5WC4IVa5IFMscdDLoqq5Jrcxm5esCyv
	NbVp582EwuVRi/lJ+d7opg2Namb6CgoBxPX5Eh+KKG7JDbL2RoPXZLB/sHeldfIljk/TsG+v/Rg
	LRMDGIAy9oVgnHgCEsk5BXztyXiJ/rt2U29HIEB6XMNujaEx9Aw0FgocRw16Xn/y6IEOBduJ0lt
	aC+SnayYT8gixDyN6zjwnAZWSD4u6DrKLi3ZeHaDByowUxiWHSYQiarn/QBEJz/vRStelGtvGiw
	3ccoIz8DlGpVNIkX9tVj1m2qJGZIBN/9wTANB1NY8TNmMVESlK9bz23EnzNH28Cit7e2Tyy2BAW
	dh91zs8bsTUaC0QkYpLuPKcHUgihJ1HMZ3RkK2pOVtuh3Z49yOCEpsfczs/2iXZ8RCKcp1Mv1C9
	K/iCH3XpaulrqEYe+rJy/nB5U+IuKyl1kpkYkSG3u7t8OVgoyfFhErwhd9n7s9coNhHavvGwQ2
X-Received: by 2002:a05:7300:3b06:b0:2c1:55fd:50bb with SMTP id 5a478bee46e88-2cbfbf78828mr3188269eec.20.1775277536410;
        Fri, 03 Apr 2026 21:38:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cc6e17e0bdsm3230364eec.31.2026.04.03.21.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 21:38:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <05e9870a-5d8c-410d-99ed-6ef9470b2ff7@roeck-us.net>
Date: Fri, 3 Apr 2026 21:38:54 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX B650E-E GAMING
 WIFI
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Veronika Kossmann <nanodesuu@gmail.com>,
 Veronika Kossmann <desu.git@rxtx.cx>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260403210343.1380437-1-eugene.shalygin@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260403210343.1380437-1-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/3/26 14:03, Eugene Shalygin wrote:
> From: Veronika Kossmann <nanodesuu@gmail.com>
> 
> Add support for ROG STRIX B650E-E GAMING WIFI
> 
> Signed-off-by: Veronika Kossmann <desu.git@rxtx.cx>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has a problem with this patch:

https://sashiko.dev/#/patchset/20260403210343.1380437-1-eugene.shalygin%40gmail.com

I never paid attention, but seems to me that it has a point.
Assuming the concern is valid, that makes me wonder: Do other boards
have similar problems ?

Thanks,
Guenter

> ---
>   Documentation/hwmon/asus_ec_sensors.rst |  1 +
>   drivers/hwmon/asus-ec-sensors.c         | 11 ++++++++++-
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
> index 9ad3f0a57f55..e14419811aac 100644
> --- a/Documentation/hwmon/asus_ec_sensors.rst
> +++ b/Documentation/hwmon/asus_ec_sensors.rst
> @@ -31,6 +31,7 @@ Supported boards:
>    * ROG MAXIMUS Z690 FORMULA
>    * ROG STRIX B550-E GAMING
>    * ROG STRIX B550-I GAMING
> + * ROG STRIX B650E-E GAMING WIFI
>    * ROG STRIX B650E-I GAMING WIFI
>    * ROG STRIX B850-I GAMING WIFI
>    * ROG STRIX X470-F GAMING
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index 070bb368f2b7..8c53cd9ed8f3 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -274,7 +274,7 @@ static const struct ec_sensor_info sensors_family_amd_600[] = {
>   	[ec_sensor_temp_cpu_package] =
>   		EC_SENSOR("CPU Package", hwmon_temp, 1, 0x00, 0x31),
>   	[ec_sensor_temp_mb] =
> -	EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x32),
> +		EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x32),
>   	[ec_sensor_temp_vrm] =
>   		EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
>   	[ec_sensor_temp_t_sensor] =
> @@ -616,6 +616,13 @@ static const struct ec_board_info board_info_strix_b550_i_gaming = {
>   	.family = family_amd_500_series,
>   };
>   
> +static const struct ec_board_info board_info_strix_b650e_e_gaming = {
> +	.sensors = SENSOR_TEMP_VRM | SENSOR_SET_TEMP_CHIPSET_CPU_MB |
> +		SENSOR_IN_CPU_CORE,
> +	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
> +	.family = family_amd_600_series,
> +};
> +
>   static const struct ec_board_info board_info_strix_b650e_i_gaming = {
>   	.sensors = SENSOR_TEMP_VRM | SENSOR_TEMP_T_SENSOR |
>   		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_IN_CPU_CORE,
> @@ -861,6 +868,8 @@ static const struct dmi_system_id dmi_table[] = {
>   					&board_info_strix_b550_e_gaming),
>   	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-I GAMING",
>   					&board_info_strix_b550_i_gaming),
> +	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B650E-E GAMING WIFI",
> +					&board_info_strix_b650e_e_gaming),
>   	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B650E-I GAMING WIFI",
>   					&board_info_strix_b650e_i_gaming),
>   	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B850-I GAMING WIFI",

