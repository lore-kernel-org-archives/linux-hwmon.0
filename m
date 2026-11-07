Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794067015;
	b=oRax/ACDBkaQUUyA3Edma1qdYh9Pd774YBLFc34nnqcAlfdYhuP/S827/etWS2HY1TkF
	 Eijm9kefTO73xtvuIMcysLsBiLZdWOW0498zIcxzxSq2ErYW/b8t8mGy4BIgJIEd6Q5+J
	 EbrZYr0oPGH0p0gyayzdY87afHFEI5fF++CzIY/3OKxYvjNGivVM5pwX/zkDgjqU8Ll19
	 jdFjBNDD7CXlV1SCj5lhLz/25H9jXyl8DGBsCiX8JNIISqTAgtr3+U1cFhtX5JrmGcgxa
	 n5yn8ttMgX3WhKoKO1DtLoz8rRKnlctcz1kLqqPGG3DhFVZ6Kq0I8FuBoNChf5YJj4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794067015;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=jkGPn1wQc7Ebuqw4SWuRJT0DLUb/33269ZxdcTJ1u1M=;
	b=RdjSvoQTQdYpfOoynPw9K8MhYEnQEGTYY6cdAUyRb2YRPDCFLVjYGQOgUhRRxU3NZ2p9
	 AaCT8RLrOXXMsL0ODJL1/bcWcJZbTksSMOuujqFMC3A33RTpgocKh1sxZ6ZTXDYO7PLM/
	 rz+TGRoP941t6YQnG3PECzIK7HEDvMCA5Ot7OJNkBY2V9iyT6o3n6WFNDoDsTaVBUs0bp
	 npmE8xbsHnMTuYaGswio8JYprDw8RVwOAe3fM8GVwcAaVzy1irAjTySchfr5B8OCOocHJ
	 vni9Ys8Z3vcD+BhoorYjEbQUHN1yHiG0kaBJ1fiwxs9iMuEEQ+Bsdc2Yb2wfFPEnkWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=GGYJodqy;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2951B606A326
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Nov 2026 15:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2951B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=GGYJodqy
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id PNpxxuslHOOJnPimkxrhpX; Sat, 07 Nov 2026 15:56:54 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Pimjxl0mylaNKPimjxtfLj; Sat, 07 Nov 2026 15:56:53 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6aef4a45
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=hLRJDZDFrmx7wTgVqVsA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jkGPn1wQc7Ebuqw4SWuRJT0DLUb/33269ZxdcTJ1u1M=; b=GGYJodqy+mofxo+qSFQBoVOes7
	69z//7Ph/O6MBP0V3xgNfLZZiVkjmCC520ASEvF2wWTSkU1y1upa0K57P1EI0mQ7IXOdx52/HVVfd
	6W3J2hFY113hJZbivjr4By5TA5DLjBk3NNoi6VA9YQIZ4Pmd/wpxQhvTL1h/rUJAPx30TYsEswPpb
	hral/Gk480eibaCtHsO0N6piU9X8Foio9Y3s6K4an5cdZmkyCWm0AbVaPwE+K/JGIADPBwvkiK2kO
	wCcWsIUsj1xSnVT5ZnsKnaZ5XbyIgzLD09rVDyZhmdJq3Mrb45uElip8QO3RYKYEjdINSBrTxpAhF
	JJqWxTnA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37414 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xPimi-00000004B4x-3pIP;
	Sat, 07 Nov 2026 21:26:52 +0530
Date: Sat, 7 Nov 2026 07:56:52 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tomasz Bojanowski <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: Add driver for MSI Mystic Light controller
 voltage sensors
Message-ID: <812ee6c0-82ac-41f6-9eca-1f17c6ef715d@roeck-us.net>
References: <20261107082821.8257-1-tomasz@bojanowski.me>
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
In-Reply-To: <20261107082821.8257-1-tomasz@bojanowski.me>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xPimi-00000004B4x-3pIP
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:37414
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 11
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMpIbVPk/9S8cPD8PaVEFzRLGqUT7CSPRI2a2efe96RpOXtJ3a/xEAKGWr6B6owwoqMRxqVZawDhzKnBZyrYxy2u/i9oCr9azh4v7rLwCluTl+w7SlHQ
 a1L1KRSNM5lIiPUb32u+wCh0YpGWKJumnwb+T9xXMHWyWjk+rZ3a/wzIyyQsjuAjqqh0QIlv2ifGGKpE2LPMI9qZE9YV8xfs48Gybg9N7N6paI/yyX3OXtDW

On Sat, Nov 07, 2026 at 09:28:21AM +0100, Tomasz Bojanowski wrote:
> MSI 800-series motherboards have a USB microcontroller (0db0:0076) that
> drives the RGB LED headers. Besides the LEDs, it measures a few voltage
> rails that are not monitored by the Super I/O chip, and reports them in
> HID feature report 0xf0.
> 
> Add a driver that reads this report and exposes the rails as standard
> hwmon voltage attributes with labels. The values are cached for one
> second. The driver never writes to the device and keeps the hidraw
> interface, so user space tools that control the LEDs through hidraw keep
> working.
> 
> The controller has the same USB ID on different boards, while the rails
> and their position in the report depend on the board. The driver is
> therefore only registered on supported boards, which are matched by DMI.
> On other boards the device stays with hid-generic. Probe reads the
> report once, fails if it cannot be read or has an unexpected format, and
> only exposes the rails that return a reading. For now only the MAG B850M
> MORTAR WIFI (MS-7E61) is supported.
> 
> The report layout was determined by analysing the vendor's Windows
> software and confirmed on hardware.
> 
> Tested on an MSI MAG B850M MORTAR WIFI (MS-7E61, BIOS 1.A68), with the
> driver built out of tree against kernel 7.2.15. The readings (CPU 1P8
> 1.79 V, CHIP Core 1.04 V, VDD MISC 1.10 V) are stable and plausible for
> the respective rails, repeated reads within one second are served from
> the cache, and hidraw access works while the driver is bound. Loading
> and unloading the module repeatedly hands the device back to hid-generic
> without errors.
> 
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Applied.

Again, I'll be happy to test with older boards. Alternatively, I might give
adding support to older boards a try if you can provide information how
to access the sensors on those boards.

Thanks,
Guenter
