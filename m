Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117615;
	b=eUweV47DNJgLEm2wZeMlEWD2i5a61XDcVZtI2k4hOB0EwG1jL2TIzvfjPTK/RnwYqiCa
	 7XA2OGwImTxzTSivJWsej7Wz5ivxnCeyIzmR29Vt6QYHU34ueQ8HMdBbY1a/U9LX54QWj
	 p9B30+VAulgwd8Q+LdR7GWnGcdyczogEy7tYt0Y4i03ESA1e8orR2Szrxh7h1vCqMXEZw
	 kzIfYcnsy9Lj2fwsWYevKLGFbLqkDmjCbtdKX+/9AkaYxA66+oxofFGykz8v2l2SbH7iP
	 Vl/gANrzOLK2rdAylpQeAaDhK7kfjVUpkf48VjpYJMlXvZ2XQ3typ6Ra8+Y6ZGovpAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117615;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=5G3ZmT86d3fe1rJiM6b5mr2ay0ue+O83AEJqLc41Pes=;
	b=gbcpEnuj7vh0AkVcJR7dTATEeodrQcIIwb/0wch6f2oIgXFLHT+rbbeOIseGETUm4kOr
	 hRMIdEorxFR3FV71u4lOPGe8JmHz+4EUHE7ZuOL+sFH7D3Ia8iq5dS/XJw7qr/U81UQMZ
	 aR6AqGiZiJWBks2FOXjm6AmVRQl4I59LqMkhkbxaigBqMmI8ucbN+3OHjRRiVkt9IcB3Z
	 v0pXEnfTUoJf0W71Rg3Gh1hQT56Z3eDJbyWhRPFlBPyHIZCE3pjFeyhvKjM0PvqD81Gq4
	 N5juaG97amrlWaCS0UKGGh5ILbqxwEn/HQ26qIj33WfExrYqhI29tNWWEgZfvIY/62g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0bRG5pWu;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403FF606A31D
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 16:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 403FF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=0bRG5pWu
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id Lg6wxnUheusRSLjnqx34E8; Tue, 27 Oct 2026 16:13:34 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id LjnpxGUTN6hvPLjnqxXy69; Tue, 27 Oct 2026 16:13:34 +0000
X-Authority-Analysis: v=2.4 cv=cqCbk04i c=1 sm=1 tr=0 ts=6ae0cdae
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=iox4zFpeAAAA:8 a=lMUDpl8nYqh3M6R7ydkA:9 a=CjuIK1q_8ugA:10 a=LP3-5Lh9zdkA:10
 a=WzC6qhA0u3u7Ye7llzcV:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5G3ZmT86d3fe1rJiM6b5mr2ay0ue+O83AEJqLc41Pes=; b=0bRG5pWuLiZXHXqJQvNggCWlNQ
	GbtulZEHDb8sReMmPpD9jeLOPqZQkvsmUB1QF/eaKJBgihsBywZ3ulNPnxshEjknN4c31xvSydrof
	G8UKnkf5xfgnI69nY3a4sNA9bFAtUL8L0JA58uLhKUpMYHBBJ0OrdJplBMt99zyuCp21tdFaUrvXc
	Rj/BTRRnkXIIxr7cfp1yIvTqmh6CwL7GsO4UOrGrFPKoB3lE61ZgXnJN1tKcwjo/RzpYUatrMH8pN
	s0ztAID6NGI3HShJw5b84D//CWybXdMw56O+bg8PoNsDOWiW4Y6p1JVP8bF+MAB+WQBG2bEK7fw3K
	OgN2UsKg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37196 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xLjnm-00000000huz-1JIR;
	Tue, 27 Oct 2026 21:43:30 +0530
Date: Tue, 27 Oct 2026 09:13:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Gary Guo <gary@garyguo.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pwm@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH RFC 0/4] hwmon: Add fan tachometer support for Raspberry
 Pi RP1
