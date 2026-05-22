Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0284028C1
	for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 13:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457938; cv=none; b=H0r9AMJO43/92jThco7es9a7C17ayWzefEwBu6tRohQtF5gh+eZwh0MQ7Efm/gwBwafCOi/i0XIsZBRrwyZz64gNMZXGr586VoKDU/XW43rzh4uoumq51yR6/C3s0SQ2KDFwrxtlT+2PwElxEjZinYXXNfNAsYy1zgxsfRuHo8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457938; c=relaxed/simple;
	bh=LlOSXzpRw5LjZUuQQCyhstzgAVn5SYkMOH9gfnRlrFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MAMVXFE2i7nxQ1fzKtqi7hZuJf5OtY8bNoeY0aeXiCLxnS0loWJCrGXDZo4eN3mZvVf1cukd34v46YrEVT2H1h80UXsEQlQFIhwqqiKdl6LIP1HahviLl33+euZ0cY0NclBIYuMTtr7lOJJynblcU5QS/BW6DcuxiixiK91qMMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qa3yeKpf; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qa3yeKpf"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2be75f658f3so27026445ad.1
        for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 06:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779457929; x=1780062729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CVpkqOJVvDpaoca9T9CocZEA86fUVHM3dkwOq/q6Leg=;
        b=qa3yeKpfYqMe/jklZ+FRiOxP7QK6TM4D4MeqFTR64NTKhW/FfEQMaYgfg19VetxSIR
         x63lEbwYurdmf7cS7Dx/E5QOH2EPGSz7wF/hx23dPkpX9UTMijyxYzNgm0qjvNUo1P9m
         DrF27UsZ9YKIBnd1eNFbBPcJRIyvQQEMvptSLVitHyEgE2fZJcrf7Y+MLJLpNmSW2Unp
         InAyBVAy9Q9x03jSFrr9lSCjRhCGfkU8ju5kQO7wNI6st1YBWKBJ0q48hPpxX6x3WQVB
         RMdaaoLc87ZDoLYlW1r0FWB1CwK/a5OGprRHQQodWz1mKZKTvmJ1FKfCDkOlmAri9y1p
         ZCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457929; x=1780062729;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CVpkqOJVvDpaoca9T9CocZEA86fUVHM3dkwOq/q6Leg=;
        b=GhvaXbODWVipT8aCulj4Ld2oidJkmSrO224L04xr4/wKFARN8X5dvHLw7Tqm1chGMQ
         d1Jh9dxSSjbM+tZMGzoZjf9U3bxnSAWsHD8PrT7z+llZr3BLhCaq8/K9fo9Bj44qxS1+
         29Tq3Jl8hk1zszy4a0JZqp8iYwO1lywOiSevdXYLnGowbE11l53uFDqXLUyenKtjk71q
         Nlofz8DeFINLlPBX7grp5U98aN5Equz3JYGr7zY0yTM92Nqh3mHRf4A2n8E7ziYwNEDF
         sTbv6WYohCYa2N/e5Jk4M1fdeD/TGhQPFDQqVzJ3k6wTa/eHIHyylXIYsaEn5mN6IO+o
         h+VQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jo2vTiyPNvXO8rWCNHguXhJ4OQl03MwdcDA7nQkeG+MMsJrJR2eXhdv/SmA1TKZL/TaPVtp32jSg8xw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2AYRTXbFZxppU8wj6vx8jnaYQ7yDxyFDW+6SPoNCH/U2iPiqX
	2GCHdrIb+ThK3DnfkqEcZBaeNouF42Dtnt5gn87yrzbuKEnx0T4mycPMhfEWemog
