Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389928;
	b=5KcFb+umV1DFXAp39h5w4X2VZjtrblrsZiqelQlL+VJhnXa/N5uUAffUg0wy5cSAMeRz
	 G09iYlR5fXPPAW/H+RCeOOMoII4sjAnOO84NGgRHUr0JHDaEVtLrcGYRHqRM1A+BZJQzd
	 5uHbrwx2XjGFDJhEp4o6AvGjMywuDHyjnP/TcimxAPrHCE7xo6glw8Omj9cBl4ImjuEWi
	 3XB6saRl3o4CrHuoEcyFEgQVMnI9Ey+AFYx0bKMmjF+K9memQJAzzySUvFHIQ8pGBUA/y
	 gmXH5Jd7OdhEw7TpNNjJoUaHGAWvTQYwOdZkgHs5ct531UJrIs8us0BySL4kkzeMhrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389928;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=30fXaKKbd46d8fP4eF3UV28bEpjvYYXr5FYuZ+bJRHs=;
	b=M3KpchWGYb8DuuwFRJ24HQMxkBhyAzB+jTNhy3W4h0+/UBnqODTiJOORuVFISzm1mLlT
	 FmoFpSvsj18SXu5H6h+7iBm481bxhKq4CJhAhz1ps8oJTjfiTYIkJvvqrIkgrIKpN4AWA
	 WDiF+w2hGU3vzM0NliJ0b0Q2S4szpY9EZmIzzcwqtFTUX46M2LZSR895FxA44EgTtKDy0
	 czBtQViHSB5RKXQTjonlQASi3mezwZFVYSHIgNPcn7NUN9rDWVEMmxHUNRlvANcWnrUJJ
	 +dBMi/dTAhqxtDjx3siXMi4cszCfyri8cRqKmFOoXHtok9dgK8exH4dcIxeLphECdgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="R34PI/7A";
	arc=none smtp.remote-ip=44.202.169.35
Received: from omta036.useast.a.cloudfilter.net (omta036.useast.a.cloudfilter.net [44.202.169.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E9F606A31A
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 19:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97E9F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=R34PI/7A
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id MlHAxMjJiLvgbMsdyxRy8m; Fri, 30 Oct 2026 19:52:07 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MsdyxySYP8LLeMsdyxyGwr; Fri, 30 Oct 2026 19:52:06 +0000
X-Authority-Analysis: v=2.4 cv=BenY0qt2 c=1 sm=1 tr=0 ts=6ae4f566
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=eNXyHOXcY0__OJ8I6H8A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=30fXaKKbd46d8fP4eF3UV28bEpjvYYXr5FYuZ+bJRHs=; b=R34PI/7Atx76HYCV1ZaWWd775d
	xBknMzcTAtvhoA4hqkHV21sbvXlb1TMqApg4ijC1Ib6w6AqLEM61/tmTS8TfL5g0Tj5W/s7QhtoWF
	7aRSToLGG8afWvY+PgouG97FE8FjRAIYSc6Dx/aOPATSwz5iA0hrnP4Dt7SwAd+Ct3/DWnBSrBg80
	o8p2uO5zlJGdtLE7L4V/UcS6K+2HJVxnS9l6eL3cxHJpT8nAjls2JA0WN6TAvtLRLlyAL7lZZON2a
	buyKnCVFOc6q0fMnbIw9yV81Kzpa+fsmEbZLYWTwAApa0EoSfOWiZfNKLQUGD5etWBQVTD9skgYha
	98sNnEgw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41222 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMsdx-00000003vdq-2kxc;
	Sat, 31 Oct 2026 01:22:05 +0530
Date: Fri, 30 Oct 2026 12:52:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Velkov <iav@iav.lv>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Reference the common
 fan schema
Message-ID: <d1fc3c7b-323a-4ad6-b770-4f3df02f5615@roeck-us.net>
References: <20261018-helios64-fan-label-v1-0-69a3f96d4efa@iav.lv>
 <20261018-helios64-fan-label-v1-1-69a3f96d4efa@iav.lv>
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
In-Reply-To: <20261018-helios64-fan-label-v1-1-69a3f96d4efa@iav.lv>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xMsdx-00000003vdq-2kxc
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:41222
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 79
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfH7wHEAockD5KhCT1KSn168SxdzQOW3bRHa5DeopdskYlf7Ms52l2YGV9feWsWs6SPNTOjHRJFcNOS/MM4JpT2iJVMbYxe71tDn4wyObKUbP0wpVlIHR
 GklVtiQxbKDxHfry/+YJmqfTOji/dpPARUMjVF3QCVdwcYgl4V/EFK44l9TqixGR7HlySoT6CnF78Zilj/Wf7uTtYjNVA342SYdBRUJDyOtFPV5djcRZrkMj

On Sun, Oct 18, 2026 at 07:54:59AM +0300, Igor Velkov wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> pwm-fan predates fan-common.yaml and repeats several of its properties.
> Reference the common schema, drop the duplicated properties and keep
> only the constraints specific to PWM fans.
> 
> This also allows label, which the hwmon core exposes as the label
> attribute.
> 
> Link: https://lore.kernel.org/r/20250106173805.GA501301-robh@kernel.org
> Signed-off-by: Igor Velkov <iav@iav.lv>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied.

Thanks,
Guenter
