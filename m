Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D303A1D2
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Feb 2026 23:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771716121; cv=none; b=Q8reUUD1TQHGIQiWsgMRY0x4Xm4JBru4cdVB/p6E6ZwAsH5H8FCGEK2r1a2QPOERHXPwOCPbL7N4/abJMfUoyn+FFeAKM5AuJ8vrJ/lq3+oJbSfoDm+IjNyCigTyM3FceWmbDVTM2Gf7HyGVEdTOX3NA2ALS/4aq/8VuPgT7p5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771716121; c=relaxed/simple;
	bh=da8+ePI9reeeEA8P8Ivqvk3tnjWawvxrnS2I15pzKKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2r70sXvrKSQ7fAqYrVu+nEr9p89UJYrHk7LIz7WIV0GGP6zuZ5KLFceoYFajk3WXWOVBlecK1d9diR7fM4cvj6DNSpJ5FLzNNwucbBbcMlR+/RwtYqUoRuexLGni0snUPtpusAmFzEEwPFJQuW/3O2WSyML6mIbBavWoew3Rwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OXKPdFBv; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OXKPdFBv"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bab70f8c8aso3016541eec.1
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Feb 2026 15:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771716120; x=1772320920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=728HmIyiDZ+NFIESodn8VZNyEpposKqcEdKd0Nh49bg=;
        b=OXKPdFBv5SuWo+HirrEl8c5+bWK5sgCm3AuNe0nQONKkfX+cnwTt737gwpQGUphMWl
         Yn9ew2xFcI9U68zdLwsHEFDlojuwJybJQ13Eggg7fB51PxUhUHdL+1fiJFk9SsF18XLp
         u8BbKF9LvKs1Z5jmDfjXO2SLLWWxbmy6NXpm+ZkaO9zgHKI+5Gn15SYUC+bcH3Bkgrvi
         ImlwGbjXzurTwLopasf0iJJZmZZpGVMPy4TVQCoSjfkjTTnHL7l8Ys3+DkTbQ7NztgR6
         Ow6myrcc6b6Vux7MIyWAU4xaJ9JTsPNJ5EXgP1c0fFL+bxrhzx9TUsjPl7cPeE5zUlHi
         jPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771716120; x=1772320920;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=728HmIyiDZ+NFIESodn8VZNyEpposKqcEdKd0Nh49bg=;
        b=Dd8VOviqR2cZvkoi+zkGiGQtNnDOewU0bF9ND12aL2OsqGOPuvry6BnDWgdDPwojTo
         gpbRo70aR8hxerw8AJv0pmhVm2b5YGLIYkeN4gt6EQPgjGYKGBct/UYWl7AiobodvTw1
         4SvY+KE3aVb1TVGJVuFR2VxomzxJZuCfUk1gpw8mT73oSWcJHg+c/rT/NgrJb2lOPq2T
         3BSq97n7x0e9rjPcOb7BpvPn8McHFJ3YUs8UuBpk4H4afq5UnM7a/dGTQZ6on00YsSpt
         OmGC3qM8HSBvr7n6nnMzYVYUsGcJ/MKem3NXAHFfKJaUWMjgFGQyRrIufVZxxnSRVt9w
         TIxQ==
X-Gm-Message-State: AOJu0Ywt8cwiTSzv6hVY+znmaCGQmbuo/62hCt9sQIsYPvV/fqzDOvLA
	PFtgINX+vPaLcNIxBGvImNkL6rCkl1jobTrpMjvBWebD5PgbzTinUSSd
X-Gm-Gg: AZuq6aJJcviDpwOQETcS/mBs/hNpL5Ayz0fNDAJnMEbWzxHlsp7OZNEL3BE/KTF+1ih
	l8qtriJ5JLtADLqZHunB4WYe+hrsOHCuhYK/t6YGBSFpXXxz9nLNS+yaQ0fjWqUeOoKCr5wQRQI
	YeVVngjUQTl2SVUicq+IFRlhaFB90JzSca81aDL/xxmVWForSI1TisYJ1ZjAf0QYHvyef5Kk3ev
	tCfas1DV+btG+cNLmtaHWUOGpsFQ8img0RKgHdlSeCmsJqF0SgOAENXyEndAm+TCKSiWM4XwXgb
	+O9CCnYTWEuGAQON1op+2YqgjrMKjOsZ5Vb8E1zUpQzLWGdnz77YW0tGrYbs2+ACZ2oLJoLBmYj
	hsFMzYLgogcVkEqt80xjMdubd1XjSycV/pUpDvpli5UXeXSF9geWBu9O09WCE2KAm04Uoi9AEBY
	ua5hruPjoXxcPrCMSOqDirk2dkO1SWKwhhu/Xrdfn48kFJXrhiAqeneMgbwegO9bjXL8RilIjA
