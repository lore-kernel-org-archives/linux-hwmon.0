Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793903;
	b=iYC7MV2ZpYh2GZoFj4O+aoJspAj9fK7ALBJFX/dYIxCWNMkEGFWtw1DnjBc5Nex4YEVD
	 cbV9IDLMYuK7eVWwqQsN+ccQMgIawFcjFcEzs7DZEwXW7+APZnTSS92hv5hA634mgbrXc
	 XLeymcueSGTycUxenwByM7JEmRVaxpLU6HIk+SVAFOUGyWhjizZwORwhDq8y5yn26uL5W
	 LOXqhyOhyv3ZeXEjoZcpXtFim8IeWrLdU5Omd3FtKMcPwjGP6ESwUY2ZK9sGrclP3+30Z
	 xi1T8x6jwMQe/90o0ip1VVNv42VqLEQ1T735xYswrFfVKa9xkNOINqKWLxPhHR9ch7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793903;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=ixVHN+f6bXwbfLfqFXi/FG437hi5R5SCUVq9nvoVZsI=;
	b=s1ZIqRhYWb8OCfGd6xWrkCXqSSt8myFAEVwiRANzbA/mhUNW4aIMsivpbLakt3adTAAR
	 c2lL0Sj3YMttHM70hbsNrEK9ABfm7F+tuNW58MF6RsEgjxym2WrdK46dTIKUZQn/B5Nig
	 /FKVRiVfeY12jmmULrg1w31IM1AX2W6k23NV1oj3rgWIUuoa3VTCkponpgufpTWvWkC85
	 jItt5Mc3eCO8euRCE1POyUAUWsXTX2tCoLvBfwxGZA/M/MnFqJVyRAm4Gf14zWH7EoMcQ
	 h6ka/ogHiIx1pqqKjXqqR6ScglcaXHB6Mfycr4ubHdMGkyAnPITztXndFw9cW/yT5kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YcL0qfny;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7EE606A697
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 15:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB7EE606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YcL0qfny
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id WvYaxEJ9kRiNxWy1mxzRWY; Fri, 27 Nov 2026 15:38:22 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Wy1exnOQhb2qJWy1jxruNO; Fri, 27 Nov 2026 15:38:19 +0000
X-Authority-Analysis: v=2.4 cv=A7tsP7WG c=1 sm=1 tr=0 ts=6b09a3ee
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=p-LfKV-GAAAA:8
 a=VwQbUJbxAAAA:8 a=sOfCyYYy1NGfjWDh088A:9 a=CjuIK1q_8ugA:10
 a=97BuGM4RKn6GwmfqMd6i:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ixVHN+f6bXwbfLfqFXi/FG437hi5R5SCUVq9nvoVZsI=; b=YcL0qfnyoM1bBp23CVqi1J2zfM
	CiSXjtSQ7WGuRmME88zFXxggvDHzcN55VJ2FADsqbqXksEbU4FgbKbtczbcFrItzUBqP7ehb+VRu9
	aJ4m0h5qAiNwObhhPlH1AiEWg/JgLuPRwprU+kwLdmCwdpGSaDeoonKUiZ8bdgjztLnscmzfC869t
	eXHDiaHA8nn60bNiYatqhKXLUKAJXmN3rLfnxs52tS3+xcnhMVK02XjPPK2suwTPVqXZmUMJ4Ik4Z
	V+oPk80B2Isk6XZ3cOKiII+w/fmFYJVgl4aBna4RR9RuC7v1vNbYGWiS9Su94jiFPA1LZraFZTBP5
	qo2h6kbQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53908 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xWy1c-00000002P4I-45YY;
	Fri, 27 Nov 2026 21:08:13 +0530
Date: Fri, 27 Nov 2026 07:38:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: hwmon: Add National/TI LM77
 temperature sensor
Message-ID: <1c56cd6a-18f2-4104-9d5d-1c6bff6dc848@roeck-us.net>
References: <20261126124402.3015577-1-lukma@nabladev.com>
 <20261126124402.3015577-2-lukma@nabladev.com>
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
In-Reply-To: <20261126124402.3015577-2-lukma@nabladev.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xWy1c-00000002P4I-45YY
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:53908
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCd/EwDyPwtQbM3UtbPbczpzNTumjcBqYxHI86jG0JieXWm1+uYhWtzQJvBG05VDwJrmtObAZ6FHRa9VGB0X59X5QM6byzuBSQHvtEm3FBFZ/d1XVs8S
 7RNk99NwCaN2YE834VKpHxc604AbxzpeXJrrZ40w6QLPyaqaWh8VBB5Vbf+crv5gKoMFtv6bp5xYN1q0Z7iXt4a1iHlrGNVZkfgPN87z7ocVNwutyhqJuTVo

On Thu, Nov 26, 2026 at 01:44:01PM +0100, Lukasz Majewski wrote:
> Add binding description for National/TI LM77 temperature sensor.
> When compared to LM75 - it has two output pins one for interrupt
> and another one to signal the critical temperature alarm.
> 
> It also has only two I2C address pins (A0 and A1) - possible I2C
> addresses are: 0x4[89ab].
> 
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
