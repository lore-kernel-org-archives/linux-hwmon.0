Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525A71E511;
	Mon, 16 Mar 2026 14:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773671670; cv=none; b=aBMojGfsCygFSAA0wol1QyIuPpA6W9bNRO1S9Jq/7GEolkBXdoO/vkPH3s7nZoQWJBxk+DCQoqQiz9/SBBmNwSTlJms7m4ZCJvLsy+W1CHLg/mdCXv1pP2P02YSc7OvPd3BNxI0ZXt1YkQpZwZhGIKBmO/99XVNAeBB18h3MrQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773671670; c=relaxed/simple;
	bh=PeJNgY4coc1jftz+tWfZK5DVqDvKvneWw1iXK8IlmxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z801MaRMhONBTLMqW68N+/Snq+t2KyiFq38DV9OH6swIaAFGEuGNELpWsjkkYWmB3STKY+uqKf2YfV4svsKha4nVhkAorREc4S0F36df3u0aFaJPC+bqGonS9Ita5A4fgFJdmxITGUqG9PLgnf+e8uhDK8IFtBkRedU8dYfjDqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rEFUaIIU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rEFUaIIU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F9CC2BC87;
	Mon, 16 Mar 2026 14:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773671670;
	bh=PeJNgY4coc1jftz+tWfZK5DVqDvKvneWw1iXK8IlmxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rEFUaIIUFXXLHmJ2tE/wnSEeQ+6mBZ4TDvzR6sGV6Mm2N/W2IMdQgC5VMvuYQYml0
	 s7OGxtpO3kODthcxxNCV6uoHT63+iB/bfx5lqS7HuB2jgaI1IFGB8v8+msqMcIy7oQ
	 cu5yGAMPb58czWbYsAEBdWHgM14yEeVmlsVtB0MbJzYJMff7rlEFhpgpFlW2uox76x
	 R6rKptaaQ5LEHZQDzvrFY4+12tnLARwRKVLo2ZDYhLje3wpUagtrl28lusXDS2z1GX
	 R2UMXxJhdZCNdmuzWVGYCjyepUOgHEpi/y1cIhP+mUyUq30qd3bTQtJ8tpgJtKFBb+
	 LHETa75Md0cBQ==
Date: Mon, 16 Mar 2026 14:34:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rahul Tanwar <rtanwar@maxlinear.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <20260316-trusting-moving-1a37dbb94242@spud>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/bIZjy/TXeMd0h4B"
Content-Disposition: inline
In-Reply-To: <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>


--/bIZjy/TXeMd0h4B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
> The G and J coefficients provided by T-Head TH1520 manual (which calls
> them A and C coefficients and calls H coefficient in the binding as B)
> have 1/100 degree Celsius precision (the values are 42.74 and -0.16
> respectively), however the binding currently only allows coefficients as
> precise as 100 milli-Celsius (1/10 degree Celsius).
>=20
> Change the multipleOf value of these two coefficients to 10 (in the unit
> of milli-Celsius) to satisfy the need of TH1520.
>=20
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Reviewed-by: Drew Fustini <fustini@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/bIZjy/TXeMd0h4B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabgU7AAKCRB4tDGHoIJi
0homAQDkf1eqMgJ/+IbCqDYOM+BEbR1o59LkqXqdiYt9YWbZ/wEArBuFNE3IjZ13
2aCGEYb1dnAW5jxk1LeIbmR5q17WCQ8=
=LVWl
-----END PGP SIGNATURE-----

--/bIZjy/TXeMd0h4B--
