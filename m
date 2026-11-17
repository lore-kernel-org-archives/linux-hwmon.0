Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940970;
	b=p5o+YsaPWPnXm0rYJp0Vibov9W9aS62T/JCQY3RWwdDn+zkXDID3vsu8qJ7AxprJWT1M
	 ChECHvIn9vP9o4hmXbIYtB9KBZuLz8tZk4BjX29/hHXv07HdiObJ8ucxab4eO/AIXkm6g
	 5YXKf2C9b+sEcw7B9pX4iGdGau40GkKkom2PP/MT0WmyJ2SNlllj1kufjUAgNGv4qLEyk
	 24tFulHSLdXA05Dtl07Nhbi4zULZGgYIPzw3PVuO67PJV2XGNSg21aKBznj7cH5Ffqo/g
	 qp5OorKBOX66cPl8snwQ0Fxj3q6B+yHeERy6wKK+thkaN4rzxjlfCb/ybBjb9aGqMpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940970;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=U073sgNxCLzTRldFiejU5fDtRk4ZLVox1V5xxlEfv8M=;
	b=CCFuOfoA7wFH40jy6/N9BV5hcqaYLOLOtEded0DqMJaUq4SxvHspUUXFEMCJsMqHHHmZ
	 l5+DZ55p4iEMZ4E9YbDTIjb1OKrgoYWJuPcQlen8x/rrwYgSMKqdKzByAY5gvzMFEtDBs
	 oTWgKmemaRDRQXalmaH2Zxagwm9hoFUFyRuP/bgj25EbbMuDnAOv+9kfbL1/gdSVxUJyV
	 Wb5OyKlr0mWBk0IH1kdddJQLtLGbI33njAzjyt9hQ2FvKLgNPQfh842trp1oWMShFHHOI
	 wwm7m59F5civyK/li1ldUpcALTsUPLMc1vJvN4jlKmD1xGnBAtg8XGU5KSEaj2Xp0zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=I+hiM30B;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24461606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 18:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24461606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=I+hiM30B
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id TNX1xsaJDyb4YTO8ix4ZZw; Tue, 17 Nov 2026 18:42:44 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id TO8hxbm75FhzrTO8ixEGmj; Tue, 17 Nov 2026 18:42:44 +0000
X-Authority-Analysis: v=2.4 cv=JY+8rVKV c=1 sm=1 tr=0 ts=6afca024
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=gAnH3GRIAAAA:8
 a=oLH7HzBLeLt1e18YKfQA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=U073sgNxCLzTRldFiejU5fDtRk4ZLVox1V5xxlEfv8M=; b=I+hiM30BEG38Bz+tkwRTcnw/p2
	PH8f8XA/0RSfyJ4x9H5SYtctd6Psc0ealaHpWjQmEw9cuaxzPllAM2sqNncsXJFE8/6a4XG5yfSca
	g3dUP22c9ZwAF7IHyf1M4k9kn7jTj+zdrHONgu22h/2vXlq4J/0sLdukytzURQJFeJelsv2iIRaCP
	WsRcO15A2OtlY+IOls2E/SzqMNkcdpV+lV47QPdU+5EYkerR/+GO6EXOLwNObBvDQpPxk67ct43ym
	0ANgIrexZJ99TnfFBUHI1Gw1uCKpWmntjgGMrteGVnRLdTzzuywgxAd2kH4y7p2dxtdjV0OQZ1Ry7
	KMweekjQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:48682 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTO8h-000000007XR-1FlE;
	Wed, 18 Nov 2026 00:12:43 +0530
Date: Tue, 17 Nov 2026 10:42:42 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher de Guzman <christopher.deguzman@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] hwmon: (pmbus/ltc2978) Add support for LT7175 and
 LT7176P
Message-ID: <175a2d96-3716-4fbe-886f-42040c8d54f7@roeck-us.net>
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
 <20261110-upstream-lt7175-lt7176p-v2-2-dd60d28383bf@analog.com>
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
In-Reply-To: <20261110-upstream-lt7175-lt7176p-v2-2-dd60d28383bf@analog.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xTO8h-000000007XR-1FlE
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:48682
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 16
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfB4SJYI2l0wdBr8SOL3+quxyBfBqn+/EJwyPI0rYwmOCwQZQl2Bgbzt7CeYWm8AnkowCgOL5DNb28ccoLlMX8DomNCrkqGnEOUYj/aikMkj8NeQQd+SZ
 ImxdLDN3XK6gOmxdyEAKNdP2oAHPaAqKOdemPS+gKEHYMRY5izf1AyNH4NYsh5dAzOjn+M4mfxptVzredCP6fFCfuzBwWAQec5VKtX13i11EQUsfaEo3DGO5

On Tue, Nov 10, 2026 at 06:00:41PM +0800, Christopher de Guzman wrote:
> Add support for the LT7175 and LT7176P PMBus buck regulators. Both
> share the LT7170 family MFR_SPECIAL_ID (0x1C1D, masked to 0x1C10) and
> use the same register layout and configuration as LT7170/LT7171.
> 
> Chips in this family are distinguished by their PMBUS_IC_DEVICE_ID
> string. Instead of adding another strncmp() per chip, match the
> returned string against ltc2978_id[], as is already done for the
> PMBUS_MFR_MODEL fallback. Only entries whose name fits within the
> returned data are compared, so the buffer is never read past the
> returned length. Suffixed variants such as LT7175-1 match their base
> entry.
> 
> Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>

Applied, with the assumption that the ieee754 related bug will be fixed
with a separate patch.

Thanks,
Guenter
