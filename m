Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714739;
	b=FYlr5MhoOUcz6nK1A/VRtvQTV6XfTC86uXVCfj0IlxXVj5qeDX5QmUNlOsGpYmiua0cB
	 dFifPgWpT90o5EYl690sRBHvgEuAcgahPZbj2g98+ZUQlonQ9/9i28rzMHa0X3PhdsjgK
	 yYkq2l63nRFG9ZlwExAdTfweRKuWtKxL8s3BOdzA225QsJAglEUuZAEq0ryQgWQvV4NPo
	 AjGTb9a+oztIYTcSNDGfHr7dKzwN31q6oG49kub0WbsziIOJfoBYrw4qpuwT+BloqrzQ4
	 0ZyPioE6QzkGnvQKGmXWE4RpO85w4GfGa52H2WTdSy7ZVObyeVh/zV9irxFlMc3ZK2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714739;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=WUmT6CAUiVXyDquHcVLXStJkH7YVniXYY2fst0uJG/c=;
	b=zeU2TxZk+U8MxbUe2/KfcAKDQ/y75Yixloze11owwIr1p3CtgygR6kftcOz7xERL+xlg
	 9bsD2iDGq9Ycqqov/vEMui1JRsO7iJgld1ptYIczxY5+ndEx1oAHPrmVF4goE6cOmONrZ
	 XKJBUSbW4fmOglMUrJiqemS4PCVfzrvSq3u0X3tzc6BAl+xMcyldQAhccbBvFHT8I4j/f
	 yoFgnQv2z+Xst43wrk0xCkr9pmhwnPWzNmWtYN2EsNuYsj76fpKWP36Y4pDQklnbYJqGK
	 DqCOiV6oKO0GARyKowFeOcVqRBs0t4c1VVzIzSwGTdr5qXu80W8XdlBMHZiPwYafMPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=KsZuoxiW;
	arc=none smtp.remote-ip=44.202.169.32
Received: from omta033.useast.a.cloudfilter.net (omta033.useast.a.cloudfilter.net [44.202.169.32])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5226606EE8B
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 14:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5226606EE8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=KsZuoxiW
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id ODTxxylRDPG7QOF8mx9kSU; Tue, 03 Nov 2026 14:05:32 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id OF8WxlY3YNBINOF8WxJySW; Tue, 03 Nov 2026 14:05:16 +0000
X-Authority-Analysis: v=2.4 cv=fvzcZE4f c=1 sm=1 tr=0 ts=6ae9ea2b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=EUspDBNiAAAA:8
 a=oz-p-7aixD_jC9KcsVQA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WUmT6CAUiVXyDquHcVLXStJkH7YVniXYY2fst0uJG/c=; b=KsZuoxiWiTV6WuFXC5es94x3+k
	CDj/0sZQMEWDWX00zYQk+T0f5REShQl9QtXfwXvt8yVOFxiKJecLVAt59UMTnnTuxDWGqY7Un58gB
	oSVCyuQA5APzw09m7EmALSTiiH7AKCR4ZQJzwCi7nh4o3g8F+a1G6Q7up4XSgSTwuoMvRLrvRAXh/
	qG2jrL6BaAt3lK4KJqpw3APVPi+xl1HbM71t54gjHtOaIP4pYE/zncshe+Ng33cTB5kN8XIzaFA7Q
	YPiP9pEiEGD44mHyEQabSToc5tN35XQN8VgEhgWTT7ICKVmPqbEsJ4tqKmEfk1CHrgWXHjOLaE7Tq
	3VC4tbYA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:36386 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xOF8V-00000002ZBT-2orD;
	Tue, 03 Nov 2026 19:35:15 +0530
Date: Tue, 3 Nov 2026 06:05:14 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Kevin Jia <kjia@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add TDK FS160x and FS1006
Message-ID: <9bc4cc83-c96c-4d06-aaae-e18b033ed489@roeck-us.net>
References: <20261030-fs1603-v3-0-6f8963a74def@nexthop.ai>
 <20261030-fs1603-v3-1-6f8963a74def@nexthop.ai>
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
In-Reply-To: <20261030-fs1603-v3-1-6f8963a74def@nexthop.ai>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xOF8V-00000002ZBT-2orD
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:36386
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPDXdX/cEOggtrrpdqv0Kjsii/1DtC+SbHAPKCy/T3AhTr1o06iBc1y/wkMlpG1O/DrpgU33NBsgaZhBjeX6J75dbpkDxgA54sD7BvfUf0RbzajxDdL5
 4SZqS67JO8XihecZkZaIra4FOFAo0O0BQgFmaotG0X4oLFruGE/6X/qjg6ggCyU1nt4zQP+c1hmf/FxeMXKTi8gE3JlMmWTfd2p5MA90UVkeBPW676poxBNn

On Fri, Oct 30, 2026 at 08:35:37PM +0000, Kevin Jia wrote:
> Add the TDK FS1603, FS1604, FS1606 and FS1006 uPOL converters. They have
> no ID register, so each part and factory preset has its own compatible,
> including the 3.3 V and 5.0 V presets of the FS1006. The FS1604, FS1006
> and FS1606-2500 encode telemetry the same way as the FS1603 and fall back
> to it. The base FS1606 reports in 10 mV steps and the FS1606-0600 needs
> an output current correction, so neither has a fallback.
> 
> Signed-off-by: Kevin Jia <kjia@nexthop.ai>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
