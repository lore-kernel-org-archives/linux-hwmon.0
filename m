Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793469921;
	b=vAIjwvmM+JTETpmWKNHaNeXsyUR80dcZW92QU4zFghxCxpaMEVd3ljmZjGvAahA4AlhT
	 lpr1PUHNch5FxeQwaMgc7SBV4aiskmZLXkzhlZt9zoaojaLjhQQShHUrcC7n6DAv7um+L
	 lM+amZN5a8lyCW84Wl5lhT+RmrrCzikpHFTVUzTRIAxH6r7oFjYoNF4AormGcQ6otSkYB
	 HjUVPGdLek+RSu8p6GFjRZP5RhIOCJV5N0fG2QmCntIRTBEfH35hjBWQT/HSSYJDu3N48
	 kupawxQh8mzQ13zE43XrM8ul9BoaqUabcnSSo0+I7H6pEGwbpTh1xFD+W3akK/xBrAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793469921;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=XH4PbSUddZVZXZtjZ75jfe0i+WJ14qbL21Dy3aZUb14=;
	b=wCO0u1nvJMzJv1EKpI9lxXakWqRtDP0ybGLNCPaOOuAWBy37DIWMGMttccjixR7MChkb
	 nfySXDRO86reZhJZgCUCHshQup2MFzN0gYwksk33/oikUpuuwtCVRJ0oLoBaWJoxH+M4s
	 Qibc99DD+/P0uNMhGHqMh+ijPxh7mTXFQlZ7Is5v/NsddclPAqiquRU/9O2omwmpq2aci
	 0/4ycRBVnOaNQq+c3DHqEh4tdNoe9PCytLiHAfWTYFwsusrX1OwI2ftdqq8D7J7pd757m
	 Lf3eCackgZ/J9kuXsqwfb1yVpFWrwiheai6ThL1JbT8zbl68rwjjL/h31mlwfBYm9Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ySZx4w7x;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCA8606A31D
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 18:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DCA8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ySZx4w7x
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id MxRzxXB1yc3XsNDS7xJbML; Sat, 31 Oct 2026 18:05:15 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NDS6xT8zoNSXiNDS6xwWQs; Sat, 31 Oct 2026 18:05:15 +0000
X-Authority-Analysis: v=2.4 cv=JvXxrN4C c=1 sm=1 tr=0 ts=6ae62ddb
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=PR8N35F6eJWpYSb-7tQA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XH4PbSUddZVZXZtjZ75jfe0i+WJ14qbL21Dy3aZUb14=; b=ySZx4w7xmJA7U4Ymz/fdAkBCSj
	vgac4IRO30r0dfM9itNmp04EudBOnmAS80NMyDN16duvBJG59nF1WLOPfmbtQqqjdYYRurqpNWXT4
	EF8Gwu160dfK+6Qe/5kLn2SDEFL52pew52cXlrpwnBy4I5JA3WUsRNryJ2Gng5uTeOt7WjC1oWbiy
	H1kj+hB30xh/74vwkK3Df7OLS+wnSwxtqxD1DFVoadO/J/16VjzMRSZT7VuJEaX7giWvEn3vIg+2c
	KteZxtgZ3iZwLr3ddtfMhjhh+h/6YPMyls07HawUz6xwMYqvqGdMOaMw8jEyPphx0t9M/CwgHvEbg
	cXqr0tBg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:36812 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNDS6-00000003Rms-1L1i;
	Sat, 31 Oct 2026 23:35:14 +0530
Date: Sat, 31 Oct 2026 11:05:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ethan Jimmy <duhxu0@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (acer-aspire14-ec) Add driver for Acer Aspire
 14 52MT and 52M fan
Message-ID: <985bd253-a9da-4b72-9348-956094625a3e@roeck-us.net>
References: <388aa474-3606-4c7f-b073-224d5e0880fd@roeck-us.net>
 <20261031174651.856627-1-duhxu0@gmail.com>
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
In-Reply-To: <20261031174651.856627-1-duhxu0@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xNDS6-00000003Rms-1L1i
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:36812
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOsOi0kG5oWgL3Gb4MrRsJO+xd5cKfhpTi/67uXnQfODdu9qJZR8CQ0lzus2KhzENZ/L3L5tqRbrzEz1lQAU8nsf1qRLof+k3nUS1HdI+p/JaF71nyK5
 wKyAXnifc1Kb3M0ys4y2+Z+wUbS6amLtauCwlkZRkokDpFxu4+0L6IJEsTGcdECRxrEMNZq9agDQq5hENp7/FjGMK5xqtP+RasPpm8tevWc99GVY6UOm4t2y

On Sat, Oct 31, 2026 at 10:46:51AM -0700, Ethan Jimmy wrote:
> The Aspire A14-52M and A14-52MT expose fan speed through an I2C HID
> embedded controller that also serves the keyboard. The same product id
> is used by other Acer keyboards, so the driver binds only when DMI
> matches these two models.
> 
> Signed-off-by: Ethan Jimmy <duhxu0@gmail.com>

Applied.

Thanks,
Guenter
