Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807881;
	b=D1fBr9G23kJUaOQypWBHsB254HnE6qtqQbWdVdbRyUpqArGLOFC4iyULE0WEuzDUmdNM
	 Qhr2yK5dEy3A5wlF19XvntM29b/hwEeEAf17DqkTYHLeirATEIJ1DvkIueFsVcZ8jGD5m
	 rYLpDC+e8TpsJ4vlN1EInRjUALhmdyfxmVtXbO1ndxho+7GJAFrvkhZUMax8RolGVUcFs
	 130Hk5qpxy5iatCXzy6uSkQP/2TXM39wwIEEE9Nouv5wfwU98GyFSONU/aDt4l9vJXLqD
	 A6IlCXf51i5UVnKr/E7UBaj1Qjt04HpK4SEFrTzTGRWyHrP1LZW4FiYvbTPKAk8d4+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807881;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=Yg4FUuMVuN87SJW+itTPRW/kkDj97x/j1OhxTJZOjZ0=;
	b=oAGrXvd5wOKDoi5iKAMfqRUO94Y2lBnVf2wijkyTC6Gfa3n1eiQeiMsUHWp72Xuq5WCJ
	 7yLGvmCxfdSH0pFG7kyLwwaVUy/k/GYHXA7NRQGoHpDT8Fpwzmnwjtz7BCYHxckRoCgaX
	 JLtmteIfn+CURCowWrK4Jz1APQ3+m8RAs7sKMs//OMfaAOMWv8KSCT2hmNHJrQv1Y7/3X
	 0MEKo76lMozF8mOqJ1nLnLVPfse+HAlP/WBWPya8spttO6OrxmaOQOofWIDcZKtJSREb3
	 zXAlFGMvlH7XpJh3UabnI0xsDsFJRcnRMbuXhiQQwl33uJhbQPRnT8HmTbTRxv1Ydmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=P8KOrBnd;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D0F606A31C
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 19:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47D0F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=P8KOrBnd
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id X0l6xg1Imyb4YX1fFxVKuD; Fri, 27 Nov 2026 19:31:21 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id X1fExPzDPFhzrX1fExOQdo; Fri, 27 Nov 2026 19:31:20 +0000
X-Authority-Analysis: v=2.4 cv=JY+8rVKV c=1 sm=1 tr=0 ts=6b09da88
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=1yjjGGwBjegOdnxs56cA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Yg4FUuMVuN87SJW+itTPRW/kkDj97x/j1OhxTJZOjZ0=; b=P8KOrBndl5PJPn5ah2qkhUkL/W
	S2jI6FUZ04nvPM8Ya+EBhvWqcYVOohMz878oe68gYJ4fbPorlCHzfEikcEzOrCM+u+Hi0D39+eOHA
	2Ut8Esa4Ye7PxPEf+oh/p5HrZGK9QhsOoYyvjfZ4KUmjJLmdszbnoPz53RU/CPKFfLwQTu4byrYsM
	KRF/Nomuh15OhfXhjeEObfGKvF+Obk1XZzQxK3pYVyD8xwNy+JSyp9lA7lNl88QSxz9G7DHZlz7pB
	vS0nuAYso8duC6DW2GwHPOtRLU4LeqaLkuVdQgh8mI10QvTb7fSLgk8uxIWSS/HSw8AGEX8Un4Z+2
	DwsDst5Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:51556 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <linux@roeck-us.net>)
	id 1xX1fD-000000040CV-3n3P;
	Sat, 28 Nov 2026 01:01:19 +0530
Date: Fri, 27 Nov 2026 11:31:19 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (yogafan) Add support for additional Lenovo
 laptops
Message-ID: <5c0b399b-e4ab-44aa-95cb-64498660c65f@roeck-us.net>
References: <20261127052841.492895-1-sergiomelas@gmail.com>
 <20261127052841.492895-3-sergiomelas@gmail.com>
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
In-Reply-To: <20261127052841.492895-3-sergiomelas@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xX1fD-000000040CV-3n3P
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:51556
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 8
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOhb6KKZsuByvnDARxNW+hmgLYMj97oI4qBhe3Uy0z7+RD7Okvr3MLMmDnCnyq2DyHazzQpSzFD82v2iJXJc4RJMQJ7uy62WmcAAYZ7rWgdqJctb/J9j
 LUDxHSymzd/0vXZIqQmmPDhMEXNu+jVdNDFZWbaT17sEHYSAF8t+OejSBQAmNQZNHWggt2khwRclDZNZj9zP5AmIAl413iHai/2fNN97YB4IueEq5ZrNugm9

On Fri, Nov 27, 2026 at 06:28:41AM +0100, Sergio Melas wrote:
> Add DMI quirks and ACPI fan tachometer configurations for nine
> user-reported Lenovo laptops:
> 
> - IdeaPad 3 15ADA6 (82KR): 1 fan, 8-bit x100 (LPC0.EC0.FANS)
> - IdeaPad 5 15ARE05 (81YQ): 1 fan, 8-bit x100 (LPC0.EC0.FANS)
> - Legion 7 16ACHg6 (82N6): 2 fans, 8-bit x100 (LPC0.EC0.FANS/FA2S)
> - Legion Slim 5 14APH8 (82Y5): 2 fans, 8-bit x100 (LPC0.EC0.FANS/FA2S)
> - Legion Pro 7 16IAX10H (83F5): 3 fans, 8-bit x100 (PC00 FANS/FA2S/FASF)
> - Yoga 7 16IAH7 (82UF): 2 fans, 8-bit x100 (PC00.LPCB.EC0.FANS/FA2S)
> - Yoga 730-15IWL (81JS): 1 fan, 8-bit x100 (PCI0.LPCB.EC0.ERPM)
> - Yoga Slim 7 15ILL9 (83HM): 2 fans, 16-bit x1 (PC00.LPCB.EC0.FANS/FA2S)
> - Yoga Pro 9 16IAH10 (83L0): 2 fans, 16-bit x1 (PC00.LPCB.H_EC.FANS/FA2S)
> 
> Reuse existing yogafan_config structures where identical and update
> Documentation/hwmon/yogafan.rst with the new models and contributors.
> 
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>

Applied.

Thanks,
Guenter
