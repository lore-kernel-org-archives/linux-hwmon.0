Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17C2366DB6
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777738880; cv=none; b=J0DxwdVq2yPn3YiEKgPIE+gASp25bapufW4yB7lEYwWYi/B5YK0+OmiCENbUsoyLDKVUg5Q5KCBYtoZ6bSUtr3a2msJ9D33LhiAR/cWtEdMe8mQvUhy1FNTU0mEx9vOf1fVxy1wLJ1WibmUgZPx9y59fy6DDZ/7LcT9kL1Xn9lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777738880; c=relaxed/simple;
	bh=4lcOWwOoovpMO5JkId9lOWhkOIZF6lSTx38XB75DQhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9E7fy5VyFTSwQw157kr9X3K1ebaMiHXv1iMBJShCFRbzNLKh/IE5HTpcDWpr8Mzxp1Xth2h1s5FtA81IYOmi+91zk/34wPC7HVusgeKyT779+b436fnsfOZXNt0jtxfa18LRjh6YhVWh1aTq0CGtQD2TmqkM4upE2jfjY+cRls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUNU5LcW; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUNU5LcW"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ef84d016d9so2435211eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 02 May 2026 09:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777738878; x=1778343678; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nStQiooF/IuN5DSIiAanMcTFav97M7ip63dFpkHzmq0=;
        b=IUNU5LcWpwdAXqyt78hgdNlbu+VVZ29/EBkiRvBSCTPUbeMMPg+TVOYDQN6UCLWoMy
         KiVYniqRSQdu7g3blFchXfwzZyhsqlFqEM2/38uvF6U5irrup7E3yHpVTb4yws3V3B49
         kni+k/s0iK0axCOGtNPJjgYBRRx+z0xDi+I2t/zR9F32uxRDe5c7DJIakP2eiTkhId/N
         T6el+3MvbOPcS1i9ZqKTvaMH+OXL5xA7V9ASc10GgB8jH2hQrRR/ThXvQPPnVojQgtHh
         ezWPrXL8AnDu9agoE7SVqDmMPYkGdR5bplZVQzifmKSKSk8FLxLWujC9yLfvAeEDHio5
         XzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777738878; x=1778343678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nStQiooF/IuN5DSIiAanMcTFav97M7ip63dFpkHzmq0=;
        b=SlqDge1xe8pIqbZR6PO6udoayw0Auy12388klMcwSvNNPfxC3UCqIUUyZcpQLvxdzX
         dBepdBwKPcsxGh3lqR2fdRMDVa/g/n6R9Mn7kXDaTtwDvXD5f3cQ11Uqmrm8dBz5A3Dk
         V6uN7517Lr23R/JO5PgIk3WFvPztSQrgZAuoTgeD3dtnmYeur8B4J3brxFLhDFEXuOHt
         YUYklG985PllbXR9rgJqKPMa7LhULIeLGHLcSJPRjCM7/cTKQZucR+JNlQ6Wl+rKC14Z
         02vgfLH5L/XDsU6GM3OEzbEW2JJwWBRrMPsg1/3ISL2hacq5vk5Pcus+TAViJGzV3Y4m
         1crA==
X-Gm-Message-State: AOJu0YzFNrR7PaQwEtQwFJSy0kABLymRFp2tON9l/MGWPjKXiNRwDIbk
	F2I333s4cOR869WWqHeD0WGngI+9O31aUVkf+L8XA2HXK4WYNLOMf7Bj2lSp5Q==
X-Gm-Gg: AeBDieuBMruIpR+UX6PodLnbhU+aUNcZp/6I1pUMc9fRlizq9Hl4aABmPhIBYpzNitf
	YM2QqOKMwrQlasSkvbjGPAXnjnytTmgaFPnOE9s6aqSe10BKppXv+N4v11RoeztIU4L5yx89Reo
	KlluMBhnLKqit8EUoMkco+A4vzQ/N0Cl/L+lkEe3ihP/C8Ivy/7pF8V+1yn98fL1YvFauFW9i+C
	yRtWArTW+OrgX9FGoi6Vf6iWgYF4bVy1maWf5RxiNWXPJ5uE6JquaJxTL+uPbKs+hbk+mZmEfxI
	8flF/vc99klguqkqvkNrZzr6LoHK0R+ras9IL5k+mFgMRp6RxzMXTO+NTNlwGDLShR2WunfDz0J
	3LMO2QJirAD1XPGMmnSmSDD2/b4Or5RgKZi0symZwOOWN8BwoqY2UKCJ2rixQp4YmI7gRA7TcEA
	rfZ4ARz1ENUzcAoGyd7cDM4kkSbIYZx1TCXw2MvNi6hK52CL6/U75t2efUBmHFHOrjBxoqks4BJ
	kj43t/laGs=
