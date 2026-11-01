Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572838;
	b=GyQWRYcYlGI+uMR1dTzecER05z9ZnhZAyFinmNeMAoeM/z1+jEGOEB9Se0vimcazFa5T
	 00F0LPFRl5wiD4mSMV9lCNNw8u185usx1cWeKzj70vswmJIHDWXi+kwy0jt0rK2NgHbNM
	 tvfoqQFPpHCKAFcVEQoOwFzRj2KI8RwAsXtVpdomNbgZ6RAEp0fwng5f/LFUDG9mFtIO6
	 jsCkk7ouXk2FuFm49Wa7E2+P+ikLJAmssGtgvGG8SUDNFCopxIlb6IJa+fQlj8ltvBq11
	 4Nk0OF5fLgy9DKZGHLVigB48Ugc8C+noL1nY4XUQ4o+fAJNZs5QwlPeYP3E9JjVV3jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572838;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ptw4Ag1GoeCdTbn+xHer8rf6nV1th1UTwVK0ks2Egms=;
	b=ugR7DHGC2erzfGudizhZcNvtW+mZCahGgI4pN8qRHLthfNGhoTdn8KIwRKwA27wFeA0Q
	 Zzj8B1KaodMotjPm2FFjRxBH195EUfEqjtNz2rQ2A0cKiMb0nsLnphD8+JnrQ1YIqxrMl
	 CXVN+3ufuGGb1Xn2nQtQzk9uCmzfxVHj+fAYaHBjgv/pZf9HPQCcPZt34Bf9IEMx412sk
	 FDoE4INiZZYYlTMbFMM2k2Mta03yJl204a9Y/tiYBRNazMgpTkowXKSewYZIpbQPMObfQ
	 1zDTg5m63KG+tlqBtd9HfXC0RktMf69Fh8NSPJnQzGBkZjtPeGjXyKWYeg/vI6KLtIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XC9X9YEF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC086606A324;
	Sun,  1 Nov 2026 22:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XC9X9YEF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249411F000C1;
	Sun,  1 Nov 2026 22:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793572837;
	bh=ptw4Ag1GoeCdTbn+xHer8rf6nV1th1UTwVK0ks2Egms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XC9X9YEFG2mF0jTtb+WTmA01hx0jO6u81YvxQMXMWoFg1Nv745bS8R8YNF3h+47g4
	 oaiLlIGbklMHhZkznxp9d2nEwRDHH6ow+Ne+RTWtOWp8lM7ClUiQfaTpr2/d7jDXF1
	 ztlKMecmWV44idgsBt5HcmXC6LcgwE5Ghpk7nY/QaC7wJPXQQp1B6zYzxPrpVTrsG6
	 Y6OMVz8ypOtVH6UIRCNqVlkgXGf2am7z3amTQjzaY14brNQ/pdyMDPBuJNqe8gkbYk
	 ieguPlFUzzVVwLX7HdAwexSTl/02KRz9oL8DAV8urwZpMveUk/a2jYPqiM9oOnTv4r
	 8kuDKQK+DALTw==
Message-ID: <sashiko-outbox-192723@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] regulator: sy7636a: bind to the I2C device
 directly
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261101223125.302001-7-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
 <20261101223125.302001-7-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 22:40:35 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Bind the regulator to the chip directly, as the TPS65185 and FP9931
> drivers do, and have it create an auxiliary device for the hwmon driver,
> instead of simple-mfd-i2c creating a cell for each. Drop the MFD glue
> and header. It now probes before the GPIOs may be ready, so report the
> power good GPIO with dev_err_probe(). The hwmon driver then only
> accesses the chip after vin-supply is enabled.
>=20
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101223125.3020=
01-1-pmazzini@gmail.com?part=3D6

