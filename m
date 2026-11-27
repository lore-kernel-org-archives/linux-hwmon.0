Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807846;
	b=iZAAGZX5FYn0uo+pfOgTJgxCq8p2CxRTDOQ3BKERU0eJFmKq9+DlDseGglZxDzDP6GXU
	 ifLDfF1L3Sc1lbq8ZryyRUgqzC91L8Z6gxHHEzgXWGOMb8NGkdFK6/Zp6Ru56HLq0sHTs
	 ERbX9P/4wePjfBuLjp57hWHDgab4FQXH7Sgx8RhYYDFlBWmyY17/pZQ6h9w0uuQnOwxt1
	 D8xj+vt6FCW4Z9y2CGBEScOk8yeFMt9EpT7KVnUO2Wsa5TCUpTSMs21T7JA80ai58gGp8
	 FFm1xAA/rpde8TQbvYMAbw2EsRCyAWFeW4+uM8ndWnZuZfmx9NB/BAdYR6aVqtbnMpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807846;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=lV6gzRwYarDtzQev8auyW29aPSM81nbbwEA/Ylkk+YU=;
	b=eomvSVL29vAddGsKnGRQc6SqX2hNjZYyf+YYGOLJD5+jT3yG+TioMl6oTHKN99G0MT0x
	 PGqku5jFFMQf3lOSmjPKOuZMx/O9enntVUiOY9v0p9BzIu1wdoQOt7CMNFh3/e0DxxnL6
	 r2P5pTFolIIYe5vQz4QOL35GNB9yu3FgN+TLaKSBh6qbVsyyhuRmSmpbuP3m4XOXeBB5V
	 njLtw8q/95oaVDucu/3hm0sb1/xKeEr+UZadKVaf7Tq7HuAe8wp9cHJZCg766xsRjKFIe
	 x3Xd+eSFEFThIodxadnbzp2qY1/mGHAOzHLluI5q4w1zWvMGZNxSN1d3SFuAdPXsWgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=TQTdSDdV;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5548606A31F
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 19:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5548606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=TQTdSDdV
Received: from eig-obgw-5005b.ext.cloudfilter.net ([10.0.29.189])
	by cmsmtp with ESMTPS
	id WvYdxHt2lVK9UX1efxbNDD; Fri, 27 Nov 2026 19:30:45 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id X1eexKDHXYskhX1efxkOAA; Fri, 27 Nov 2026 19:30:45 +0000
X-Authority-Analysis: v=2.4 cv=CKMqXQrD c=1 sm=1 tr=0 ts=6b09da65
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=qfpIj3PEHlP3QdlUBgQA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lV6gzRwYarDtzQev8auyW29aPSM81nbbwEA/Ylkk+YU=; b=TQTdSDdVjwrzxyPsjIFqweLt5D
	VFwXpSNOUTJOvIJmLY0n0gOuWT6FlXTNp9Lv6x0hKSkzMk9DrNmXRjnm/sfCd9e3lqiQlkesVVPDw
	pHqJB1RMMJ6Jo8r4WWMXK5hZ+UariL48oPPW5U890716vzP9ABn01UCcnE2sDDDC2WD0LsOTFBYYa
	oQuj1kuSO2FWgdqk2+odORRQ2JprQuJE5aU6mwrc6nl9gFJGWrwAZw6CKitSOgB2QClMc6SbFnpWI
	LGtR0t49cHnVQE4N7gXpbLa9cPit/LliDJuJfYDpCQ4eUbOBxSM+imfLX6qfEmoiFPqlH8RO9ZbgJ
	tr4h1fIQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54854 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.2)
	(envelope-from <linux@roeck-us.net>)
	id 1xX1ee-0000000402j-2ocU;
	Sat, 28 Nov 2026 01:00:44 +0530
Date: Fri, 27 Nov 2026 11:30:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Sergio Melas <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (yogafan) Support more than two fans and add
 3rd fan for Legion Pro 7 16AFR10H
Message-ID: <d67c8d8e-89d4-40d9-b41a-4d127ba1ea83@roeck-us.net>
References: <20261127052841.492895-1-sergiomelas@gmail.com>
 <20261127052841.492895-2-sergiomelas@gmail.com>
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
In-Reply-To: <20261127052841.492895-2-sergiomelas@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xX1ee-0000000402j-2ocU
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:54854
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIcH59/KTXijBqUVGswXQBJb/hlw+f54tpahW9VClSmdLlCb94O7eqX6phKib6cz1pkY9OtqzMNaRDAzjIpRVh2CyfYYTcZ/k5LkWzlb/eYiJhX7m5+J
 XuDvYG1hi+nLzlkmge8k8eCZqR8Vag3MIc7j9hhe+9EDEf4RnmQstGdPYOOSEGreqImbql5hvRJ49iy++/fZrDnWY0mb/yhz9cOrjF3XkMm26HgYPL8OGehv

On Fri, Nov 27, 2026 at 06:28:40AM +0100, Sergio Melas wrote:
> Expand struct yogafan_config.paths from 2 entries to MAX_FANS (8) so
> laptops with more than two fans can be configured, matching struct
> yoga_fan_data.
> 
> Update the Lenovo Legion Pro 7 16AFR10H (83RU) configuration to include
> its third 8-bit tachometer field (\_SB.PCI0.LPC0.EC0.FASF, EC offset 0x04)
> and update Documentation/hwmon/yogafan.rst accordingly.
> 
> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>

Applied.

Thanks,
Guenter
