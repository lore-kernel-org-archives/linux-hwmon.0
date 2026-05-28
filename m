Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA5C3F8891;
	Thu, 28 May 2026 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779988591; cv=none; b=l6zAM9m0zJ+4F+jdEN9OHQq0QNN0Dgh2lS28fg/e/ELGv6u4aNj0zIHJzN/eS6iELcUVZ2qLYD2UBujAFz9TwLwU+868RslGerMWJl86YvAkGiaZmlav4zibRpVwbZRMvbNbaLJpvlNnM0RnT1dRMMyQBauTqiwogsv7K32a5d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779988591; c=relaxed/simple;
	bh=7P/Zyncn/N4WbTLSy5ck0qrUmHyJh1WbKNdtnPduHew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAIrzgCcBSBV2yE5h4qzZHFfi6MB4yQOBNdQL2IChFhSGqLYB7Kepsh8WbNjrnHzNTaqA4wlv+q9CDmEKDh1q1d9mLNpKksHnKQxJIDlA1AkfkAWEv2gFzpuzVe15CW1co2/nt0dDBF+xSASBc/dU0ZWMvsh52W+UJUpC1E6t9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QU4JZiZO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QU4JZiZO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17281F000E9;
	Thu, 28 May 2026 17:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779988590;
	bh=7P/Zyncn/N4WbTLSy5ck0qrUmHyJh1WbKNdtnPduHew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QU4JZiZOeiBuRZygvfTgtgr2HdO1yC8byaz40OcCZ6vl5lHfEJNj+EFBZhTyPUYgo
	 xaG3TaWt2n6W1k8cH4y61LSHemaf+EbJ1eUi1brC3Uspbtwif7969FlLQmrX7ibdlX
	 AY+74qxZUXHVR9gjl1HG7vzvu7xy6AY2ATDxz39wan7qu1wkAKsgjPFHwAr6nFrem6
	 x3P71KOPYT1g1VoSgdo6mBqJSUG1hDz8tsnls/p7ustDxFjxsUhk1tSPqcFqfjJygh
	 qOBiBxiyhlPSNFLMqblbwQQJ/cEiScf5kzHCAiCsbScL82vkDA7agpyUjDSc+LLys2
	 9WzlKaOGxg9Kg==
Date: Thu, 28 May 2026 18:16:25 +0100
From: Conor Dooley <conor@kernel.org>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux@roeck-us.net" <linux@roeck-us.net>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Message-ID: <20260528-resupply-sympathy-f590eb8616ce@spud>
References: <20260527045409.9092-1-sanman.pradhan@hpe.com>
 <20260527045409.9092-2-sanman.pradhan@hpe.com>
 <20260527-exuberant-broadband-052c3526847f@spud>
 <20260528170618.85027-1-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sDdp0RPSGRHMxjWg"
Content-Disposition: inline
In-Reply-To: <20260528170618.85027-1-sanman.pradhan@hpe.com>


--sDdp0RPSGRHMxjWg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 05:06:30PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
>=20
> Thanks Conor for the review. Will fix in v2, will add an allOf reference
> to regulator.yaml and switch to unevaluatedProperties: false, will follow
> the same pattern as adi,max20830.yaml, if that's ok.

Okay. Please don't remove quoted text when you reply, so that I don't
have to look on lore.kernel.org to figure out what it is that I am
commenting on.

Thanks,
Conor.

--sDdp0RPSGRHMxjWg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahh4aQAKCRB4tDGHoIJi
0pmcAQCh309j0Hnjg+J0BQ9waOumbyLg7zZfWUm4jH5mo+VsXAD+MD2uqYuagWD7
D1QyoDj8lbQGOt93pJYD+dC/girqswY=
=PW0h
-----END PGP SIGNATURE-----

--sDdp0RPSGRHMxjWg--
