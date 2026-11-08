Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794154462;
	b=UPS9FaDYFFPk8OWX0j40cPlOJRoWGB+4p754Y0h8eordbqhhOVZdPbpbH04d5y37YnAo
	 GgrHTHTEbdlYv0HhuHKQHfqEqH0QoLsdkCrCUha0UxvfQBcGV5bQncyqI5mxyGxR4Vnfv
	 tgVRX9TVxaTQXMBU4W8e3NMqf6kyHvpp6txj9ypgDdUnwPLBM8dHuNswkFNLZLb5WxfHR
	 3SjFfkFBNfF07l6I+sMWq7svqLe6J7fLkl2ljpFMzhGacHZBsf9TjclgLj8h/z3JU5mul
	 QZoI35nFq/oB8sKPEvr49yhCfvoDQlw+hZcdL6LNUBVJosxboWJvma1VbSiicfYXIJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794154462;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=sFl0lykPv+vxvsDAVMMQlp9gQxaIjAG3kakuHz4avOY=;
	b=agYqH60GscLe61dGNRAKjYRMPElO2pPkgi2hxKmFSJvILsOgJoyaQlStq/2xjhhJk7/O
	 BmY6pecnnaSm8vUohOLOoPGAJjZYlXAmecv9GL0FC09YzqphKlE08LQ1ZL9X5Jml+M38q
	 kupEbWzdFQn0JPaksg0Wr+TGdIC9DiO6bhhMkZiLj07+mMdqlVT9R2tOyLqmb43RoVi6Z
	 YP6E+VQbkgoL+kChkByendiS/R7R84Ih5kZfoJ1DANlIMmCFy7MX4YqSBZi68xpCZf6/e
	 4l5M811BrRaHQlz03c2XrIwiOQxnfJKCSV8oFg814XD8px61hLsD+wy/F/hAsq4HsxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=gZZ6yDjJ;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7754606A32A
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 16:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7754606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=gZZ6yDjJ
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id PmLXxQqkMJFmFQ5XAxx86i; Sun, 08 Nov 2026 16:14:21 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Q5XAxOXLwlaNKQ5XAxMwmA; Sun, 08 Nov 2026 16:14:20 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6af09fdc
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=Ikd4Dj_1AAAA:8
 a=DnCPt_loHZteT4MqJ5oA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sFl0lykPv+vxvsDAVMMQlp9gQxaIjAG3kakuHz4avOY=; b=gZZ6yDjJKhe6ocvuwvBSk0XGqm
	QF/8iQachOoEeg7/Lmzzsjl9eNXa9qLzfMiOGutEPIflmF6uvq6CySq5dfGvRjjfinVRB4AVRuZuI
	XzNKrNpRjnxcftvsek7kCDYWb9CimvCcDF/B3VepvQZ9i2E1JZjHhrAyJ5zwu0QH8P5dRastYwTFW
	hquju6oj94KGMqx6mXFuBxW8T3PlAL1sysbuUi/nLpOs88F0RLYnxXFCeOHEVShng44RxQ2j78k59
	9i49qkUzTcQHtSabxU890mThvNyKTjfrwT6k4xZsXuJrmGPqqo1WDvtgl62H1XQBfWdq2lVOgpLkR
	FW9Nhluw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:43862 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQ5X9-000000015L5-3atN;
	Sun, 08 Nov 2026 21:44:19 +0530
Date: Sun, 8 Nov 2026 08:14:19 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Felix Radensky <fradensky@nvidia.com>
Cc: Vadim Pasternak <vadimp@nvidia.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (pmbus/mp2975) Get vout fault limits
 dynamically
Message-ID: <8e4410db-66df-44b8-9617-1013545d7b43@roeck-us.net>
References: <20261105193200.1570996-1-fradensky@nvidia.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105193200.1570996-1-fradensky@nvidia.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQ5X9-000000015L5-3atN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:43862
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDaC4x3oMAAuBHTZIp9Kmaa2qb4TyTAyiTwK1FBYSjGiXIPcaB3MX9PSvoUH7f6pYZ7UDk5s59c4wQZzDt6hPkrQggIkDVE+nYJGL/10dRcqs2ZTETio
 9bV0CfYnGB2RtBmAfxorDQBaTDwLdV5CNE3yQxXA3PECf5iQV8AgVAFprCF0Pskwfk6b6rOwxe4ZdY8R56/H53R7585puGuy6o3ytahwhRQNyq5SQ+FTnriz

On Thu, Nov 05, 2026 at 09:32:00PM +0200, Felix Radensky wrote:
> The over- and under-voltage fault limits of the tracking mode are
> relative to the voltage reference, which follows the VID/AVS requests
> issued to the device and therefore changes at runtime.
> 
> The driver reads the voltage reference once during probe and derives the
> limits from that snapshot, which the PMBus core caches in addition. As a
> result in2_crit and in2_lcrit reflect the operating point at probe, rather
> than the thresholds the device enforces. On systems where the device
> supplies the CPU core voltage, in2_crit was reported anywhere between
> 1.15V and 1.70V across identical systems, causing false over-voltage
> reports once the CPU voltage exceeded the value latched at probe.
> 
> Read the voltage reference and the over-voltage offset selector whenever
> a limit is requested, and mark both limits with pmbus_set_update(), so
> that the core does not cache them. The voltage reference is available on
> page 3 only. Let the core change the page, so that the page it caches
> matches the device, except for a single rail configuration, for which the
> core does not issue PAGE commands, and the page is changed directly.
> 
> With the selector read at runtime, a device configured with an
> unsupported selector no longer fails to probe. The OVP1 threshold, which
> does not depend on the selector, is reported for it instead, with a
> warning.
> 
> Clamp the under-voltage limit to zero, since the offset can exceed a low
> voltage reference, while a negative value would be reported as a read
> error.
> 
> Fixes: 2c6fcbb21149 ("hwmon: (pmbus) Add support for MPS Multi-phase mp2975 controller")
> Signed-off-by: Felix Radensky <fradensky@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

Applied.

Unrelated, that makes me wonder if we should introduce a device flag such
as PMBUS_FORCE_PAGE_CHANGE to support page changes on single-page devices.
This would retain functionality of pmbus_set_page() and avoid the need
for driver specific code to set the page. Thoughts ?

Thanks,
Guenter
