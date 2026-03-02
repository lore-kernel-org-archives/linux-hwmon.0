Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7664241B360
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 15:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772466633; cv=none; b=GWTk+qVl6kq0FIx3HJw7ZuF/cT5A96flbtdrjCwPLV93BotXTEDT0d7wIEkh0kweJ4xpxff6IAiF+notVlKgPGTgh3QfgSRA3JJUMWvclcvjUP2CAUcL86KJBsOjwclc7xJ2vRRGe28i6vEjKeMSE0Y3peukIGcdKjc3jx3jerY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772466633; c=relaxed/simple;
	bh=uCG8pjP96YJTLtlofVk2+auOcmQXfe3b+alXdEH63yA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nb8wQWeVvN/kNwtgb9yNOsE0XxrrhSVYgYyGTf0BNZCmPBFbnuDmcc0mI35ryYUP4/9oZ2zsGHOAMqn13uStTJp9PP4M6BnElgNa5klHLVwbUn1m5xjaiRcudE9z9njeJ5NkCedkdJGbRLdulgMkKiRHoYPN7C7GwMS9xhEujGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjUf/hiJ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjUf/hiJ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8273e0fb87aso2520118b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 07:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772466629; x=1773071429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=f/GVqaTIW+tkoQj13WydYODy/zBoLZehy3xZGlTZhO0=;
        b=fjUf/hiJz7wda2TRvtZn3tdLDtbF7siUN2N/YbimCqmYT6YcDsZYyrIUCbORb2xybc
         sqme2FdNmXmSoDrD0CLzoq8/qj8vjm65Eo/DnQ009YXTBIxLGDfe7DbPHUlUILE6/Ey5
         RoMNbnOun4mcKNSJhMvzyjpUKvpuh2hx0YJNgtTD3rcg1GfBPpo/hXdccOWXAEtNAOES
         aweaWW9065wlHu4yfF0t+3Tugxgl3AwIxDnhvlZrR9cBfE2KL0O2MkIoAx9cBzzlYgdo
         vIszNJwzrdp4jhomkdZ/U49L8nQlXgKVrPnBrXxVCYQtKF10NR9c0Akv8JnKih875Ygd
         EShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772466629; x=1773071429;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/GVqaTIW+tkoQj13WydYODy/zBoLZehy3xZGlTZhO0=;
        b=H91d+WfgmIbfEQ3Rc2Yc5fO0HJaWcwdCapTyI6HcPSKrfKeIKms7+JwrwZSg9gmMas
         GeBEV/64EFhIteW7kOK9jGAu3wDcwilEs0UFMUaS3ZCjKraK2H6TWy22n/bbJ0OiOae1
         PxDW8DZU9vytAD/kplWQLe4tCo/qTGJbR3N2YxKi2fN5ah58z6bd6PDpy2C6GvEigQSG
         R0x09hnVJXlCtkZn1KZf+zvEVeOtoWLXDpmIBNeEXFwadgShmD8X0EfKAPBjzcVmdux8
         w45+WwMEJUUf1gOkqPyo7nF5GLmAnggFlklkWQWMhbSlS01COIRhvvk0mx3yLeExeI0i
         qtXA==
X-Gm-Message-State: AOJu0YyTmEVLagNeQJNtx9EmPdDH9wuAk2SAPyxHwnIQLpaAlANHWTgG
	2r8DUDrqiXHvReJXwLkIHc8IsDtTXZVplLBFi/p7KTCjK37VWr9bLBJN
X-Gm-Gg: ATEYQzzcU2Pxl2hcdfcvcvuVvf8TC4sAQSz8h5r7V76kJSxf0dRiqZeQCPxAWQhraI1
	aBnqmlwxVoPl6/AA97APdAy5z69SOEYz5qUhB9/RpmR0wnSaHzm8sxTb/9Myyi8v/xUAHFOZqWS
	Y26Un2uZ3pJofd/NaFST/x5aTb3q49e/bZWtaAoCWyQhz1MRwQofkB9dMx6XjTI6PCSIl8TpF48
	qfKt4QACirLferQ74YNSCTo77tNE7TEj2Z2YX4l/1oLQPjAS8SWPzpGDG2IJt0qmU2t4g7ce9tN
	CKaU6r6JVHKqfWu5wC0n1RJfpYdwCBvouBlR2UOTlQ3XcFDI7VCniQroRUpUAJMJodCqRxh2/6S
	YiBtLKcB8ZXZoNXtYgtQGbwep7+dSgR9H8tJcggvGGbwtq9oWGz0rMoVNW4mRu223O5N2zE5N4S
	dEDo5WHtPzvocmsqKqR2m0Ns6dfbItLDztA09dlr/Kfq21a5XekwXD/cqGMqqRWkixNoKcoseNu
	5GOaPtpo/Y=
X-Received: by 2002:a05:6a00:3d12:b0:823:1406:8797 with SMTP id d2e1a72fcca58-8274da12bbbmr11390398b3a.31.1772466628593;
        Mon, 02 Mar 2026 07:50:28 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4d826sm13646384b3a.10.2026.03.02.07.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 07:50:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <58c0e46e-fa58-40ba-91f0-235a4cef034c@roeck-us.net>