X-Received: by 2002:a05:7300:8186:b0:2d9:fa9c:87a9 with SMTP id 5a478bee46e88-2efb79cbc97mr1566398eec.5.1777738877505;
        Sat, 02 May 2026 09:21:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3c05dc28sm8461990eec.30.2026.05.02.09.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 09:21:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3044ffed-b9a8-4a30-852e-2689b0cf0118@roeck-us.net>
Date: Sat, 2 May 2026 09:21:15 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: =?UTF-8?Q?Nuno_S=C3=A1_via_B4_Relay?=
 <devnull+nuno.sa.analog.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
References: <20260502-ltc4283-support-v13-2-1c206542e652@analog.com>
 <20260502104311.0D48EC19425@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260502104311.0D48EC19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/2/26 03:43, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Read-modify-write operations on hardware alarm and fault log registers will cause concurrent events to be lost.
> --
> 
> commit 768d24f774b79f50e1444b93b756d7bda5873159
> Author: Nuno Sá <nuno.sa@analog.com>
> 
> hwmon: ltc4283: Add support for the LTC4283 Swap Controller
> 
> This commit introduces driver support for the Analog Devices LTC4283
> Negative Voltage Hot Swap Controller. It adds functionality to monitor
> voltage, current, power, and various hardware faults via an I2C interface.
> 
>> diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
>> new file mode 100644
>> index 000000000000..d8931c9a4685
>> --- /dev/null
>> +++ b/drivers/hwmon/ltc4283.c
> 
> [ ... ]
> 
>> +static int ltc4283_read_alarm(struct ltc4283_hwmon *st, u32 reg,
>> +			      u32 mask, long *val)
>> +{
>> +	u32 alarm;
>> +	int ret;
>> +
>> +	ret = regmap_read(st->map, reg, &alarm);
>> +	if (ret)
>> +		return ret;
>> +
>> +	*val = !!(alarm & mask);
>> +
>> +	/* If not status/fault logs, clear the alarm after reading it. */
>> +	if (reg != LTC4283_FAULT_STATUS && reg != LTC4283_FAULT_LOG)
>> +		return regmap_write(st->map, reg, alarm & ~mask);
> 
> Could this read-modify-write sequence cause concurrent hardware events to be
> lost?
> 
> If these alarm registers use write-0-to-clear semantics, writing back
> alarm & ~mask will inadvertently write a 0 to any new alarm bits that were
> asserted by the hardware between the regmap_read() and regmap_write() calls.
> Usually, a direct atomic write of ~mask without reading first is preferred
> to avoid clearing unrelated active alarms.
> 

Sashiko comes back to this one. Looking this up in the datasheet, it says
that alarm bits are reset by writing 0 into the alarm bit. That isn't
what is done here, though. It will write 0 into any alarm bits which were
not set when the register was read.

Should this be something like the following instead ?

	alarm &= mask;
	*val = !!alarm;

	if (reg != LTC4283_FAULT_STATUS && reg != LTC4283_FAULT_LOG && alarm)
		return regmap_write(st->map, reg, ~alarm & 0xff);

That would ensure that only the checked bit is cleared, and that it is only
cleared if the bit was set when it was read.

> [ ... ]
> 
>> +static int ltc4283_reset_power_hist(struct ltc4283_hwmon *st)
>> +{
> 
> [ ... ]
> 
>> +	/* Clear possible power faults. */
>> +	return regmap_clear_bits(st->map, LTC4283_FAULT_LOG,
>> +				 LTC4283_PWR_FAIL_FAULT_MASK | LTC4283_PGI_FAULT_MASK);
>> +}
> 
> Will using regmap_clear_bits() here and in other history reset functions
> also risk losing concurrent fault logs?
> 
> Since regmap_clear_bits() performs a read-modify-write under the hood, any
> new faults asserting between the read and write phases might be cleared
> silently. Direct writes using regmap_write() might be safer if the register
> behaves as write-0-to-clear.
> 
Again, looking into the datasheet, I agree. It would be safer to explicitly
write something like
	~(LTC4283_PWR_FAIL_FAULT_MASK | LTC4283_PGI_FAULT_MASK) & 0xff.
This would avoid accidentally clearing bits which were set between the read
and the write operation.

Thanks,
Guenter

