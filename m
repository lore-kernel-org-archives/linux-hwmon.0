Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD943815C3
	for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 16:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774803128; cv=none; b=VOuNfmJB+vv5fqjP9gyxcLgrISbkR+GWOHz6V2f5yBPeLDDWnW9Bb0Ui5Y9RB89Gb2NgWZa4yIPL7MrB1kd7f7FLK0X1h/Qlbvj+c4GeXrEl/yLvFQKD1VQs306x/42PEK1Z1O7lEjOHqF7nQszHbuI1J8tkHCAQF+VGQgxysYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774803128; c=relaxed/simple;
	bh=QgUkhoCHKdMY4BAB1749UR77ZswHDSxHL9naJcq/fy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZeCayqeZosFhDUoz8juLpmoGB9twPvTdcQo9hiXWBGK3WSOxeQ2jA9P5kYuDM9Ugy3favpUN6jia6PaMLjbosHvtwFgNLHKh9O+r6Is0OmWqc+/5yoB1YOz0XGQUxsPUVkeQIkw+pqVm/nARf6gTgNfPgPxCPP5gMjrYcK1kzz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=osJm/opG; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osJm/opG"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2aae146b604so22057655ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 29 Mar 2026 09:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774803126; x=1775407926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bVG7KEyomhALkFaGSEXjFcWkz3Zg3KUEM/4SaD0Pivc=;
        b=osJm/opGm3blxaRMHpx71MOmzono/NEhe76Fcj1W9qXnc8CFkUwx+ObnNbMllqR9iq
         5u+kbjOH2b8hxizFv5mWxT7vH9s3Sw76OR9RzjGPq7OEWM8Yedu9L67pTFDH+4tGXPxA
         btoMj2gxc5MeqrO5mTwgF3YGJuaMi83j+zLjaSJ8YI2Ugvnw0JFb6IHhLpNeXzK9+nbn
         LPVNFw5cf+qlGQWG6ydoaOvqx2pvMeYb0PmZqw+N8Dm3TJgQFYJ8n3ORK6T0h1v/rBIn
         1RiVhziO78ZXaDkg45QX6R0hLd21po3w3tXiYqJJiqBGe4xoyD/EZ+Wfyp1Ds5tBPzve
         PfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774803126; x=1775407926;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVG7KEyomhALkFaGSEXjFcWkz3Zg3KUEM/4SaD0Pivc=;
        b=pbp/pLvl09aaWXjccEwMO6oUPC7abHRP9x4GBhYemdCPInfFtTErmLsNOFCTuJYQrp
         yiUDHD00zR+/RlbAlg7ikSEKZuBmrYhlfvC5wucgv6oI/U75TFP6ravBzmKuXmf0RibG
         IIChdLXjUk32IfIIbpOQOpqapnJleaZkN2nxo+e6SH07LZUeL8Q9EauPjv6mJIUDAQJY
         Z8duWypEAn09IkUzfaHquBeUes9hjUzdoBNU4an+Yvb2DP2yoS+5MF2svUAbcJDtCHwC
         46l5a59oVg7UOizTErxfjdlHuqkU5nVNyNsQ9x4f878FjbhI3Gy7bGD4nTHPKtnzOPU8
         LT3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOmMbIUEe8JfnXqMFuqkXlkP/UX7OBTl1jhZL7xNu9Fks01qFEaUK44hAjCYRnxD3+xWBfo/5dXKDW8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YznflNLJVAxXWHqdECRlii60feXiwFafuT89YzgLUDOjJ48PyBb
	QmFS2USqu1Ff8fUKecDzZacEUkQcXCvFW0mcSLKOb2j2vewfKEt8Pbnn
X-Gm-Gg: ATEYQzwUYowStuX6/MmYDqCD4XKnVQyTe9yD+9nWKsrUqV05aH8wPSUMdPmN8hVT/QU
	DklDicMlKJ2KMFR8Ol/kW8Z8wswXKUeik37Y4WRY/rWrTXwmAVcbi53HETNCw68qW8pe/8GG9w5
	vwzDnLV2Gm7EsDAFgZX+et1K1o3N/GlOYY6ZmFBOeJl5vDKBDqzeGVcPFlGY4SIP+PZWuMfp9nX
	1lEteVRnBjoQc/CQvire7rmSQxUGRGWa70sRA6bLajq3tg7DYN/61mzUU151L7DJi9jrALV8u5z
	TyejzrAxgM1MEMlP+Sd7ydqiBujwCVa8CRRBPOEzCpGco4x6G2qmGGBxAFudP4maBP8nHgHebbq
	gXoHHpvoA5xrpZaYi1mP1TA6NiZjg6iI4tGCd1N0Sv3aFuuQ9yHMjLRgWymNBuOsIxc17x5UJDR
	PuTlolSijwJ2rx+e3u9lScnTbKFadPTzwtbyI/9N8P/8tPf/PiQQpDs+5+okWQEp5xTfmgkpJrM
	tWCDzuTvKg=
X-Received: by 2002:a17:903:1a86:b0:2b2:4e1a:aff9 with SMTP id d9443c01a7336-2b24e1ab2aemr22705925ad.44.1774803126343;
        Sun, 29 Mar 2026 09:52:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242676e13sm55903995ad.28.2026.03.29.09.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 09:52:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <20a29a60-6848-43cb-be2e-4e63c8602462@roeck-us.net>
Date: Sun, 29 Mar 2026 09:52:04 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] hwmon: (occ) Fix bugs in power sensor, extended
 sensor, and remove path
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>
References: <20260326224510.294619-1-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260326224510.294619-1-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/26/26 15:45, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> This series addresses three bugs in the OCC hwmon driver
> (drivers/hwmon/occ/):
> 
> Patch 1 fixes a possible division by zero in occ_show_power_1()
> when update_tag is zero. The power_sensor_1 code path divides the
> accumulator by update_tag without checking for zero.
> Commit 211186cae14d ("hwmon: (occ) Fix division by zero issue")
> addressed this for occ_get_powr_avg() used by power_sensor_2
> and power_sensor_a0, but the separate code path in occ_show_power_1()
> was not covered. The fix reuses the existing occ_get_powr_avg()
> helper which already handles the zero-sample case.
> 
> Patch 2 adds a missing trailing newline in occ_show_extended() for
> the EXTN_FLAG_SENSOR_ID case.
> 
> Patch 3 reorders operations in p9_sbe_occ_remove() so that
> occ_shutdown() is called before setting ctx->sbe to NULL. The
> current order creates a window where a concurrent sysfs read
> could see a NULL sbe pointer before the hwmon device is
> unregistered.
> 
> Sanman Pradhan (3):
>    hwmon: (occ) Fix division by zero in occ_show_power_1()
>    hwmon: (occ) Fix missing newline in occ_show_extended()
>    hwmon: (occ) Fix potential NULL dereference in p9_sbe_occ_remove()
> 
>   drivers/hwmon/occ/common.c | 20 ++++++++++----------
>   drivers/hwmon/occ/p9_sbe.c |  2 +-
>   2 files changed, 11 insertions(+), 11 deletions(-)
> 

Please check

https://sashiko.dev/#/patchset/20260326224510.294619-1-sanman.pradhan%40hpe.com


and either address the problems or explain why they do not apply.

Thanks,
Guenter

