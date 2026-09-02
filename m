Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDD93803D0;
	Wed,  2 Sep 2026 18:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372349; cv=none; b=rk4ZemsqSPWwzpxxz4zCNRvAVIIhi09qgyRMdEC8N3dGmug9kjarXdao4nlgiildZwTc1DF/iWvNK73A0MkdQiO/uHYq7ZXJRHdQFcRY7J/cxGl5fVroydPxOCjFzWwqlSrIuWFmrM8NRe5qlhmJd/GJ7vqkcg1dHNVlUta61PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372349; c=relaxed/simple;
	bh=uA6KIoQjQzPxx1hOASzcS/sT9mxwE7G2kp4rF+O0gr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvHDd4s/9RchQWaMGEWp482QcpkMd+kC6WcM0uCp4q2vyjPIBIT/NwLuNgL6RPuUP884jlyDUL9rkMoEH4pktn33IwdoOG1ZNuWRdaFZWXuyP6fFodCIV/Y1PEztI0I7GkYqn1kUGpzalF3AKUa5jLBkL+FLtPRRsQn6KE1IypE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+MzdZb/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+MzdZb/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F23A1F000E9;
	Wed,  2 Sep 2026 18:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788372347;
	bh=uA6KIoQjQzPxx1hOASzcS/sT9mxwE7G2kp4rF+O0gr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R+MzdZb/7SkEMZ0t6HMQ0OfkYGoysbRfewrdIaX0pTGUX/wJjKPzvvWLd9XmsUrOW
	 FGrnjRAUx1XvcGtLmc6PxJUqnJmQNb4KMQ33gpztu/DCWdB8J7eE3RS2UNax3q0jn2
	 06z5e0mGmrvBhiJJBYG9mh/99UckhIOoYj80n6NjYH+kq+6E0PRGvAoesKX1SJ0hSh
	 zFqIUIIT7IYtn75Pm1bKd3Q4WEIirEp0Ig78rQUjkJl0rx3MkQpObkqojXua2NIdCU
	 Y8bmdJE+o3OcuGsEoADOr13aVMqc58l4MOxQabqGkQXkZq9tqxeDsVHv/GIhOTV169
	 6eTS1xE9Ayo7g==
Date: Wed, 2 Sep 2026 19:05:43 +0100
From: Conor Dooley <conor@kernel.org>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 1/2] dt-bindings: trivial-devices: Add TI TPS53622 and
 TPS53659
Message-ID: <20260902-camisole-parking-faa90b1cbaca@spud>
References: <20260901211129.360792-1-sanman.pradhan@hpe.com>
 <20260901211129.360792-2-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TcgRQVCdwPNM5qFX"
Content-Disposition: inline
In-Reply-To: <20260901211129.360792-2-sanman.pradhan@hpe.com>

--TcgRQVCdwPNM5qFX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--TcgRQVCdwPNM5qFX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaphldwAKCRB4tDGHoIJi
0i0RAP9ZABwp8QkQBk/ENlTpeBAlJlpy3kETktMbx3jnNtFA2gEA5QlbFaOOls2G
jXqUwuYNl/JNeXIXANryuL4K2J+CNAc=
=3mep
-----END PGP SIGNATURE-----

--TcgRQVCdwPNM5qFX--