Message-ID: <b02b4f0b-ad2c-453a-b69c-a0865a333d62@roeck-us.net>
References: <cover.1792748690.git.andrea.porta@suse.com>
 <7df58d42-517c-4936-88b0-9d044d30882c@roeck-us.net>
 <auBzvB8TsvIK8Hik@apocalypse>
 <53a4b4bb-271c-4d2d-a9e4-cec4e0ce214b@roeck-us.net>
 <DMFPE71J8205.3FZKD5BKW3U7C@garyguo.net>
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
In-Reply-To: <DMFPE71J8205.3FZKD5BKW3U7C@garyguo.net>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xLjnm-00000000huz-1JIR
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:37196
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 32
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfM5OnuqUPoHflIrwSL56b1WaB8zX2rb6JWZNNRK7utKbHedOizVmze0Vd8neV7DEZtAOT+Z+Qr/024hr2eEO9RdKZc3Ow+MQuI0GKBLl/ZtxvZI0Xos+
 XftU62hkjog6rYuw4ic2DI976SG02iNgJsmQ7UzDqIx1K9shumO30kI2LziuNqPDL8EHABaObUKnHD7Ln34cqq6k1YwlGRicSmT8WRjd1FwmXMLHDvJw5bl3

On Tue, Oct 27, 2026 at 10:51:15PM +0800, Gary Guo wrote:
> On Tue Oct 27, 2026 at 9:48 PM CST, Guenter Roeck wrote:
> > On Tue, Oct 27, 2026 at 10:49:48AM +0100, Andrea della Porta wrote:
> >> Hi Guenter,
> >> 
> >> Yes, I also proposed that in the cover letter because auxbus seems also a viable
> >> solution.
> >> 
> >> The current implementation is a consequence to the discussion about the companion
> >> PWM driver, from here (and the revisions that followed):
> >> 
> >> https://lore.kernel.org/all/cover.1775223441.git.andrea.porta@suse.com/
> >> 
> >> To give a short and hopefully coherent view of the decisions, here's a breakdown:
> >> 
> >> - first proposal: PWM driver + fan hwmon (to read the RPM), all in the same driver
> >> 
> >> - V2: Uwe preferred to split the PWM driver from the hwmon one, so the hwmon was
> >>   dropped from teh PWM driver in favor of a future (fan) driver. To accomplish this,
> >>   I moved from readl/writel to regmap + syscon.
> >> 
> >> - V8: Gary proposed to export a function to read the fan RPM as a viable
> >>   solution. As a result, the regmap/syscon was dropped as it was no longer needed
> >>   and the function has been exported from the PWM driver
> >> 
> >> - new patchset for fan driver: the now independent hwmon moodle just call the
> >>   exported function from thw PWM driver.
> >> 
> >> If the auxiliary bus is indeed the preferred approach, I'd like to ensure we are
> >> all aligned, as this would also require refactoring the PWM driver.
> >> 
> >
> > Let's say it that way: If you don't want to implement the auxiliary driver,
> > and you insist using the exported function, I would prefer for you to go back
> > to the first solution. The one thing I really dislike is conceptually broken
> > code, and I consider the current approach broken. Your call, but the one thing
> > I won't accept is the code with the exported function.
> 
> I agree on the auxiliary driver part. However, I don't think EXPORT_SYMBOL_NS is
> an issue, and regmap is not the right fit here:
> 
> - Previous version of the PWM1 patch series publish regmap using
>   of_syscon_register_regmap, but this cannot be undone -- which needs to happen
>   on PWM device unbind (the RP1 PWM device is itself platform device, but RP1
>   chip itself is PCIe device which must be removable).
> 
> - The tachometer register is not its own separate register, but rather (re)using
>   the phase control register. The phase control is not implemented in the RP1
>   PWM driver on the list yet, so this is currently a simple register read -- I
>   can see that RP1 PWM driver need to take special care to about the tachometer
>   reading if the phase control is implemented.
> 
>   For the two reasons above, I think the way that tachometer is read should
>   really be an implementation detail of the PWM driver and not for the hwmon
>   driver to worry about, so I suggested using EXPORT_SYMBOL_NS.
> 
> - EXPORT_SYMBOL_NS is the documented way for exposing functionality from parent
>   device to auxiliary drivers: https://docs.kernel.org/driver-api/auxiliary_bus.html
> 

Let's agree to disagree, and keep the code in the pwm subsystem.

Thanks,
Guenter
