Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640844;
	b=pmViqGXHlo2z5kdy3xeWIW8piHZETTH7QR46xbdr/BaCXql3ECPfD0DPfdBnyi5B9Lng
	 EjsTj6F8XkFqlIysGhbNx+R5v5tEPVt4dDgawUO4WfV3Jjak8oqHxx+uy6xNoIbxYnq6L
	 TdyuRQg7hPy6dtpluAZxGVyVqN+Y+SguDmIXm1J+c7IZzpiQVJ5hTqGwofd07T6jpCWCg
	 rcNSt85IpGyeZskMJzjtI5LgHr/9/KhjupaAB6P2ZmtXBaHPk2Avbsz6/2vgnR4WqaIT9
	 MyPezd51lcABbGOzkxp/XFA6/060fHsQMQi8wZN/UVuYdG8Nq13/CMnW05M6/GQHpIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640844;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Cl8W7PCmAvj0H5ym9/oIHdX5JS8ulLYYJKda+ChCBbI=;
	b=ToCDoRb3huu+2pSbQtLtxEp9Vntw+aW7UXpY7EpTq4rOsJs6VNGkLvYKlE2gwiPCzCMd
	 9+wH4oU6d+u4k5kYDm+yrYUwi8opIBzP2uyJw3pRRS1er+l4yJp4fB/dSIDpuh87B7zt9
	 qV1VHpp3/GkPw0zqxGVxx/nAPLUFAGsIV66JPmuqnAbuMSciPe8N2+h/RM17hsLNq2fNl
	 PBlfT1m8yeTuwd7GWrLyQAkd0gr7uVTKofGIG9+PlfNcFMME4rCK8SJd3DClU/VqAam/P
	 Ths0Y/VJGIPF00J8Elkdn3dHYNXx8vQCaH9pSLY7zQtK/2MIamwOlWeBZylRRf/+AYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=UVRwjNYW;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9FD606A339;
	Mon,  2 Nov 2026 17:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA9FD606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=UVRwjNYW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Cl8W7PCmAvj0H5ym9/oIHdX5JS8ulLYYJKda+ChCBbI=; b=UVRwjNYWd4j+dvaAiP5E/kRER/
	VOE7OQgCan9gSQt4Oc5qupVbNCuosNG81x1ak6jSSPbAXx0wJcx+nszMIpv/u2NvnrhCbcczpbtOI
	1vkIfptvR2/wyFOAjYIpStmbhB5O53VU1H7hADV9K8wRwrFjQrnTTw2iwcEIMVxvmI00=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xNvuq-00DqIs-8K; Mon, 02 Nov 2026 18:33:52 +0100
Date: Mon, 2 Nov 2026 18:33:52 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Roman Kuzmitskii <roman@damex.org>,
	linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
	robert.marko@sartura.hr, luka.perkov@sartura.hr,
	o.rempel@pengutronix.de
Subject: Re: [RFC] hwmon: (tps23861) PSE-PD support, extend hwmon driver or
 move to pse-pd?
Message-ID: <300336f7-94d2-4075-abf3-2c1ddc48fa69@lunn.ch>
References: <03055ffd-d015-4810-8b8a-678821fa6dcc@damex.org>
 <92e3383e-26f8-4bed-b487-1c52f6c4f420@roeck-us.net>
 <8cd41211-b026-4158-8e18-454a9ac0bae4@damex.org>
 <4d12314e-56db-412c-a558-e4026cd03528@roeck-us.net>
 <d126b3d3-33b9-405c-9839-db492d874ece@lunn.ch>
 <9bac0a84-f03d-4fd1-8092-9922c65010bf@bootlin.com>
 <57516add-01bf-492b-9fd9-2bcb762e3041@roeck-us.net>
 <1219dc2f-0f96-40db-8268-1a8eb009b152@bootlin.com>
 <e422d6e8-3385-43f2-bcd3-1c5060a5b45e@lunn.ch>
 <d7f5a3b3-a3e9-47bf-8f08-5c8feb0c88e7@bootlin.com>
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
In-Reply-To: <d7f5a3b3-a3e9-47bf-8f08-5c8feb0c88e7@bootlin.com>

On Mon, Nov 02, 2026 at 05:57:06PM +0100, Kory Maincent wrote:
> 
> 
> On 11/2/26 17:36, Andrew Lunn wrote:
> > > I am not using at all the hwmon framework in that development.
> > > But as the binding tps23861 is already reserved for hwmon I use a new
> > > "tps23861-poe" compatible name binding.
> > > To me, I agree to remove the hwmon driver but this will break backward
> > > compatibility. I am not a hwmon maintainer so it's not my decision to take.
> > 
> > Is the hwmon code applicable to the tps238XX range of devices?
> > 
> > Can that hwmon code by merged into the PoE driver? Without API
> > changes, apart from dropping the API abuse case? The compatible can
> > then be transplanted into the PoE driver?
> 
> Should we really want to add the hwmon framework in the driver only to keep
> the binding name?

That is why i asked if the code is applicable. If it is using hwmon to
show the temperature of the PoE controller, it probably is
applicable.

If it is just repeating the same information which is available in
ethtool, then it is not so useful. If it is not useful, the hwmon
driver should be marked as deprecated, and a pointer added to the real
PoE driver.

	  Andrew
