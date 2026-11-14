Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673223;
	b=GEJEKrjt+Mm/yXHjWsV3S24E00bK1KN/Eu75W0dNmZPpi1XtRi5B2ahhsWfnvJbBffOM
	 Rbd8X2KwiXqrD9f9tBi1IFEZZx+dI+3HiepJ9m+JK/l2hm09DGQtpPgYelYT2l5KYBhj8
	 OUa9GVLk94SBzXzKfh+l8dUZEXeetneN+JhWPCC3BkqG7fS6Uz1ZKKngSqsaKaYHuEr/X
	 vB8Jn1sxiU7fd6S3ztnKbngZ63S0kmWa2v87kZCMjlUJkNcVIwR1G0CvNxbhe3S7tgMS2
	 wFRgrGUrZGEZxtaSkzyEni9mivlyA+UFFGLpTUOe0EuRxYzccKKp3vTeGYQBJOVD1Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673223;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=ZxwhgSYpDoXwHxHLVzNNenoKfmFE9x1vWok7rQPvhLg=;
	b=QI+ruD6Xu1IS34yohh1n5FU2dxbSBc9cn4NKRjRgFMkOnaepMBHZXVMdLyRlcwh5ygVB
	 EsjbApEj2ZiHz6dbXBR2CMjt49j40qoksl/tDWosRmluqRfUjIJoNGm540pv1IQ95eXlK
	 uOxUpJi6upQ4Omaylblw+YAD2+p/V5lYqk6qcFAPkpuWa0w9BEv5AlQnaKFtYKvmT5FMN
	 LZ9yvPLO2kIK4yJlDUgkmLOaKYstVzziQ0R8dDvLb7Qb7Y8rZNjh7IOoj76JidtMTC5i7
	 Gyqr47o+eVyskWpm6ljairRQ5RAZERrp2IdfZ/xLdjOMOtkZ5jh/RjzxZZcAZznbQYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yxko4Opj;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E2B606A330
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 16:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53E2B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=yxko4Opj
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id SCx6xGWYnRiNxSGUJxCCc1; Sat, 14 Nov 2026 16:20:23 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGUIxXUA0FhzrSGUIxLVjd; Sat, 14 Nov 2026 16:20:22 +0000
X-Authority-Analysis: v=2.4 cv=JY+8rVKV c=1 sm=1 tr=0 ts=6af88a46
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=rJQTfqSEcvX7QKNp:21 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=pGLkceISAAAA:8 a=cDTaPH7Phgbu5lDjgQUA:9 a=CjuIK1q_8ugA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZxwhgSYpDoXwHxHLVzNNenoKfmFE9x1vWok7rQPvhLg=; b=yxko4OpjcB3eDKvGXGy3lCQha6
	qYnBatw/d03wNuymE+oiMJ7W1HLq4TYV5YCEOnd29yWXG+4IjDgYSsH5fnb1LlyPqbnPbL7wvOUFL
	CwkXy6OK4VpQ5fV1Tc3ffKDqHFHaGfT6fGd5I31IXmM5dZwgAop1ZSwX7TdSuUrh1YxYh/E+opIeA
	/haViLROweizpxQV/lMMTnmnXVKp0aUrIYJJ/+2e75o9PaWTmHudDGL0QdWN4ymIDMeq/lD+Rya1O
	RZLczoeIgi9CeLNq8SjVPHANCTVivsbf8nPfNwUK2hj95/ClRWFw7npWcILZOboPw7LhLJtd9RO9S
	evvx0C3w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53504 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGUI-000000008s3-0xYW;
	Sat, 14 Nov 2026 21:50:22 +0530
Date: Sat, 14 Nov 2026 08:20:21 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Johan Dahlin <jdahlin@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>, Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH v2 7/7] hwmon: (nct6683) Scale the +5V and +12V inputs of
 the ASRock B850 Steel Legend WiFi
Message-ID: <900c0952-7f04-41db-9b99-3be5c32f16ef@roeck-us.net>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
 <20261111082838.1418051-8-jdahlin@gmail.com>
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
In-Reply-To: <20261111082838.1418051-8-jdahlin@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGUI-000000008s3-0xYW
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:53504
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 63
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGku4hKBwvPZafVIVQYVuB870o/RWVRsDWOg4EO7FH/tlJJFEjyV/b8TjorGwmXcV50v3W5+shxiITl6+o76gyLtrFTD+MkOkq6l7RmplMuY30Wg/BIj
 G61krprA+++6IbRmVbIQ8PnDd5uxhVMuAzqt8p5CD4wGCSzhdfYhoRg0mjxffe4i/9iVf3T18enX5mH8vG2giP35u8+pYagpTLTyebiNQmMF7Ny+Y6ZkVXVp

On Wed, Nov 11, 2026 at 09:28:38AM +0100, Johan Dahlin wrote:
> The +5V and +12V rails reach the chip through resistor dividers, so they
> read as 1.70 V and 2.03 V while the UEFI setup shows 5.04 V and 12.19 V.
> 
> Let the sensor table carry a divider ratio and apply it when reading the
> input, with ratios of 3 and 6 on this board. sysfs-interface.rst asks for
> such conversions in user space because dividers differ between boards.
> Here the board is identified by its customer ID, so the ratios are fixed.
> 
> Signed-off-by: Johan Dahlin <jdahlin@gmail.com>

Again, this belongs into sensors3.conf.

Thanks,
Guenter
