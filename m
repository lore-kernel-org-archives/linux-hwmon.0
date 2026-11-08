Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153747;
	b=XrJJFzSAK14Z2nPTB2eidS8yz1UI2Oj4TStKQNb5On2pYnwt7UHZLSW19vtWFRYCuqKQ
	 OiICj78s2Z4xeb7KlOz9R1Pssu+xz1oRp1nG8FCZFxQoa7kJVThxUEar9XpySllGCY9wR
	 84pr6SGUFOhUU7ssb2qP1+nc62PDa0cLWEmj+Pq+w5IGpZoJIEH+Qor/WSpf2FhDX3bbM
	 3KpdnZYFIhWQAbcI3bZGg0ZneSczdb06+N1xUkKcHswP7lgwcyGIYLwGmsv3QefAGjye9
	 R3QWnGf/UhSr/rs3qjVjwuOZDF9LyhXPQwDcC7hn3jJAVhQW2TADW2T6dS3TfEe8rAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153747;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=ej30WceHDvxYCHBRpxgFnbxKwm/1PhHk2tRvt9APK+k=;
	b=yNeAgNf3CkuJr8fAvjXihCIT+AV4PvQ2vhkbCb7gL4Km5871vruhVSQo6eAsB2400vRn
	 ltX+m/nDDdqnnrBLlFbEu8CV9PzgXlGdlebwoGraHpoI3LlWwG5oNZUjvBG0GJTXgNVYF
	 PGqMdWKm5Ze5OxCI8QKh21UaBS0nZzH6A92QWSGXNfjJm4jBOYri/4nlKCnpBDdnirLDU
	 3YkrpIdEO+1O4lw5w/mld3zsKmZSPS2pGDWXzVfdluxrrt4ZwqWmxGuq2pPWsl8vzg5lO
	 tPffM2eP3FJNOV1pkFHRRCBAQ9UNvYInd38Bq7BdEIV0aIqa5jkaIFrf/UJ+jICi95g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="iOvQYmm/";
	arc=none smtp.remote-ip=44.202.169.32
Received: from omta033.useast.a.cloudfilter.net (omta033.useast.a.cloudfilter.net [44.202.169.32])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4495606A320
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 16:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4495606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=iOvQYmm/
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id Q4NHxleLvB830Q5LXx90V0; Sun, 08 Nov 2026 16:02:19 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Q5LXxy3ZHxmi7Q5LXxcRVt; Sun, 08 Nov 2026 16:02:19 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6af09d0b
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=_jlGtV7tAAAA:8 a=ubTP0OvWGwm60-eT7C4A:9 a=CjuIK1q_8ugA:10
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ej30WceHDvxYCHBRpxgFnbxKwm/1PhHk2tRvt9APK+k=; b=iOvQYmm/kI38VNWHr/X7dMB1fk
	c0MBgFttyqNqrj4o/wauJR4XgNdw330swRLXIV3rlUIvOCgAdfJGyTNzxDFfDVzrOEpeOnOx6LyJP
	E6PF1MWSO3QYqYpa32LpH9HVTIxkXqOntsMu7SG0nXn+w5IyCr3lNEAe7sOxEMuNKm47xtyMZm2lJ
	dsVjmRHDfWZuFZA440FPdFnTWmrKQ8xR+WTtr+5P/FWX4AbNZWxh/7G1FPRa434XZA54XHiYA6S0p
	/aNFYebxGDs3bDxD38hZ2zQC7GcAIbtiQBdnpzOpia6mCSqFkB5iuZzdG+rWetEvuND5TuwWtQcNP
	7xmBv3tg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53492 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQ5LW-00000000xnL-3vFA;
	Sun, 08 Nov 2026 21:32:19 +0530
Date: Sun, 8 Nov 2026 08:02:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>, linux-hwmon@vger.kernel.org,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] regulator: sy7636a: bind to the I2C device
 directly
Message-ID: <1ad52663-696e-4a6c-8f78-c75e3cd84102@roeck-us.net>
References: <20261108093602.329554-1-pmazzini@gmail.com>
 <20261108093602.329554-4-pmazzini@gmail.com>
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
In-Reply-To: <20261108093602.329554-4-pmazzini@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQ5LW-00000000xnL-3vFA
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:53492
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNIe1i6jWHAL7877kyF/DNETtU9qPaRKTpQC/9OjMSG5zSTBC5uX3tbpqlLul/nY+E0udvctb4/cAVPtY0wgt8TZut/3ON0lTnDFfNsTw85ADhXQEof2
 V6jI7UKbpa+f171s3PAfMCNUipA/vNgxHBLdTYMxfcOLWsCOvgW3e2jPm7C6VMHdlmoaSlJGsPcj0eiTMmQZ3AlsCUGDsgDRDf2NMdXacskgOejgAU6nidNY

On Sun, Nov 08, 2026 at 09:36:00AM +0000, Pablo Mazzini wrote:
> Bind the regulator to the chip directly, as the TPS65185 and FP9931
> drivers do, and have it create an auxiliary device for the hwmon driver,
> instead of simple-mfd-i2c creating a cell for each. Drop the MFD glue
> and header. It now probes before the GPIOs may be ready, so report the
> power good GPIO with dev_err_probe(). The hwmon driver then only
> accesses the chip after vin-supply is enabled.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

For hwmon:

Acked-by: Guenter Roeck <linux@roeck-us.net>
