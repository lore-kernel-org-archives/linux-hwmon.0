Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191D629898B
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 15:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778944756; cv=none; b=Kb1jm7VsJtOBtXWhPRNuuFHbuw2drF4iSQIassP7VAQpwWgbWThXuPJ4a6S0KAD+tA8Uj2/v2bqF9BaYWv6HUwilZsYmcFx+ArXkhWeil1MGkSMDtcVzN7y1YZd8zXzGRbqUWXZ33QCpdxqI08EDlfRfF2qbyvdw8zMhIWrux+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778944756; c=relaxed/simple;
	bh=Pw8b5bPQqcNlcW3aCbB9ag/FgzotRKgymsVwoZrW7mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P++3ACcLPRZ2mGaJw0kuGAK0lZbNJfQchOPdEePkM4UXNJ2RIQYULpLw8XQR+McnTgFDp5sgFax2rRfAe/kN/GoeShTlNYhbRn/45fgjDUv3H1z1nfLmTSEUrawDg3gs+RG6cxbcU8sn4ieRZMs4avfDkicLA3qaab+BtBZWEt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TA8OZ4YP; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TA8OZ4YP"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so8334805ad.3
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 08:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778944754; x=1779549554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rj8rndSFiycmqOwIbgdwAMxdgZDADNL4od2Tb81O+Tg=;
        b=TA8OZ4YP5xFwn19JTT81kHJ080SGQjLROvos8bCkabdbj9OX7maleqjtF0R+FpgCtA
         iqo1L0KKD1IgO93CriX1mHDp2KcJ9WnTduYxrGBYqstfa48J+Ufb1JZ9w1giJuLzJn6L
         rgFo6SkPDsCTTuswWPoybjq0MvWN1E1FnSUk6C6SKSRaj6YHA4GWO04UjoD6HGWwN50d
         CfpVLj6SKs0+NHOTAihY8eudj7xsW4AhN2rN/YF8ZWChRcz7tJmMH5a/9vb/Bc5mVIqi
         i/5Y0rNcGb1NuHdvjH7GJePBucSwMdfUTnsQEF7yd8ugn8rbCUYUzT4doI+C5CxkNavx
         Lx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778944754; x=1779549554;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rj8rndSFiycmqOwIbgdwAMxdgZDADNL4od2Tb81O+Tg=;
        b=CmC0ibuoUGcWOo1arJ2/ezGBSN5qCVIXOfLJoajwLb2uQFSjp95I4nveUcmR7+QnRm
         AEEKhW1+/ZVBebUey+iMqKl+x9azzpewLECTnPcPlc94mipRmU7+3fVHUZtga6pltCoH
         DGPmPc2UlQNE9fx6wc0gGr+AHnY9i9kLQW67TRgKsZaQEccol/daegdiQRqvDUqWSqWc
         5kWZbTqNeu9vEUFRdAdN32ZxjJ1BCMbiIhVJW89sQdI2HD0a4S7+Q0AX5HQ6rWCyMzce
         Q05FAVPDyAbwyac46vMGbF7c+iK+dI40Bl6qZag83VejqdgGx6Z0m+iBgqe6p5nxP5+p
         /Nbg==
X-Forwarded-Encrypted: i=1; AFNElJ+wIUFoTRVOTk7bblbO4jCq1l7ypYHMG8eqH2rImeXHGbRthhhUos86BSG/IZjPL0Chkw+bJN4onaUd9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDeMh6Jq4h3pFr2DbeRMHqaWo09F8OKSXaqCnkb7IEp7I1S4s4
	n0bSfc80NObjt66Ydoab/deTzxoa+O9GrX5JYLPbkG1hBZrONYo+VBEh
