Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DCF8615E
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Feb 2024 19:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708542418; cv=none; b=E9tpN9rgI8tWewX6b1UrFoDMXrOcHNHSEoTc7vGsuthE33kdEu2uJC0wrWdfAuilnBRgq+9qEazsM7Cq4tcm+u5aLL6YX5JLhk8UijH3cD1OSmesSmtW8l5VOPTluJJuM89Gz+G9qhGwoJ4csIn07rN5oLGLtKMklSvoXX1bIDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708542418; c=relaxed/simple;
	bh=cHlZJPwre8i7SpzZE3WyluYRuzb18qvxE8ZjsqRU4XM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rx51zxquowtfslCWC0dK554/VcJz5Y3W4jsKhYtt2feFMSvkI+mzOFdWs88uqaWDtleMzCtj9Ot5bk0TLh0+MoV7SjWYH+ALIPQfnWnnhL9sTMz9I6mY4WBDKAxA9jRLXVFRtoNN1oBs2TrHe7Bzbw3iz7/NEzyzxX+Q8CsojDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnF6ErLQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnF6ErLQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704D6C433C7;
	Wed, 21 Feb 2024 19:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708542417;
	bh=cHlZJPwre8i7SpzZE3WyluYRuzb18qvxE8ZjsqRU4XM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qnF6ErLQV1DfiaTJhQexFFbjFwdoSgex63TysD9VG1nvtindcBco8ZPZ0rmFIRJxj
	 LDR2XKO39koXFz5SLnT+K7Vq15aSTtxKAtjPAVimaKJhvtLE1NiIpEiN1e0+ttO1AU
	 id/wS8HTm5yFuwxN/I36Sc/PI18kFw3v8dsbasqbVXSkECgIrEo4IHUUIBCUSm5Rzw
	 RrgE83OcBbJl7NomrEXwyAHIyOtje5ucHZf2H81+Okm7uaU7/FQNZ8FQQaoeT3UGgp
	 0CQAz+5s/VA6vEdMvoDmCRfcDD9h//T9VaoADfrNNYe5U9wPp2TU/Nh412faxLOj2t
	 AaVgHDIca+exA==
Date: Wed, 21 Feb 2024 19:06:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Zev Weiss <zev@bewilderbeest.net>,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH 0/3] hwmon: (pmbus) Use PMBUS_REGULATOR_ONE to declare
 regulators with single output
Message-ID: <20240221-founder-upward-3464de32031c@spud>
References: <20240214194342.3678254-1-linux@roeck-us.net>
 <20240217-sliced-company-6c6fa2a40369@spud>
 <20240219-rigging-strive-fd54af33253c@spud>
 <b4265631-1835-4b9b-86a0-62b404cca5ae@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p4lkDifbL2xsnn3B"
Content-Disposition: inline
In-Reply-To: <b4265631-1835-4b9b-86a0-62b404cca5ae@roeck-us.net>


--p4lkDifbL2xsnn3B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 07:13:33AM -0800, Guenter Roeck wrote:
> On 2/19/24 06:48, Conor Dooley wrote:
> > On Sat, Feb 17, 2024 at 10:00:30PM +0000, Conor Dooley wrote:
> > > On Wed, Feb 14, 2024 at 11:43:39AM -0800, Guenter Roeck wrote:
> > > > If a chip only provides a single regulator, it should be named 'vou=
t'
> > > > and not 'vout0'. Declare regulators for chips with a single ouput u=
sing
> > > > PMBUS_REGULATOR_ONE() to make that happen.
> > >=20
> > > If we're gonna do this, we should go ahead and document each of these
> > > regulators. If Naresh sends a v2 for the tda, I could do the others.
> >=20
> > As it turns out, the infineon devices in question are not PMICs, but
> > regulators themselves. I think something like the following is what we
> > need. Perhaps Zev or the 9elements guys can comment.
> >=20
> IMO The lm25066 patch should be separate.

It should already be a pair of changes - one for the infineon stuff and
another for the ti devices:

> > commit 9cf2671c0b98c0a0dd599fe9152985d1320bf320
> > Author: Conor Dooley <conor.dooley@microchip.com>
> > Date:   Mon Feb 19 14:24:48 2024 +0000
> >=20
> >      dt-bindings: regulator: promote infineon buck converters to their =
own binding
> >      These devices may need to make use of the common regulator propert=
ies,
> >      but these are not permitted while only documented in
> >      trivial-devices.yaml
> >      Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

> > commit 597739840d2bc95ebb884d7f5fc4f3cc206d9af6
> > Author: Conor Dooley <conor.dooley@microchip.com>
> > Date:   Mon Feb 19 13:29:12 2024 +0000
> >=20
> >      dt-bindings: hwmon/pmbus: ti,lm25066: document regulators
> >      All devices documented in the lm25066 binding are intended for use=
 with
> >      a regulator, be that for purely monitoring purposes (lm25056) or, =
for
> >      the other devices, as the controller of that regulator. The bindin=
g does
> >      not currently allow regulator child nodes, so add one.
> >      Each of these devices interacts with only a single regulator and
> >      documentation refers to it as "Vout", hence the choice of child no=
de
> >      name.
> >      Signed-off-by: Conor Dooley <conor.dooley@microchip.com>


--p4lkDifbL2xsnn3B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdZJzQAKCRB4tDGHoIJi
0stWAQCjvo+BhshudkfFgy+LFXMwL2k1A0W5GtEpKflOzuZenQEAhO+m9mnbmZXf
to1KEo0zJpjOF8+SbFMc+X3bOvSviAQ=
=HgcI
-----END PGP SIGNATURE-----

--p4lkDifbL2xsnn3B--
