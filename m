Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3770243E4B4
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 14:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781618941; cv=none; b=OgQLxVZBQGn8CS4GkheeXBY+BRSUksmaXCyiXRXl4Rs5hGv7lShxkf+nhejTwPtXZOk9Zuqx3AJyavz1VxuZah4GC49ZOm4xE42qrVCm/FHexqCVi4e3K9zOT9wn2N0l5FHD7e1FlZpQC9GIT6s5eZKQg+tRdw3MP1VZMzz2I4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781618941; c=relaxed/simple;
	bh=n6pqwuk2bX/dW4+5bMMqi/uzcPmgpw0vZO0PQFIv5tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=joarVlx/iz0SHi45R6FUjehdJoZBZx5D+4KyVdlc2YDZySEAZCnGBxf1b5dLdWkv8zcRjVHuecP0DyOYWFeS1G8w0nu2FUpsVgE5S1+xzXAkg0mLzSVNYaNeFBDtOpLJmiMkLIdT+AuPVdwCrOVPjJcsO5r7mhXD5/t74EMT8Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r7utH39V; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r7utH39V"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36b9033d230so2546254a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 07:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781618939; x=1782223739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DhPvSn7NVN2Iec8rVsh0ADn+3E5nd/Q5vIlOYduaGQg=;
        b=r7utH39VJlbuN6XEi5MXbRD1zyzdg6WQdIE5Lbana9tCM1vcKSp0L/JEUCnmcW9fwh
         ikwiKataODnYyL2a5+lmbri8l4lyLY+A5yAMt8RSp4LpE3s76QDVoFQFW0GDEWlSEUn0
         mPNlu2bpVf0IRq1zaf0WnyanhNuBH2JJ64dcYsx7WZOUEPDg+vUFrkkct1wXwWzzJ7gr
         pXeRmSIMPeAjQydWf+sJHtlkLVLACahDFst4CcYQaSX4XnW9VzF1aerjHCkAHqVr5klm
         wC1I1XJjh76qfKEx9FJeLZfnWzHub/nxBWKZiAh3ymhzM99Zal4pZZLNhE70a6KYc2IN
         f4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781618939; x=1782223739;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhPvSn7NVN2Iec8rVsh0ADn+3E5nd/Q5vIlOYduaGQg=;
        b=WhhQ/g318TJ9UsOnIKRtiij1vALhU2hI7VIWA0xu8MWe0o8fr6/0YmEmjcJ8XfNSPS
         muHf/YRBAIxQ95uDAkoxBoZ+4ykgsjKas8ykeechgK5ojqRGtgJGDo0LjOVhVuNPlqdo
         Ob8HV9AjatEikSnVACrsWP7+t6zTjEBDHZ95ehoEpaj1h+9uSj9gquPyqwWYWrzgoegp
         1ccCl0JKMvYPUDxa7VIYe9wZWa7sYHohSLoxsEp5UQsOfOldHHdqnqsQtzsu8Da9uwiy
         alt9IwMfanEaoXvxcvYBIPJ5dUHzRS/xxaxTmuU4hDQw8vpWqn+xh+YXRaM7OHYjAIr7
         oADA==
X-Forwarded-Encrypted: i=1; AFNElJ8xl6aHx87eKMkQJfW1kuzDFmSk93guP4r3aZzygKK9l77SOqcF/dq5QiDNXKnh0hZWm55iBD92O9hbWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8YN5GFGm8yTgQINtlCwerNdtt3eeQgXMJIsQWlgWjKOC7csei
	TQmIvlcyhw0HjOWw+Csn2L6SDqBydEebQxaFFx4yTEYw8KyELgcCyqhE
X-Gm-Gg: Acq92OEqIwwN/xeO7XhMwLmwtVQYmkkS1yyAcv56PDuB76jr7AZ3YOHbfm/W+daFCfc
	Ox63KLu9IiJaNXUTRr6+kCx3qvvaWoVELtPHbgnHljwZSERkeDDSYh7SuIlauU5uXRzMn/Co+FA
	33aB1q+Il5xvvc6K50/mFmDd8gwuv2pj4BDFf/96Bjt22B6/g4GPDJsyatuj+VmlfeE90/yYMA4
	+vVFnPPM2HWgqFo06O3S2cuNNu9rM1RIbvVmpT+2FAvDTgVljlNTWcZRaHOBreAflqXhxYK31NQ
	U+1ET5RYv/gbsGUpMZ1yoPG1HOG/18GeesI+Nk+qtVi8CxKUFT16EzlJLZyUomNVhID+c9OjEt3
	mwQDNwTkihqh4K5oG938pcaW+mrSoqpBopppwJsi8Segp53FltsAEQfI4u+Yvq6ipzqQbn4h0Zs
	wjO7E+KOWgk36vKAAd54EQuahTDeHs1pTlNC2mhmtdvp4hJ5pxuptYTxHnAhBagyJ8902Ir7by
