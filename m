Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794939642;
	b=2YxnExmyfoFQ/rIBIeZK440cc6ymRBxeLOTbCdgugWXlQyIF4Jl9kiagzI6L9vbdgvwu
	 J7x+QJiqB+IgZ1nQtiE5pIToi2X24D/bhKevtjxhNvjspHPJGZedjmcLAimTBhAQlDTwi
	 26sC7RxG8TU6jH9JoBYm5QHKWNNEX1iDkeiQ0kkezkbVE0ZQlunfU40IEsu9AKBB1V9Ag
	 9pMT+i8PVVisQBVsw4ha8nI1JbNqHXBqJ/QX6eoWvO2wz14+AzsyvY7/ZpKl6apiZz43I
	 uRt/V8CeXBhzWSy9nilpewU5pKXw3qYM5DIJfbVSCMm5T4eYcJosq2/byevHJu4WkPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794939642;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KK2Oa/5xl355COfxUHA/YMeYMwCPvjuoFteXfA4B0Ks=;
	b=Rd1dE0HMeyHAQiPIWchpgBPx/bpJEt5sWhnrAZoK0Pms8J0qjJ+HEHRaGx74wF1D9s6S
	 APy0nOp5EcItfWH09PVNekgMgMvjOUqktQV5b3fum7h6qfP/aZ4EMFkqX2sJuujLuulwU
	 nCdcWG12aIVv2YxBFEF7yWbbK5fMg7pbUladkGQv5Y3QHyxTyYYIl846xxT6ClkAIpok0
	 Cr1jzG4Bj6Y5AtWWMJhQb1wuWQTbcza6UYvDQPo0ROmKmsyaEqrDLfKbg/x5IYOnVAhei
	 lNOssnY6Az3S1GqCnRvd7mJHjXgjV5QUySGJb/3maNlV36Ytpc7fiW0cY0DYx8dsh8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M55VZVbt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D72C606A32A
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 18:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M55VZVbt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6301F000C5;
	Tue, 17 Nov 2026 18:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794939642;
	bh=KK2Oa/5xl355COfxUHA/YMeYMwCPvjuoFteXfA4B0Ks=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M55VZVbtE9DsGRa2BTRPL6QgFZO2hsfAXwaz/+n3otqUUJHAXMnDwLKGflz3uimWe
	 10hSq07ILX7ZmJX6eZ3wHiriA8QoDiCaNlmi94WpUq7Rgtfp22zVZ4KNMDzCmY8MG+
	 3ybeDxEpsmGDgzTtbsIbG13lol1/REGm5TB6Nzo0DY+fq+oHv8BCHe+XEts9ZMZpmD
	 YnIeJpB7UKvS9w1SnQY9XZNFcfhqyic+f0J69ildNg3L/QzwXchwmNKuj8WiXabdB6
	 bvcE8bVZbZoGfOYhzVqFW+SMLqAkW1m7G2YzIfli6UC2awUa0JeEj+7vPqdIYe9fj2
	 kefZ4bIBx4htQ==
Message-ID: <sashiko-outbox-219330@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/7] alpha: marvel: refresh environmental readings
 through the console
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261117-marvel-env-v3-3-0edc370fdca9@gmail.com>
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com>
 <20261117-marvel-env-v3-3-0edc370fdca9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 18:20:41 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The SRM console keeps the readings of the temperature, fan, voltage and
> power supply sensors in the power and environment (P&E) nodes of the
> config tree (GCT), and refreshes those of one node when asked through
> config tree callback 0x28, function 0x1f. The Alpha Architecture
> Reference Manual reserves every callback code it does not list, so this
> is a Marvel console extension; its code and function number come from
> Tru64 UNIX. Define CCB_CFGTREE in asm/console.h, and add the callback
> and marvel_cfgtree_partial_update() for a sensor driver to use,
> retrying, as Tru64 UNIX does, while the console reports busy.
>=20
> On an ES47 the callback takes 13 to 300 ms per node with interrupts
> disabled. The console callbacks are not reentrant: a refresh on one CPU
> while another printed to the SRM console killed the second CPU, and the
> service processor reset the partition. So export the srmcons callback
> lock and hold it around the call. The lock is declared even when SRM
> support is not built; there alpha_using_srm is the constant 0, and the
> call is compiled out.
>=20
> Tru64 UNIX makes this and its other runtime config tree callbacks only on
> the master CPU, and the Marvel PAL TOY calls are already known to work
> only on the boot CPU, so make the call there as well.
>=20
> Signed-off-by: Matt Turner <mattst88@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-marvel-env=
-v3-0-0edc370fdca9@gmail.com?part=3D3

