Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE6337C91F
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Mar 2026 18:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772820802; cv=none; b=im/n/kePfMIflbPhaRurCWb7opdinrxdVvhyim6bOcHD8BCE0QHccQUN2pvqigg6tjLxcxFLgq3HVDrDR+Jn4sWPXK+0ejigiluYQiv7zNzBcRa7eTjBSdIPzZgJoIlq5EIqmLFceKknM++m9fEX8osmeJOjlZRU/FJgw8H9CAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772820802; c=relaxed/simple;
	bh=yipEarHCwwYSajXjdx3eb8SR/frf8uKhcVnUA9roWh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/HgalwMXIGcppDc0ZjG1L6LKOEKVtisPx5ILM4duBs0H8RrB9PXywrvzM2y3H3Db13dewN2ulYHEHmH/rAKM4g0wLm5ybXKKUCyRI/YQqhdtoy5FPvEw3Q3Fze7f9frP3hHSS9hEyDSpjQqtiIFI/LHU3AfCzecOwq0XWSvZa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0xPSif8; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0xPSif8"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2be26d11b95so6571920eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Mar 2026 10:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772820800; x=1773425600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=FjJLebFspOfIa2hTFIdRtP+6bxBHerLQCjuff9QmaDA=;
        b=I0xPSif8PfjHQkc5WWBntGTuiH8RHGh7qGJ22TVDCtaaLEOCBTWUKWPGW4b1sy+58M
         O+HPmL4QBNFmQQgptrcejyX4GY1ldB/20ar88R3rxeNfw6Ilx81eJuCcoEr6PdQeOiTD
         DcrtJmE0YiznLOtZSjp6qFaF1txXK+hCL5I2msthf3J7uX906seRwanX57iETjAU8wo+
         5hdOHlSv7RGglUpg/uo+R1LP3SgW+WsKf7eljU92eIjPCStAmYZRL+j3bhC3LcXwX1W+
         w2j1wq0kikV8Xo5x4eyggQ1inOqvx9yTaX4LU+A9w0evLSwrJTIs/SB4zpulb7sSYwsg
         frcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772820800; x=1773425600;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjJLebFspOfIa2hTFIdRtP+6bxBHerLQCjuff9QmaDA=;
        b=kpHIbKn09G8GeNDfqa2pb5M6WqIs4DBpaOZPDIqi1a/wzAORiOHyy0DPr+PkDDgBcL
         fmu83C6HBXvhh+Nc/Le3oloGUu2HC46l4kCg454MjIKoE62cgplk9kPdtIJtv4dODZW8
         3P448DsRF79BWv70kcNKQbnNjge4UECHBa3QKw9HL71M9Vh0o0yh9UqLwwTv4GPsaMjz
         UuP4hMKfjQMHEsZ0ujwxVk6Fv5/zh6l0Rfr7F9tcz7Y8zwoxUQ3eobfr241tukDivoY/
         X5nvS/2NV64yIECFLxJlvoYPMBP0mV/5vK6g8RZjPnwY+x5YULYo7LHljiCzxHZWqSzF
         5fbw==
X-Gm-Message-State: AOJu0YxfBp1w8uGKwf6kxk0qx2WX9LGcdv3rgcHe/1DBXG3e4lc/8P6R
	iZGtadCg/illCGgJzYzjIq2LyxxiPROYrIOLjOQTuhUw4wLEhf6daqIT
X-Gm-Gg: ATEYQzx7Ypr/UuFnBtDGVNfyqgdtY2+nD26oO11oVUKkh0GkJiFpEH7+7xmlBDjXiFf
	lvTyvLZNU5gVZ18DNAZHR5fCPUZujPqvURJi0YOlpdSCerMp8r55GkL/auBwgmfh399S2W2U84F
	HZO8IHuCsGogpiWQJiWJN0qbRyBbwvXuV9x1hA0y+dol0IZFo4ihIdYvl21g5dZQtliFNcHxElw
	/Hynf9PC4+LQ2iuJ2pfpEwbmSMsl/CVor1pWl/9e0o/PmveVnJUfu6Mo37VwQ9XPNiG+f2eHsHY
	R8QYvFGDote7FX54ivOlmZj3RY7irxF2l4S7lTYNEcE213JpZSLcB21AvdndXeXdIACivLYm/2F
	RpFt+DzDfS25sqw4WM6Kv0VeP4y3v5z2soKP++K+jBGc5S0HlXiLqxlxZKf/LZgU5RwvVbkcrnc
	Zz+RZDARzGxd1u+NeiikUjiHKwVaiClLH7+s0gwld+e8p7pxBv6qYs7DY3x0z1nDOj6hibl6uq
