Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE22346FA8;
	Fri, 17 Apr 2026 16:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776443056; cv=none; b=uBh6p42dZX9nA8eLQ4yyf/7g45rxA70eZ/O3+OnCmzXtvGJM15eZCvtG8Y6fPqkRpwoUGG/xMLuc41eQwKXdQHi6C6FN8F/40+t93kGhVkDLWMcyx0FFQSRHqpXzBtT/tfQ4jsXBtv3UuA7CBphWTunDC8bkZG7jPTwFjnAl2z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776443056; c=relaxed/simple;
	bh=aTsmt4pvePCj+enDftiv3VrCnTPML5qs0PQEa/hm/zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGUtMBfz8Xdbk63LEMX/L6o4in0CXGonQlqZhDncgmwCXtaDQUcu3QVgZ5qT8jrA3PPZbNCOEv+FTJHs5oAbngVDl/Zj9OF/9Xc0m3mXtseC9y5UVWeuS3ZPq+33AKrkd1UGgioymhrZgVZ4dJy0L8BXl/bZmt9nRBuGJjzKHUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQtOqNjl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQtOqNjl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C18AC2BCB4;
	Fri, 17 Apr 2026 16:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776443056;
	bh=aTsmt4pvePCj+enDftiv3VrCnTPML5qs0PQEa/hm/zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CQtOqNjlOs4N098XjRSCs2/jcByx5NDX7WpfARi1KCL8oIsfBaQpCkHQv6miIRnYI
	 3BKZUW8HP54Gq3reokSvmcMLIS7DfuYtHPZ22O4aEuhexBlT35Wdfyjzrrp7MPrFZC
	 nnSnLqi6FAdr9ujhyrXDw2eKZxHvfIebTVASL3F9ltN6L0IT/NdfrO7WlK9Teh7xEz
	 UAKlrnGnPokhqaIo2T7NCyeF//Yk3joEWIGMbH49qPknj1y4fITn/PMn1wqnbxxxzh
	 Vq5qfnSsC29gAzay4ehF2ozfPqofrCrcWUkEpmz/JjI9ndrcg7KYbF5nI4wfSIJgwl
	 pG4Jz3cpqs/Ew==
Date: Fri, 17 Apr 2026 17:24:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: add max20830
Message-ID: <20260417-tightwad-stylized-2b0eea3b1e2e@spud>
References: <20260417-dev_max20830-v3-0-0cb8d56067aa@analog.com>
 <20260417-dev_max20830-v3-1-0cb8d56067aa@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q4q4JCBLIcxVsWcx"
Content-Disposition: inline
In-Reply-To: <20260417-dev_max20830-v3-1-0cb8d56067aa@analog.com>


--q4q4JCBLIcxVsWcx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 04:27:13PM +0800, Alexis Czezar Torreno wrote:
> Add device tree documentation for MAX20830 step-down DC-DC switching
> regulator with PMBus interface.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

In the future, please relax a bit with new revisions, particularly
during the merge window when nothing is gonna get applied and there's no
urgency.

--q4q4JCBLIcxVsWcx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeJerAAKCRB4tDGHoIJi
0pUkAP9wKSelTgmGoaJ3WPxVvBsOR1tqwDgsXopfQDfcdY7WPAD+JGGK7v957mgE
hfl8ndcXy44fy/GxwR29EtZeee/3SAk=
=qIra
-----END PGP SIGNATURE-----

--q4q4JCBLIcxVsWcx--
