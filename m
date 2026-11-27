Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807750;
	b=c/tNKIRWnR3RaP/1WypSbvxKA9IvER500wroccxCE5A8rl640yogzazCW/tA/ESkr0C9
	 vS2OWuYd+Xr0fY+VLrH2d5o621VZyPWSwB7v/0VlQ5Llnj7iOAG9Yjyj0NTuJJLAzBHQS
	 ZNpu0wV/NwoikbF92ux1OMcYv8gXWJokqP2yLTya2+NelLwUlrfNApnY+h1KdUMghe0Sp
	 CHnyymQQbJ1rdqjldtj4KbCpAk6+ZIgms8XY/muKYPVL/bLlPyHPf/t4iW6eT9xfHHfuI
	 UFFjm+dbCf9JPda+X4jFem23ixxksjL6IvTCvst2oYCeaHlIqFzEgLPN9F8cmBc3yGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807750;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=1RBGQR+zk96JePPfnwT968f98+WGFOWzh2KLo2VonEs=;
	b=M5zEU2xZz+fpazInWQI3omMya+Oj8PoepU64IEVjCANPdqAkMsM5uwKzFGkCAoCGYpD+
	 ljhsmBsKHq7OVCesM96eb52LFhs4smR+8dLxUWcCk1SaaqSjC54TPD4Xvfl5BC2meibE7
	 LP3s5a3RS7I9bymkTRwHMZqXyRg8QWdbs25a2jkTMBYk7B4wWzhhE2oCPzKhgKtSGrKBi
	 In9ulvyuygKbP9JC2sPY82M70r4yyWgGXMkdivvBqS8vzPenbLfdzvqjYTq/46ccYZb8A
	 CQwXNdva/BOH5AIx8DkFSC/vhD+/NUUvppyJ5UxVn9YldESFXGaFfIIp3RauvAKlDEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vvr24ubx;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F678606A31C
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 19:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F678606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vvr24ubx
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id WlFrxcnDtyb4YX1d7xVJn7; Fri, 27 Nov 2026 19:29:09 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id X1d6xKAZ6YskhX1d6xkLlB; Fri, 27 Nov 2026 19:29:08 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6b09da05
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=VLOmf9A2OVSOn22oWyAA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1RBGQR+zk96JePPfnwT968f98+WGFOWzh2KLo2VonEs=; b=vvr24ubxOgncPgku4CfhZmKtA+
	3uvZSuNd0pvPixfQGJXTHqh2eXIn2M77z6uTeRsXiS2YrqhWUfGs9hPK+VnZvxOMpyW8FbrjwDXhA
	1KMD+8j3qEvCUPeThjEXX7/iTUcXTfuf/KkK3kuiF3JiMppqVLSZNzZaVomDWvibOw/g60GEZMUIy
	Zk9aksXUSIENE7YfWkq/5WEI+rfOhuZTaTcz8ZCXx1p5MatI58mJy4nRCa08EiEaS+WaS44VBRdYH
	Pm7j2nMHv48OhiM2dWq+VxpZIjbC+s5npAIUHXydA2AjEnlTer4sXspLrevYKh3ZH8ZGQFcaqFyUm
	ZW63S7ig==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33636 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <linux@roeck-us.net>)
	id 1xX1d6-00000003z9Y-1FB2;
	Sat, 28 Nov 2026 00:59:08 +0530
Date: Fri, 27 Nov 2026 11:29:07 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: KuwaLee <kuwaleecross@gmail.com>
Cc: Sergio Melas <sergiomelas@gmail.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Add support for Lenovo Yoga 9 2-in-1
 14ILL10
Message-ID: <350dea66-53da-4683-a39f-bfa71cbea6b0@roeck-us.net>
References: <20261120230744.34942-1-kuwaleecross@gmail.com>
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
In-Reply-To: <20261120230744.34942-1-kuwaleecross@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xX1d6-00000003z9Y-1FB2
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33636
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 1
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDmglJBNwBSAFUGW7iRon4p6KvQu4iNnGMM2sZXOYPnYN53Js+MBBhUnib5gf04TFZ/TrqRu89V9Ubi2y0W07AWkhHJTbiJQAT0LcZSZ+RXZi4wdHwfF
 /5b1m0p/NK/37FYbBv0X0/LAlNhzBHLfK22cHd8FecBjhL1BpSv8meTVMw8WRZB838HcyoDc4v8K9Ap9Rgv7NEVdnPxwAPfH7rYBisQWfGJk8Pb50NQbBmjf

On Sat, Nov 21, 2026 at 07:07:44AM +0800, KuwaLee wrote:
> From: LI-JIA-EN <kuwaleecross@gmail.com>
> 
> The Lenovo Yoga 9 2-in-1 14ILL10 (DMI product name 83LC) currently
> matches the generic "Yoga" quirk, which looks up
> \_SB.PCI0.LPC0.EC0.FANS. That object does not exist on this Intel
> Lunar Lake platform, so probe fails with -ENODEV and no hwmon device
> is registered.
> 
> The DSDT exposes two 8-bit fan tachometer fields in the EC0 namespace,
> used by the vendor WMI fan speed queries (feature IDs 0x04030001 and
> 0x04030002) with a multiplier of 100:
> 
>   \_SB.PC00.LPCB.EC0.FANS  (fan 1, EC offset 0x06)
>   \_SB.PC00.LPCB.EC0.FA2S  (fan 2, EC offset 0x03)
> 
> This is the same layout as the Yoga Pro 9 16IMH9 (83DN), so reuse
> yoga_pro_83dn_cfg and add a DMI entry matching product name 83LC
> ahead of the generic Yoga entry. Document the model in the reference
> table.
> 
> Tested on a Yoga 9 2-in-1 14ILL10 (BIOS Q9CN31WW): both fans read 0 RPM
> when idle and rise to a few thousand RPM under CPU load.
> 
> Signed-off-by: LI-JIA-EN <kuwaleecross@gmail.com>
> Acked-by: Sergio Melas <sergiomelas@gmail.com>

Applied.

Thanks,
Guenter
