Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B38A275AEB;
	Sat, 12 Sep 2026 10:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789208535; cv=none; b=ZRh3IgXPk14ZyJ+cnbv/S2d7dJg4ZbU8bWKIv0khhnaC+0oW6dQSzod7IzSbkfNOdzROeM+9JIIuGBNRvGYqOTJ52Sgoz/PWRfuP4BE+YJRO7LmPC3a7RpMFEmrgnJxjooGMk9ZtQb2np/QQWbAD5zlD5lw1N3+Xy9eFTgdZl34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789208535; c=relaxed/simple;
	bh=IcrpVNpTDXLqhyg2YbkzsiUJ3yZfRF14nYfGxfau9f4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8ySBY47heZ3LNb8fUV1SC08Uu/CFnt/sGLjc2804amE9Lb94fRpuYP7t7LZDyrOt2WMYfj/z384ChlzXaG7Aqi4ISWBvnxqhWMWgzeQf5BLpySNQct3ZYDbHzieyQYRDoDgTn85XBBwcMyvNahtNioF2nyYofaJVtGJMZEJg4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rw4FVCND; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rw4FVCND"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42401F00898;
	Sat, 12 Sep 2026 10:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789208524;
	bh=IcrpVNpTDXLqhyg2YbkzsiUJ3yZfRF14nYfGxfau9f4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rw4FVCND/X9NmZIFiSXFHprRVGZWBxrgtohRd7U/TqPBSrk2RhTJpubu0gCull75l
	 VcaIr/yiRerURM5pl31wNaV0kDRT39j0HCoRQ5zcWLE0eNYJ/F9A8FbONVLoJ+CS9V
	 cEPQvSf7ZU//kePIZO4zobNeSQtizCK4T9JkZY2f8N2M5GPRkbfwyrAB/d7ne3TJU9
	 4xxH2evlt/+5fbERcQ6lrIrAKuZhATLyijpWDIZHrB7VDkvlNZ1ibr1EcOh0p63SrY
	 fSDPolMgGqXifT9ysyBj8U2VN6Drh85HrCf7DekRpEICi6fYujThEgX9V0J1GjE2eT
	 wneYHx3BlJCJA==
Date: Sat, 12 Sep 2026 11:21:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: hwmon/pmbus: Document MAX20826 and
 similar devices
Message-ID: <aqUnx8Tzg6vJ0vwE@squawk>
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
 <20260911-hwmon-max20826-support-v2-3-5e30cbd97d84@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QPbUH+r4VhZmxZ4I"
Content-Disposition: inline
In-Reply-To: <20260911-hwmon-max20826-support-v2-3-5e30cbd97d84@analog.com>

--QPbUH+r4VhZmxZ4I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--QPbUH+r4VhZmxZ4I
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqUnxwAKCRB4tDGHoIJi
0tPhAQDOfOul3UEFtm3wWX1iXRCGwL+BVSNZoi0ezGiWs4tOogEAjav9+MErUVaH
3BY5D05f/dcXOsO6hRnA+izpecmZmAQ=
=ZbpM
-----END PGP SIGNATURE-----

--QPbUH+r4VhZmxZ4I--