X-Received: by 2002:a05:7301:1001:b0:2b0:56fd:4b67 with SMTP id 5a478bee46e88-2bd7b9e70admr1774475eec.12.1771716119581;
        Sat, 21 Feb 2026 15:21:59 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dc37895sm2115619eec.33.2026.02.21.15.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 15:21:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ac930a67-01ee-4c68-a9ed-bf1c321e78f8@roeck-us.net>
Date: Sat, 21 Feb 2026 15:21:58 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hwmon:(pmbus/xdpe1a2g7b) Add support for
 xdpe1a2g5b/7b controllers
To: ASHISH YADAV <ashishyadav78@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ashish Yadav <ashish.yadav@infineon.com>
References: <20260219105630.11929-1-Ashish.Yadav@infineon.com>
 <20260219105630.11929-4-Ashish.Yadav@infineon.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260219105630.11929-4-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/19/26 02:56, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add the pmbus driver for Infineon Digital Multi-phase XDPE1A2G5B and
> XDPE1A2G7B controllers.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> ---
> XDPE1A2G5B and XDPE1A2G7B support both Linear and NVIDIA PWM VID Data
> formats for VOUT_MODE.
> The configuring both loops/pages of the device independently is not
> supported for VOUT_MODE.
> In case of vid mode, NVIDIA PWM VID vrm_version is supported:
> Vout = 5mV * (VID-1) + 195mV
> ---
>   drivers/hwmon/pmbus/Kconfig      |   9 +++
>   drivers/hwmon/pmbus/Makefile     |   1 +
>   drivers/hwmon/pmbus/xdpe1a2g7b.c | 120 +++++++++++++++++++++++++++++++
>   3 files changed, 130 insertions(+)
>   create mode 100644 drivers/hwmon/pmbus/xdpe1a2g7b.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index fc1273abe357..a4513fc6bc26 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -711,6 +711,15 @@ config SENSORS_XDPE152
>   	  This driver can also be built as a module. If so, the module will
>   	  be called xdpe152c4.
>   
> +config SENSORS_XDPE1A2G7B
> +	tristate "Infineon XDPE1A2G7B"
> +	help
> +	  If you say yes here you get hardware monitoring support for Infineon
> +	  XDPE1A2G5B and XDPE1A2G7B.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called xdpe1a2g7b.
> +
>   config SENSORS_XDPE122
>   	tristate "Infineon XDPE122 family"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index d6c86924f887..d592d8c77bec 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -70,6 +70,7 @@ obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
>   obj-$(CONFIG_SENSORS_XDP710)	+= xdp710.o
>   obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
>   obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
> +obj-$(CONFIG_SENSORS_XDPE1A2G7B)	+= xdpe1a2g7b.o
>   obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
>   obj-$(CONFIG_SENSORS_PIM4328)	+= pim4328.o
>   obj-$(CONFIG_SENSORS_CRPS)	+= crps.o
> diff --git a/drivers/hwmon/pmbus/xdpe1a2g7b.c b/drivers/hwmon/pmbus/xdpe1a2g7b.c
> new file mode 100644
> index 000000000000..e10bafeb0984
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/xdpe1a2g7b.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for Infineon Multi-phase Digital XDPE1A2G5B
> + * and XDPE1A2G7B Controllers
> + *
> + * Copyright (c) 2026 Infineon Technologies. All rights reserved.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +#define XDPE1A2G7B_PAGE_NUM 2
> +#define XDPE1A2G7B_NVIDIA_195MV 0x1E /* NVIDIA mode 1.95mV, VID step is 5mV */
> +
> +static int xdpe1a2g7b_identify(struct i2c_client *client,
> +			       struct pmbus_driver_info *info)
> +{
> +	u8 vout_params;
> +	int vout_mode;
> +
> +	/*
> +	 * XDPE1A2G5B and XDPE1A2G7B support both Linear and NVIDIA PWM VID data
> +	 * formats via VOUT_MODE. Note that the device pages/loops are not fully
> +	 * independent: configuration is shared, so programming each page/loop
> +	 * separately is not supported for VOUT_MODE.
> +	 */
> +	vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
> +	if (vout_mode >= 0 && vout_mode != 0xff) {

"vout_mode != 0xff only makes sense in generic code, where it is possible
that the command is not properly implemented. It does not make sense
in a device specific driver: Either the command is implemented and returns
a useful value, or it is not implemented. So this code should simply be

	if (vout_mode < 0)
		return vout_mode;

	switch (vout_mode >> 5) {
	...

If the controller is really so unstable that it returns 0xff once
in a while, a respective comment would be needed in the code. However,
even then, I would suggest something like

	if (vout_mode < 0)
		return vout_mode;

	/* Explain instability */
	if (vout_mode == 0xff)
		return -ENODEV;

	switch (vout_mode >> 5) {
	...

i.e., error handling first.

If the concern is that this isn't really one of the chips supported by the driver,
I would suggest to implement chip detection code either in the identify
function or better in the probe function. If that is the case, the return value
from PMBUS_VOUT_MODE isn't useful anyway.

Thanks,
Guenter

