Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675281;
	b=Z8srCAQnVjPXh2JtCtEBKFSvAw4NdefZIzO9zdjuwDeB8qUXJOyioL/LQK5NX3H+88h8
	 R/5UmSnHgaqH0WbJzXDF90Eh8cP9jWBmIFm0L22TEOB4bBPkhuv828nZwlWp+M1IFFFGZ
	 cqKKZ2FCOUI+Cdw5fUziHLlqj/IqjuJxwN8V1LQHEx0xwRBECqLOlTNGTiutoJIVV6GuW
	 9aGTzYhkRYYlp6F+I78ZrP1s9gCDVMhkTlGllNB8biDaxrs/OrpDYY5XoL1TGJz7UpEPA
	 vWwT8POgoGdy+6UsleywvseAyO1Fv6OnzpOpt7FfHHlTNWnBwrIbCN6UdpOfszMLJrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675281;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=n5UsVPtZvhQiUvUeNRBWwsmppzZEReyOurASB6aSeh8=;
	b=0AwibNUk0uRA7wmT8QqZipI2dP5spV213tUltiBNyqPRmdWUOX1rYPNM8EMzFdOiXyJU
	 d9nDODvk6Fee7HtGc3c9cvRhP9h+hmV4q8kgyIHMwTxgDI9YpQi7IT1aSwHXbv70kOdwi
	 OPkusb5GqRA9RVF69ggcAGwqpk2pSI1K+LV2fnETziECy3u4okJ66RCi/B6xvlCiGs8YI
	 JuYsBebDZW51/+K/HDXnRiZTHRnYM13HQEhF2SPeJfGfWDu+PQPWpa3+IEnEmX68ClYkC
	 qWmyWHYAlwX2NtEkBLcX66chP/+kubvzczYPLRLBGGbgRn9YNZOy2IfguLLql31GSrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Mhn270Wx;
	arc=none smtp.remote-ip=35.89.44.33
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1234B606A327
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 16:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1234B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Mhn270Wx
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id SAYExqDBCAR1iSH1UxOGVC; Sat, 14 Nov 2026 16:54:40 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SH1UxzxjeSgq1SH1UxTxne; Sat, 14 Nov 2026 16:54:40 +0000
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=6af89250
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=CTxgCXsYzwGYwadptLEA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n5UsVPtZvhQiUvUeNRBWwsmppzZEReyOurASB6aSeh8=; b=Mhn270WxrsvwR0XKkiCAka/6g0
	8RYgA4rLnAH4/dcm6iIHaDYcqOoF+DAIWqGXUji8+ajq4FHCLkmIRSGevPO32b5FC+yZ5t3Lmo+Hj
	VjXOIA2nRU3ARhjjZV53jSFXVgVagKSOYYz6DwcvXE6WLks7mhx1yvU+rFeHfPcjTCpu9Rf1f8Jz9
	Y+iX1ttgu0B5BYC/jN3cxRL2PZlG+djFRuvnimPlugzxCPdTgWSUvODGTOSPemBY9ZEzCdebpRK4p
	ixRghwxFvbdTZwoSmmMHEsF8vIuOhmkia2zksl1r+eaWw30UWo6UU1gRK12I/6CesDrSsBxFy6SZ8
	6U4UrUEw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41990 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSH1T-00000000Pyj-3jJB;
	Sat, 14 Nov 2026 22:24:39 +0530
Date: Sat, 14 Nov 2026 08:54:39 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Shady Abu-Hussein <shady.abh@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (dell-smm) Add Dell Pro Precision 7 16
 PW716260 to fan control whitelist
Message-ID: <996a06e5-3b2a-4cf7-aa27-49bfb896e725@roeck-us.net>
References: <20261111172707.84072-1-shady.abh@gmail.com>
 <20261112160447.136279-1-shady.abh@gmail.com>
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
In-Reply-To: <20261112160447.136279-1-shady.abh@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSH1T-00000000Pyj-3jJB
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:41990
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 144
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAXb/Xq5lYoKGubvho6chDBJvfKcipmY6Q0iswXjEpyfPHrH1yayEmCnHu4cYTY70XrdNWGBqawZnf/kHQJtjYTjxvboSclnUgF21sFh85w3M9iH8BUB
 uFmAcHadCkMo7HJ0MMwy5e1jqj6+/ZC78c7nWj2ljkBSVssXRPxjDQl7IPGfewMdfzStXhCRJyf77OvKwX7W7fmdx8NgiY7q1cWrjQn5UE+zt/Fjc9/YFUF3

On Thu, Nov 12, 2026 at 04:04:47PM +0000, Shady Abu-Hussein wrote:
> On the Dell Pro Precision 7 16 PW716260 the firmware fan control
> cannot be overridden using the default SMM method, writes to pwmX
> are ignored and pwmX_enable returns -EINVAL. The firmware AC fan
> policy also requests speeds below the minimum sustainable speed of
> the fans, so one fan repeatedly stops and restarts every few
> seconds at low load.
> 
> Add the machine to the fan control whitelist using the
> I8K_FAN_30A3_31A3 SMM codes. With this, writing 1 to pwm1_enable
> disables automatic fan control, the fans follow the requested
> state (0: off, 1: ~2500 RPM, 2: ~3950 RPM), and writing 2 to
> pwm1_enable restores automatic fan control.
> 
> Tested on BIOS 1.5.0 with kernel 7.2.15.
> 
> Signed-off-by: Shady Abu-Hussein <shady.abh@gmail.com>

Applied.

Thanks,
Guenter
