Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795388888;
	b=FKNo0pGYAkHwYNef0mVJdJrYee7EEtcqrOJEAzOfdYPYJAKRLSSCWMKFS3FpOzFzU+6+
	 IO4uXCtAv9KyV28t9OnCtpVTaPXkPcNPh7k6f3JKmiJc3Xd3btnNWUJeX3AhIRmmE71nV
	 P9GLAxKHSTjm0kL6vxFgwB3mUx8W9hHJvuNSbcuiX2rLHQaQk83o8eZJD6HVmqbRCCDRK
	 sCCr1F8Ethk24r8XV2jIZ8CDf+bwakx7pSwx9m4mgfhPRYWgd3ojQ5Lmkm3ZzGk/pikvb
	 J6KlpIJewu475AzYy8g3TOVBnhk49d+EYH/ENSGkPVMh1PIgNZXvJaQiHVrCtGgLpQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795388888;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=pSFv1TzIZTPgZoW/WU2hDH+j4HL51DCXxt28O2Ykllc=;
	b=BLDWBscULEp2FQfuduMnJYETc7ufwznqD8W3lS6xQJWKMekvE72UOVmrwGLPBfPTVHaw
	 POl90RVOMRhYj8fCROY7gGKKwuK3XwQzzjIkaCnlq0uDBp1uq+/kKvhXWm4nCNX42ZfOQ
	 D1zfGhGG6y1usKedEF4Ic2btRS042F0D0LjVBibEbDT+j8bHofNMChkf4Z8Dqsh16gEM4
	 BcibEj4DCUQeuZKS7EPHKVkowNILoWYl0pxU09S+BwiiJZafj1RtLdUNB3PDrBGeoSGe0
	 KADceSg2uEE2Wfv8UKVl3/OGbA3l0+FgQ3P4wneiihStVbMb15LunsqP4g+jNzw5Y2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=bSltHqvo;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36B8606A31D
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 23:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D36B8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=bSltHqvo
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id VDSCxFU1POOJnVGfHx04Ct; Sun, 22 Nov 2026 23:08:07 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VGfGxrVE9xqjjVGfGxH3rt; Sun, 22 Nov 2026 23:08:07 +0000
X-Authority-Analysis: v=2.4 cv=bZxrUPPB c=1 sm=1 tr=0 ts=6b0375d7
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8
 a=Ikd4Dj_1AAAA:8 a=VLlcURApojEC_iPVA_YA:9 a=CjuIK1q_8ugA:10
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pSFv1TzIZTPgZoW/WU2hDH+j4HL51DCXxt28O2Ykllc=; b=bSltHqvo3v5IPTetUzlE7ldHhn
	EWDhExloMJL3vZrD0heKwM79haAULHuVUVrYttDnW1CY7T+myq0c/qDuUg2UQEgmJaAVam7QoNykd
	ADEuv2vcbLuzwn0F+AGY2nMocWjCVrfe9YMo5OVqzLCSPb0eYJivfLUvVACPLYpVwPhEIxfuPOMuW
	0ooBHLrtqe/sloz6D2Lz/dV1k5XWYk6UA4wzLUJ4t8fapmPvw+tsYUOywmejLr2jmjxfJqAeOQ8uf
	zNoyOabWzoDFPuKH2xvJBNNtAEpGPIujhBLteQWvVlK8dFlubvnKhe3QVwQR/30JcyC+3s1y4UUdI
	lbENbIcw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:60698 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVGfG-00000000vAM-1Eh9;
	Mon, 23 Nov 2026 04:38:06 +0530
Date: Sun, 22 Nov 2026 15:08:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Felix Radensky <fradensky@nvidia.com>
Cc: Vadim Pasternak <vadimp@nvidia.com>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (pmbus/core) Add PMBUS_FORCE_PAGE_CHANGE
 flag
Message-ID: <a155bd34-62b1-453d-8eb6-ed98341b8133@roeck-us.net>
References: <20261122170949.3059743-1-fradensky@nvidia.com>
 <20261122170949.3059743-3-fradensky@nvidia.com>
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
In-Reply-To: <20261122170949.3059743-3-fradensky@nvidia.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVGfG-00000000vAM-1Eh9
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:60698
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCXhPdknliqniJTL99AhdpIz+SujrtiYCbzI1Z180z5TR19ZMvhRLMkBWnkx5cRxvypk+qwM0svEjb2e6DXFtL5BMddHqW+/Yf1MOhr8VPQJNidpQnyu
 HmEW38FT7JuS+WyIzZSonVM5lTafx7JkuLlsmXvoV3lTENOjJIYYBjxSbiCTxSgvbouGYlIFAW8/3FccHhHsSNNMLrjyC+/I51grkwvTxyLYjgk3FuikYC5C

On Sun, Nov 22, 2026 at 07:09:48PM +0200, Felix Radensky wrote:
> The PMBus core driver only changes the page of chips with more than one
> page, and neither writes nor verifies the page of a chip with a single
> page. Some chips with a single page provide manufacturer specific
> registers on additional pages. Their drivers write PAGE directly to
> access them, and have to change back to the page the core expects on
> their own. If changing back fails, the core accesses the chip on the
> wrong page.
> 
> Add the PMBUS_FORCE_PAGE_CHANGE flag, which makes pmbus_set_page()
> change the page of a chip with a single page as well, so that its driver
> can access the additional pages with pmbus_set_page(). The page change
> is then read back, and a failed page change is repeated on the next
> access, as for chips with multiple pages.
> 
> While at it, drop the outdated number of flags from the platform data
> description in the documentation.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Felix Radensky <fradensky@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

Applied.

Thanks,
Guenter