X-Gm-Gg: Acq92OGncAg0JiurjFbQkx0e/nUCfzkzObVSjYb7P25u1Sn2wq2kb7I4C3MgGhn0pM6
	gGJbt51k6OjAEKNslHPsQzgh4K3RL2VcCXFQgoHDkAee/zjPeb2lym+BJMg+mCSIXq8VTv8fQW5
	oBH9TVYnL/2JRq4K8PAe3ikYSMC6wt74RpK9yMAfejIctQt8nfrmZ5iBQBeM009pW9s6IWfuk1n
	hhbRS23Q0ZD2MTPni90+6hwX2PmhktV8l12a7ithtI9FMaz4PlUCz0PgaEC7j2yCSyGRqUNJhPI
	YQs32NPK4n1A4Pm1Sjw8VtV+wSRa7aO64bGuVqzZ4SbHOaf1AUqTH/EfrOds7u7qzFGdj0jrlkQ
	1jv16XaA8zRoFnduu7llTBXGKaiQhgrYpdtP997j0xuEPtOsAopldbjBDEqjVw4r6KfH4Y5hDOe
	vE22MET4ir9/jmFmtVJbyLK6/RdlObN60sbr/+Vv9UQ77KYUqkyCLPnyOl4/S1DHHLD9I+jyKS
X-Received: by 2002:a17:902:a701:b0:2bd:5b20:a5b5 with SMTP id d9443c01a7336-2bd7e951360mr67938555ad.37.1778944754433;
        Sat, 16 May 2026 08:19:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bdc58575dfsm3068475ad.20.2026.05.16.08.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 08:19:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <23b62e32-8773-49f4-98d2-3c32b229650c@roeck-us.net>
Date: Sat, 16 May 2026 08:19:13 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver
To: sashiko-reviews@lists.linux.dev,
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 linux-hwmon@vger.kernel.org, conor+dt@kernel.org
References: <20260514-d1u74t-v4-2-1f1ee7b002ec@nexthop.ai>
 <20260515033458.CFBFCC2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260515033458.CFBFCC2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/14/26 20:34, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] Missing includes for <linux/module.h> and <linux/string.h>.
> - [Low] Logging raw I2C device strings without escaping.
> --
> 
> commit f645f72f2f4d8cc53bec169fb4350e6231e649a4
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> 
> hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver
> 
> This commit adds a PMBus client driver for the Murata D1U74T power supplies.
> 
> Closes: https://lore.kernel.org/oe-kbuild-all/202605122253.zInzmUeX-lkp@intel.com/
> 
>> diff --git a/drivers/hwmon/pmbus/d1u74t.c b/drivers/hwmon/pmbus/d1u74t.c
>> new file mode 100644
>> index 0000000000000..286ba492e3362
>> --- /dev/null
>> +++ b/drivers/hwmon/pmbus/d1u74t.c
>> @@ -0,0 +1,86 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright 2026 Nexthop Systems.
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/of.h>
>> +#include <linux/pmbus.h>
>> +
>> +#include "pmbus.h"
> 
> This isn't a bug, but should this file include <linux/module.h> and
> <linux/string.h>? It uses module-specific macros like MODULE_DEVICE_TABLE
> and MODULE_AUTHOR, as well as the strncmp function. While compilation might
> succeed due to transitive includes, it could lead to build failures or
> implicit declaration warnings on some architectures.
> 

I added that; no need to resend.

> [ ... ]
> 
>> +static int d1u74t_probe(struct i2c_client *client)
>> +{
>> +	char buf[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
>> +	struct device *dev = &client->dev;
>> +	int rc;
>> +
>> +	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
>> +	if (rc < 0)
>> +		return dev_err_probe(dev, rc, "Failed to read PMBUS_MFR_ID\n");
>> +
>> +	if (rc != 9 || strncmp(buf, "Murata-PS", 9)) {
>> +		buf[rc] = '\0';
>> +		return dev_err_probe(dev, -ENODEV,
>> +				     "Unsupported Manufacturer ID '%s'\n",
>> +				     buf);
>> +	}
>> +
>> +	rc = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
>> +	if (rc < 0)
>> +		return dev_err_probe(dev, rc,
>> +				     "Failed to read PMBUS_MFR_MODEL\n");
>> +
>> +	if (rc < 8 || strncmp(buf, "D1U74T-W", 8)) {
>> +		buf[rc] = '\0';
>> +		return dev_err_probe(dev, -ENODEV, "Model '%s' not supported\n",
>> +				     buf);
>> +	}
> 
> Does this code log potentially unescaped strings directly from the device?
> 
> Since the I2C bus can return garbage data or unprintable characters from a
> malfunctioning device, using the %s format specifier could result in
> corrupted log output. Would it be safer to use the %*pE specifier to safely
> escape these untrusted strings?
> 
Possibly, but I'll let it go for now. Other drivers do the same. It can be
fixed in a follow-up patch if needed.

Thanks,
Guenter

