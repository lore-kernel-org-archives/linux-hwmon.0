Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340209;
	b=46ooJEisGHQbiRD6pSrJpY4YBy1A+lVmak/QhdDihxdN5L90i6jdE0NQt4lJFzoPINGK
	 4l2JDLldv59ogwFgVT4zwda0WLoi4JMjrucBd5XhI33NvTLm88vZIs/hmQLt0bsZQnoKh
	 D6b/JB5hT63Xsi8X1aCTZ8vR+pIx+116iMc/I58qIDmX+0upt9FIadzItPLIc7wpawIjZ
	 b+NQrDLoVBBP/QubmbkHgPqTjleMVDckIWtI4/tAW6v/do2uA+1++xt6E21iMpBaBMu8k
	 6ZTxOZfICjD1xsYQ9YmPK/K47Nh9s5dDWxlsUwErNjwp/su/Ewen0AmYT4bEdr3kJHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340209;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=IWOw1JwfDiwyl/GaeGAOvZTCmIypp63YopvxlyJkSsc=;
	b=NBW50GZ3yMGXhrGULlq2vzZ7zB1s8odEPrTZK9TfDnLrLw2xcc0NHzl4K1csB5NPcsxR
	 +q1YbvBckwlrz7QrSZGAUQytgXyOeXMFhuG4pbH/d6oTCfMELq7yMy95CE/GE24w7K0Qv
	 eX1c+gQPxlRgLiWUIP6p1IR5uOxATsuE2MEz/1ne7B2fb7UmqLOdp3cLOjr+QDmT3Zx21
	 JCDjjwIlM8oqLHH1x2VhArDG/ChB3iwxci3r+nYq51jalmEPr4t0bEzeTiB4v7+Jfd+8K
	 TPvvOg09/kXjpTdSn2uM8KkJMRwQD4eeAysMN6owbwFfErmN05rdBn1jvUU9PRoY6kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=rPT7yIAG;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6701606A335
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 19:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6701606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=rPT7yIAG
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id QqA1xy6vjVK9UQrr6x8ZZ1; Tue, 10 Nov 2026 19:50:08 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Qrr5xfljE3nNNQrr5xWELC; Tue, 10 Nov 2026 19:50:07 +0000
X-Authority-Analysis: v=2.4 cv=TuLmhCXh c=1 sm=1 tr=0 ts=6af3756f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=go7_iiqvOra4VVw7hDIA:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=IWOw1JwfDiwyl/GaeGAOvZTCmIypp63YopvxlyJkSsc=; b=rPT7yIAGQQDM
	LaRwK2ijOyAYdssmcbcds6Vi/zvMNOczZgyIWhV+/oTJeomTJtN+BVTp5LrykQag4xNIM6PtHwG8Y
	MEPfF2eVwkkPan/3Kvrs+JyhN0Jzdwcg1XpaAQBMUWZLrwxUAD4+krJd5kNSjsl2br6E7VV9154gW
	ZE91StTVoDL2jLKgguI/hTe3Ed9vRgg0zkfxtU5+ndoon+68B+qiczZBaUGiGCqZFhvYjOygW2Wi2
	hiPKoXU4aAmSvwPYl9JbCE0w8WsYbtvVO1XZ9ORRMnzUBWU6TcFadtHJH9GT23OOzpdh4A2cbCK9m
	fJ84o9p4REm8HOtG2bIu+A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53516)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQrr4-000000041GZ-43iy;
	Wed, 11 Nov 2026 01:20:07 +0530
Message-ID: <d43d0f8c-bec0-4dcf-ba81-b3e141faf4e8@roeck-us.net>
Date: Tue, 10 Nov 2026 11:50:03 -0800
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
Subject: Re: [PATCH 00/10] hwmon: Drop unused platform data support and max197
 driver
To: Arnd Bergmann <arnd@arndb.de>, linux-hwmon@vger.kernel.org
Cc: Tim Harvey <tharvey@gateworks.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Riku Voipio <riku.voipio@iki.fi>
References: <20261110183434.181711-1-linux@roeck-us.net>
 <2d7b1690-c943-4640-89d3-d18901d04ebb@app.fastmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <2d7b1690-c943-4640-89d3-d18901d04ebb@app.fastmail.com>
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
X-Exim-ID: 1xQrr4-000000041GZ-43iy
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:53516
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 18
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfH5Q46eRyKx9ISDhU2xVU6dpZJz3U0dkULI1fC8YHCxYrgGv8yz++xxpmYiaLyNfuIB9EXZCzGbhANinnEq3UpI/I5qPputwqK50ae0G7uyyY7RFqQZB
 ooDbY6ckP9fSp2cTZhxawABO/oEtvcc0asYjlXHLao7nyuCjsYZXJGX0ajPSATppHAOchw1F+ADdZWCSvo4CgV2FZijjMQDFT49rR6RMxIm6zc9hEtXY2D7r

On 11/10/26 11:24, Arnd Bergmann wrote:
> On Tue, Nov 10, 2026, at 19:34, Guenter Roeck wrote:
>> Several drivers in drivers/hwmon still support configuration through
>> platform data structures even though no in-tree platform or board code
>> ever instantiates or supplies that platform data.
>>
>> Audit all hwmon drivers using dev_get_platdata(), dev->platform_data, or
>> headers under include/linux/platform_data/ and drop dead platform data
>> support where it is never provided in-tree:
> 
> Hi Guenter,
> 
> I already commented on the individual patches, and this looks all
> ok to me as I did almost exactly the same thing.
> 
> Obviously it's a bit unfortunate that we duplicated the work, but
> it does give the chance to compare both and find possible mistakes.
> 

At least on my side it took maybe 30 minutes, so not much time lost.
All I did was to ask Gemini to do the work for me (see the Summary
patch).

> My patches are in
> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=board-remove-7.4
> 
> 337dd938a3b0 hwmon: shtc1: remove platform_data based probing
> ab1c9ff391ad hwmon: emc2305: remove platform_data based probing
> 985a7d241616 hwmon: ltc4245: remove platform data probing
> 8b300deafa72 hwmon: g762: remove pdata based probing
> 489bafe5cfb8 hwmon: gsc: remove pdata based probing
> 94ec070cdb5f hwmon: asd7828: remove pdata based probing
> 296048203f0b hwmon: mcp3021: remove platform_data probe support
> 93ce98eff9b5 hwmon: remove unused max1111 driver
> 9d4791700bb8 hwmon: remove unused max197 driver
> 190ba99436ff hwmon: remove unused ds620 driver
> 157784eaf3df hwmon: remove unused f75375s
> 
> The main difference was that I ended up being a little more
> aggressive about removing drivers entirely.
> 
> The max1111 driver is technically still used in mainline, but
> I remove the last reference from the pxa board files earlier
> in that branch.
> 

I'll look into your patches later and pick the ones I like better
(including the removals).

Again, sorry, I did not intend to duplicate your work.

Thanks,
Guenter

