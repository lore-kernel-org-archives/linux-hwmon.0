Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675176;
	b=fsg3Tdk7ioGlb7NUKnxEuxybT7R7Cl4LWfK6LIPM8UjJNzs0oVTWWNn/nWAVqyG0tRmw
	 nUda9iReq/0Ignu5cab/RkM+FhglfWcl+MJD6NVtkmUkIX9eoK3fiYX98Woa5c+ubuP9S
	 1HHFIdb2Ujkub4QJGLsXLrpkC070dB1NEUJHTZiMYNkW2z8NE1MU5TzKlwgdEDkIz5ouo
	 woG1vXOyGdJhkDVN+T/kWOBar13/owZzCMQbOaa0Ei05gHS3Qh1BXB+7PkwyeeZgQk7+Y
	 Zk8/fM6pD35+rdnBbkc7PgRPDtEcxpCcUMVHjXoxJltWss1NboUDyOHEX14Yn1fJ2BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675176;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=m3Yf5qoXQaNvm1hgJWQS/Me8bhvGrg8HNVS3EQcQEYE=;
	b=ZF2nPQ69y2upk2K4hBgtzcs4Zi/SnGZLodU9aflX4cFyvIu6Hyc3b7GVeUIxtI5FZR6V
	 BH1tSRlieZkd3q/cf+RSTu2tFX2ZpJk8xcFXsMmU4eIt4CPl1L1r4EwC2no3f+tYvE3Os
	 8CMtSrHpbMteYkJwA+HTicudE7eXIt3jQTQl9B06DIunNiuqtuMPZWRWyTBEi36InoIMc
	 1VrA+YpgXnFPEpNSdjdX8bfViJvyWJOELXcI82CPkL3KXTDYaXruDJWpQ9cHNhzW8PhY1
	 PzJ9mRcdtc4UpCVZ4PjrlL8wlUJ63YIND3WIT8huQhxOSCAJroXlv6WfBekBOnDHB/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=JwDZYtsW;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA219606A329
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 16:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA219606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=JwDZYtsW
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id SGFRxfhJsyb4YSGznxgKn0; Sat, 14 Nov 2026 16:52:55 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SGznxMHge3nNNSGznxpe1T; Sat, 14 Nov 2026 16:52:55 +0000
X-Authority-Analysis: v=2.4 cv=TuLmhCXh c=1 sm=1 tr=0 ts=6af891e7
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=cbgCNc2d-JY49THGD4sA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=m3Yf5qoXQaNvm1hgJWQS/Me8bhvGrg8HNVS3EQcQEYE=; b=JwDZYtsWD5aIYJPiifFwEp4oIt
	Vsh9BjtBF+jOkgXnfUH7UWf0j7vhF7STC7XiyfoIjqcE1CHvl7ZpkuKOxDtuWSLLQNO1c6TqUb4Zs
	l0G5c0EYFdWV/WBFv+/koKJJrIJkPQjgICYTBZGDUPbhSHzmhgDDvkqaf7tshJUbfC71MagTnnnDf
	eX4kUJ6383kYEVaXbTj+As3kzN4Gpn4GX/AT6vyh/iDUxUkk9aE0HMePCz3NPGboAGgHn1jzSXuw4
	afTEbBtpd2H1PmxljCy/LVbKklAIP0BZrk2ZFNycXZlk+Iuyg5DC5b7pkJmssz/RNF2k8F0V75Ad/
	WnUyQEJw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45486 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSGzm-00000000PI7-36d2;
	Sat, 14 Nov 2026 22:22:54 +0530
Date: Sat, 14 Nov 2026 08:52:53 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rosen Penev <rosenp@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (dell-smm) Reject a fan_max that the BIOS
 cannot take
Message-ID: <73e9e9be-96fc-4189-8d86-7c4059b7f676@roeck-us.net>
References: <cover.1794633179.git.rosenp@gmail.com>
 <6d3b86acf6713e9286e60ecf788582e840946238.1794633179.git.rosenp@gmail.com>
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
In-Reply-To: <6d3b86acf6713e9286e60ecf788582e840946238.1794633179.git.rosenp@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSGzm-00000000PI7-36d2
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:45486
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 138
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfO9NkRpRyu4Bff2sHxuBZFOGlZ4Vpycq1LAKDZYoUdSz7/TfQ5uDemCpdBQJzUiybjFenjmdW1odjemlj5LGY1R7vHziCfcSl5NUFKvnBFXKuM0U8sv4
 7tRwF+tciu4Qc98eTzNvjXhsvwldGg4RWLS2wCqxgA2gOV3i/mVODBPDjrJfAaZihIzf1ipnbZwYi9OyOwdOfZNWD+ZJPMMUaM1KWeM540IUl+JpQdpeyONs

On Fri, Nov 13, 2026 at 10:20:23PM -0800, Rosen Penev wrote:
> The fan_max module parameter is used without any range check, unlike
> fan_mult. dell_smm_init_hwmon() allocates the nominal speed table with
> 
> 	devm_kmalloc_array(dev, data->i8k_fan_max + 1, ...)
> 
> and fan_max=4294967295 wraps the count to 0. devm_kmalloc() then
> returns ZERO_SIZE_PTR, which the first successful nominal speed call
> writes through.
> 
> Values above 255 are also meaningless: the fan state is passed to the
> BIOS as fan | (speed << 8), so the higher bits end up in other parts of
> the request. Large values that do not wrap still cost one SMM call per
> state and fan while probing.
> 
> Fail probing if the maximum fan state does not fit in a byte, like the
> existing check for fan_mult.
> 
> Fixes: 81474fc2fae9 ("i8k: Add support for configurable maximum fan speed value")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied.

Thanks,
Guenter
