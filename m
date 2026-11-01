Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563051;
	b=aFbv7d/Mr6y/GjOcHwKoJKaIhNhCYw08ovamgkTX9oVgELXCoCyKiSqo4vk2oBcngzWG
	 ISaTUkzJJpKscOj9B7BIkNxpBMwGpH6+s6gzVHELjY5Rspr05AGmW8rFsZ1ljoFbXgjLC
	 WI6wIwXLj/LQ/b3O/Sw0U1fAVyaXeVgG6P8lAztMEZB33r5F+nVN9CmZ27zRU9KtOrOjx
	 HpDbGasbleIf0qHSNfSwXSHdN8q4g1SWDKknow5rUE7G7mb0HFJOaHkaGqhzMxx/ITMEN
	 0N0frm+LXd9MZqI7dF5KLzQhSKgTTWm4zatE3InPb8VxZVp/0cN3B74FjEZOO7DN71w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563051;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=XNlEHs0fm6A7AjdQOswonMr8zgR2fWy9NIraQgELwNo=;
	b=ls2/EPUm8w8KhWgiEaPgvGDRj2jo7f5tjUt7RRICtyj3qeZ3c4Aj8K5pKVGX/vSkolGA
	 a+j/vs4zsNBklnmQOKAjyGOI3vv1pIF626698Vh//KRLLcRf/sKG9m6YAU6uCjDlDbkyL
	 eXcRqs0TeQtzpul+dFcxgUbbuyl8yE1Z4AwZMXnS3V6Z247Y7IfUHaKHjTbMHJpT31WCT
	 4w/v8TO9+EvCI9Xo9zCqQGjuoDoUfQ1Jzbk4VDns7aOuUvpegfACGjUdhkSuD4FLGZMEO
	 QGk4GVLORzhig+2ApjS2Hw9RWvV5w97AmOGvL7hgbCztLZXk0RwfhApO36T4jhCcXKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=OEkdE66g;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96E5606A326;
	Sun,  1 Nov 2026 19:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A96E5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=OEkdE66g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XNlEHs0fm6A7AjdQOswonMr8zgR2fWy9NIraQgELwNo=; b=OEkdE66gA1hN8MtHKuiu+Pq7OO
	0fZX1a0f9ePVaMxB+KkExFGmA1eyZP17RmU+CIlYXY+IUCjCHbFC+GrihKXyI1d20oOQmRpdzHJpR
	lUm+kPyHnlQ1Uj1gUeQUu/4kuQxhoIA7u3W2SGQCxYnThdL27HWjykY6ixlx3eQfPtoc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xNbg5-00Dfb4-6l; Sun, 01 Nov 2026 20:57:17 +0100
Date: Sun, 1 Nov 2026 20:57:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Roman Kuzmitskii <roman@damex.org>, linux-hwmon@vger.kernel.org,
	netdev@vger.kernel.org, robert.marko@sartura.hr,
	luka.perkov@sartura.hr, o.rempel@pengutronix.de,
	kory.maincent@bootlin.com
Subject: Re: [RFC] hwmon: (tps23861) PSE-PD support, extend hwmon driver or
 move to pse-pd?
Message-ID: <d126b3d3-33b9-405c-9839-db492d874ece@lunn.ch>
References: <03055ffd-d015-4810-8b8a-678821fa6dcc@damex.org>
 <92e3383e-26f8-4bed-b487-1c52f6c4f420@roeck-us.net>
 <8cd41211-b026-4158-8e18-454a9ac0bae4@damex.org>
 <4d12314e-56db-412c-a558-e4026cd03528@roeck-us.net>
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
In-Reply-To: <4d12314e-56db-412c-a558-e4026cd03528@roeck-us.net>

On Sun, Nov 01, 2026 at 11:09:42AM -0800, Guenter Roeck wrote:
> On 11/1/26 10:50, Roman Kuzmitskii wrote:
> > On 11/2/26 1:38 AM, Guenter Roeck wrote:
> > > On 11/1/26 10:02, Roman Kuzmitskii wrote:
> > > > openwrt reviewers asked me to check with you first which way you prefer:
> > > > 1. extend hwmon driver with PSE-PD (like it is done right now)
> > > > 2. move driver to drivers/net/pse-pd and extend it with PSE-PD
> > > > 3. something else
> > > > 
> > > The hardware monitoring "enable" attribute is supposed to enable monitoring,
> > > not to enable some power delivery or network (or any other) port. That "port
> > > enable" feature using the hwmon ABI was sneaked in, and I am inclined to just
> > > remove the upstream driver for severe ABI violation.
> > > 
> > > Guenter
> > 
> > thanks, does second option look okay with taking tps23861 to drivers/net/pse-pd
> > with enable attribute going away?
> > 
> A perfect solution would be to move the driver to drivers/net/pse-pd (or elsewhere)
> and implement the hwmon part as auxiliary driver, but I am also ok with moving it all.
> Note that I do not review hwmon drivers outside drivers/hwmon, so if you move the
> driver to drivers/net/pse-pd you can abuse the hwmon ABI as much as you want.

Although some network maintainers do have a basic understanding of
hwmon, and might push back on such abuse.

Does the tps23861 share anything with the tps23881? It already has a
pse-pd driver.

       Andrew
