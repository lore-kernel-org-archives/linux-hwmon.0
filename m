Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4923741D10A;
	Wed, 22 Jul 2026 16:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736941; cv=none; b=K7CsXxQ0aZnCFLBaomZd9h0lNbTfneYpfGpHSEuaYPD0Nzxd1ctiWOzY1QzBSl3OYw3+/Rtv9CGMlL0RivFyPK9qfK2NGWlquNPP0KeizI//Ei7zOL9KlcneoJNdOriQXK1XhfRQlpJdt5oGLXSuSyy9xwX/Y482jT0ZlSwY5oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736941; c=relaxed/simple;
	bh=JRSSPH5/mIjuijfbAtoGLk+DIcsPFNtlz6RKZFC686Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpP4FHCXqatIpYvWNeERHDdHDcFy+hAd4L4axliKN7Fce8uL2TnMq6x4f1RK2HcacMCA93/o3ZqSB6jGJMVoF55Y6NvvrnX7ivrWDOmMK0h/hxR83+iHDc7px3N6u+y/brw92EmhyGNF6FKg2EecVDe5Pts99yIsIt7waDFLQRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XM0FpB8U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XM0FpB8U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF311F000E9;
	Wed, 22 Jul 2026 16:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784736940;
	bh=UCNZNSZ/KaKi2HN6huz+/6/BGuqPjjLEs0PsS30eq/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XM0FpB8U/90EUWbEOIg1nBMzeofr1gZH6J9DDpXlLp4O25TXo+64QORFvIO7W6Y2p
	 XATOmuAWT4AMBig2bgQo40IhsC31gg6igpFfyYF3r0CwYXtRuYUhduCVzFp0RkGVKE
	 61TH8e72D9xgVWfpkuNLAHKJhsdFxs7i4sULhnTfg6kCPfhCnJlFr1jOFXGpGd7+6W
	 rey7BHkkIlxSjZNu3Ve9cXHqpgUjCaHGOY7gLJR0/JdBZjypdhzeLrRIwh0JMDznh7
	 2sK8M1h2hXrOleY3m8zbpncqD4THVvImQfrDqWDEM/9FgvR/Qp1w7DaUUkl6t0Xsd7
	 +6bRabeO/FP3g==
Date: Wed, 22 Jul 2026 17:15:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Message-ID: <20260722-devious-seventh-9859bb3741b3@spud>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
 <20260721-ctl2301-v2-1-ef5fb342872a@linux.dev>
 <20260721-dill-dab-df15585090d2@spud>
 <673be23a-2a84-43b7-9be7-a661cf0e7935@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EpgLK6YPQDxaGwyB"
Content-Disposition: inline
In-Reply-To: <673be23a-2a84-43b7-9be7-a661cf0e7935@roeck-us.net>

--EpgLK6YPQDxaGwyB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 10:56:36AM -0700, Guenter Roeck wrote:
> On 7/21/26 08:49, Conor Dooley wrote:
> > On Tue, Jul 21, 2026 at 02:48:27AM -0700, Troy Mitchell wrote:
> > > Add the vendor prefix for Sensylink Microelectronics.
> > >=20
> > > Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> > > ---
> > >   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b=
/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > index 396044f368e7..22d0d26f1bbd 100644
> > > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > @@ -1467,6 +1467,8 @@ patternProperties:
> > >       description: Sensirion AG
> > >     "^sensortek,.*":
> > >       description: Sensortek Technology Corporation
> > > +  "^sensylink,.*":
> > > +    description: Sensylink Microelectronics Technology Co., Ltd.
> >=20
> > Googling the company to see what their website is, I seem to see a
> > different name for the company: Shanghai Sensylink Microelectronics Inc.
> > Their website has that with the Shanghai dropped.
> >=20
> > Also, probably the commit message should contain
> > Link: https://en.sensylink.com/
> >=20
>=20
> Asking Google search: "Why the two names ? Did they rename themselves at =
some point ?"

The google search "AI" response was what showed me the different name,
sounds like I should have questioned it some more!

>=20
> Response:
>=20
> Understanding the Name Structure
>=20
> 1. English Legal Name vs. Marketing Abbreviation
>=20
> Sensylink Microelectronics Technology Co., Ltd.:
> This is the literal translation of their full, formal registered corporat=
e name
> used for international trade, customs, and legal documentation.
>=20
> Sensylink Microelectronics Inc.:
> This is a simplified, Westernized abbreviation used on their official
> English website and marketing materials for cleaner global branding.
>=20
> 2. The Native Chinese Name
>=20
> =E4=B8=8A=E6=B5=B7=E7=94=B3=E7=9F=BD=E5=87=8C=E5=BE=AE=E7=94=B5=E5=AD=90=
=E7=A7=91=E6=8A=80=E8=82=A1=E4=BB=BD=E6=9C=89=E9=99=90=E5=85=AC=E5=8F=B8 (S=
hanghai Shenxiling Microelectronics Technology
> Co., Ltd.): This is the company's sole, official legal name registered wi=
th
> the Chinese government.
>=20
> "Sensylink" is a portmanteau created specifically for international marke=
ts,
> blending "Sensing" (their core technology) and "Link" (their interface and
> connectivity products).
>=20
> Prodding further, asking if the previous response was complete, it tells
> me that there was a name change:
>=20
> According to Chinese corporate registry data (via Tianyancha and Qcc),
> they did change their official Chinese legal name:
>=20
> Old Name: =E4=B8=8A=E6=B5=B7=E7=94=B3=E7=9F=BD=E5=87=8C=E5=BE=AE=E7=94=B5=
=E5=AD=90=E7=A7=91=E6=8A=80=E6=9C=89=E9=99=90=E5=85=AC=E5=8F=B8 (Shanghai S=
ensylink Microelectronics Technology
> Co., Ltd.)
>=20
> New Name: =E4=B8=8A=E6=B5=B7=E7=94=B3=E7=9F=BD=E5=87=8C=E5=BE=AE=E7=94=B5=
=E5=AD=90=E7=A7=91=E6=8A=80=E8=82=A1=E4=BB=BD=E6=9C=89=E9=99=90=E5=85=AC=E5=
=8F=B8 (Shanghai Sensylink Microelectronics Technology
> Co., Ltd. by Shares / Joint-Stock Company)
>=20
> I don't know if Linux has a policy about Legal vs. Marketing names. Perso=
nally
> I don't have an opinion. Your call, really.

I don't know what the policy is, or if there is one, but personally I
wouldn't use the westernised abbreviation since they may decide to rebrand
that etc and the vendor prefix information should remain static.

So this is probably fine as-is, just I'd like to see that link added to
their website.

Thanks (and thanks for doing the extra digging),
Conor.


--EpgLK6YPQDxaGwyB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCamDsowAKCRB4tDGHoIJi
0tcBAP44s90TlKfjWN2tr4LUjXBc0U/1shHw59sier4x+iVQ/gEAr8zXcYYlzXk4
TCp4Mym7totPI/aTPLaNyKSkbm8gLgM=
=aJPc
-----END PGP SIGNATURE-----

--EpgLK6YPQDxaGwyB--