X-Received: by 2002:a05:7301:4094:b0:2be:1dc7:999a with SMTP id 5a478bee46e88-2be4de901bfmr1385993eec.4.1772820799827;
        Fri, 06 Mar 2026 10:13:19 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948390sm1598849eec.22.2026.03.06.10.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 10:13:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <32fe758f-680a-4001-83e0-da35cd34b9d4@roeck-us.net>
Date: Fri, 6 Mar 2026 10:13:17 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Remove use of i2c_match_id in PMBUS
To: Andrew Davis <afd@ti.com>, Chiang Brian <chiang.brian@inventec.com>,
 Erick Karanja <karanja99erick@gmail.com>,
 Grant Peltier <grantpeltier93@gmail.com>, Jeff Lin
 <jefflin994697@gmail.com>, Cherrence Sarip <cherrence.sarip@analog.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306171652.951274-1-afd@ti.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260306171652.951274-1-afd@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/6/26 09:16, Andrew Davis wrote:
> Hello all,
> 
> Much like we already have done for HWMON top level drivers,
> we are removing the i2c_match_id() function from all hwmon/pmbus/
> drivers now. Using i2c_get_match_data() can simplify code and has
> some other benefits described in the patches.
> 
> I don't have most of this hardware, so testing is very welcome :)
> 
It looks safe to me, so I'll apply the series. There is a potential
pre-existing problem in the ltc2978 driver, but that is really unrelated
to this series, and it is better to fix that separately anyway.

Thanks,
Guenter

> Thanks,
> Andrew
> 
> Changes for v2:
>   - Moved enum value [2/11] to prevent 0 from matching valid device
>   - Trimmed all commit messages to only patch relevant info
> 
> Andrew Davis (11):
>    hwmon: (pmbus/bel-pfe) Remove use of i2c_match_id()
>    hwmon: (pmbus/ibm-cffps) Remove use of i2c_match_id()
>    hwmon: (pmbus/isl68137) Remove use of i2c_match_id()
>    hwmon: (pmbus/max20730) Remove use of i2c_match_id()
>    hwmon: (pmbus/max34440) Remove use of i2c_match_id()
>    hwmon: (pmbus) Remove use of i2c_match_id()
>    hwmon: (pmbus/q54sj108a2) Remove use of i2c_match_id()
>    hwmon: (pmbus/tps53679) Remove use of i2c_match_id()
>    hwmon: (pmbus/fsp-3y) Remove use of i2c_match_id()
>    hwmon: (pmbus/ltc2978) Remove use of i2c_match_id()
>    hwmon: (pmbus/max16601) Remove use of i2c_match_id()
> 
>   drivers/hwmon/pmbus/bel-pfe.c    |  5 +----
>   drivers/hwmon/pmbus/fsp-3y.c     | 13 ++++++-------
>   drivers/hwmon/pmbus/ibm-cffps.c  | 16 +++-------------
>   drivers/hwmon/pmbus/isl68137.c   |  4 +---
>   drivers/hwmon/pmbus/ltc2978.c    |  2 +-
>   drivers/hwmon/pmbus/max16601.c   |  2 +-
>   drivers/hwmon/pmbus/max20730.c   |  5 +----
>   drivers/hwmon/pmbus/max34440.c   |  4 +---
>   drivers/hwmon/pmbus/pmbus.c      |  4 +---
>   drivers/hwmon/pmbus/q54sj108a2.c |  5 +----
>   drivers/hwmon/pmbus/tps53679.c   |  5 +----
>   11 files changed, 18 insertions(+), 47 deletions(-)
> 

