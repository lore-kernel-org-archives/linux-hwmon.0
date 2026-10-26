Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051810;
	b=DqIHZz5lyHGSTTF/oewp8Wy6h1sXaavzqzOFVbLN57DmHOsid96OkrhaE/KDbwv/OHq5
	 pU6q8/BxvYy+m82pgDZfkscRefwmzqPPcvVmZKfi0eeplcDbVbDWYKxEJi82KVnBE4kgI
	 nFwrwMXy8fnxr56REYcgnMC0JZQ9oO5q/gx0douefUZem2yxh1RdsCOMOUaKOwWu0LteJ
	 HbrMLzKTgmYLl+bqZSD1Z308YZ0eaY76IHTGkKiVIAlnZjCui2aFHewwGzsq0lu2l1+DA
	 b8LVe918vInroFBXJoWdrvL7dzCp+dr124ebeoUysB0ICNeKm1Dzw419Ycih8ckVD2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051810;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=Ql8b3SPdd8YuwXyKaG5uxeVFoTrcOtPYj40d++K6fOE=;
	b=lUMWTXZwQQchvfLk97IgppBz96XEf/9rbc7zQUW99V6O4bGjWTcMjcaRjDXbL+fP0+rr
	 9hmb6mf3MpxhzOYR0QSDVv+nqQEAgAvpltuwBoaeCaJJDe0/s4PyjuM3E3R3XjCQ/jAf7
	 1SAdp8eNIXZMsBxLXN9Q6UKZn+aomaJjtpUczg61eDOg4QgbVWzmg4pbZgoQYUgNB5+87
	 nxZKstzxSRRwD/BlaK9o740EVDND+/T+QhjYiXKr6fLjraaUWzGulVqZIkNsoha4KV2B0
	 44ZhWVc62nSKoGazbjXPBw1nt+GTIsTBGAT1F3sE4rL+0xWkLbr7E1LHkc7jmZZ/nEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=pssl+oVo;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00CC606A31B
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 21:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B00CC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=pssl+oVo
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id LSJZxuk17v0ndLSgTxEKw5; Mon, 26 Oct 2026 21:56:49 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id LSgSxjc95BsONLSgTxEPzL; Mon, 26 Oct 2026 21:56:49 +0000
X-Authority-Analysis: v=2.4 cv=cqabk04i c=1 sm=1 tr=0 ts=6adfcca1
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=2sXmku2JeBYkAKbX80UA:9 a=QEXdDO2ut3YA:10 a=YLW5Y6rX8DFJjTE4N0y5:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=Ql8b3SPdd8YuwXyKaG5uxeVFoTrcOtPYj40d++K6fOE=; b=pssl+oVoGd78
	gvVzCBAqcriOZwGntgw5N3pqO0M9UuepaKSV0p+NQAtMCXkdApBVPDAYIwEsfgqT9v3ZYwhntqofm
	vE8/q2qdEHtFTc7U3YN5Q/UlFQMTZQka0+cqdAX0IG0Hqd/tmhhIxpoIEruZ9yq6GrT4rFJCUdpbK
	614j/o9gCv6FgVty+BrrXp7j/tYBWuZd4nyVvw9jBC0Ss4pOxIPEwVdvYOljb0Oc8GqsOwLq2ChTq
	kux3o/HBUOsu4QJwjKW2taOiqkRSCYfNbOBKV6rCbEja7dDGGsKj9bssadnYxgUZ2WFzODLi94mzG
	n6GcZycnmbS908LnirrnWg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45814)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLSgS-00000003lg7-2EYQ;
	Tue, 27 Oct 2026 03:26:48 +0530
