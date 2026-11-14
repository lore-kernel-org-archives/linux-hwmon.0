Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674092;
	b=sIw22NqNX+5hkrYtO0TAi0RaMP+9gMFgZ5v3q95WJ8LI+7yUZcqBxG22PE8ZiT+HnkuL
	 LhmqNg4E++SYq9KfcOQaqQwi3uHtQMF6cgy0iYEYpD69XxjV1efc5xgJF2B307kLGZP23
	 DiXCQod9DCPJMdqB+VE8dIGGvugMQ2f+fr7vUSvwZOZn29tEFqA0GhPyEhkP/ByYlqvcj
	 OchSDldQPTkFNYMefqQMfOrJt4xnMCMQ9LR2J+4ibiIwUKuwKZIklTbD6enQObHgAoBq7
	 Ekf2OBcvTsKrwP130y4GnhySESg8zBb8SuJcVW+c9sX/V645Y7Wu/EIKE4q651EfLbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674092;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=nYPcb6RWAzSWV1D7qe4gDy3zAPUEX8E78823vNjFEUI=;
	b=1L+8tvnVMMUBWwQeaumzzICM0VdhrkXr1Js+ZYAhr73WG2u546T4NFI9cc33IS5Xi4d6
	 rhp0/N/7oFmFUaYLpffx69DaRimkgnHstqb5dCfEEtivILJL7szPe4iJhXdCZ/wOZy4+I
	 bpW0+lu0wZSg40S+/x8vBYUXgxB/HxlQq9ez+8+V4IwkhMYx2peb2xArlms5Yct7le9Nw
	 upAZQLnKat43UGfWssvjVM9A1N1r+l29vhGWxvzUpY3XM5Lzy9eoBSVOi81cV6ljbFrPk
	 iXW2yGS5nsM6PXgTdf/gKaIaJDf1J5hTSxY0KOt7DLaxVoi1KJT2mE76oVyY3SeFOfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vuDKDegQ;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABC5606A88B
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 16:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ABC5606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vuDKDegQ
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id S8g9xZVejOOJnSGiJxvAY1; Sat, 14 Nov 2026 16:34:51 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGiIxedSI0288SGiIxaJuf; Sat, 14 Nov 2026 16:34:50 +0000
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=6af88daa
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=OBINIw4Rw6YrgAu89ioA:9 a=CjuIK1q_8ugA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nYPcb6RWAzSWV1D7qe4gDy3zAPUEX8E78823vNjFEUI=; b=vuDKDegQqIh7a8xxzbs3JggogA
	e/Ue0gq0xXFo4TYOFCFPbO3Pa/+v1HH3rEfZkykVHLDMPZXU++8Qt9bmsQdQJW6Sc7poo4Y19e+k6
	QSILn/98p2yuAgE8ioY1NLtYdByrkGuC72F6uMXij892k/1hU6UTHKcP3OKaB49hmcCr214aqO/H5
	XvhFNqLxgwGDNwoSCY1r/zbcTHP5moMs7n4shTNZpk1mqKR74RWPhhkw/yPoB0YQyKvqfchtwvpYq
	8E+JV5ICk8zxV8QiBQIhG+nWHmEI3TP8MKRUc3myHR4VU6/CX/6iXZ+ljmiZqObzCzCf70jTSW55P
	yP+t1phg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:35708 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGiI-00000000Fy2-0pRu;
	Sat, 14 Nov 2026 22:04:50 +0530
Date: Sat, 14 Nov 2026 08:34:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Wayne Ho <wayneho219@gmail.com>
Cc: Pascal Sachs <pascal.sachs@sensirion.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] hwmon: (sht3x) Fix overflow when writing alert limits
Message-ID: <45a41724-f9da-48be-a3dd-cbdcac5dcf0a@roeck-us.net>
References: <20261113054857.97048-1-wayneho219@gmail.com>
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
In-Reply-To: <20261113054857.97048-1-wayneho219@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGiI-00000000Fy2-0pRu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:35708
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 73
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfL6btxpsl1sTW66vGnPrWpNbWSLpbSbF4Wpm1Bz7+FbbVvhmKS0z+youspWnMa4z5bgicUkigRUl8nTvfsTB84dQKqbYBfTMahZ5IDA/g8AA6nsWDN/s
 1VuPYC72OByGvMGCipmgt9Htq3j/rQt6fhdIZf0NdounpoQ4SweizeVzWorCkfocS+c4YwP54E802HR506sr3zhiZTNZkT5NtaBT7rZp3Lei4qaZ55XnORXD

On Fri, Nov 13, 2026 at 01:48:57PM +0800, Wayne Ho wrote:
> limit_write() encodes the limits with 32-bit arithmetic, which overflows
> for the largest accepted values:
> 
>   (130000 + 45000) * 24543 = 4295025000 > U32_MAX
>   100000 * 42950           = 4295000000 > U32_MAX
> 
> Writing 130000 to temp1_max therefore programs -45 degrees C, and
> writing 100000 to humidity1_max programs 0 %RH, so a limit set to its
> maximum makes the alert fire instead of never firing. Reading the
> attributes back returns the cached values, so this is not visible from
> sysfs.
> 
> Use 64-bit arithmetic and clamp each result to its field width. Even
> with 64-bit arithmetic, 130000 encodes to 0x200, which overflows the
> 9-bit temperature field, and 100000 encodes to 0x10000, which is still 0
> after masking.
> 
> Prepared with the help of an AI coding assistant (Claude); I reproduced
> the bug and tested the fix on hardware.
> 
> Fixes: 7c84f7f80d6f ("hwmon: add support for Sensirion SHT3x sensors")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-hwmon/20260725222229.EA69B1F000E9@smtp.kernel.org/
> Signed-off-by: Wayne Ho <wayneho219@gmail.com>

Appied.

Thanks,
Guenter
