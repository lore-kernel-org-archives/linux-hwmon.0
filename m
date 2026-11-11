Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436475;
	b=HETKSueOB5wAzXBuMaXBhZ6NB6gX/GDWWBjJgixXD4DgpF3dgOV6PAxPg5u+2vLaKoXG
	 3K+/WkXLgonnpFBnHF64ojeD1qnivpODHdcrqnPzOXRXn1XQ7rS1gYtxUNNdCP5Q/4xoW
	 ds0NEuPfZhVpTAcVPsHypvB51/UljVU9FwWj9FSTdCQoveH4U8Yrhc0zvb2kbLvEPl8xk
	 Mo2cqe7Is0DDFy16YrIZn2rL9WzGHaOfyysJr+Pfllb5RyLnH/3hppFJM/mrmxu7S+w1Z
	 /NzoRHxk/rPFh4m1LxpAZEK5sdIKYDQUlsVTy8BBZ+5pLmx4KJw1OiHBy2TGO3b244g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436475;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=ZJetzjYII+dvJLUGzzos67gvRat/HORXrpI9b/r2uo0=;
	b=soF+58MXq/DJSsvRUFtFowF4grmJebfAije1Llr90YWGLEqLwkEfxFZAuZvXkPqjZsfI
	 0j4/gpYr47MFOg/58BQPSEV2CaJ9BdPdug6adbpQDXQH9ZDATaT3zKxMDABMmV0wGYq72
	 1FWKgZ4QS5wLD2uKV2YhVRM9etsFU9uYMsOde3Elr7FNA+do81sUP4JTfMAp3eGOIsVOQ
	 a3tjdbvPrlkS4yHs8JZsSBA8+SC5TLJcGo7jADbEJA9sUZY8YePIs9Rlu4aJ85qVT4L/7
	 CkiDluuE8S9lJy4TZ+EMuKiTm2woYIn/KKsAT4aO8S1pjBY50uxECXtds3XY4O7IBDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="Jdmm3/hJ";
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA257606A881
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 22:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA257606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Jdmm3/hJ
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id RDmNxbBQQAR1iRGtmxwi1R; Wed, 11 Nov 2026 22:34:34 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id RGtlxmgKg0288RGtlxtlBS; Wed, 11 Nov 2026 22:34:34 +0000
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=6af4ed7a
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=R5C9hjxsAAAA:8
 a=aTefX-UtI5BFv7nUFlIA:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=ZJetzjYII+dvJLUGzzos67gvRat/HORXrpI9b/r2uo0=; b=Jdmm3/hJpZuV
	kZ8PcMmeUM4RRREBnBu1G0ZHSvkFHcEBaDqVEvpaABE1irlPd+SPR4hDTsm/B7Uiid8ZUc5TaZpiD
	s053AG0GBp1qR7NBhy7A4pekzK4UeHrlvh5itgUzb3L3EU9KNgGN75hmI2IXZwq07R4lbFEx8v9bE
	h0CDxvK6wTORpJAXa8U3Vo5Cdjy+DDaMf7JmNTXvWWiyp1UPFBWWEV0buRAbsx/FPlP+gZF0w8A0i
	t1X0UudEWawdxGbCgYJYZIPMU5TBimLqUgkin733VYyMCXnZ34QubMG1izBHn3C/OjColNSzY9ei+
	0Y+i8xnY9yyBxqNxt0cOhA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42854)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xRGtl-00000003q4j-1V8L;
	Thu, 12 Nov 2026 04:04:33 +0530
Message-ID: <e5d8ded0-eb5c-472a-8c4a-5e5175759e93@roeck-us.net>
Date: Wed, 11 Nov 2026 14:34:32 -0800
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
Subject: Re: [PATCH] hwmon: (lochnagar) Avoid oversized shifts for zero
 readings
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: rf@opensource.cirrus.com, patches@opensource.cirrus.com,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261111064930.17408-1-zhujun2@cmss.chinamobile.com>
 <avQ2JvdLKIp51/wH@opensource.cirrus.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <avQ2JvdLKIp51/wH@opensource.cirrus.com>
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
X-Exim-ID: 1xRGtl-00000003q4j-1V8L
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:42854
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLaL/CoZZlNw22qs6bLpJLIxMdKnsqg3DlmWxS+V77eV73FkfoeyzWo/tqyheSee43ONDmWRUUE2UAtQIOpXRKo8RuyORUfvUUb9Y2nf/iyM///R9YEt
 KupCT+914rq2eGMvgC6bUkHtJQLR7BTgwRalb0nudhaI6EIcvT4mDwZeYIIsFXBoNCuW+hlUq0BDH2GmBoHaxc574NTBvWTj3xCgSHmwS7QpPHaZ8aRy66Nj

On 11/11/26 01:32, Charles Keepax wrote:
> On Wed, Nov 11, 2026 at 02:49:30PM +0800, Zhu Jun wrote:
>> A zero IEEE754 reading gives exp = -150 in float_to_long(). Both shifts
>> in the rounding expression then exceed the width of u64. UBSAN reports a
>> shift exponent of 149, and the conversion can return a nonzero reading.
>>
>> Return zero when the required right shift is at least 64 bits. With the
>> supported precisions, the scaled mantissa is too small to round up in
>> this case.
>>
>> Fixes: 4cdb56214746 ("hwmon: lochnagar: Add Lochnagar 2 hardware monitoring driver")
>> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> 
> Thanks for adding the sign off.
> 
>> +	else if (exp <= -64)
>> +		result = 0;
>>   	else if (exp < 0)
>>   		result = (man + (1ull << (-exp - 1))) >> -exp;
> 
> But as I missed and Guenter Roeck kindly pointed out there is no
> value in this. The shift in the following case will just result
> in a value of zero anyway.
> 
I am not going to apply any patches from this individual. First,
they don't listen - see above. Second, they don't find it necessary
to have enough courtesy to follow patch submission rules such as
versioning patches and providing change logs.

Given that the patches at best fix minor issues, and at worst
may be misleading and/or unnecessary, this is not worth my time.

Guenter

