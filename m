Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793560185;
	b=eOuwyHj0qdjvbg2jaMprpDBFyVB2oIt+3cmz4A4FkAUDiZj1VKLu2wp72HzDT1kIRx2H
	 N/8+j/i3mdhPGIUr7CQprz8KtfIfMKjubR3YWRrsiu7QlyWklK0aNMGuSEqtiVNC98uhN
	 FAIs6+cT/ZJr998EuUQC+PgvJTep2d1U4cQblFrjaOL7H3/lHVCnACUsMd/mK17HgaM/I
	 MSt/nQKbSjc48PEQpyeRVi7lNCcrdGu6shP5GxFKMICZlnSjU0I0dartC+Ijh1J4dyJ7z
	 hdmmbBqYO04dpJWC1S8Ojxa6CfFvQlzn7NYOxioQmMC1KMJm9WSna9oMeOgJYWCi49g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793560185;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=VunHcN04PE82MG384vRvxyk8cgSo4EJM/fvpjqkbGAA=;
	b=feAwWmccw/lCiKa01nLYV0C54dP7p7HgtA/bLmysgu+8cYmJS8blKUFcqZ6X06obD3OW
	 MnNu5P7aSPlrlbOWudBRUfq8m5ZRwGkopMv8d1WQEU/rd/v5FlOyatXDXua7bVGxuGSZy
	 FnEfS+K2xMKbxaoko7/bL0nF+r6ZJAkQKOEgRTXBNhbi5Tabpf1CGvYQkt4qZm+xZ1YHh
	 sk/CJsoweX5DO3TAiQNXbU2C2T9Sw6XaRo6yYSWD8ijloVaYkINFYFXk4OLZp2DTNGYFo
	 xvtCI+Dmib+l34JGPiad+DQqEAt4eWswJ+/ATD82WH7eL5m+MhMpL+AvrU7FJeIfDqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="C/4RnWVd";
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C991606A329
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 19:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C991606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=C/4RnWVd
Received: from eig-obgw-6001b.ext.cloudfilter.net ([10.0.30.143])
	by cmsmtp with ESMTPS
	id NW6NxC9ZWaC0UNaw4xNgkX; Sun, 01 Nov 2026 19:09:44 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Naw3xogWx1xnwNaw4xJUj6; Sun, 01 Nov 2026 19:09:44 +0000
X-Authority-Analysis: v=2.4 cv=OsxPyz/t c=1 sm=1 tr=0 ts=6ae78e78
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=FQSCjVPzdfuLLySXQBkA:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=VunHcN04PE82MG384vRvxyk8cgSo4EJM/fvpjqkbGAA=; b=C/4RnWVdDrBS
	QYXFcPpuc1k8QcHM90zSmnyab2fFaZx664QDuwbTgCZ0hekbxC1iXFeqAZMQSFiYRD0UUvDcMvCcJ
	+UJP9dRXT/RV3UCd7bw8nH/uYXUetaFILONTLG+ihHUXF7+8DYZYEy03mXMF4xR/k2H3xXH2BC3D4
	3sz6XAVmVpGGQCDt/HlhnxSPIa7HslU250z0dCtVXUVvV0NOjnrdtbBLTvdRGwTpriRM0+0hDFAyd
	dy9vQeTq16hUYVsXZsJ15im0OTE9duaH89mkl+M+Kgo9TLEF1sTS4Xg5EKvSK1GzlGFguIRBvWGtC
	PjhEiplEltqczJtnUHWHMQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48438)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNaw3-00000000qv7-2Ugb;
	Mon, 02 Nov 2026 00:39:43 +0530
Message-ID: <4d12314e-56db-412c-a558-e4026cd03528@roeck-us.net>
Date: Sun, 1 Nov 2026 11:09:42 -0800
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
Subject: Re: [RFC] hwmon: (tps23861) PSE-PD support, extend hwmon driver or
 move to pse-pd?
To: Roman Kuzmitskii <roman@damex.org>, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org
Cc: robert.marko@sartura.hr, luka.perkov@sartura.hr, o.rempel@pengutronix.de,
 kory.maincent@bootlin.com
References: <03055ffd-d015-4810-8b8a-678821fa6dcc@damex.org>
 <92e3383e-26f8-4bed-b487-1c52f6c4f420@roeck-us.net>
 <8cd41211-b026-4158-8e18-454a9ac0bae4@damex.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <8cd41211-b026-4158-8e18-454a9ac0bae4@damex.org>
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
X-Exim-ID: 1xNaw3-00000000qv7-2Ugb
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:48438
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNvcUgqb/8Rb82e4z4jwVJ5ayAL5zr4l7zpeEXsJ3/p4xefmsdGJz0J0+bJ02BTpnrXMpqtY2RfS8/xnD7eyjhexoQym7mG4EPBcmfNZva3Bm/t/visF
 R28GgGkUNFU/ynPdQtGpvPs2Qwv4KPLcCMm6VTJD+9egyDL3PZKTyxOeyg0S9uro1o/fsHOILNnO9CkDHqdl3qMkogRyMshcUWML/GE+NwXscVpeq6DUJRqX

On 11/1/26 10:50, Roman Kuzmitskii wrote:
> On 11/2/26 1:38 AM, Guenter Roeck wrote:
>> On 11/1/26 10:02, Roman Kuzmitskii wrote:
>>> openwrt reviewers asked me to check with you first which way you prefer:
>>> 1. extend hwmon driver with PSE-PD (like it is done right now)
>>> 2. move driver to drivers/net/pse-pd and extend it with PSE-PD
>>> 3. something else
>>>
>> The hardware monitoring "enable" attribute is supposed to enable monitoring,
>> not to enable some power delivery or network (or any other) port. That "port
>> enable" feature using the hwmon ABI was sneaked in, and I am inclined to just
>> remove the upstream driver for severe ABI violation.
>>
>> Guenter
> 
> thanks, does second option look okay with taking tps23861 to drivers/net/pse-pd
> with enable attribute going away?
> 
A perfect solution would be to move the driver to drivers/net/pse-pd (or elsewhere)
and implement the hwmon part as auxiliary driver, but I am also ok with moving it all.
Note that I do not review hwmon drivers outside drivers/hwmon, so if you move the
driver to drivers/net/pse-pd you can abuse the hwmon ABI as much as you want.

Guenter

