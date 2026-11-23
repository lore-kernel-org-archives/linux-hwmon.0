Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451314;
	b=EybeUuJeUEvfyVkco/5mpwes7mDznpLR7BG6pDX1sUJ84/Y8bZv5oSsG2IW5yq0JrEXn
	 DQ3yXbdnfqHD4P48rtZ9X0APeeW3pu5YDF3Iaa9TkbSHxtsuwXkDoXJZ1fxhPfYlOd0cx
	 ZHPhFdNeYwAy0zbHuT1s4xVhYRcUq00R/+247VB8hmBx7y0u0xWAhNpRqG/+BMFexyNJf
	 qqk2q6HGUXHqoQfBIXbLtgV/SZz3HGQNDoihc6bR71SoqNvE4PvOQu1f8fqhiHNqS3wPJ
	 AoG+8qxR9Twll3U8D5yhvfI73ijg1p3+4/r8cCqci8PKGwzNPdXaAxsyFfpUPJ4bmXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451314;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=ztoU6Q2hWVr7fpLoUVyvFQJEz4Wl66bCozSJLnVZ0cU=;
	b=5QDyIXL4VKJNYnEVzSnGh/HN+UTsGuGSlop0Bd/0e+5e7h6emEABW5SljdX7P8xeDqcJ
	 Vtq6dKT47DEftvmVVVLh/8YpAGY6dyDmOuH6RP1oirJrkvnViaoX1AwrNTKNyfSl7pqOs
	 pcsSKTA6LwE4jgqitbOQnelR5uLQ4CTZg41V4CH6NJGypQ/TaokAyN5TiDly1RIExO1jw
	 vixsNKKf0eWYmq9f/LBIglHKS47cgNM6HmM9szhj4wfgA5SlsvYNDmEsIZh6V/SXuB9tl
	 U4MtmGbnse/5u1mXLkdWd0N39T40afJ6/C4HymYHHuFVglolFUiq9jUh77b23XtQY2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=faoLUWeL;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B77606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 16:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B77606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=faoLUWeL
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id VKHjxGQUaOOJnVWu2x6Kpq; Mon, 23 Nov 2026 16:28:27 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VWu1xNojK3nNNVWu2xJjUW; Mon, 23 Nov 2026 16:28:26 +0000
X-Authority-Analysis: v=2.4 cv=TuLmhCXh c=1 sm=1 tr=0 ts=6b0469aa
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=RhJsnZNeteWDwaqiTEoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=ztoU6Q2hWVr7fpLoUVyvFQJEz4Wl66bCozSJLnVZ0cU=; b=faoLUWeLumuj
	/B/5iAswsFq4V3AL6LdgLGEULIxv4zQblPly8VDwFZacc13JPY9AlcX4FgKeC41m+1rao+oB+rdj2
	NwyklE7jdLTBj6f0C2kC0KDX6nyliGXuwy1i1A4e67bRZKo3A7v+rO54r5eZ5CFotwS6FegaHRHgJ
	8weA55v+/v20M7uzbYLXlJYUXIrv/7u4TInorbD3oBepAXuwGJLBHi8H/kImYveaBTtYXCLeO9RIp
	tvQexAgpBkdKoKnJ+5y+hOaqaY5QTBhGcxpK1PgvIHlfTkmwDDkOe2ZY60sxzxP+f+/WeDMcSS8QJ
	3FxTsPaZQoQ1IeIYwwyUrA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42700)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVWu1-000000004au-30gj;
	Mon, 23 Nov 2026 21:58:25 +0530
Message-ID: <47778357-5449-41a4-9def-e539653b97aa@roeck-us.net>
Date: Mon, 23 Nov 2026 08:28:24 -0800
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
Subject: Re: Unknown values check in acpi_power_meter
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.de>, linux-hwmon@vger.kernel.org
References: <20261123110616.1a3b8290@endymion>
 <f248e88c-e328-4118-9282-09f6829ebcc7@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <f248e88c-e328-4118-9282-09f6829ebcc7@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVWu1-000000004au-30gj
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:42700
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGInjtZWPXiv+/kmr0LlMmRhVb2OxDVGiPsdlXSZ0gk3pZUY367mlTd0+8hwuiZpQ90VJs53Wf3cihmBiUk00IbVL9dKLPBSUMk3/YH1KmMGZlGZCnWP
 Tjua/F35N2e10fM2FgybF5uHDkYUFHbUU1+vj6uotup4vijldk0A5y52HrZbAIB9WTLYcs3G6EAyBfebeW6ZHA9T9Kp5PjsTcdovhTe6t2zVk5Cya9cn6KT8

On 11/23/26 08:23, Guenter Roeck wrote:
> Hi Jean,
> 
> On 11/23/26 02:06, Jean Delvare wrote:
>> Hi all,
>>
>> I have a concern about the following construct found in the
>> acpi_power_meter driver:
>>
>>> /*
>>>   * ACPI integers can either be 32-bit or 64-bit wide, so
>>>   * we have to check for both values.
>>>   */
>>> static bool acpi_power_meter_is_unknown(u64 val)
>>> {
>>>     return val == U32_MAX || val == U64_MAX;
>>> }
>>
>> If the implementation is returning 64-bit values on a given system,
>> then only U64_MAX means that a value is unknown; U32_MAX is a regular
>> number as any other and should not be handled as an error case.
>>
>> Don't we have a way to figure out whether a given ACPI integer object
>> is a 32-bit or 64-bit value, and only compare the result with the one
>> appropriate special value which means unknown for that integer size?
>>
> 
> I didn't like it either, but I asked Google search. There is
> acpi_gbl_integer_byte_width, but it is not exported. It recommends
> to use the above code for modules. I don't know of a different
> mechanism.
> 
> In practice, the value is checked for properties which should never
> be even close to U32_MAX, except for the power value. For power it
> returns -ENODATA only if the power is exactly 4,294,967,295 mW,
> which I found to be an acceptable trade-off.
> 

Actually, this didn't really change for the power attribute when I
introduced the above code:

-       if (ret ||
-           resource->power == UNKNOWN_POWER_32 ||
-           resource->power == UNKNOWN_POWER_64)
+       if (ret || acpi_power_meter_is_unknown(resource->power))

...

-               if (res->power == UNKNOWN_POWER_32 || res->power == UNKNOWN_POWER_64)
+               if (acpi_power_meter_is_unknown(res->power))

It appears that the original driver author was aware of the problem and
didn't know a better method either.

Thanks,
Guenter

