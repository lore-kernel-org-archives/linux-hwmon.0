Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749719;
	b=FSWl0423UPvfXy+MMmdFe0mmvXcTG+A6yUsGi20dvBpyYrQaIDUhCx8HffmPDrV1Qq4Z
	 ocKHJ0DVg0PS1BG5603iN5hWl2SvcRLMIYBklnRaLzEuYaME3VcAJxN0LKOlBjgeFVcH4
	 RTwf95wB+ELJB+SQ9dkidu1jwg4z7ee1Rg0UhdCKuW8JRjg6xlvIXv+FmocFOMLWvFS8a
	 YrlITKPHAy5u1+1P3yrKPll9VPi/SLMAGyb5slOX/dGCr/UP4owwJDwi9RpbNTXcy6KiB
	 mLtsy76rmEnXdr4tYj83Jr8cMlhyTJp4FT6NY7e8La504PVPJcAKiPTN97cyOCwLtxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749719;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=aSapEaH/NuRU2jX6S12LQSO8bYKdhcI+xgkonqmfsqs=;
	b=2m/bRnWataZQ6lKqGxho6RW9tnMSsmEzPMSszXUKYkpPI4FBYh/3WHq2kSK+5bFfy1XA
	 V/+9iRFerdB10QxR8CUbTuPwGnKT5ECNyFkyaj/aFIA2meiPeGi3aNwe/pg7Lq/i7cz11
	 JkG+Jqi079gXM/IDb/8eABaup/kZD6chtTqNmpTufuWiOUEDOFo7+3MIBNBde5ntKpkg1
	 uu+wEBi/vTJAHocr77y/G+9YN4o9zCJjKKr1cTlG1okEwhUdu9NRtRjBtd2BAt9c1mQAu
	 xDr9u4fa16umyBh1IwUZPFM3y+Fi4bqcGotHa3QN3AJroWmQ7z41/AoI/H2wR5ECwiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=f9WBXsKM;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943B9606A327
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 13:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 943B9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=f9WBXsKM
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id SaN6x2KgnJFmFSaO0x2aq5; Sun, 15 Nov 2026 13:35:12 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SaNzxYq45uJrPSaNzxGCHp; Sun, 15 Nov 2026 13:35:11 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6af9b50f
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=Byx-y9mGAAAA:8 a=YlH-AGZLenAcjOw3p3AA:9 a=CjuIK1q_8ugA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aSapEaH/NuRU2jX6S12LQSO8bYKdhcI+xgkonqmfsqs=; b=f9WBXsKMx+AxcyyUHrh3/0Gv6H
	n9FaCar2PKDAsnj/XFLBflZL/3lYxXy8UXiYLvlDXOS2wjoyTqV5l2PrODsNaJwyXZ22jcLkXLB6h
	A8AiqA0jyaEpX0HBtdSQj2rS4tQlTzHeeBExazgh63F/ghXq2d7XUubsU5UDLInNlPcraL/cTi30L
	P9/HDY8J0fHyFVpxIr+Sf0Tynf6rJGOVVs3UwnqgXsFPfIYg+WehnpZXerdmeCAfBsGbO8iaWAsI8
	oidN3LeLknD06YHwa5dH6y7ghqaSaYApiXjekQNY9shPMaPRkZV8qxwm357X4ufT95OvuUqVIJ2Km
	KRi5yE5A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:50512 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSaNz-000000011nP-0obe;
	Sun, 15 Nov 2026 19:05:11 +0530
Date: Sun, 15 Nov 2026 05:35:10 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ziheng Wei <zihengw03@163.com>
Cc: Marc Hulsman <m.hulsman@tudelft.nl>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: (nct6775) Fix incorrect struct cast in beep
 callbacks
Message-ID: <adcfae11-f8f2-477f-bb4d-4512caa089a1@roeck-us.net>
References: <20261115080203.910033-1-zihengw03@163.com>
 <20261115080203.910033-2-zihengw03@163.com>
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
In-Reply-To: <20261115080203.910033-2-zihengw03@163.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSaNz-000000011nP-0obe
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:50512
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEFjN18HVLz7ZKV9ZR1Bu4RSTtn7i1qmll0Q/ELV9zExESPbglVXBETn9zhGkyYrngu0JUNZp0NrPalHjZkfjq3bGcr1ITPBUCFE1DXcKR0L3g9E9/S0
 P4IpmsYru2Bflxt44mwxek5DrTVdnJkL/RT7TQrjjNx1IeDjhmFj56brxSr9vJYyZPB7fS5z9sdWZpjXIoAzrvopxKhT9PScQlH3MwCu4UtJN7Z5TWSKMoOs

On Sun, Nov 15, 2026 at 04:02:01PM +0800, Ziheng Wei wrote:
> On big-endian architectures, writing the in[1-*]_beep, fan[1-*]_beep
> and temp[1-*]_beep sysfs attributes in the nct6775 hardware monitoring
> driver always changes channel 0 due to an incorrect struct downcast in
> the beep store callbacks.
> 
> The driver defines these sysfs attributes using SENSOR_TEMPLATE(),
> which initializes them as struct sensor_device_attribute (where the
> index is a 32-bit int). However, the sysfs store callbacks
> nct6775_store_beep() and store_temp_beep() incorrectly downcast the
> attribute to a struct sensor_device_attribute_2 (where the index is
> an 8-bit u8).
> 
> Because both structs start with struct device_attribute,
> container_of() resolves to the same base address. On big-endian
> architectures, reading the 8-bit index field from the memory layout
> of a 32-bit int fetches the most significant byte (which is 0),
> rather than the intended channel number.
> 
> This type mismatch causes all beep writes to change the beep setting
> of channel 0, regardless of which channel the user targeted.
> 
> Fix the type casts in the two store callbacks.
> 
> Not runtime-tested: the only big-endian machine available to me (s390x
> under QEMU) cannot build the platform driver (no HAS_IOPORT).
> 
> Fixes: 30846993047b ("hwmon: (nct6775) Add support for beep attributes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ziheng Wei <zihengw03@163.com>

Applied.

Thanks,
Guenter