Date: Mon, 2 Mar 2026 07:50:24 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] (ina2xx) Drop bus_voltage_shift configuration
To: Jonas Rebmann <jre@pengutronix.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ian Ray <ian.ray@gehealthcare.com>
References: <20260302-ina2xx-shift-v1-1-4ff5b7b76d51@pengutronix.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260302-ina2xx-shift-v1-1-4ff5b7b76d51@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 3/2/26 07:26, Jonas Rebmann wrote:
> The INA219 has the lowest three bits of the bus voltage register
> zero-reserved and the bus_voltage_shift ina2xx_config field was
> introduced to accommodate for that.
> 
> The INA234 has four bits of the bus voltage, of the shunt voltage, and
> of the current registers zero-reserved but the latter two were
> implemented by choosing a 16x higher conversion constant instead of a
> separate field specifying a bit shift.
> 
> For consistency and simplicity, drop bus_voltage_shift and adapt the
> conversion constants for INA219 and INA234 accordingly, yielding the
> same measurement values.
> 

This isn't about simplicity, it is about correctness.

The datasheet for INA234 says for the lower 4 bits:

     Always returns 0. Remove these bits from the full result by doing a
     right arithmetic shift

which is what we should do for all chips with reserved bits instead of
assuming that the reserved bits always return 0.

Thanks,
Guenter

> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> ---
>   drivers/hwmon/ina2xx.c | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 836e15a5a780..d7c894d7353c 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -151,7 +151,6 @@ struct ina2xx_config {
>   	bool has_update_interval;
>   	int calibration_value;
>   	int shunt_div;
> -	int bus_voltage_shift;
>   	int bus_voltage_lsb;	/* uV */
>   	int power_lsb_factor;
>   };
> @@ -172,8 +171,7 @@ static const struct ina2xx_config ina2xx_config[] = {
>   		.config_default = INA219_CONFIG_DEFAULT,
>   		.calibration_value = 4096,
>   		.shunt_div = 100,
> -		.bus_voltage_shift = 3,
> -		.bus_voltage_lsb = 4000,
> +		.bus_voltage_lsb = 500,
>   		.power_lsb_factor = 20,
>   		.has_alerts = false,
>   		.has_ishunt = false,
> @@ -184,7 +182,6 @@ static const struct ina2xx_config ina2xx_config[] = {
>   		.config_default = INA226_CONFIG_DEFAULT,
>   		.calibration_value = 2048,
>   		.shunt_div = 400,
> -		.bus_voltage_shift = 0,
>   		.bus_voltage_lsb = 1250,
>   		.power_lsb_factor = 25,
>   		.has_alerts = true,
> @@ -196,8 +193,7 @@ static const struct ina2xx_config ina2xx_config[] = {
>   		.config_default = INA226_CONFIG_DEFAULT,
>   		.calibration_value = 2048,
>   		.shunt_div = 400, /* 2.5 µV/LSB raw ADC reading from INA2XX_SHUNT_VOLTAGE */
> -		.bus_voltage_shift = 4,
> -		.bus_voltage_lsb = 25600,
> +		.bus_voltage_lsb = 1600,
>   		.power_lsb_factor = 32,
>   		.has_alerts = true,
>   		.has_ishunt = false,
> @@ -207,7 +203,6 @@ static const struct ina2xx_config ina2xx_config[] = {
>   	[ina260] = {
>   		.config_default = INA260_CONFIG_DEFAULT,
>   		.shunt_div = 400,
> -		.bus_voltage_shift = 0,
>   		.bus_voltage_lsb = 1250,
>   		.power_lsb_factor = 8,
>   		.has_alerts = true,
> @@ -219,7 +214,6 @@ static const struct ina2xx_config ina2xx_config[] = {
>   		.config_default = SY24655_CONFIG_DEFAULT,
>   		.calibration_value = 4096,
>   		.shunt_div = 400,
> -		.bus_voltage_shift = 0,
>   		.bus_voltage_lsb = 1250,
>   		.power_lsb_factor = 25,
>   		.has_alerts = true,
> @@ -281,8 +275,7 @@ static int ina2xx_get_value(struct ina2xx_data *data, u8 reg,
>   		val = DIV_ROUND_CLOSEST((s16)regval, data->config->shunt_div);
>   		break;
>   	case INA2XX_BUS_VOLTAGE:
> -		val = (regval >> data->config->bus_voltage_shift) *
> -		  data->config->bus_voltage_lsb;
> +		val = regval * data->config->bus_voltage_lsb;
>   		val = DIV_ROUND_CLOSEST(val, 1000);
>   		break;
>   	case INA2XX_POWER:
> @@ -387,7 +380,7 @@ static u16 ina226_alert_to_reg(struct ina2xx_data *data, int reg, long val)
>   		return clamp_val(val, 0, SHRT_MAX);
>   	case INA2XX_BUS_VOLTAGE:
>   		val = clamp_val(val, 0, 200000);
> -		val = (val * 1000) << data->config->bus_voltage_shift;
> +		val = val * 1000;
>   		val = DIV_ROUND_CLOSEST(val, data->config->bus_voltage_lsb);
>   		return clamp_val(val, 0, USHRT_MAX);
>   	case INA2XX_POWER:
> 
> ---
> base-commit: f08c5de5f61a117ba5326d3d5b86e884077da2d0
> change-id: 20260302-ina2xx-shift-89ed2c5d2e72
> 
> Best regards,
> --
> Jonas Rebmann <jre@pengutronix.de>
> 