X-Received: by 2002:a17:90b:2e0b:b0:36b:d40e:2cf9 with SMTP id 98e67ed59e1d1-37c523a4ae3mr2950145a91.7.1781618939405;
        Tue, 16 Jun 2026 07:08:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5228eb5bsm3066187a91.12.2026.06.16.07.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:08:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e1673147-a51f-460c-ad09-21f54d3d6803@roeck-us.net>
Date: Tue, 16 Jun 2026 07:08:57 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] hwmon: adm1275: Support ROHM BD12790
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Wensheng Wang <wenswang@yeah.net>,
 Ashish Yadav <ashish.yadav@infineon.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
 Charles Hsu <hsu.yungteng@gmail.com>, ChiShih Tsai <tomtsai764@gmail.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1781591132.git.mazziesaccount@gmail.com>
 <8ca875d21f2d9a4d53a87b47a5e6efab48266178.1781591132.git.mazziesaccount@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <8ca875d21f2d9a4d53a87b47a5e6efab48266178.1781591132.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 23:44, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Add support for ROHM BD12790 hot-swap controller which is largely
> similar to Analog Devices adm1272.
> 
> The BD12790 uses the same selectable 60V/100V voltage ranges and
> 15mV/30mV current-sense ranges as the ADM1272, and the same VRANGE
> (bit 5) and IRANGE (bit 0) layout in PMON_CONFIG. It therefore uses
> a dedicated coefficient table that mirrors adm1272_coefficients, with
> the following differences derived from BD12790 datasheet Table 1 (p.18):
> - power 60V/30mV: m=17560 (vs. 17561)
> - power 100V/30mV: m=10536 (vs. 10535)
> - temperature: b=31880 (vs. 31871, reflecting T[11:0] = 4.2*T + 3188)
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> 
> ---
> Originally this patch was AI-generated. I did pretty much re-write the
> probe changes by hand, and also fixed some of the coefficient math
> afterwards :/ But yeah, this one was AI "assisted". :)
> 
>   drivers/hwmon/pmbus/Kconfig   |  4 +--
>   drivers/hwmon/pmbus/adm1275.c | 53 +++++++++++++++++++++++++++++------
>   2 files changed, 47 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index b3c27f3b2712..6ebc01e26db3 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -52,8 +52,8 @@ config SENSORS_ADM1275
>   	help
>   	  If you say yes here you get hardware monitoring support for Analog
>   	  Devices ADM1075, ADM1272, ADM1273, ADM1275, ADM1276, ADM1278, ADM1281,
> -	  ADM1293, ADM1294, ROHM BD12780, and SQ24905C Hot-Swap Controller and
> -	  Digital Power Monitors.
> +	  ADM1293, ADM1294, ROHM BD12780, ROHM BD12790, and SQ24905C
> +	  Hot-Swap Controller and Digital Power Monitors.
>   
>   	  This driver can also be built as a module. If so, the module will
>   	  be called adm1275.
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index 838b8827eb76..9e21dd4083e9 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -19,7 +19,7 @@
>   #include "pmbus.h"
>   
>   enum chips { adm1075, adm1272, adm1273, adm1275, adm1276, adm1278, adm1281,
> -	 adm1293, adm1294, bd12780, sq24905c };
> +	 adm1293, adm1294, bd12780, bd12790, sq24905c };
>   
>   #define ADM1275_MFR_STATUS_IOUT_WARN2	BIT(0)
>   #define ADM1293_MFR_STATUS_VAUX_UV_WARN	BIT(5)
> @@ -47,8 +47,8 @@ enum chips { adm1075, adm1272, adm1273, adm1275, adm1276, adm1278, adm1281,
>   #define ADM1278_VOUT_EN			BIT(1)
>   
>   #define ADM1278_PMON_DEFCONFIG		(ADM1278_VOUT_EN | ADM1278_TEMP1_EN | ADM1278_TSFILT)
> -/* The BD12780 data sheets mark TSFILT bit as reserved. */
> -#define BD12780_PMON_DEFCONFIG		(ADM1278_VOUT_EN | ADM1278_TEMP1_EN)
> +/* The BD127x0 data sheets mark TSFILT bit as reserved. */
> +#define BD127X0_PMON_DEFCONFIG		(ADM1278_VOUT_EN | ADM1278_TEMP1_EN)
>   
>   #define ADM1293_IRANGE_25		0
>   #define ADM1293_IRANGE_50		BIT(6)
> @@ -136,6 +136,30 @@ static const struct coefficients adm1272_coefficients[] = {
>   
>   };
>   
> +/*
> + * BD12790 coefficients derived from preliminary datasheet, Table 1 (p.18)
> + * and the PMBus direct-format relationship X = (Y * 10^(-R) - b) / m.
> + *
> + * Voltage: V[V] = 14.77e-3 * code (60V) / 24.62e-3 * code (100V)
> + *   -> m = 6770, R=-2 / m = 4062, R=-2
> + * Current: code = I[A] * RS * 132802.1 + 2048 (15mV) / * 66401.06 + 2048 (30mV)
> + *   -> m = 1328, b = 2048 * 10^(-R) = 20480, R=-1 / m = 664, same b and R
> + * Power: code = k * RS * PIN, k = 35119.94 / 17559.97 / 21071.44 / 10535.72
> + *   -> m = round(k / 10^(-R)), R=-2 for 60V/15mV, R=-3 for the other three
> + * Temperature: code = 4.2 * T + 3188 -> m = 42, b = 3188 * 10 = 31880, R=-1
> + */
> +static const struct coefficients bd12790_coefficients[] = {
> +	[0] = { 6770, 0, -2 },		/* voltage, vrange 60V */
> +	[1] = { 4062, 0, -2 },		/* voltage, vrange 100V */
> +	[2] = { 1328, 20480, -1 },	/* current, vsense range 15mV */
> +	[3] = { 664, 20480, -1 },	/* current, vsense range 30mV */
> +	[4] = { 3512, 0, -2 },		/* power, vrange 60V, irange 15mV */
> +	[5] = { 21071, 0, -3 },		/* power, vrange 100V, irange 15mV */
> +	[6] = { 17560, 0, -3 },		/* power, vrange 60V, irange 30mV */
> +	[7] = { 10536, 0, -3 },		/* power, vrange 100V, irange 30mV */
> +	[8] = { 42, 31880, -1 },	/* temperature */
> +};
> +
>   static const struct coefficients adm1275_coefficients[] = {
>   	[0] = { 19199, 0, -2 },		/* voltage, vrange set */
>   	[1] = { 6720, 0, -1 },		/* voltage, vrange not set */
> @@ -504,6 +528,7 @@ static const struct i2c_device_id adm1275_id[] = {
>   	 */
>   	{ "bd12780", bd12780 },
>   	{ "bd12780a", /* driver data unused, see --^ */ },
> +	{ "bd12790", bd12790 },
>   	{ "mc09c", sq24905c },
>   	{ }
>   };
> @@ -581,7 +606,8 @@ static int adm1275_probe(struct i2c_client *client)
>   	if (mid->driver_data == adm1272 || mid->driver_data == adm1273 ||
>   	    mid->driver_data == adm1278 || mid->driver_data == adm1281 ||
>   	    mid->driver_data == adm1293 || mid->driver_data == adm1294 ||
> -	    mid->driver_data == bd12780 || mid->driver_data == sq24905c)
> +	    mid->driver_data == bd12780 || mid->driver_data == bd12790 ||
> +	    mid->driver_data == sq24905c)
>   		config_read_fn = i2c_smbus_read_word_data;
>   	else
>   		config_read_fn = i2c_smbus_read_byte_data;
> @@ -655,12 +681,23 @@ static int adm1275_probe(struct i2c_client *client)
>   		break;
>   	case adm1272:
>   	case adm1273:
> +	case bd12790:

Please don't overload the existing case statements.
Just add separate case statements for the new chips.

Thanks,
Guenter

> +	{
> +		u16 defconfig;
> +
>   		data->have_vout = true;
>   		data->have_pin_max = true;
>   		data->have_temp_max = true;
>   		data->have_power_sampling = true;
>   
> -		coefficients = adm1272_coefficients;
> +		if (data->id == bd12790) {
> +			coefficients = bd12790_coefficients;
> +			defconfig = BD127X0_PMON_DEFCONFIG;
> +		} else {
> +			coefficients = adm1272_coefficients;
> +			defconfig = ADM1278_PMON_DEFCONFIG;
> +		}
> +
>   		vindex = (config & ADM1275_VRANGE) ? 1 : 0;
>   		cindex = (config & ADM1272_IRANGE) ? 3 : 2;
>   		/* pindex depends on the combination of the above */
> @@ -685,14 +722,14 @@ static int adm1275_probe(struct i2c_client *client)
>   			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
>   			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
>   
> -		ret = adm1275_enable_vout_temp(data, client, config,
> -					       ADM1278_PMON_DEFCONFIG);
> +		ret = adm1275_enable_vout_temp(data, client, config, defconfig);
>   		if (ret)
>   			return ret;
>   
>   		if (config & ADM1278_VIN_EN)
>   			info->func[0] |= PMBUS_HAVE_VIN;
>   		break;
> +	}
>   	case adm1275:
>   		if (device_config & ADM1275_IOUT_WARN2_SELECT)
>   			data->have_oc_fault = true;
> @@ -738,7 +775,7 @@ static int adm1275_probe(struct i2c_client *client)
>   		u16 defconfig;
>   
>   		if (data->id == bd12780)
> -			defconfig = BD12780_PMON_DEFCONFIG;
> +			defconfig = BD127X0_PMON_DEFCONFIG;
>   		else
>   			defconfig = ADM1278_PMON_DEFCONFIG;
>   

