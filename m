Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732514;
	b=m2xbt8eq2dHQ3bmjiT+dFB+kmLTQg7uzzXtiwSelsIfUz1uyxvdhNycVjmEewJ9PsZWQ
	 lLgLLM1MVItduMQ+LRfOPSxItIYbPkHQyFI+E0QjG/87kkg2V3XicYaOiuEmBS0Fir2Fr
	 q8JbWGbIiXw2fHsKwMy5DbWemrdL/+7/6kv9OD42ipt4LWZPDluZgRJwGWfLFjORnnSd0
	 c4EB2249RgevK9U1OKfagWA1tHQE4J+2nL0003HtyPHpXFw6V0ld5/1L0RATBw0CSQQeO
	 WuAveBbWqBBBKudn/n+pIJ4MGr0rxUGHP9Ec4e3k2k+pLzPIzX2QHKmNGj+5FObYtbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732514;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=maTYNqXfFAY69cSpc6opfZJvoIuN11Pb3q+sIsW3tDo=;
	b=sOIzXHbq8iFHH6YA+Ql4Ab08O1Fzg3PYWaY7obnTuO0MBzzg8KOoPDWZ1VQjEhJpG60e
	 IG12FosAhKL6u5G4TutvRuVniNQFOly1uy2492iEGdpq9nfcQXL60/9Y1YNf6A2pkZijC
	 6dcGkNgenl65NfrM9ZNNF2MiWFOruRmPp6A+i69/C4fWYdGC1HOJJ0uYFzcuf0C1iApSE
	 adGDwRl3gmPxeWwlfWmrU4IyFNPnwWTbQipVsjxpSVMI9hgK5llYzyDylYvy2MHnGDdrp
	 OKU7oPNPxcLJOCO+mAjTBIYS+KYcRO3nDMShH3idwskKM5BFAopcOpvBUFgsfAZNHYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="CmuPm/sw";
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D6C606A31B
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 19:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D6C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=CmuPm/sw
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id ODaCx61oeJFmFOJlSxJWuc; Tue, 03 Nov 2026 19:01:46 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id OJlRxE7roq5xIOJlRxJm9N; Tue, 03 Nov 2026 19:01:45 +0000
X-Authority-Analysis: v=2.4 cv=RayQC0tv c=1 sm=1 tr=0 ts=6aea2f9a
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=OwA5jd1rZCiFzd11u2cA:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=maTYNqXfFAY69cSpc6opfZJvoIuN11Pb3q+sIsW3tDo=; b=CmuPm/swj04d
	XbamulP6qZ++BU6AOZzfnMaWZA5Dgn6E7JQMHUx1rzBOxFe7aRxbY4Dk5G6DI6tfzwihuSS4hDzg+
	4WbLpEytcyhxxTuadwMRJKoZ7adaKihrE5MSlJ1+OL9u4ibEu/lFy0KB+4oMYnuqxIFT+YK/fhJ8j
	M+t3CqeNgoCcN3CeeYAdkyBgMBMf4VJJz9bsY5ARYDhQ8SrOlWB2hw5BunbyL8TYhJqmz55XaxfXe
	PQJAMVUak+8BCHTZVzFWvMpiEsIS/ddS4gCm+mcnryhSdYuVD56jh290iXfw0TQcZLzpadECsnDaS
	rei1T7liyBAsWgpkJI8GTg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:35238)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOJlQ-00000000tBr-3MVl;
	Wed, 04 Nov 2026 00:31:44 +0530
Message-ID: <68df61bb-9d33-45bf-9f24-2bb849abbffe@roeck-us.net>
Date: Tue, 3 Nov 2026 11:01:43 -0800
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
Subject: Re: [PATCH] hwmon: (nct6775) Add support for NCT5525
To: Anton Lundin <glance@ac2.se>
Cc: linux-hwmon@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>
References: <20261103132948.144216-1-glance@ac2.se>
 <9e1f1a68-ef65-4e38-9396-48836ff50979@roeck-us.net>
 <auoa+d1nBZeD3U7s@accum.se>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <auoa+d1nBZeD3U7s@accum.se>
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
X-Exim-ID: 1xOJlQ-00000000tBr-3MVl
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:35238
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJY02M8WZGi31XG2HC7PooD6/WKrzIGExOtW9uIA6rfY1FwLckxSgD9V73xzAghv3ooSOeI0EQvMal4hM/EM0geQ0SZfYuW1GHOs3SOQ0o23yMPVP39H
 lTFyl5cLwtGlIGQ0P3nGPkJtRc5j3n1e3UNW5NIMcDK3G806Pf4s/R5FKyp2M4zAvohEpN6LqYAKz1f0JKbya3f1XniAfCNuBJQzAjdF2KQXz4HARA/zSK2M

On 11/3/26 09:33, Anton Lundin wrote:
> On 03 november, 2026 - Guenter Roeck wrote:
> 
>> On 11/3/26 05:29, Anton Lundin wrote:
>>> Extend nct6775 driver to support NCT5525.
>>>
>>> Assisted-by: Copilot:GPT-5.6-Terra
>>> Signed-off-by: Anton Lundin <glance@ac2.se>
>>
>>
>> I don't havea datasheet for this chip, but I do have to say
>> that this seems to be off just form chip numbering perspective.
>>  From the registers it looks like the chip is mostly compatible
>> with the NCT61xx series, but NCT55xx chips are typically scaled-down
>> variants of MCT67xx series chips.
> 
> Yes, its quite close. My first quick-n-dirty stab in the dark was to
> just alias it to NCT6116, and that worked surprisingly well.
> 
>> I _will_ need to see a datasheet
>> to confirm, or at the very least independent confirmation that the
>> driver is correct.
> 
> I have a datasheet which I could send you if you'd like, or if you
> rather request it yourself from Nuvoton.
> 

It would be great if you can send it to me. I tried, but never got
through to them. The form just did not work for some reason.

>> Some more comments inline.
> 
> i'll go through it and send a v2.
> 
>>> --- a/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
>>> +++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
>>> @@ -25,6 +25,7 @@ properties:
>>>          - nuvoton,nct6797
>>>          - nuvoton,nct6798
>>>          - nuvoton,nct6799
>>> +      - nuvoton,nct5525
> 
> I mostly added devicetree bindings because I saw that all the other
> variants the driver supports had them, but then I noticed that nct6126
> was missing.
> 
> I won't consume the devicetree bindings, so should I rather leave that
> out until there's a consumer for it?
> 

Your call, really. If you add it, it will have to be a separate patch.

Guenter

