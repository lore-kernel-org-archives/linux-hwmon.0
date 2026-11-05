Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851867;
	b=CDfb9raH6PtoYixqeO59vtyYJpsM3PHcEDIWVscXln1R+1T9px4GGSFp9yF6UKYyGase
	 TzcXbOpGTs3HbuUt3Ql/33gcyeU6Cvc8a5JrpKvWUPS3i3LaywWEZJQCy8hi3yqO+Dn8Y
	 xC0EU/+zpvDh9IPYY5DX2zMSZ6LNdCwLrReZ4GoWGTwxspol4lhshfncA4O3rP4tb/y+D
	 rMOOCPIWYBNrCv5a6sjaP7l7WLBxrfSI6MdPkiphjY6yzoyXrAwFtEligyX7d3XTzNmq9
	 Yxy6oD2+IpWTl67g+rbNGdmX8DndKraYImVnIAPTL6nzKKT+3tptxbJBsa3UEnwF6cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851867;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=7PjNp7M8NdbUtRzPqvcFMsqSbTh3bvkW+KbajXfpVq4=;
	b=vklk7vtZEMg1ZioaB3nw0LRQ8VoJUUpY+EpN7tTquArlTljB839rI+eC1fWm8AxsoEMe
	 hQqMeVrz2Tmhw+m7Ex06JpqpDnsGqsUjnu5kiOyYU16OdbKRJ2sW2ELbAAPFEw99ND5Iw
	 1o90zrVmm8756V+NyD6KBBaYHHeMn74lXoL7iPP5zQvHTjv3qkRLjeIl3uJsLhvLLQkhx
	 l+Vezuk26tKfsmXRuK4bzTpcw9FlqWElxCXZrhX/wufAL2LCNNiU8uhPyiZKfuKd9Mt2c
	 G4weSNib0O1wXPeCgHx92qTLZwA3JO+f5KGOGkcEjqpPnF8CS05PeSKVoO1yBkCIhcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=iGzJHpCh;
	arc=none smtp.remote-ip=44.202.169.37
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4AD606A328
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 04:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB4AD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=iGzJHpCh
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id OcT6xCI8gJFmFOoobxWz1C; Thu, 05 Nov 2026 04:11:06 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id OooaxE68YBdeUOoobxR62F; Thu, 05 Nov 2026 04:11:05 +0000
X-Authority-Analysis: v=2.4 cv=AaexH2XG c=1 sm=1 tr=0 ts=6aec01d9
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=gAnH3GRIAAAA:8
 a=XYAwZIGsAAAA:8 a=4aXZcvZdyrIr42SlFlEA:9 a=CjuIK1q_8ugA:10
 a=E8ToXWR_bxluHZ7gmE-Z:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7PjNp7M8NdbUtRzPqvcFMsqSbTh3bvkW+KbajXfpVq4=; b=iGzJHpCht4IFVbLRS6RHrhQrno
	UCa8ibCtOaEHTks65FDZOFwQ8WAb125ucllJJc1MDGPs8djNa4bCZZO9c2YeiAKlco6uAhZnSm62B
	yighXyElarCViDxyaO7WRFLsT313zzMuVB4FlXGAlcjnt7sSRWWQP61tjV1TZFITD6UJX7qD/ofk2
	lkfOjPwvNxQIWeBq3PAhoGzvhL/zHnY39CKjQAoWfPp4SZ++QdaLmgbpVY0fAhw2F9cESX19Jr4C9
	NAYViyk6xarvDsByWvZKUGSMyIeLXF5OHnKzotuqiynguogEy/LKI93eMmUwTQxnyPkUtDLAh7pQd
	7UbHV1Vw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:49824 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOooa-00000004B1q-2U88;
	Thu, 05 Nov 2026 09:41:04 +0530
Date: Wed, 4 Nov 2026 20:11:03 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Carlos Jones <carlosjr.jones@analog.com>
Cc: alexisczezar.torreno@analog.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: max20830: Add MAX20810,
 MAX20815, LTM4739, LTM4740
Message-ID: <e947803b-3191-41d8-9620-53bbab6394a0@roeck-us.net>
References: <20261103084331.449-1-carlosjr.jones@analog.com>
 <20261103084331.449-2-carlosjr.jones@analog.com>
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
In-Reply-To: <20261103084331.449-2-carlosjr.jones@analog.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xOooa-00000004B1q-2U88
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:49824
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 11
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOo5oHb1KIU8ZWZenNczmC0MKd0MDleLvDACq5Hicferdw4Hf6neUQOdRZ/btVa0R+W8KfA35vM6YxATv8amzrXaP94cGyP3scUL9AhpzBZI5cWxYg0E
 RaAdYxYmQaeweFflgEYiOirnUWgKUsbh+2FqLpBIr5meX36o6bzzu1qBXBEztdxY6a6sM50bZSYRoh+tu5cJ4UCqqitPq3OLD1hCbf8JUVIJkeqnctxtYt8U

On Tue, Nov 03, 2026 at 04:43:30PM +0800, Carlos Jones wrote:
> From: Carlos Jones Jr <carlosjr.jones@analog.com>
> 
> The MAX20810 (10A) and MAX20815 (15A) are members of the same device
> family as the MAX20830, sharing an identical PMBus command set and
> telemetry (VIN, VOUT, IOUT, TEMP). The LTM4739 and LTM4740 are the
> LTM-series module equivalents of the MAX20810 and MAX20815 respectively.
> 
> All variants use the existing adi,max20830 fallback compatible.
> 
> Signed-off-by: Carlos Jones Jr <carlosjr.jones@analog.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