X-Gm-Gg: Acq92OHpj6gWM2NjxWR2/X4iz+ke9GJWJrMyFKYOdB3x59VRRYWFzfIRKYcARJdGiJK
	0q9wdj0Zr0NhhSGgf7qoQ7crX2ns7YROEiJvYBfrqr3Q/lCiBe8xM96OXssdLv/IJzCuEL0IWAD
	lyi31ay7BJlzCy2zgb7f6DIBXc1YtIQOSyQqwJD92V58UJUfWclurXJ7jLXv/8lf6o9YGtUtAhK
	hoM6af32mknderLzk8zqHYy1zBqN44EL4HpBtWx/kd/WEzLKTuX+WVBrihTR+E3MyVKeqxbLjMl
	siHgFnEx0yoOAy4ZTZDzp+NbzgHu/47BMSK7ydIvm0siuZRIA62Uxe6mXtNEKT+ufgAelXXKBfg
	p/Xoxr/EXHDdKS7yTNYm2GcP3YWg7VJKjEeVwVmgrht1E5fWQXRyunhq1N/qOZufRph0BqHkF9o
	Ir8mqJB20H8j1vBt0BDpqkE1id7bz6dlR4q9jic96bIxYQBvWQRVBqMe2XZQCLlX9XHqprNxwu
X-Received: by 2002:a17:903:1a84:b0:2be:3850:297e with SMTP id d9443c01a7336-2beb07726a8mr36997915ad.31.1779457929277;
        Fri, 22 May 2026 06:52:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591a277sm18909745ad.80.2026.05.22.06.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:52:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <720aafa0-01bd-4a74-871f-cfa8fb4c4f88@roeck-us.net>
Date: Fri, 22 May 2026 06:52:07 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: (gpd-fan): remove global variable
 gpd_driver_priv
To: Pei Xiao <xiaopei01@kylinos.cn>, cryolitia@uniontech.com,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1775378028.git.xiaopei01@kylinos.cn>
 <8b19b6bd73d0f9659d41cbeec6fcdfd4ddf59035.1775378028.git.xiaopei01@kylinos.cn>
 <91a16188-c95b-4d6a-b5fc-dd959aa3fc30@kylinos.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <91a16188-c95b-4d6a-b5fc-dd959aa3fc30@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/21/26 22:50, Pei Xiao wrote:
> 
> After all, using the global variable |gpd_driver_priv|
> does not comply with driver development specifications.
> 

I had marked this patch "changes requested", though I don't recall
the reason. Comment inline. Please fix and resubmit, together with
the next patch of the series but excluding the third patch.

Thanks,
Guenter

