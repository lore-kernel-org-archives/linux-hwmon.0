Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794063459;
	b=ApnRXqi9LIhFJwT+J0CLo+1+5UphjvyISiNifcqkPgpsv+ZYp7IqJaeEm77mZ3wg6TV1
	 ml0exYtH8iXVldcwGyOS3C0hM9Yl8Eqw8jrKhkon/PnNacdtqY6p+N0ux2BauTu7/BD2b
	 DVDXLEQGH1hVWcffYfjEyYWx27jYPhOTLH7gLsU+VDR473oSFzm+aGOAZd3x4RxrUhcUL
	 DnqK4zdyIY9NvfLKv4Ol3u+BaleurpWs8eL9G1il12IetPvqbNw2CfnIb+rMOO3lqCZrg
	 /57KqtmQWDvL7n5f4G4nVf59ZjR6JuxIvn7fs1KL1/K2gCbzcCGvLXsBWtLzGV+m1oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063459;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=EAvl3fitRQQ+zOb/lLotd7eR1uWF2wKurJXsbGkVIEU=;
	b=gXsQbqXMwLL8OlN9Qv0SXLG4ETZ9laxK+uxiH1B/aLJDZxQrb8YHFnobraRii+QfmMWL
	 rX5Ca5IJdDR6erptz59ydSj8py24oesqLaPA7ORFH058Iv3IX/pLHtf6/p/DC8Rhi3B8g
	 RKcZ6tAGDlb8/5a6zxtnSCTWgB0IXLg+ZLljzTXWYbMs0Sip84I6tVjh+lAZxUyOFUx8p
	 221VrCDuFraDEWFbMcXcUssPOqL3ijWs/aLoH8sFfvl5TqSHOCy//gGF2FjRtXA90FNZp
	 6UbpSH3Y/pA9yt3K2b/A/zpQAw319rRxVvwqv/9r8KmemL8b0YG90k6EvNhrCmsRYeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Gf2nERXO;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22A5606D83C
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Nov 2026 14:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B22A5606D83C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Gf2nERXO
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id PhlyxyNKQOOJnPhrIxrQuP; Sat, 07 Nov 2026 14:57:32 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id PhrHxUJDSuJrPPhrHxkWLw; Sat, 07 Nov 2026 14:57:31 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6aef3c5b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=0VzQnij0Y02-aV-MoqEA:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=EAvl3fitRQQ+zOb/lLotd7eR1uWF2wKurJXsbGkVIEU=; b=Gf2nERXOQmCG
	VIoDGcPMYZTbtFueBaRm4thKVavIVFxMclZspFlaP98EMVKk5FXWGGpo/wH4ngi8wHwXgrsoMr73p
	Jopt5KYi/TBWuwemMLRp/QlzEoyU/xSICcbGWKyFvSpWXvffzcX3m+pbi/MkBYnJgKEiYc7xdrus/
	gVWLan+9TsYKGxM92oBceku5MDGuKykrJyywMU3fKPxow3gEZe8rrHnGqbqT15qVaLuMpdWzqT+RW
	RBMzYXZ8BG2gFk3e0MF3p5/tfvvRtIwZF2ElaldwtKtPl9lXdt58hfvhGJt57zdVQJfHR2Z/arPk7
	q7pr8p1cf7X1oSCXL4Za5g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:51504)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xPhrH-00000003bwA-0pLu;
	Sat, 07 Nov 2026 20:27:31 +0530
Message-ID: <9aff5480-3be5-42d5-b0c1-b3d7b4de8e9a@roeck-us.net>
Date: Sat, 7 Nov 2026 06:57:29 -0800
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
Subject: Re: [PATCH] hwmon: Add driver for MSI Mystic Light controller voltage
 sensors
To: Tomasz Bojanowski <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261106184357.27763-1-tomasz@bojanowski.me>
 <db51c24b-4b41-407b-a20a-b87ed7c0dbaa@roeck-us.net>
 <20261107082728.8035-1-tomasz@bojanowski.me>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261107082728.8035-1-tomasz@bojanowski.me>
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
X-Exim-ID: 1xPhrH-00000003bwA-0pLu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:51504
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 11
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFVAtuz0dSTgubR1CqzwIfkmKXFTtmsAke+4z7FLDmP9g4Xl3WpzY2yr7aLYxuBvMSmr5ne50aJh/h1Uz0CuuWOBUd8p00dVcnKUyoCR5Lr8Vp7giKEe
 /xo8ViOQAGM4Y89ztPHxuTrn6bhMZqmk1X1edaVrV41FhLXyA8//kHqPTX2SPXa/32CfY23HkzSuKNwGR2azlEMQJbxCgCZt0khHsNWOKz4sK/+p8mw9nMd+

On 11/7/26 00:27, Tomasz Bojanowski wrote:
> Your reply did not reach my inbox, because the spam filtering at my mail
> provider was set too strictly. I have fixed that, and I read your review
> on lore.
> 

There is nothing I can do about that, sorry. No matter which provider I use
to send e-mail, some provider somewhere considers it to be spam.

> Thanks for the review, and for trying the driver on your boards.
> 
> On 11/6/26 16:36, Guenter Roeck wrote:
>> Using the USB serial number to detect the device seems fragile. If the
>> USB vendor/product ID can not be used for some reason, it might make
>> more sense to implement a DMI match.
> 
> Agreed. v2 identifies the board by DMI only and no longer looks at the
> serial number. The driver is only registered on supported boards.
> 
>> This will require additional per-board data. On MAG B650M
>> MORTAR WIFI (MS-7D76), the USB IDs are 1462:7d76, and
>> hid_hw_raw_request() with the parameters below returns
>> a length of 0 bytes. On MAG B650 TOMAHAWK WIFI (MS-7D75),
>> the USB device ID is 1462:7d75, and on MAG B550M MORTAR
>> (MS-7C94) it is 1462:7c94.
>>
>> That makes me wonder if the parameters can be associated
>> with USB IDs.
> 
> On these older boards the controller uses the board code as its
> product ID (1462:7dxx, 1462:7cxx). As far as I can tell from the vendor
> software, the sensors of these controllers are read with a different
> request, not with feature report 0xf0, which would be consistent with
> the 0 byte reply. I have not verified this on hardware.
> 

I have the ones mentioned above, so I could test there if you want to
add support for it.

> On the 800-series boards the controller uses a common ID, 0db0:0076.
> OpenRGB lists more than 30 X870, B850, B840 and Z890 boards behind this
> ID and selects its per-board LED configuration by the DMI board name.
> The vendor software also handles these boards with one class and tells
> them apart by the USB serial number. So the USB ID does not identify
> the board there, which is why v2 uses DMI.
> 
> For now the driver only covers the 800-series controller on the MAG
> B850M MORTAR WIFI (MS-7E61), which is the board I can test on.
> 
> v2 also addresses the issues reported by Sashiko and your other
> comments: it reads and validates the report in probe, fails probe if
> that does not work, only exposes the rails that return a reading, and
> no longer returns -ENODATA. I will send it as a new thread.
> 

Thanks a lot for the information.

Guenter

