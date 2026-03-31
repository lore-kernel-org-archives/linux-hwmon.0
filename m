Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A41A1925BC
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 02:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774925896; cv=none; b=gEXS/3evntAWRYtHtQDh+5WSIPI6xabhLgQaaz8BY7MP+CfuWFUyk8NhHe2xfPjtQbcsgLvLHHc3tajeU8kK7kYvABWiudIIoZD/94vURXmWxKIttAEsevBXgGRMPQtkyIqYtLyRDXsg4IXa911V01VGkzVfuGcbowx1R+98iOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774925896; c=relaxed/simple;
	bh=eEHwwcvthorVw7lWP3wZ7LFgQX5BEVzFmZNpYOfsWW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UdSA5EQ+9rjC/EXcR8T2XOGpH/yYW9kLfOA2necpDg1KEkb5I6IR4pMEZaZnc46MaF+v+3RfAAmHXYrClKfk6mpT5qj6vBUOOH/fIrYlMWYqvBCRNTOqLs4rhSdWVzA7ZMANlLSkT27bpqquJaogzaSpy6eBal5m4UzepbuuFow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r1gNpGIz; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r1gNpGIz"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12776bebe9fso2261709c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 19:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774925894; x=1775530694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sWd7NZrw1WUS5I3AVKkDtn/IiHt1UzrgvGunZvmRCqI=;
        b=r1gNpGIzOn31PEKnFw2DP6QP7DFuFNjP8kJBkK0AJ/B6+0iy0zm0ttJAv2e14vcbk6
         jvia6tZZF6LreyNnx7PB9eCReX/BX2BGVpfcy/xRrXJoyNJL3t60/wWuDUx/V0jw72Y0
         5mIqC/BP3a6Xneqim6NHlhSDn0W0FIsC0UewXAdkw83D+B7FzSBTMBvlSBQy8eFJzpgX
         nptFdeLTERj8B1cJ3ATU7qLMRwFxSYZZpfIzFZd6LHApv8+zBJUCbww9pGegVxs5mk0i
         5DEmz1Ha/lezE41lsI/Wnb2pMPcmqizJLJsY6eTypVnr9e5y2WN3iIR+Ifb823HcdAKO
         uJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774925894; x=1775530694;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sWd7NZrw1WUS5I3AVKkDtn/IiHt1UzrgvGunZvmRCqI=;
        b=NHiuLS1etj3z4lqXTVROyEL1+838+/E0WuowYJjOtyyJMpAgZx1wJKyUumj9kXgZRX
         mOxmc0nUW8ZwsDz1XL2w8SbGs17WtLVvppkBF7yUeNNwiQgRbQBVhP2Cz64e55Di5eRP
         /ADoHodwkRLxziMgRWD28SQoDR3lb2Y5KfblB8wno3WS+NvvCdR6woWUZT/2nHcWvg7X
         HtHDadf3X5A2a/RlbULcMZCam7jwqinNs/f7gL4WGkaa4Xt2waxJ5alDsRPFELf/L0EJ
         0vptuIMyH739k66W/2+kUJN/PcykH/8GFlfxeHSymHBp7FyK0yO5DI3cXy7hdDxuqSEi
         5sjw==
X-Forwarded-Encrypted: i=1; AJvYcCUq+A2cu/++teuqqVtFSlthk04plGR0INAxx9VfqtlUgcgQLPsDayq5cOMo4LAghy2O8f1l6CX8bqGzSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoNK/tsH3Fhnsk9a7tQ0uOwfsR2H+YvFyITh5olPVm3YIuONGD
	g60kYaIB0gODNwyWKxVP7Q8Inpyh0cjpeUFWVh2dwnt2oOy0D3TNijmR
X-Gm-Gg: ATEYQzwuMMdnx5QOGs8ZZxWlP/znH0nwqYCrQ1IXaIv8JY84vfG3Rl09UwV20CSiHNn
	qC5TQtFjba9X7DqUSAJckXctSZ9yzdKA6Rfn1OARTZ1kauYEc9P5Euk6fl3JxESvFanckS5P8HD
	Ncvtus4ZqKZsxacz+7Q6q4CT1gzv4FVdRlovwhOZxTc43bAsmLvC02Owdoi5PIriTNzgIEpZdMT
	lmU166fEfu9mro3vFFSSQDdNFK72zRZgxQnXnBbfd2o9XNHKs05OrLiUC0fczr/EHdwLSvHYDIG
	0zoVqPQcqJR5H4Bi/wLr49TKyla9Ywi/01m93pfXOYftJigZyVCvQq4DFiXW4oa9dVqn6TG1hL7
	U4FbVqvJdLWSVzdd1ut3OaPenjifznTFep0TY0naNbJZnzcRqw5gL8zxPkTifn3CQ87JeiPvgUl
	FKcQEt/d8UZCC+lMB5HjM+7vQQ7aTcVk9gvxlskfczfX2/L930LeT0agEJFJMUOrQRfoVn9h8t
X-Received: by 2002:a05:7022:3842:b0:11b:f056:a19b with SMTP id a92af1059eb24-12ab2884e88mr9945538c88.18.1774925893942;
        Mon, 30 Mar 2026 19:58:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm13661658c88.10.2026.03.30.19.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 19:58:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a3d5942a-cf3d-42c7-9ae8-494fc34cac23@roeck-us.net>
