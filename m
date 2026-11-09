Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240372;
	b=Z9wRqGjKc6uhgiQVXI5vqQm/8yen9Q5Y1jPWgxiQ6L5gTvmFcPGtX8illkXi5ps40NQL
	 5pi/8AztAZFyyVZEguUpJ9G26fVifAIqld9yTJmzLPMn81fXa3Nd6F9yS/aHDYKmfcX2A
	 iwSLkAbXFxZk4INT88uyqSw9y7F2oVzZyzhp4bryskM9tz3Y9kqWebiWOlODT3BJDNkcS
	 di4XoBHdS5P2v0AlPuc8VCwjsI6Oa/ZU9TwtuZJHSYO787U+7nper8MmmFx6R7jkcR8aN
	 D4D4HO5NDRwKzizE8pr/ClVbwo4tAZ35E47x/ISaEgu4i1BMZeYkVPhSA9eF3g8wUPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240372;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=1qt/rgohGANRxm3IrjdgH5lztUYKTM3+/ifRCpRxUyE=;
	b=KvsEGvoQY9IcDaXuGm2iucc6nQk3jNtMa66sPVryvUuAEC1gffzSGGywIf3AUCHpFSO+
	 DyivlmlnvQcSfQ5eH6dBQDR+AfQ843EnV3kydsjCWSI34hstbj5ApQodi5nDstVJ0Ee3/
	 7l2N+NGvFScZixEielZbEAUo7YTkJDw2UKZc3BZWwGfaSyQAOWJiBNGKpPBAmGQjKyEpS
	 3Kc1sb5BoKSCUSGsPAABugZ5h8ZkxXHd3oKK+RbbBRPShT2f2ZyGPon0rmXQjxeTf7Nab
	 2E7VulJBs336sRM+NZxoUnw2IqYO+oGjbJOsqJxDvEHAwwPX3cjydNFe90rt81NuWsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ExbcyR3L;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EB9606EE9B
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 16:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1EB9606EE9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ExbcyR3L
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id QOIExnc1zRiNxQRspxKN8Y; Mon, 09 Nov 2026 16:06:11 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QRsox8hiE0288QRspxdINU; Mon, 09 Nov 2026 16:06:11 +0000
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=6af1ef73
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=pYUB3rPNxVkG2UVf4jEA:9 a=CjuIK1q_8ugA:10
 a=GvGzcOZaWPEFPQC_NcjD:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1qt/rgohGANRxm3IrjdgH5lztUYKTM3+/ifRCpRxUyE=; b=ExbcyR3LgI8UtmDIXkwDwpOSpg
	4abeGKaE/ESLcrfix4hndnO19d5Cvvy2UmoM6SPNB1hTMbQFdkl9RSH5Pw3ZV2GQ5HyO9iYbeEPVY
	60RrUevEyrYkFy/Lx2L4vNoibJ0fGbE9m2as68ur0ZTaNYFsB1sWPI2OqeoRuvh4hy+iUryFjl5Je
	rYemJckg1Bonp/ACAG2lRQDiX3opCIlcOZSLz/HyDAHMBdnLsrmWVlKTu6hca0+nq+QolhEJ77f3z
	3V8vb3rV6WrO0+pjICXbT8Vo+A2hG4utbpPtSOY6xbjTGaKQ59ch/tPZMSx56oMGGRwpOLIT4SkoU
	hX4IRiiw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:36418 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQRso-00000001aQ7-2InT;
	Mon, 09 Nov 2026 21:36:10 +0530
Date: Mon, 9 Nov 2026 08:06:09 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-hwmon@vger.kernel.org, arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/2] hwmon: (scmi) Check channel config allocation
Message-ID: <1a0ffaaf-6ffd-401a-bae4-f67e82ca151c@roeck-us.net>
References: <20261109151927.1672956-1-sudeep.holla@kernel.org>
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
In-Reply-To: <20261109151927.1672956-1-sudeep.holla@kernel.org>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQRso-00000001aQ7-2InT
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:36418
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBqU6q0Ryyly1fatiHs5ORgQrqWm+/vyV9srytrtp5iXpsImNcBnvDhM+ONEwT5VE8RcxGap+H3rXSaXdvkaKsJu7pbqPM6uKIsQgObh2pMlvfK6ZmJx
 JexkgLZwswQpsrsvSpzs9dmlERsjd316TxWwCgHn/kmyHhyVGeF4C79BZgmMMeMskRW7izOmp+/mIzgqgLFVMLvJxw82nM7vnaiCr57uDAHWQo0o/ybWTv15

On Mon, Nov 09, 2026 at 03:19:26PM +0000, Sudeep Holla wrote:
> scmi_hwmon_add_chan_info() can fail to allocate a channel's config
> array. Ignoring that error leaves a channel with a NULL config pointer
> in the hwmon chip info, which hwmon dereferences while registering the
> device.
> 
> Check the helper's return value and abort probe on failure.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-d10ced6b-a6f0-403b-9619-f5a6573f9e7f
> Fixes: b23688aefb8b ("hwmon: add support for sensors exported via ARM SCMI")
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Applied.

Thanks,
Guenter
