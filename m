Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795388828;
	b=iM+LAT3/MeSEXIk2jO1ikHVH+yflBMdlLbp9BDd9cHAqb21uz6XKV1xbORmj41eEbfyr
	 /JsxqHo/iIbaCWy9ADea39r1p1AyzuPcbJBHSu4XxfbBWqW5iSOX+Xe2IlENqo4yxxosf
	 OY7DtrdrSgSOhA80zimoparlZg7GlRBDhl9M9B5FG7PcyQ4AcDYolj8dyzzFX7g7QC0TT
	 Qj4RMxoRelsnE2DzWm025PhtYRw060T1AaSwSlmliIwfKNEI0akayQVRzunR/LctA8xwY
	 PYig012e18yBzOYIfyO2dQ36bTnEjMBZ553C2wzJvn4PcwO8p4ZW8mE1JN0VS/kcStw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795388828;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=zRXVwvIlQET5zYfG9Tttom8faSeJpODyfJ6Vw9eP0v4=;
	b=QPmlvyKP5P5m0/fAr+IOF+X1Oq+OyM6VusBVlT2VoJGo6ifLv6YbSMkv9XWuoTxb0Zhh
	 i0Gxo4LuXHgpUL9ev52ZKGayB32AZ1xLUIrhWe4fngg+TXvmuvvK0DNjA5kROtYXYpQZt
	 KrVodDL4DpwNtEBsOuYFK4VMafOpDAR5LC9EUw+IJ+yFXFBMZErD2gx/u3DL/3OXfv3I9
	 /qLlY1riiYJ70ZGk/IpBn1UFQyZ8T9QM+8Qo+vpPMLUnxL2qOCWjqL9nf92LOM4akq4RL
	 M0IBMLgBgCIC3thZ4xu3GZsQ/rcAaXiZfcmJ87DBwwZliD54ii90G8bVM1W5OOMy40g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=c2AREA0M;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CAC606A31E
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 23:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2CAC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=c2AREA0M
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id V6ElxqESvRiNxVGeJxHBYq; Sun, 22 Nov 2026 23:07:07 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id VGeIxgSUxSeuLVGeJx9MEI; Sun, 22 Nov 2026 23:07:07 +0000
X-Authority-Analysis: v=2.4 cv=NYvm13D4 c=1 sm=1 tr=0 ts=6b03759b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dYNR_tWki1Y21jDd:21 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=Ikd4Dj_1AAAA:8 a=5XR5nEGViU9cR0xS-8IA:9 a=CjuIK1q_8ugA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zRXVwvIlQET5zYfG9Tttom8faSeJpODyfJ6Vw9eP0v4=; b=c2AREA0Miyiu+/4rO4tGw+aZzm
	vYHk2SFnLGlGV7yFgM22p/geoXDgqJxe2EgJhaAINsDU2Qa5OEiWqK3zopqrx0arXO+7JOS6GirP+
	CmkaOmaMxOVzMoE8R2aDDor6WohT3uNvqgaee01tD33o1is2rCtpcA+tLAGPY8osuIoLEMP/Ik+JX
	Om1rGqoZMDVzI9hjLoR8ZVvPNQmNS142gEr9enrSW2IlnmrWdiM7fxvC0Cz4+7MqMg43+0x9aBlMj
	Ha+fBzWvfZxoaaMCh2znlvrFWDgIS8JZNP2dxKAzcHVDrdGU0E1gls56HhjR3kCV5elrBENavAijg
	zQ7zr+8w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41394 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVGeI-00000000uoh-28sG;
	Mon, 23 Nov 2026 04:37:06 +0530
Date: Sun, 22 Nov 2026 15:07:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Felix Radensky <fradensky@nvidia.com>
Cc: Vadim Pasternak <vadimp@nvidia.com>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] hwmon: (pmbus/core) Keep cached page and phase in
 sync with the chip
Message-ID: <0e2091af-093c-4d59-a3c6-29cc40f1ad21@roeck-us.net>
References: <20261122170949.3059743-1-fradensky@nvidia.com>
 <20261122170949.3059743-2-fradensky@nvidia.com>
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
In-Reply-To: <20261122170949.3059743-2-fradensky@nvidia.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVGeI-00000000uoh-28sG
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:41394
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfM0kHCYG0rDBj3RrZh7XRsnbdCltuI0t/SkPjhDyzzl4FLHHjh8DNfZ/3Cphp17bnCHMfyszsWKXpdxtsx2lW88CRg/9x/0MlfXK/KNF33ozaAt+fd1C
 J7vEQsxpSRmX4MGbETJkDLUUcS7pPjqa9BwzQxliNjMLfGvoZ4H46f7UPU7uds8dHHV7NESnDckCH6aGWXJyTv2oARt5ZWOvjWN6/AeSllmNj/c7MJv9R0Hy

On Sun, Nov 22, 2026 at 07:09:47PM +0200, Felix Radensky wrote:
> pmbus_set_page() caches the page and phase it sets, and skips the PAGE
> and PHASE commands when the requested value matches the cached one. The
> cache can get out of sync with the chip though.
> 
> If a PAGE write succeeds, while the read-back fails or returns a
> different page, pmbus_set_page() returns an error without updating the
> cached page. The chip can then be on the requested page, while the core
> still caches the previous one, and the next access to the previous page
> skips the PAGE command. The same applies to a PAGE or PHASE write which
> returns an error after the chip has accepted it, such as on a late NAK,
> a PEC error or an adapter timeout.
> 
> In addition, the cached page and phase are updated even if no command
> is sent, that is for a virtual page, and for a page without phases or
> with virtual phases. The cached phase then no longer reflects the phase
> of the chip, and can suppress a PHASE command required for another page,
> even if a failed phase change had invalidated it. For the page, this
> only causes a redundant PAGE command, since a virtual page never matches
> a page of the chip.
> 
> Invalidate the cached page and phase before changing them, and update
> them only once the respective command succeeded, so that the cache only
> holds values the chip has accepted.
> 
> Signed-off-by: Felix Radensky <fradensky@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

Applied.

Thanks,
Guenter