Message-ID: <56a656d8-66be-41d0-9d9d-4533b3030817@roeck-us.net>
Date: Mon, 26 Oct 2026 14:56:47 -0700
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] hwmon: sparx5: add LAN969x PWM support
To: sashiko-reviews@lists.linux.dev, Robert Marko <robert.marko@sartura.hr>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
 <20261013125735.1542349-4-robert.marko@sartura.hr>
 <sashiko-outbox-169777@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <sashiko-outbox-169777@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLSgS-00000003lg7-2EYQ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:45814
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 17
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCibBURBJylzZtWT+s3VjkRnk5XmUihYeinvI5BvIA2dBCwxmejGQEcNaesMmhS+mt0F+FO8p4OjLHJg6xfeZG8Rl5TK6dmvXkhgB1EjU5WtuhpaxCif
 xjTpgH6ofF8NQV+uqa9YZ9fvjpGHgwnNPj6Juz7fnbhgYCJFZ/qhYnz/z7sej8wXXzcN4DRfvF0ZDTBW8StyDTchITec+1BTvVakTOyFevKAQvAMm4aSPW9Y

On 10/13/26 06:10, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] hwmon: redundant custom lock violates subsystem locking guidelines
> --

I agree, the extra lock is unnecessary.

> 
> commit 28a1c23dcff1b1ead30305d4b8a45894536ca4ec
> Author: Robert Marko <robert.marko@sartura.hr>
> 
>      hwmon: sparx5: add LAN969x PWM support
> 
> This commit adds PWM support for the LAN969x fan controller, exposing pwm1
> and pwm1_freq attributes. It implements a custom mutex to serialize fan
> controller register access and parses standard PWM specifier properties from
> the device tree to configure the hardware.
> 
>> diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
>> index 922c3c33a049a..5130140e1b579 100644
>> --- a/drivers/hwmon/sparx5-temp.c
>> +++ b/drivers/hwmon/sparx5-temp.c
>> @@ -41,8 +48,11 @@ struct s5_hwmon {
>>   	void __iomem *base;
>>   	void __iomem *fan;
>>   	struct clk *clk;
>> +	struct mutex lock; /* protects fan controller state and registers */
> 
> [Severity: Low]
> Is this custom mutex necessary?
> 
> The hwmon subsystem core already serializes sysfs operations for attributes
> registered with the info parameter of devm_hwmon_device_register_with_info()
> via its own internal locking in hwmon_attr_show() and hwmon_attr_store().
> 
> If follow-up patches in the series introduce a thermal cooling device that
> requires serialization against sysfs, the hwmon architectural guidelines
> explicitly mandate using the hwmon_lock() and hwmon_unlock() API instead of
> a private mutex.
> 
> Could this private lock be replaced with the hwmon core locking to avoid
> violating the subsystem's API contract?
> 
> [ ... ]
> 
>> +static int s5_write_pwm_freq(struct s5_hwmon *hwmon, long val)
>> +{
>> +	unsigned long rate, divider;
>> +	u32 data;
>> +
>> +	if (val <= 0)
>> +		return -EINVAL;
>> +
>> +	rate = DIV_ROUND_CLOSEST(hwmon->clk_rate, FAN_PWM_FREQ_SCALE);
>> +	if (val < DIV_ROUND_CLOSEST(rate, FIELD_MAX(FAN_PWM_FREQ_DIV)) ||
>> +	    val > rate)
>> +		return -ERANGE;
>> +
>> +	divider = DIV_ROUND_CLOSEST(rate, val);
>> +	divider = min_t(unsigned long, divider, FIELD_MAX(FAN_PWM_FREQ_DIV));
>> +
>> +	mutex_lock(&hwmon->lock);
> 
> [Severity: Low]
> Since s5_write_pwm_freq() is invoked via sysfs for an info-registered
> attribute, the execution is already serialized by the hwmon core. There is
> also no concurrency during probe() for this driver.
> 
> Does taking hwmon->lock here add redundant locking complexity that can be
> safely removed?
> 
>> +	data = readl_relaxed(hwmon->fan + FAN_PWM_FREQ);
>> +	data &= ~FAN_PWM_FREQ_DIV;
>> +	data |= FIELD_PREP(FAN_PWM_FREQ_DIV, divider);
>> +	writel_relaxed(data, hwmon->fan + FAN_PWM_FREQ);
>> +	mutex_unlock(&hwmon->lock);
>> +
>> +	return 0;
>> +}
> 

