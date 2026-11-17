Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904428;
	b=lIG983U9o1+2VhOfX0/OIzMGIJGQq8zsAPbUOqN/9t2LD1j6UMBH8u1K/kZGmxCrD93r
	 CU+4xlo9UTHNrqez8ZqNMflUoOTH2WoPpzozEI9pXAPubdEb/7A12qS6oOqJ5sPfO6B8P
	 SE4lzD9MMxIKWLKIElWeUVTg6rNVX8/Iljm7hxgZVSfD1RkAqVqBEZRHAstyp17earI4V
	 5pyz328e6l98u/ioQAJiflYxqILrIo6hsnfGK1aLyToSUVe/kZJPyKKKkLpRPe1UL1XV/
	 CiUsIpTU+b5+/T/VHOovtjMqxX08w1dJTMuEW7ClLfR20+8SVC4vIR0sPjRVfKt6vcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904428;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HRDrDBMOyI1cbKrzEVikmBqQGi+IkpZKf9To3CQ5G6k=;
	b=iatwRm1tjmUzeeV+/uor5Rmf0RlP+dhT87MShnMWXOXHm2agEQK10Ufl8mPauZuotA94
	 4aezYxFonRg3LXW5vvz+gIVzZYLKzmQwelKCWR9ahGxntDzMc76DRqQqxWrBOMyz9RvKa
	 dlSytw/Fsi0aHxOzluKmZ1JAANASv3NmX1o8oqRFb+mMrW864+qoX5xMA50+4LdMEEN5k
	 x/8PMooJWIVzE4nEZwJz9LrHB3v0GU/SwXf6e8KFaAsqBY1ksa2Z/cgJwMzeKpSKgoN/H
	 FG04Or5I/NDDBsLXccLOtHExC2SgC2AQzmYvk0qk2iz0xvYnWwufxjZGDMEhQXBJJrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=enz3YEwH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D535A606A8B9
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 08:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=enz3YEwH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC1E1F000C6;
	Tue, 17 Nov 2026 08:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794904428;
	bh=HRDrDBMOyI1cbKrzEVikmBqQGi+IkpZKf9To3CQ5G6k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=enz3YEwHHvRpI52PdUFHiYOFQhArrbIJJtnU1LSpTu2Kn02zFQ8w7VOwgaPWOeSHZ
	 R9gnlJ0KWhfM1R8Qll8tt7dGorLixBuccs5FeHNrBIHrqNMcW+A3NuKJJqnrMEZZxD
	 5EKaac2R/+qiIKjPjDOU2jxcx/lK6RR3i9xfz0Cq521TxAN/T+msrdYRiUdqpSS69Q
	 Kd4CaYVFv3mnaceCOprR5yLk5eWJ3aPDbHf9BbV0INhKGegom7t3mZI1szo7nYGZvy
	 9RrW8LsjYa3OXTnkDG0q+mjsNMWbSD8z+UkAyAbWtlsT4blt2imolkIUz7XI7O48I/
	 NeH/GvTWB8I/w==
Message-ID: <sashiko-outbox-218421@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: ltc4283: add ltc4284
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261117-staging-ltc4284-v3-1-326bb844e08c@analog.com>
References: <20261117-staging-ltc4284-v3-0-326bb844e08c@analog.com>
 <20261117-staging-ltc4284-v3-1-326bb844e08c@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 08:33:48 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The LTC4284 is a negative voltage hot swap controller that drives an
> external N-channel MOSFET to allow a board to be safely inserted and
> removed from a live backplane.
>=20
> Note that this device has a MODE pin that is determined by differing
> voltage levels (VEE, VIN, INTVCC, or left open) and cannot be
> controlled via software or GPIO.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-staging-lt=
c4284-v3-0-326bb844e08c@analog.com?part=3D1

