Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793052406;
	b=xZetim+UflaiTU3AKUhdRUpjpxxZ2WuLaeJgoiRj9yivoGQ/BeDMh5w0cYrihKhTQEI6
	 C4hm+fSRCERb8gIK6mLKxjfIJLsYsj+AIcohajeMQf8NFRBgz80T63TW805EQ8R/vQoGJ
	 6S7NHBo7IxKIV5Z2BuHRXfx/D6RZfMY2A+PxSejWwIi2SvlB7cGuTlbkRMN4w1+tWXBEZ
	 u/FoOyb862Z1gQ8kewscTS8cLd4oxSev7wZDJxD5leIRLP/6wnqqTwBsktAgRJ9b8X7UJ
	 k/sYC71HzDK/bM8UWshWTVpmlwmeI8ysIP4yRHsx5xHtsFKP3mrfNrj3qWVPwGaSA0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793052406;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=js99JJ6aXUROCqTAR9VcBF6aoOKTjeNWm0vzygdhblI=;
	b=UmA++IJDkUPbmBBd0oIF2NfpslUz2Y1wcImu3ePIqKF++I/DOxogaCHcKqnSoq/qLskS
	 edUwPMBsBgKkhbxQURcO2p39k/ymModJeAiMGeRl/xbZvEV8pCmmisOWloy8sTg60+D8/
	 nlmBvqqIeaqaCJ9/2HW8pQWyarsc0GkaRamdmG8oMC7Dvq9JQZ3qFNlHNoAyJxEQ3FWnQ
	 t95Vw/mA7vDFyjLgcRh65psSOFRSnp6i9+R408Lo7eDITvcS5muT3Z+n3XNnd6JNGWApk
	 dF3XCcQwv0k5Mqc9QvbjludRJpPWQzg0LOUtF0xXTC+H+X2u3OWK/BzWbi3wnBbd79A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=cvoPlBcL;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DE2606A31B
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 22:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73DE2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=cvoPlBcL
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id LKwFxikgrusRSLSq6xvtcQ; Mon, 26 Oct 2026 22:06:46 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id LSq5x4RJ3zVzKLSq5xI6En; Mon, 26 Oct 2026 22:06:45 +0000
X-Authority-Analysis: v=2.4 cv=As7u3P9P c=1 sm=1 tr=0 ts=6adfcef5
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=In8RU02eAAAA:8
 a=VwQbUJbxAAAA:8 a=OOPhO3tBZ-RCjzheWRoA:9 a=CjuIK1q_8ugA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=js99JJ6aXUROCqTAR9VcBF6aoOKTjeNWm0vzygdhblI=; b=cvoPlBcLKH904k/W+caT+Rc2to
	9qE8ple65zunHakZ2rDcotTiKS2pyrq3YRWMFk7ukjCtfbQqQH0mO3c3oe7zQPSsuHfbm6L8jAsjX
	ToUSSpaSDOuIjA1kMxj9satZHEOeQa6BuR1bZsQL9tyQQ9CYg7OJ7GMpncLEKpnKDAXOBkP9Egoxk
	WWvVb3x9KZjvBVhXuHxlzogGSJ5GwbNKbNGJcKAiO7bw8TgCFGapIPnko3KBg/wpqLseX5XDOW0vP
	EBfQy1nUAkQptt9JK8zpnbpDbE6UDXDLyACGGLj/8Zk3ODnTpllxSWMPQoA5OZM1hckCi+/+OJ/28
	P1V5nO3A==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57910 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLSq4-00000003rFl-3Gjs;
	Tue, 27 Oct 2026 03:36:44 +0530
Date: Mon, 26 Oct 2026 15:06:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kevin Jia <kjia@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add TDK
Message-ID: <5448fb6a-d83e-4178-86b8-c968d4a49bb1@roeck-us.net>
References: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
 <20261020-fs1603-v2-1-0986107a5cd2@nexthop.ai>
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
In-Reply-To: <20261020-fs1603-v2-1-0986107a5cd2@nexthop.ai>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLSq4-00000003rFl-3Gjs
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:57910
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 14
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDYtZnq9axZYXCKzbjq4NsSWQnJzaZktodu8oOTpH7QTfNt5vfeOTHyLS+Jmo2vlECz63QjpzzQBuMnWjIhpI8/SzgF5Rktj8fJ9mH1n9vfD8cEFe0pS
 1rtaASw82fXWqAtyNW+awNZFCqb1MGaeQPrKc2z4PoEsXr0nCrGGH8TneHUAPkAMK5rjJuwUqcP3Gs5YQ7PtpcrBvlDOpeZRuQr5ZoQ6cGpyiRzO5p+nlR5j

Hi,

On Tue, Oct 20, 2026 at 04:48:14PM +0000, Kevin Jia wrote:
> Add a vendor prefix for TDK Corporation.
> 
> Link: https://www.tdk.com/
> Signed-off-by: Kevin Jia <kjia@nexthop.ai>

This patch won't be needed - it is already added with
https://patchwork.kernel.org/project/linux-hwmon/patch/20261020-hwmon-pmbus-fs1412-v4-1-27ece4e43d04@nexthop.ai/

Thanks,
Guenter
