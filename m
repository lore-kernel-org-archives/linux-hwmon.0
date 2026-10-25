Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792941101;
	b=tOpHAW5R7jDAohKRSG30+r8FhwWZvhi2KQ9gpgvuJQThGajwbfhR3OgHoB58rJgWc6P3
	 7+P3PLZRORNV24BAJ0XyWMXk3dxbSu67D3OCT6mkIRxr6aqfocJR+ylApToZrxgm8u5Bt
	 757E33RzKWsLDUr56YWZRLEtZ8JSH3qWW0MAM9UnujDRxLtrsvaZ7cO/7rEucb5NHwGDb
	 JvTV4HLdiWD84iwKUYsVur+UDdqyLMdks18+n79NwT3fUzlaCynlUsl5JxSzJSdOO8nD1
	 IG5S+Ik4Ec9J1MudVxWHTzLLK8iGJ2ZYxfntfKdIFfzP7fTf10kUawshiw0D7B66v9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792941101;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ThSMyo73DFzDqmi/5wcBRUvUbHvTl8rOmaOlZnvaMPw=;
	b=PIlAPDWaI6+zlesA/p1AS5YfXQLrg7Mze7ORlgf/zaFv8KlKKRn+H1AY2HqWATKuKSEC
	 2k7f4oGjIUb/XwCyvyAxTHicNDAYCYeDb5/XuJLdb6gs5VjC1/PX2bRi7TYczhL2Uhyqw
	 x244Yz1TbuMfWSHw6s7ZD6uVLVm2PBhmAB4TptvTT9E5dR5k9EDnv3kyL/VAt1l5HJFoF
	 65Q5Q22BAxfUetRrHhAaQ8KXI+vQRczKzxvQWYx1XhnKMZoxj4mWODTSGSIPXGfm/nSn1
	 dY5QswBKbUkLeCx3XWHWfF1C2cILz+HhNaILYRHiT3Tu4E9lWf5zr1eX/5y2B43kidg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ntAH9U0n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24D9606A31A
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ntAH9U0n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EEDD1F01825;
	Sun, 25 Oct 2026 15:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792941100;
	bh=ThSMyo73DFzDqmi/5wcBRUvUbHvTl8rOmaOlZnvaMPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ntAH9U0nQ3EmApN4dT+iFmAs3rxDRJWt4f1wokyqxW2F++P82rWkS+QGROkkx30OV
	 ZKIQV2YNNvym6mgO9WVcZNNCEvOfefxAvjyAX87ZUcO3bJnylFjq+anCZmdJNZoexz
	 P5hpiC0BEIuJwcHhi6s/1ntB49ahBq//ThOlDtqzwt1rcp1szbrNhtXKEMFNSSDtkN
	 ytrgGVplnceyqzy5cXpWzOXPFCJOe7Byb+WTCJAVrC1VHpPLHJFx0t9RzQZ6uLcqk0
	 ylY/mG26J7RIZsFFbwX/O2GpkW2M2WermIba3UbpJmqYAmfRo8sJlnPRWDqUACCkGd
	 6sAkgn1/DEvMQ==
Message-ID: <sashiko-outbox-184257@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (lm87) Propagate analog output write errors
Reply-To: sashiko-reviews@lists.linux.dev
To: pocj8ur4in <pocj8ur4in@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261025150800.49041-1-pocj8ur4in@gmail.com>
References: <20261025150800.49041-1-pocj8ur4in@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 15:11:39 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
>=20
> The aout_output store path updates its cached value before writing the
> register and ignores the SMBus result. A rejected write therefore returns
> a successful byte count and reports the requested value until the cache
> expires. With a cached 980 mV, a rejected write of 1960 mV returned 5 and
> read back as 1960 mV although the register still held 980 mV.
>=20
> Check the write result and update the cache only after success. Return the
> bus error to the sysfs caller.
>=20
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025150800.4904=
1-1-pocj8ur4in@gmail.com?part=3D1

