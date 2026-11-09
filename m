Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244390;
	b=e4s9PRxn+qof7DmyPEyIig0hBf5VYFiD5nfTgDgFN4LI2xM+L6y50MD7flpMi+kfW61z
	 98p9vpzFbB9+PMG9J0XaSjt+J6+YL0I0ODIl+99mjI7xam+91lh7OGCsdG3OPzMa1GfF0
	 6e0C5BRroOK2sYf1s7/7EbqnLA93z8Y/My7d8hHolB7gqsALTbt7sHqLK/CYsKS+zgGjG
	 D6RklHYunCzFY5L9ehbVive2DyYDfu4VMIQIbyinOTNVLMMlycTaXFWopCrsNGWVe7TI+
	 Zxxt41GLdyGTqwE3cUZHAIIe9YBQrOY+UNUbfK+rxi2n72idzQ5UvB/oo/f5K8JawTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244390;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=LUi5S3TExYT+fKA6nyYWe9RLlbolnfUl69avGF7yzSc=;
	b=R4B+fTuIZmdXMevMOXOaruSHPhixf2/E2vPudWPGWOT1VJ8jKDdtFYQB+d+tPHRRsl9n
	 vsygfNDydF/8Q54Tcc24DXe/dY9/CJjsvody2X0D0My/YzVlbUY3/A9xHtN5e2Yv3TsMH
	 0DaQmSvcNzKY24mZuOtPhhEEJVdmYi1OSEeMrDyf+LEI3jqVpcFgVfjQDETbBB0gjm97f
	 +G5rQBse0qzvg84VCv+xF4nzLzATuFbo1y14ruYPPo/ZmhAkKa4s/VC+B+39W50KsC9Mi
	 SrV6KI5fg+pGiD+s86xRCZztr4VeK/8dOed7tBo7q/YD7bEPPR1S2q89Qq4RtzGK90Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=VvHmcwTI;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B15B606A321
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 17:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B15B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=VvHmcwTI
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id QO2exVy80JFmFQSvdx4wy5; Mon, 09 Nov 2026 17:13:09 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QSvbxvVQX8cn4QSvcx2g7A; Mon, 09 Nov 2026 17:13:08 +0000
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6af1ff25
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=RKWXfmB6k3OvuUuLRrUA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LUi5S3TExYT+fKA6nyYWe9RLlbolnfUl69avGF7yzSc=; b=VvHmcwTI0Ey696r4qf/Wb5Uo3z
	lcZJIvInZekLkUOyz8BsgZj/EEoPUWSBL6drouNt1fECv7YeJsojfVqdeNUZAbX6UMZpPt0obLq1a
	zSwHRTcQneCBakXzTqS4+SkyDS+slHBUJD16Dz7ptP7r1cfcIQdqWRNhO88ZyufeBaODmjcYuPt0i
	FWZbv96aRmedvKTv/F8sq9+6PbcPe6UWX+t4E+6gtNaFvsoLcEyp6I3Lz98HSakPR0ENsgq73xnzv
	3Oc5zMp65mbMZbU9Tm6ZuJXBz5kdbTrFS+cimKnghp4+AZFLaL/rvBHXXFOpuWnAJdojtp/lR6P9P
	HECqRb8w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58360 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQSvb-00000002AoF-32lZ;
	Mon, 09 Nov 2026 22:43:07 +0530
Date: Mon, 9 Nov 2026 09:13:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tomasz Bojanowski <tomasz@bojanowski.me>
Cc: Hamza Mahfooz <someguy@effective-light.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Restore manual fan control after resume
Message-ID: <d696c937-5caa-42af-90a9-f18f37c86706@roeck-us.net>
References: <20261109163328.61787-1-tomasz@bojanowski.me>
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
In-Reply-To: <20261109163328.61787-1-tomasz@bojanowski.me>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQSvb-00000002AoF-32lZ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:58360
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfN1YmI8JDgz0jGPJui/oLW3BzLokxPhWRT7XcuNGBYAmY6TaSH8u0JnJeNFwy5qwMJ3/Mj09qzCa2t8hOHwNbdDUIWNDfys4lBB8VjbUQcVoov2S6Z2R
 wSClDZ28U0ON7IfwIEBGSV829na/xS3DUk+nqbncDYUj9yj8ihy9tT3Rj2Yq+MmxQNM3oSiL94/F2GmaFsZYt5qVeSFzxooCaBshpLx4Kd69o37ic7HvuJYX

On Mon, Nov 09, 2026 at 05:33:28PM +0100, Tomasz Bojanowski wrote:
> On MSI boards with NCT6687D-R, the BIOS restores automatic fan control
> on resume from S3. The manual mode and duty cycle set through
> pwmN_enable and pwmN are lost, and pwmN_enable reports 2.
> 
> Remember the channels switched to manual mode through sysfs and their
> duty cycle, and restore them on resume if the EC switched them back to
> automatic mode. Other channels are not touched.
> 
> Tested on an MSI MAG B850M MORTAR WIFI (MS-7E61): with pwm16_enable set
> to 1 and pwm16 to 153, pwm16_enable reads 2 after resume from S3 without
> this patch. With this patch it stays 1 and the fan returns to the manual
> duty cycle.
> 
> Fixes: 5410a1257e26 ("hwmon: (nct6683) Add fan control support for MSI boards with NCT6687D-R")
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Applied.

Thanks,
Guenter