Date: Mon, 30 Mar 2026 19:58:11 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] hwmon: (asus-ec-sensors) fix T_Sensor for PRIME
 X670E-PRO WIFI
To: Corey Hickey <bugfood-ml@fatooh.org>,
 Eugene Shalygin <eugene.shalygin@gmail.com>, linux-hwmon@vger.kernel.org
References: <20260330230836.314311-1-bugfood-ml@fatooh.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260330230836.314311-1-bugfood-ml@fatooh.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/30/26 16:08, Corey Hickey wrote:
> From: Corey Hickey <bugfood-c@fatooh.org>
> 
> I have attached a temperature sensor (10k thermistor) to my motherboard,
> and the temperature monitoring in the BIOS reports a value for the
> sensor, but the Linux driver reports a constant zero value.
> 
>      $ sensors asusec-isa-000a | grep T_Sensor
>      T_Sensor:      +0.0°C
> 
> By experimentation, I have found that the address in the driver is off
> by one. Some basic checks seem to confirm correct sensor operation at
> address 0x37:
> * sensor disconnected: -62.0°C
> * sensor plugged in, ambient temperature: +22.0°C
> * sensor plugged in, held between my fingers: +30.0°C
> The latter two values match those measured independently via my DMM's
> thermocouple probe (with a precision of 1°C).
> 
> The existing address was added in commit f7ac3020036b ("hwmon:
> (asus-ec-sensors) add ROG Crosshair X670E Gene."). The commit message
> specifically mentions T_Sensor validation; assuming that commit was
> indeed correct, then 600-series motherboards are inconsistent in what
> address they use.
> 
> To fix the "PRIME X670E-PRO WIFI" (0x37) without breaking the "ROG
> Crosshair X670E Gene" (0x36), define an alternate T_SENSOR. The "PRIME
> X670E-PRO WIFI" only has one T_SENSOR documented, so replace the
> original T_SENSOR in the driver rather than specifying an additional
> one.
> * If there are any other boards using 0x37, those can be changed to use
>    SENSOR_TEMP_T_SENSOR_ALT1 instead.
> * If there are any other boards using an entirely different address, an
>    additional alternate T_SENSOR can be defined without altering the
>    naming scheme.
> 

Is it off by one, or do Asus boards possibly support [up to] two such
sensors ?

> For reference, the sensor used is "XSPC Wire Sensor 10k", purchased from
> Amazon.
> 
> Link: https://www.amazon.com/dp/B0CR8Q24TK
> Link: https://rog.asus.com/motherboards/rog-crosshair/rog-crosshair-x670e-hero-model/helpdesk_manual/
> Signed-off-by: Corey Hickey <bugfood-c@fatooh.org>
> ---
>   drivers/hwmon/asus-ec-sensors.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index 86f444498650..9548f6794c9e 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -111,6 +111,8 @@ enum ec_sensors {
>   	ec_sensor_temp_mb,
>   	/* "T_Sensor" temperature sensor reading [℃] */
>   	ec_sensor_temp_t_sensor,
> +	/* like ec_sensor_temp_t_sensor, but at an alternate address [℃] */
> +	ec_sensor_temp_t_sensor_alt1,
>   	/* VRM temperature [℃] */
>   	ec_sensor_temp_vrm,
>   	/* VRM east (right) temperature [℃] */
> @@ -160,6 +162,7 @@ enum ec_sensors {
>   #define SENSOR_TEMP_CPU_PACKAGE BIT(ec_sensor_temp_cpu_package)
>   #define SENSOR_TEMP_MB BIT(ec_sensor_temp_mb)
>   #define SENSOR_TEMP_T_SENSOR BIT(ec_sensor_temp_t_sensor)
> +#define SENSOR_TEMP_T_SENSOR_ALT1 BIT(ec_sensor_temp_t_sensor_alt1)
>   #define SENSOR_TEMP_VRM BIT(ec_sensor_temp_vrm)
>   #define SENSOR_TEMP_VRME BIT(ec_sensor_temp_vrme)
>   #define SENSOR_TEMP_VRMW BIT(ec_sensor_temp_vrmw)
> @@ -277,8 +280,13 @@ static const struct ec_sensor_info sensors_family_amd_600[] = {
>   	EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x32),
>   	[ec_sensor_temp_vrm] =
>   		EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
> +	/* The address of T_Sensor can vary; only one of the following T_Sensor
> +	 * addresses will be used, depending on motherboard model.
> +	 */

/*
  * This is not the networking subsystem. Standard multi-line comments are expected.
  */

>   	[ec_sensor_temp_t_sensor] =
>   		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x36),
> +	[ec_sensor_temp_t_sensor_alt1] =
> +		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x37),
>   	[ec_sensor_fan_cpu_opt] =
>   		EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
>   	[ec_sensor_temp_water_in] =
> @@ -519,7 +527,7 @@ static const struct ec_board_info board_info_prime_x570_pro = {
>   static const struct ec_board_info board_info_prime_x670e_pro_wifi = {
>   	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
>   		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
> -		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CPU_OPT,
> +		SENSOR_TEMP_T_SENSOR_ALT1 | SENSOR_FAN_CPU_OPT,
>   	.mutex_path = ACPI_GLOBAL_LOCK_PSEUDO_PATH,
>   	.family = family_amd_600_series,
>   };

