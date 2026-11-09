Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236485;
	b=nbcG0hiwG5sZT/1SIrOsZquQCTU6Xd++ZKUQFUMwLt8NUajyVu1nU+MktsyBIPgu/YT8
	 kzUbHr/xWII/K7e1S1+wQD6a4rQUZ2V/3hbaXDFgrpRuz1fiuDY6COgEh7zQXA8KvgDuH
	 qH3UcuEbASzkuENs3SjSgEezhTE7PRl+H1fRJrsSrzobs14q73GI2AL+xa6hJlkjc8iSq
	 Xi1lZ9NJZSYXfQG8uJBG1lj6lecSffqj3YauLwWsFBYmPLFQ3mint4uFshx1lazmtWmH0
	 pCxNfhX8gPsOY2ypHkEV4JcC3QQf9N6pfIMTO9XxdGeUbATjH0Mkz9xsK49JgP1qv1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236485;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=pE/zoHsVh2hvD+ALrCiRyBI4CZ0z8Da+B0aHYRWc3dM=;
	b=HapYij97uTeK2c60vVYqi6O6i8eM65yNZTAEu0iVDzZW/Ok1Db61G6wre+Ij5O/n3sPC
	 d284pI9DDAJF9bjEuQuJY3R0SO7Zq7M+UdlfDxAMkduHEsCPl7W98d3hk/0FyzumfQKOK
	 wOJ+q0Enh1nGib0vZCDrqL8ukgD5aY8Qx5D8ioyu1801era64XMMIfydXvx+EL+Tmoleq
	 vt38A5kQN06wHWWKeJM4j8IsqCHdh4K9kWq0BQAadwWkY0NJp4YzyXx1Aq+aaDJXX9Nfm
	 8+E4FN+18VfUjr6PAUbO7LvpvBtLMB/YVIfM+ekdYUAbJhVtxaoboox55aDzp5u7xtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=mSYSnkdX;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6C2606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 15:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F6C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=mSYSnkdX
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id QIQGxqBpeVK9UQQs8xrDBT; Mon, 09 Nov 2026 15:01:24 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QQs5xcoyHuJrPQQs5xjhnU; Mon, 09 Nov 2026 15:01:21 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6af1e044
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=jgqPS7p6Ee5OVFubFSMA:9 a=QEXdDO2ut3YA:10 a=7K6VwESCuAkwX747YaXk:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=pE/zoHsVh2hvD+ALrCiRyBI4CZ0z8Da+B0aHYRWc3dM=; b=mSYSnkdX6ub7
	zs4PHiV5ehrwnEpyCU6Rf4NW+Brts0HWGJ2/8iT1okFEDdjAzPln0j1xPc/5AD35QLT99vhL2NGkK
	k2bPJDCRGMfnNpH4dhIlj1Yi4M/26g0KlyRAOTccHgreZGOmnOjMSvEpeFbrAMl/4+aPErH+3IR2a
	F2BKYu7nd0PrCTh62I+vq1r0PtB7tGU+5JIQImI4gYrgBmvawtikl9sgHCytxT4VkVnIyc2FT0nFL
	dy3iU45S5qMMaBuRsedrMt/ou5clGcAsu+6e2XoQy2AFlIwSbCI+5spKrM4ujANpPnW4KhqqY9Sd5
	gMZtKCzWZt7eQPZrU1OYMg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37372)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQQs4-00000000zu3-3RM3;
	Mon, 09 Nov 2026 20:31:20 +0530
Message-ID: <8986a7fb-f822-4b05-8aae-a948b893e5a7@roeck-us.net>
Date: Mon, 9 Nov 2026 07:01:20 -0800
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
Subject: Re: [PATCH] hwmon: (dme1737) Use str_yes_no() helper in
 dme1737_init_device()
To: Archit More <architmore303@gmail.com>, Juerg Haefliger <juergh@proton.me>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261109121127.10937-1-architmore303@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261109121127.10937-1-architmore303@gmail.com>
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
X-Exim-ID: 1xQQs4-00000000zu3-3RM3
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:37372
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCtAzhtAFLhro/vSrsZcV4krbvJhU10OQsNM9NlG8n1WH3L7XAiRO0fa0q3SgAd+8n9nHynOjm1rVDBAwtEkuvP9EUNB9KzH1+q+mkXfDt2kzz+YMO7Z
 lLX45cQqMxzNyourKL0ZEgsuRt6+R65wrudosX8yYUVhLVFtj4rbuOFGYzjGVSX0MBL5E9BqoLmqLbms2V+EkrPkquuVB75MR7vY+RHRsyPuTLVzzF17hiVf

On 11/9/26 04:11, Archit More wrote:
> Replace open-coded ternary string choices ("yes" / "no") with the
> standard str_yes_no() helper from <linux/string_choices.h>.
> 
> Signed-off-by: Archit More <architmore303@gmail.com>

Please refrain from submitting such patches. I will not apply them.
The Linux kernel is known to have thousands of bugs. If you want
to do some good, concentrate on fixing some of those.

Thanks,
Guenter

> ---
>   drivers/hwmon/dme1737.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hwmon/dme1737.c b/drivers/hwmon/dme1737.c
> index b1bd3682c5fb..c3bf5f4ef941 100644
> --- a/drivers/hwmon/dme1737.c
> +++ b/drivers/hwmon/dme1737.c
> @@ -17,6 +17,7 @@
>   #include <linux/module.h>
>   #include <linux/init.h>
>   #include <linux/slab.h>
> +#include <linux/string_choices.h>
>   #include <linux/jiffies.h>
>   #include <linux/i2c.h>
>   #include <linux/platform_device.h>
> @@ -2316,13 +2317,13 @@ static int dme1737_init_device(struct device *dev)
>   
>   	dev_info(dev,
>   		 "Optional features: pwm3=%s, pwm5=%s, pwm6=%s, fan3=%s, fan4=%s, fan5=%s, fan6=%s.\n",
> -		 (data->has_features & HAS_PWM(2)) ? "yes" : "no",
> -		 (data->has_features & HAS_PWM(4)) ? "yes" : "no",
> -		 (data->has_features & HAS_PWM(5)) ? "yes" : "no",
> -		 (data->has_features & HAS_FAN(2)) ? "yes" : "no",
> -		 (data->has_features & HAS_FAN(3)) ? "yes" : "no",
> -		 (data->has_features & HAS_FAN(4)) ? "yes" : "no",
> -		 (data->has_features & HAS_FAN(5)) ? "yes" : "no");
> +		 str_yes_no(data->has_features & HAS_PWM(2)),
> +		 str_yes_no(data->has_features & HAS_PWM(4)),
> +		 str_yes_no(data->has_features & HAS_PWM(5)),
> +		 str_yes_no(data->has_features & HAS_FAN(2)),
> +		 str_yes_no(data->has_features & HAS_FAN(3)),
> +		 str_yes_no(data->has_features & HAS_FAN(4)),
> +		 str_yes_no(data->has_features & HAS_FAN(5)));
>   
>   	reg = dme1737_read(data, DME1737_REG_TACH_PWM);
>   	/* Inform if fan-to-pwm mapping differs from the default */

