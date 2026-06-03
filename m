Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504B2472771;
	Wed,  3 Jun 2026 12:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488166; cv=none; b=c/9xB1pS1X3wRGVGqaeDBkCQzZ8oMb+CtenoSRMFSts6jASOYiWi7STDQa0cNF+t0/HmEa6DZjijfvopjzPGME3Yz8zAS8kGSkQV8sGIA+CZDNrbqROCEpO1FmaV5XYbQogYPurLrL3+tuQXRDErVTumm6MMsuaF0WxHM7Mst3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488166; c=relaxed/simple;
	bh=4hAvxFKZHSSYDu4jd5tgpaEVXw4jjuLOgjT1fSUJXdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ujL3vSeKYZutoPqOWkSAA1r6t27CO6EGBcb4+UkLfaoGKYDLiApZheo6rpVZWaxLJ1QY+DRL8n7jGECQ5Ucmq7BSh8PMhclumHALw4yZNjRSZh51dbzEsb6TcBLLgS0vz+VDJOJAtYV4Gcdo3RYTVZxSy9YE7krYa5gEKHf8P3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zOHk/Hi8; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zOHk/Hi8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C7BFD1A02F4;
	Wed,  3 Jun 2026 12:02:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CF906029E;
	Wed,  3 Jun 2026 12:02:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B2E010888CC6;
	Wed,  3 Jun 2026 14:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780488159; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=GoX6DBzQK3bxyZ5OdVtosgZMLBjxal2wLwkY1xIOuVY=;
	b=zOHk/Hi8JD/C9VtAkNDNIJVHHA+Zy+7bjj/cIUNKDZ62QTyUW0bI7M+zGWVR2El8BqSBDS
	Hl2PFZzOVOPBcXjT0UkBBVZO0b+KGHO0cOTpI6xDWarmjH0cs6sjsqkh4HUprnZiQNbdwl
	Oan14+IAe13dthCR8ygFKoQGkEaKSFtRnZxOFc0hR0DOxtMrd+RZys80XwKffH8FtJEYv4
	rP0gwpnvXX/iV4mjVw6xezVqRCi+VOb1f+00fM2j1STaGyFs5bltFqntdDxyVpjZ71nCsS
	fDQBmEO5ud3P9i2YAM2S4ioRLnsZyGidZ1a9WAeeHS+LnmeAh85csLIvMkdZZA==
From: Romain Gantois <romain.gantois@bootlin.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-binding: hwmon: Add binding for ADT7462
Date: Wed, 03 Jun 2026 14:02:33 +0200
Message-ID: <2eAABoDhQ5ih8u_5nmvpxw@bootlin.com>
In-Reply-To: <20260603113526.232F61F00898@smtp.kernel.org>
References:
 <20260603-adt7462-bindings-v1-1-301304bcf774@bootlin.com>
 <20260603113526.232F61F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart_tMOLV3iRx26hmmL8Ybxbw";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Last-TLS-Session-Version: TLSv1.3

--nextPart_tMOLV3iRx26hmmL8Ybxbw
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-binding: hwmon: Add binding for ADT7462
Date: Wed, 03 Jun 2026 14:02:33 +0200
Message-ID: <2eAABoDhQ5ih8u_5nmvpxw@bootlin.com>
In-Reply-To: <20260603113526.232F61F00898@smtp.kernel.org>
MIME-Version: 1.0

On Wednesday, 3 June 2026 13:35:25 CEST sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider: - [Medium] Incomplete binding migration:
> `onnn,adt7462` is not migrated to the new schema and remains in
> `trivial-devices.yaml`. --
> 
> commit 8e3b73cf675c7a9534a713ae61c15469f85f0d06
> Author: Kory Maincent <kory.maincent@bootlin.com>
> 
> dt-binding: hwmon: Add binding for ADT7462
> 
> This commit adds the ADT7462 hwmon Controller device tree bindings
> documentation.
> 
> > diff --git a/Documentation/devicetree/bindings/hwmon/adt7462.yaml
> > b/Documentation/devicetree/bindings/hwmon/adt7462.yaml new file mode
> > 100644
> > index 0000000000000..745a371affd65
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/adt7462.yaml
> 
> [ ... ]
> 
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - adi,adt7462
> 
> [Severity: Medium]
> Should the existing onnn,adt7462 compatible string be migrated into this
> new schema?
> 
> The ADT7462 device is already documented in trivial-devices.yaml under
> the compatible string onnn,adt7462, which is actively used in existing
> device trees.
> 
> By introducing this new schema without including onnn,adt7462 and without
> removing it from trivial-devices.yaml, existing device trees will not
> benefit from the detailed schema validation. This also leaves the subsystem
> with two conflicting, fragmented representations of the same hardware.

I've just done a bit of research and it looks like this component is now 
commercialized by Onsemi, so the existing compatible would be the correct one.

Furthermore, the suggested binding only has a "reg" property and a 
"compatible" property, so it seems like the trivial-devices binding is enough 
to describe it for now.

I'll drop patch 1/2 in version 2.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart_tMOLV3iRx26hmmL8Ybxbw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcCsAScRrtr7W0x0KCYAIARzeA4FAmogF9kACgkQKCYAIARz
eA565BAAiUnofwPG57qpJi2HrG9yKzAvGwJBZIJyDsTJFLIYkI+HdkbsrBpxRml/
i6x3Lp4p2CCXpzua1RrMGoxlz+t7CrkS1OxrS6vC0j6nIsU3iR/r9KNkX4SU6t3A
zMCTivlr2ZG0zgHy05XAlpa30KGba3uNYAcJQozET9f+165S7M1euv9vzt1aMLQ3
r6lQP0NcpNAJ898f01vD5cIUj6ZF1iuK4eGBoCvTiLRvj24c9wddkjmBEI7+nZ1G
/XFMSg2UIHwLl6HqWgJGE/UheElE8qzHvr6VpGYND0lHnczvfpqQJgb93wTYAakf
gDC131Ep/5AX7oPI3pQ+hio9iTeb5qtqVkZN7d3NSXdJj6ONvi2mS3+2qyGvWBBH
1XVU6t3ZEMvctbs5BDliWqkg1/gxJrHdyFaEfsLyBbiCu8dtpyz1QL3IxzCVLk3g
1VuJORSl5cEuezkgp/Z8KjQQRCdhS8W8oFKnUtSOjgT8vvph7r732UI/DRO7AvNw
dTSqj5gelVEOsGeDxbZNbEFIV+eUxM8xeqS7blkanXTxLWjuXoJyoITj8zzbKsuU
12RlIurihXQhK52pQjM//LEzLmmeX2+5mLjJvHAJ6aPXVd2iSygv3vr/vK9B483g
DU2Xh2BUn8dewzdMzkgUIphPyMWJZNtUCUAbWsP9ZgCm7R3NBbE=
=8wQ0
-----END PGP SIGNATURE-----

--nextPart_tMOLV3iRx26hmmL8Ybxbw--



