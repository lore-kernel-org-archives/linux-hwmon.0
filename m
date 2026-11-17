Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940878;
	b=buaPqDUQh6VhAv2XuCtyoh8J9L7EAN9opZRwdyN0Wu0NUCsCgoCvbajPqLp/k15qEutp
	 KwuIp2VC37W7VMG47C0pjTnnNvQmuDH4+0E42K+OUdNVff468io6c7KS2h0XM2stTX/6B
	 0Hj+dMaQOX2fmnL61Qav3jQEVH2pXe0P8kYgM+FRAgHSry7Y0BfLyVI/ptaw+q87MmLZF
	 g2oMQK1q5FxnHT84w6qvEcDAyvmI6zi4D8yyjYQuVh8kdCjhcW1xDX8ErR39lwbUR4nLx
	 BIbxpZ7DXR3KYPfQ4x27yKHd4hfkIkaw+QEafAzC9rGF1bHJoIu+x6rRg2471UKEQnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940878;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=uzgMGuJH7y9PpdqDVrfWe+YpxihFKk8NBF5FqP0/B48=;
	b=MTgV+y4lLur7aBBpUwZtZiihcAm+ImF8KkwBdaNP4DVCSCTXIZl8tE0yBzxHMHKAXljm
	 zxdF6icYGblW9t2ngI096HthofbBpTv1lzOSLuZ3v8dit5mf0C/wNmWaDCc2lJCnKfoIY
	 KgPTnhgfyRm7SQ3od66v86XzEMEMTGbn9nLhDigHVCOkZ7O2T/2L9OMe/OOKTPtn6Kek4
	 jEHzEETmTAGsWX0m6fYhUhGQJulFjMU+FcnplI3FpYdyZRXmm4RqY8JzE6PZfqWKnlMGK
	 4nf/4uW2b4ZUhK3uql1ZFgLs1O0Xl/4XWJT6FqGRVIWGr/6LY0KPKe1XpqecHzIw7gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YFDmMSQ6;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3188A606A337
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 18:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3188A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YFDmMSQ6
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id THscxRj1yRiNxTO7DxaY8S; Tue, 17 Nov 2026 18:41:12 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id TO7Bx7sa9uJrPTO7CxgSP7; Tue, 17 Nov 2026 18:41:10 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6afc9fc7
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=gAnH3GRIAAAA:8
 a=EUspDBNiAAAA:8 a=3OfnbWqpRXkE7MXKp-4A:9 a=CjuIK1q_8ugA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uzgMGuJH7y9PpdqDVrfWe+YpxihFKk8NBF5FqP0/B48=; b=YFDmMSQ6njJ7g3TGwyqyWG6HbD
	VSUs5xReDgoBDPjfuNVzXMpkDWlDX/66hznqmy1hiwlGvrhHVLfoIqNb9Ba7058Fj6B3Q3Caud8S/
	RW4Y2jcPocH/FzHoCD50S6gLiVL8jpsaYxgL5l4OQ1Q5cOVPJ0DFG/WWDTvYQFb1AXOYJgsiFNtwm
	irFQAVbPn8u3m8Nr4ILti1/hOWXmj/wc+qwyZYYxG6QAHRK80Bz2d9EgvK8t+nqCigZhOSMU5dwck
	hdNbtLBqmKlatziwPdDFz8+mwwxOXQ0TELj9ZWxiKMzSOemDfCMfTvTmSh7mK4LAV+uRtCpespuTU
	OD6atnNA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:45336 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTO7B-000000006da-1bIQ;
	Wed, 18 Nov 2026 00:11:09 +0530
Date: Tue, 17 Nov 2026 10:41:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher de Guzman <christopher.deguzman@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: hwmon: ltc2978: Add support for
 LT7175 and LT7176P
Message-ID: <ea14de95-c079-4302-8a65-86c4c65a8e12@roeck-us.net>
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
 <20261110-upstream-lt7175-lt7176p-v2-1-dd60d28383bf@analog.com>
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
In-Reply-To: <20261110-upstream-lt7175-lt7176p-v2-1-dd60d28383bf@analog.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xTO7B-000000006da-1bIQ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:45336
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJNrMF6PgPhCSUwbzGT4gM/s4thUMvk8dz4O/BDPo+XYadxW7+9kByOdRtTX0g6mvq2UxhBixG9xISLVdBZaGvdeqRxWtZFaDqtsS2N0+LhRKgX7KVhB
 hxAP2Dp+p7rp2eINClX/mrtELgKav/JG2fPeLClqO+n5uVt+xeejVvFP2D0vfjpo4wbVviRrqtpaXta38Sm9Bi3VAwsYHMwu9iTFzZ97ZH3S4mwVl22VD/yM

On Tue, Nov 10, 2026 at 06:00:40PM +0800, Christopher de Guzman wrote:
> Document the compatible strings for the LT7175 and LT7176P PMBus buck
> regulators supported by the ltc2978 driver.
> 
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