>   Friendly ping.
> 
> Pei.
> Thanks!
> 在 2026/4/5 16:40, Pei Xiao 写道:
>> Replace the global state gpd_driver_priv with per-device private data
>> (struct gpd_fan_data) allocated in probe. This allows the driver to
>> support multiple instances in the future and aligns with kernel best
>> practices.
>>
>> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
>> ---
>>   drivers/hwmon/gpd-fan.c | 211 ++++++++++++++++++++++------------------
>>   1 file changed, 116 insertions(+), 95 deletions(-)
>>
>> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
>> index 80de5f20781e..5a9d07cd29ab 100644
>> --- a/drivers/hwmon/gpd-fan.c
>> +++ b/drivers/hwmon/gpd-fan.c
>> @@ -40,12 +40,11 @@ enum FAN_PWM_ENABLE {
>>   	AUTOMATIC	= 2,
>>   };
>>   
>> -static struct {
>> +struct gpd_fan_data {
>>   	enum FAN_PWM_ENABLE pwm_enable;
>>   	u8 pwm_value;
>> -
>>   	const struct gpd_fan_drvdata *drvdata;
>> -} gpd_driver_priv;
>> +};
>>   
>>   struct gpd_fan_drvdata {
>>   	const char *board_name; // Board name for module param comparison
>> @@ -249,10 +248,10 @@ static const struct gpd_fan_drvdata *gpd_module_drvdata[] = {
>>   };
>>   
>>   // Helper functions to handle EC read/write
>> -static void gpd_ecram_read(u16 offset, u8 *val)
>> +static void gpd_ecram_read(const struct gpd_fan_drvdata *drvdata, u16 offset, u8 *val)
>>   {
>> -	u16 addr_port = gpd_driver_priv.drvdata->addr_port;
>> -	u16 data_port = gpd_driver_priv.drvdata->data_port;
>> +	u16 addr_port = drvdata->addr_port;
>> +	u16 data_port = drvdata->data_port;
>>   
>>   	outb(0x2E, addr_port);
>>   	outb(0x11, data_port);
>> @@ -270,10 +269,10 @@ static void gpd_ecram_read(u16 offset, u8 *val)
>>   	*val = inb(data_port);
>>   }
>>   
>> -static void gpd_ecram_write(u16 offset, u8 value)
>> +static void gpd_ecram_write(const struct gpd_fan_drvdata *drvdata, u16 offset, u8 value)
>>   {
>> -	u16 addr_port = gpd_driver_priv.drvdata->addr_port;
>> -	u16 data_port = gpd_driver_priv.drvdata->data_port;
>> +	u16 addr_port = drvdata->addr_port;
>> +	u16 data_port = drvdata->data_port;
>>   
>>   	outb(0x2E, addr_port);
>>   	outb(0x11, data_port);
>> @@ -291,198 +290,198 @@ static void gpd_ecram_write(u16 offset, u8 value)
>>   	outb(value, data_port);
>>   }
>>   
>> -static int gpd_generic_read_rpm(void)
>> +static int gpd_generic_read_rpm(struct gpd_fan_data *data)
>>   {
>> -	const struct gpd_fan_drvdata *const drvdata = gpd_driver_priv.drvdata;
>> +	const struct gpd_fan_drvdata *drvdata = data->drvdata;
>>   	u8 high, low;
>>   
>> -	gpd_ecram_read(drvdata->rpm_read, &high);
>> -	gpd_ecram_read(drvdata->rpm_read + 1, &low);
>> +	gpd_ecram_read(drvdata, drvdata->rpm_read, &high);
>> +	gpd_ecram_read(drvdata, drvdata->rpm_read + 1, &low);
>>   
>>   	return (u16)high << 8 | low;
>>   }
>>   
>> -static int gpd_wm2_read_rpm(void)
>> +static int gpd_wm2_read_rpm(struct gpd_fan_data *data)
>>   {
>> +	const struct gpd_fan_drvdata *drvdata = data->drvdata;
>> +
>>   	for (u16 pwm_ctr_offset = GPD_PWM_CTR_OFFSET;
>>   	     pwm_ctr_offset <= GPD_PWM_CTR_OFFSET + 2; pwm_ctr_offset++) {
>>   		u8 PWMCTR;
>>   
>> -		gpd_ecram_read(pwm_ctr_offset, &PWMCTR);
>> +		gpd_ecram_read(drvdata, pwm_ctr_offset, &PWMCTR);
>>   
>>   		if (PWMCTR != 0xB8)
>> -			gpd_ecram_write(pwm_ctr_offset, 0xB8);
>> +			gpd_ecram_write(drvdata, pwm_ctr_offset, 0xB8);
>>   	}
>>   
>> -	return gpd_generic_read_rpm();
>> +	return gpd_generic_read_rpm(data);
>>   }
>>   
>>   // Read value for fan1_input
>> -static int gpd_read_rpm(void)
>> +static int gpd_read_rpm(struct gpd_fan_data *data)
>>   {
>> -	switch (gpd_driver_priv.drvdata->board) {
>> +	switch (data->drvdata->board) {
>>   	case win4_6800u:
>>   	case win_mini:
>>   	case duo:
>>   	case mpc2:
>> -		return gpd_generic_read_rpm();
>> +		return gpd_generic_read_rpm(data);
>>   	case win_max_2:
>> -		return gpd_wm2_read_rpm();
>> +		return gpd_wm2_read_rpm(data);
>>   	}
>>   
>>   	return 0;
>>   }
>>   
>> -static int gpd_wm2_read_pwm(void)
>> +static int gpd_wm2_read_pwm(struct gpd_fan_data *data)
>>   {
>> -	const struct gpd_fan_drvdata *const drvdata = gpd_driver_priv.drvdata;
>> +	const struct gpd_fan_drvdata *drvdata = data->drvdata;
>>   	u8 var;
>>   
>> -	gpd_ecram_read(drvdata->pwm_write, &var);
>> +	gpd_ecram_read(drvdata, drvdata->pwm_write, &var);
>>   
>>   	// Match gpd_generic_write_pwm(u8) below
>>   	return DIV_ROUND_CLOSEST((var - 1) * 255, (drvdata->pwm_max - 1));
>>   }
>>   
>>   // Read value for pwm1
>> -static int gpd_read_pwm(void)
>> +static int gpd_read_pwm(struct gpd_fan_data *data)
>>   {
>> -	switch (gpd_driver_priv.drvdata->board) {
>> +	switch (data->drvdata->board) {
>>   	case win_mini:
>>   	case duo:
>>   	case win4_6800u:
>>   	case mpc2:
>> -		switch (gpd_driver_priv.pwm_enable) {
>> +		switch (data->pwm_enable) {
>>   		case DISABLE:
>>   			return 255;
>>   		case MANUAL:
>> -			return gpd_driver_priv.pwm_value;
>> +			return data->pwm_value;
>>   		case AUTOMATIC:
>>   			return -EOPNOTSUPP;
>>   		}
>>   		break;
>>   	case win_max_2:
>> -		return gpd_wm2_read_pwm();
>> +		return gpd_wm2_read_pwm(data);
>>   	}
>>   	return 0;
>>   }
>>   
>>   // PWM value's range in EC is 1 - pwm_max, cast 0 - 255 to it.
>> -static inline u8 gpd_cast_pwm_range(u8 val)
>> +static inline u8 gpd_cast_pwm_range(const struct gpd_fan_drvdata *drvdata, u8 val)
>>   {
>> -	const struct gpd_fan_drvdata *const drvdata = gpd_driver_priv.drvdata;
>> -
>>   	return DIV_ROUND_CLOSEST(val * (drvdata->pwm_max - 1), 255) + 1;
>>   }
>>   
>> -static void gpd_generic_write_pwm(u8 val)
>> +static void gpd_generic_write_pwm(struct gpd_fan_data *data, u8 val)
>>   {
>> -	const struct gpd_fan_drvdata *const drvdata = gpd_driver_priv.drvdata;
>> +	const struct gpd_fan_drvdata *drvdata = data->drvdata;
>>   	u8 pwm_reg;
>>   
>> -	pwm_reg = gpd_cast_pwm_range(val);
>> -	gpd_ecram_write(drvdata->pwm_write, pwm_reg);
>> +	pwm_reg = gpd_cast_pwm_range(drvdata, val);
>> +	gpd_ecram_write(drvdata, drvdata->pwm_write, pwm_reg);
>>   }
>>   
>> -static void gpd_duo_write_pwm(u8 val)
>> +static void gpd_duo_write_pwm(struct gpd_fan_data *data, u8 val)
>>   {
>> -	const struct gpd_fan_drvdata *const drvdata = gpd_driver_priv.drvdata;
>> +	const struct gpd_fan_drvdata *drvdata = data->drvdata;
>>   	u8 pwm_reg;
>>   
>> -	pwm_reg = gpd_cast_pwm_range(val);
>> -	gpd_ecram_write(drvdata->pwm_write, pwm_reg);
>> -	gpd_ecram_write(drvdata->pwm_write + 1, pwm_reg);
>> +	pwm_reg = gpd_cast_pwm_range(drvdata, val);
>> +	gpd_ecram_write(drvdata, drvdata->pwm_write, pwm_reg);
>> +	gpd_ecram_write(drvdata, drvdata->pwm_write + 1, pwm_reg);
>>   }
>>   
>>   // Write value for pwm1
>> -static int gpd_write_pwm(u8 val)
>> +static int gpd_write_pwm(struct gpd_fan_data *data, u8 val)
>>   {
>> -	if (gpd_driver_priv.pwm_enable != MANUAL)
>> +	if (data->pwm_enable != MANUAL)
>>   		return -EPERM;
>>   
>> -	switch (gpd_driver_priv.drvdata->board) {
>> +	switch (data->drvdata->board) {
>>   	case duo:
>> -		gpd_duo_write_pwm(val);
>> +		gpd_duo_write_pwm(data, val);
>>   		break;
>>   	case win_mini:
>>   	case win4_6800u:
>>   	case win_max_2:
>>   	case mpc2:
>> -		gpd_generic_write_pwm(val);
>> +		gpd_generic_write_pwm(data, val);
>>   		break;
>>   	}
>>   
>>   	return 0;
>>   }
>>   
>> -static void gpd_win_mini_set_pwm_enable(enum FAN_PWM_ENABLE pwm_enable)
>> +static void gpd_win_mini_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABLE pwm_enable)
>>   {
>>   	switch (pwm_enable) {
>>   	case DISABLE:
>> -		gpd_generic_write_pwm(255);
>> +		gpd_generic_write_pwm(data, 255);
>>   		break;
>>   	case MANUAL:
>> -		gpd_generic_write_pwm(gpd_driver_priv.pwm_value);
>> +		gpd_generic_write_pwm(data, data->pwm_value);
>>   		break;
>>   	case AUTOMATIC:
>> -		gpd_ecram_write(gpd_driver_priv.drvdata->pwm_write, 0);
>> +		gpd_ecram_write(data->drvdata, data->drvdata->pwm_write, 0);
>>   		break;
>>   	}
>>   }
>>   
>> -static void gpd_duo_set_pwm_enable(enum FAN_PWM_ENABLE pwm_enable)
>> +static void gpd_duo_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABLE pwm_enable)
>>   {
>>   	switch (pwm_enable) {
>>   	case DISABLE:
>> -		gpd_duo_write_pwm(255);
>> +		gpd_duo_write_pwm(data, 255);
>>   		break;
>>   	case MANUAL:
>> -		gpd_duo_write_pwm(gpd_driver_priv.pwm_value);
>> +		gpd_duo_write_pwm(data, data->pwm_value);
>>   		break;
>>   	case AUTOMATIC:
>> -		gpd_ecram_write(gpd_driver_priv.drvdata->pwm_write, 0);
>> +		gpd_ecram_write(data->drvdata, data->drvdata->pwm_write, 0);
>>   		break;
>>   	}
>>   }
>>   
>> -static void gpd_wm2_set_pwm_enable(enum FAN_PWM_ENABLE enable)
>> +static void gpd_wm2_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABLE enable)
>>   {
>> -	const struct gpd_fan_drvdata *const drvdata = gpd_driver_priv.drvdata;
>> +	const struct gpd_fan_drvdata *drvdata = data->drvdata;
>>   
>>   	switch (enable) {
>>   	case DISABLE:
>> -		gpd_generic_write_pwm(255);
>> -		gpd_ecram_write(drvdata->manual_control_enable, 1);
>> +		gpd_generic_write_pwm(data, 255);
>> +		gpd_ecram_write(drvdata, drvdata->manual_control_enable, 1);
>>   		break;
>>   	case MANUAL:
>> -		gpd_generic_write_pwm(gpd_driver_priv.pwm_value);
>> -		gpd_ecram_write(drvdata->manual_control_enable, 1);
>> +		gpd_generic_write_pwm(data, data->pwm_value);
>> +		gpd_ecram_write(drvdata, drvdata->manual_control_enable, 1);
>>   		break;
>>   	case AUTOMATIC:
>> -		gpd_ecram_write(drvdata->manual_control_enable, 0);
>> +		gpd_ecram_write(drvdata, drvdata->manual_control_enable, 0);
>>   		break;
>>   	}
>>   }
>>   
>>   // Write value for pwm1_enable
>> -static void gpd_set_pwm_enable(enum FAN_PWM_ENABLE enable)
>> +static void gpd_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABLE enable)
>>   {
>>   	if (enable == MANUAL)
>>   		// Set pwm_value to max firstly when switching to manual mode, in
>>   		// consideration of device safety.
>> -		gpd_driver_priv.pwm_value = 255;
>> +		data->pwm_value = 255;
>>   
>> -	switch (gpd_driver_priv.drvdata->board) {
>> +	switch (data->drvdata->board) {
>>   	case win_mini:
>>   	case win4_6800u:
>>   	case mpc2:
>> -		gpd_win_mini_set_pwm_enable(enable);
>> +		gpd_win_mini_set_pwm_enable(data, enable);
>>   		break;
>>   	case duo:
>> -		gpd_duo_set_pwm_enable(enable);
>> +		gpd_duo_set_pwm_enable(data, enable);
>>   		break;
>>   	case win_max_2:
>> -		gpd_wm2_set_pwm_enable(enable);
>> +		gpd_wm2_set_pwm_enable(data, enable);
>>   		break;
>>   	}
>>   }
>> @@ -505,15 +504,16 @@ static umode_t gpd_fan_hwmon_is_visible(__always_unused const void *drvdata,
>>   	return 0;
>>   }
>>   
>> -static int gpd_fan_hwmon_read(__always_unused struct device *dev,
>> +static int gpd_fan_hwmon_read(struct device *dev,
>>   			      enum hwmon_sensor_types type, u32 attr,
>>   			      __always_unused int channel, long *val)
>>   {
>> +	struct gpd_fan_data *data = dev_get_drvdata(dev);
>>   	int ret;
>>   
>>   	if (type == hwmon_fan) {
>>   		if (attr == hwmon_fan_input) {
>> -			ret = gpd_read_rpm();
>> +			ret = gpd_read_rpm(data);
>>   
>>   			if (ret < 0)
>>   				return ret;
>> @@ -524,10 +524,10 @@ static int gpd_fan_hwmon_read(__always_unused struct device *dev,
>>   	} else if (type == hwmon_pwm) {
>>   		switch (attr) {
>>   		case hwmon_pwm_enable:
>> -			*val = gpd_driver_priv.pwm_enable;
>> +			*val = data->pwm_enable;
>>   			return 0;
>>   		case hwmon_pwm_input:
>> -			ret = gpd_read_pwm();
>> +			ret = gpd_read_pwm(data);
>>   
>>   			if (ret < 0)
>>   				return ret;
>> @@ -540,27 +540,29 @@ static int gpd_fan_hwmon_read(__always_unused struct device *dev,
>>   	return -EOPNOTSUPP;
>>   }
>>   
>> -static int gpd_fan_hwmon_write(__always_unused struct device *dev,
>> +static int gpd_fan_hwmon_write(struct device *dev,
>>   			       enum hwmon_sensor_types type, u32 attr,
>>   			       __always_unused int channel, long val)
>>   {
>> +	struct gpd_fan_data *data = dev_get_drvdata(dev);
>> +
>>   	if (type == hwmon_pwm) {
>>   		switch (attr) {
>>   		case hwmon_pwm_enable:
>>   			if (!in_range(val, 0, 3))
>>   				return -EINVAL;
>>   
>> -			gpd_driver_priv.pwm_enable = val;
>> +			data->pwm_enable = val;
>>   
>> -			gpd_set_pwm_enable(gpd_driver_priv.pwm_enable);
>> +			gpd_set_pwm_enable(data, data->pwm_enable);
>>   			return 0;
>>   		case hwmon_pwm_input:
>>   			if (!in_range(val, 0, 256))
>>   				return -EINVAL;
>>   
>> -			gpd_driver_priv.pwm_value = val;
>> +			data->pwm_value = val;
>>   
>> -			return gpd_write_pwm(val);
>> +			return gpd_write_pwm(data, val);
>>   		}
>>   	}
>>   
>> @@ -584,26 +586,27 @@ static struct hwmon_chip_info gpd_fan_chip_info = {
>>   	.info = gpd_fan_hwmon_channel_info
>>   };
>>   
>> -static void gpd_win4_init_ec(void)
>> +static void gpd_win4_init_ec(struct gpd_fan_data *data)
>>   {
>> +	const struct gpd_fan_drvdata *drvdata = data->drvdata;
>>   	u8 chip_id, chip_ver;
>>   
>> -	gpd_ecram_read(0x2000, &chip_id);
>> +	gpd_ecram_read(drvdata, 0x2000, &chip_id);
>>   
>>   	if (chip_id == 0x55) {
>> -		gpd_ecram_read(0x1060, &chip_ver);
>> -		gpd_ecram_write(0x1060, chip_ver | 0x80);
>> +		gpd_ecram_read(drvdata, 0x1060, &chip_ver);
>> +		gpd_ecram_write(drvdata, 0x1060, chip_ver | 0x80);
>>   	}
>>   }
>>   
>> -static void gpd_init_ec(void)
>> +static void gpd_init_ec(struct gpd_fan_data *data)
>>   {
>>   	// The buggy firmware won't initialize EC properly on boot.
>>   	// Before its initialization, reading RPM will always return 0,
>>   	// and writing PWM will have no effect.
>>   	// Initialize it manually on driver load.
>> -	if (gpd_driver_priv.drvdata->board == win4_6800u)
>> -		gpd_win4_init_ec();
>> +	if (data->drvdata->board == win4_6800u)
>> +		gpd_win4_init_ec(data);
>>   }
>>   
>>   static int gpd_fan_probe(struct platform_device *pdev)
>> @@ -611,7 +614,9 @@ static int gpd_fan_probe(struct platform_device *pdev)
>>   	struct device *dev = &pdev->dev;
>>   	const struct resource *region;
>>   	const struct resource *res;
>> -	const struct device *hwdev;
>> +	struct device *hwdev;
>> +	struct gpd_fan_data *data;
>> +	const struct gpd_fan_drvdata **match_ptr;
>>   
>>   	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
>>   	if (!res)
>> @@ -624,24 +629,42 @@ static int gpd_fan_probe(struct platform_device *pdev)
>>   		return dev_err_probe(dev, -EBUSY,
>>   				     "Failed to request region\n");
>>   
>> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	match_ptr = dev_get_platdata(dev);
>> +	if (!match_ptr)
>> +		return -EINVAL;
>> +	data->drvdata = *match_ptr;
>> +
>> +	data->pwm_enable = AUTOMATIC;
>> +	data->pwm_value = 255;
>> +
>> +	dev_set_drvdata(dev, data);
>> +
>> +	gpd_init_ec(data);
>> +
>>   	hwdev = devm_hwmon_device_register_with_info(dev,
>>   						     DRIVER_NAME,
>> -						     NULL,
>> +						     data,
>>   						     &gpd_fan_chip_info,
>>   						     NULL);
>>   	if (IS_ERR(hwdev))
>>   		return dev_err_probe(dev, PTR_ERR(hwdev),
>>   				     "Failed to register hwmon device\n");
>>   
>> -	gpd_init_ec();
>> -

This suspiciously looks like a bug fix which is not mentioned in the
commit description. Either explain why it is now needed before hwmon
registration and why that was not the case before, or submit as separate
bug fix.

>>   	return 0;
>>   }
>>   
>> -static void gpd_fan_remove(__always_unused struct platform_device *pdev)
>> +static void gpd_fan_remove(struct platform_device *pdev)
>>   {
>> -	gpd_driver_priv.pwm_enable = AUTOMATIC;
>> -	gpd_set_pwm_enable(AUTOMATIC);
>> +	struct gpd_fan_data *data = dev_get_drvdata(&pdev->dev);
>> +
>> +	if (data) {
>> +		data->pwm_enable = AUTOMATIC;
>> +		gpd_set_pwm_enable(data, AUTOMATIC);
>> +	}
>>   }
>>   
>>   static struct platform_driver gpd_fan_driver = {
>> @@ -668,6 +691,7 @@ static int __init gpd_fan_init(void)
>>   	if (!match) {
>>   		const struct dmi_system_id *dmi_match =
>>   			dmi_first_match(dmi_table);
>> +
>>   		if (dmi_match)
>>   			match = dmi_match->driver_data;
>>   	}
>> @@ -675,10 +699,6 @@ static int __init gpd_fan_init(void)
>>   	if (!match)
>>   		return -ENODEV;
>>   
>> -	gpd_driver_priv.pwm_enable = AUTOMATIC;
>> -	gpd_driver_priv.pwm_value = 255;
>> -	gpd_driver_priv.drvdata = match;
>> -
>>   	struct resource gpd_fan_resources[] = {
>>   		{
>>   			.start = match->addr_port,
>> @@ -690,7 +710,8 @@ static int __init gpd_fan_init(void)
>>   	gpd_fan_platform_device = platform_create_bundle(&gpd_fan_driver,
>>   							 gpd_fan_probe,
>>   							 gpd_fan_resources,
>> -							 1, NULL, 0);
>> +							 1,
>> +							 &match, sizeof(match));

Why &match instead of just match ? match is a pointer to driver_data which itself
is a pointer. Passing a pointer to a pointer just to dereference it in the probe
function doesn't make sense to me.

>>   
>>   	if (IS_ERR(gpd_fan_platform_device)) {
>>   		pr_warn("Failed to create platform device\n");
> 

