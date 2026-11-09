Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240043;
	b=v5RCB+fhKR4NZkH0uxBSrh+qJklMBrvpF1gILbuCWHHONc2FowA4hqDbcWCeSu/0ccZS
	 p2DkFCFIg/ZZeZE5SRRsvg2znn8SW+27oOsuKLSZYnmOPThf+E5KtUePvTDzRN3jmT6ZU
	 OhhLnOCsWUJ7e6RUCYeBsGx8EyiTu27WBnSI1gqBCg42goQgS6+T35SSEOIWCGEPrNW3q
	 cZTb/ZVIufbltrV9YXpw/qdi2/AU2lgrDH1D+YHREZZu1+8d2n7/KA7fKcNLR4lACTbJW
	 3UAA/S+HHbx2E1ur+OMas9yAFk4dxeifMLYfnX89KVjGYAOFcODecEAHPPl4YKkcn7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240043;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=+2tfqPk9hVnQ2q3KWovDfYLeV+1w88aC7QghffO/3is=;
	b=nhqxIv8OlXD4z3SIuC8O8kobnasnuohWRyVFgU7JsRgOIjfxVNd63Q4AtLjIbjkpQEWm
	 CnHj65WRUmV/FWBqslJ2pSyz4eGBIrHva54RZA9dhRv8EtYr9kvjYaae/l8o07/jTFdpL
	 gtBIuYjpzMY/0FRkE0Vio4gV5th1lOEuigHf5dx05van2E6Vceo16hlWBFKHJDqc4xIeE
	 4AHZ6kFCP2MmS1A8O8jxduDG+dELFxqNfmx0U4MYseJEx1DcBlNK46wmIm14Y2MTwyJdN
	 8CaLg/aeSK3hUoMSppDKCYeW07GTp4k4vguhvCIWvD8vQzs5klo/ad3gxwGz//GA1nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=lrv7l6xn;
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAAE6083636
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 16:00:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CAAE6083636
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=lrv7l6xn
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id QQp4xoqWH4vCDQRnWx8P5Q; Mon, 09 Nov 2026 16:00:42 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QRnSxeZtDuJrPQRnSxlGd2; Mon, 09 Nov 2026 16:00:38 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6af1ee2a
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=b5QGJjtLcb-mCnj7-7AA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+2tfqPk9hVnQ2q3KWovDfYLeV+1w88aC7QghffO/3is=; b=lrv7l6xnRgm4fnWR3+2oSEco9t
	y6RWKuZg3J+jsgjZDCqpl1gkjh7qsGQQ4YtsxYBEFKMoW0nZhdyJ5bh3rW69aJOdOK+OpB612rq1N
	bNu0hUKm09RvvB06VKn3Suz8vPAAc1cQLNfvOu9CH9SSWnWStel2Ket0mu9vI0eR9jvtRNnu60dTI
	XqwfRC5FL+hXdwtvCzVtREUzGq4nYs8pTxM6z17EPJtacSYcvRUomf5V/Q7CZy9zCcC8gRZ0DN9Kn
	PH86uyxjtsDAIfvMO2JdRs/AyEC4l3YvgWVPiricec9Z6xBMDJSWv6gdM9RCbctVzARMgDXJ8xCPL
	RF+KJ5cg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34670 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQRnS-00000001X5p-0Lcg;
	Mon, 09 Nov 2026 21:30:38 +0530
Date: Mon, 9 Nov 2026 08:00:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Anton Lundin <glance@ac2.se>
Cc: linux-hwmon@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2 2/3] hwmon: (nct6775) Avoid reading nonexistent
 PWM-mode registers
Message-ID: <8788a807-71dd-4253-b6bb-b2251751a5c9@roeck-us.net>
References: <20261109082511.851377-1-glance@ac2.se>
 <20261109082511.851377-3-glance@ac2.se>
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
In-Reply-To: <20261109082511.851377-3-glance@ac2.se>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQRnS-00000001X5p-0Lcg
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:34670
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfL9bfBqxYLxP8u9Oo+YXgdKugYmMKJG8enjtQ5hjLZ9djUQOevgsE7cEnlTGBmYA+3PwJz5Vmi6jp+2zkLCQIgHia3fJ98Uy/bUUk9UuTl5ewSfeI0F+
 mxYVGt1XyAIDYdgrX/M66gJQqoEE2jWtEr+jURsaE2aMbyOufE6lJREDyz0CmptVlODUCJu3eOKPJtnZMqNhXVvUTyqhp4+ykoUT3jqQy+fUWJ72ZICmYrIy

On Mon, Nov 09, 2026 at 09:25:10AM +0100, Anton Lundin wrote:
> A register value of 0 is used to say that this pwm doesn't have modes.
> 
> There were already a guard for this in store_pwm_mode() but
> nct6775_update_pwm() didn't have one, and read register 0 and then
> didn't use the value.
> 
> This introduces a guard so we won't read a configuration register we're
> not interested in.
> 
> Signed-off-by: Anton Lundin <glance@ac2.se>

Applied.

Thanks,
Guenter
