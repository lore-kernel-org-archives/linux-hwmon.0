Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793145226;
	b=emTh5gge9fG6cQxj4FnpihdCDxBMk+dWd3q11im8oy43b9K+Fi5DpPWsMY5x+41B8x5P
	 8NJB8oHQARrKpC+C0mPcmgRdFOgv8EIV0s8kXi4lLxMbqZlGafmPk2o45a7D9/k7AMnpk
	 dPpnUh6Rj7nGFOZ6IfH+hq5z/Ozy1xSHB6CjJJOMI5fqBa2tesgHKd13ug6C6tKyhG8Jc
	 dJwLeehuHu2BSDMwsAM9ZS1+KvXSNN6lIskmSgSBh1jLQBe2ri2HpEE/jn1zljYNDiMcc
	 JSFl9RwvA0j5p18NfDOALBYR1ltLGfjjl1JIr9KOzoJg5jDe1KgULs4H+W5KkB/rxCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793145226;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=g2ZTjrdVZe/hJwae0DDMZyqDrn3UxtuOCJQnq1CLxJo=;
	b=c9f6+sJn+JFSRfn2RPomRDZfIChCHYUfzwVGZ6A2Wv9HSOw+gNyXRLANfGgp3EQbPNvH
	 ULme43opHX2FO9a3A2oP7ZM52UmGj8MTitY+nd0ccfYG58zcct1813SjbH/IWOtcXTdlS
	 mYPxPOgCRypBoPxAilqAasQQaOkh5ncM8JiyfdkZiI2g3cpaJUUHqhntVqnhFsod71cYd
	 lc8GEkz9pazl3erXi0xIMqfSHL/VzttbVvUSrJeupxCqeu1y3AJHKrlEarLf2D6iP8FPL
	 0vwWQo0YO1/xv4fFhjReeth7uiu69nQT0ZLddBZtFCPy8LZf6wAwJuS9EidXViyMzTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=TC3oitGK;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8D1606A322
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 23:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D8D1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=TC3oitGK
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id LpkZxAuUiLvgbLqzBxzf61; Tue, 27 Oct 2026 23:53:45 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id LqzAxKkMhs38WLqzAxVDHU; Tue, 27 Oct 2026 23:53:45 +0000
X-Authority-Analysis: v=2.4 cv=NvfRc9dJ c=1 sm=1 tr=0 ts=6ae13989
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10
 a=SesowdIJlHH8kaKYTl0A:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=g2ZTjrdVZe/hJwae0DDMZyqDrn3UxtuOCJQnq1CLxJo=; b=TC3oitGK2Pjx
	tNeJGOphfPsj+3gf5+rcrrajX7uZo2jITZPv47pgYxPr0FYz9S+UqLa8fJrpK8T3e0GeZaSa3W5As
	hDnjh0Cn5MiXAV5QLYK28nr9FajOUKzMdAQUuUmYB6pPtjHdnfQsKQfZwBSMbugisbLDcmYxo7FTr
	7KmLnHIwfwllIhJGns45bhEaAjI5TgJZBCi0UQZFzj6EctPAIs4lING3o7SAydnhsCycA46/RRv+X
	LfCReYcg0061JQvFHqRu8Ivck0OOJ2QrsT6kbUtMCuGvchLdv/fYdT9MlQIWRUCZSCWj3+78idC3W
	TVjV7STjLvwnNhTUB1RRMA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:46902)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLqz9-00000000ASt-1Y7C;
	Wed, 28 Oct 2026 05:23:43 +0530
Message-ID: <50272385-6d0c-48c4-9779-2ad59a1289ad@roeck-us.net>
Date: Tue, 27 Oct 2026 16:53:40 -0700
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
Subject: Re: [PATCH v2 3/3] hwmon: (fs1603) Add driver for TDK FS160x and
 FS1006 uPOL converters
To: Kevin Jia <kjia@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Abdurrahman Hussain <abdurrahman@nexthop.ai>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261020-fs1603-v2-3-0986107a5cd2@nexthop.ai>
 <3735b504-30ba-4656-927c-d321248102e1@roeck-us.net>
 <20261027232157.3395142-1-kjia@nexthop.ai>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261027232157.3395142-1-kjia@nexthop.ai>
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
X-Exim-ID: 1xLqz9-00000000ASt-1Y7C
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:46902
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHqRnjzURHABUEE6A/gjIhVOEISH0Yqs1XLLPin8qhqqExIwNlz+QCXOxxu4pppFxjY2737Y8NG5lQ32Th8eGi8UJL3XNIP3hIc13+4qdesRLB4D4rs7
 GkbbUg9Reiup5uEJHNKs9mVuqd/dvodmWKLTVI/exeF0GvdyLtfXSMxjLy79+TsvfE3qyR2SN14huCnx5v5Iejj8kvne4ozrutOY2yTiEBxOyEybKU9oBeti

Hi,

On 10/27/26 16:21, Kevin Jia wrote:
> On Mon, Oct 26, 2026 at 03:04:45PM -0700, Guenter Roeck wrote:
>>> +static const struct of_device_id fs1603_of_match[] = {
>>> +	{ .compatible = "tdk,fs1603", .data = &fs1603_models[fs1603] },
>>> +	{ .compatible = "tdk,fs1604", .data = &fs1603_models[fs1604] },
>>> +	{ .compatible = "tdk,fs1606", .data = &fs1603_models[fs1606] },
>>> +	{ .compatible = "tdk,fs1606-0600",
>>> +	  .data = &fs1603_models[fs1606_0600] },
>>> +	{ .compatible = "tdk,fs1606-2500",
>>> +	  .data = &fs1603_models[fs1606_2500] },
>>> +	{ .compatible = "tdk,fs1006-5000",
>>> +	  .data = &fs1603_models[fs1006] },
>>> +	{ .compatible = "tdk,fs1006-3300",
>>> +	  .data = &fs1603_models[fs1006] },
>>
>> Why those extra compatibles ? I can see that -0600 and -2500 are
>> needed, but the others could just use tdk,fs1606.
> 
> The FS1606 reports in 10 mV steps from a 300 mV base, while the FS1603,
> FS1604 and FS1006 report in 20 mV steps from a 600 mV base, so they can't
> use tdk,fs1606. They do encode telemetry the same way as each other, as
> does the FS1606-2500.

I referred to "tdk,fs1006-5000" and "tdk,fs1006-3300, both of which reference
the fs1006 configuration. Sorry for the misunderstanding.

> 
> So for v3, I'd like to move the bindings to a dedicated tdk,fs1603.yaml,
> where the FS1604, FS1006-3300, FS1006-5000 and FS1606-2500 list
> tdk,fs1603 as a fallback. The driver would then only match tdk,fs1603,
> tdk,fs1606 and tdk,fs1606-0600, with three sets of model data. I'd also
> drop the OCSet check and patch 1/3.
> 
> How does that sound? And is there anything else you'd like me to change
> before I send v3?
> 

Sounds good to me. I don't have any further suggestions.

Thanks,
Guenter

