Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655351;
	b=JU+9E0gqoB9G5Z4cAO3mOaNlmeIf7fxB8DByIuYKLWkbJzFXk9/iwosogQ5iLZ+RzlYv
	 4cEnscWnzp0DDRLy9WK7s1tYCEdlFNUWVuV7a7MAZxMVoeHGAf+/0B7V79Tv7Ho1ftdzB
	 gGjY+99Px07U5/ytloT4JyaKMeRoDdLkerN7zcGFXg/VgOd19K8ILLfh7rn0d1qGiSvqJ
	 cKjXo+RGPBFlc+3N3Pu4Our4HQyJI9SJMtj/EpmhXr2xrfZdOU3srYrF2eMJGkELYJigY
	 OG8DY9T6PR6SoFHgip/OUSSz5awBPDwjQ4FHhIXn16KkHtc+Rac3UVquR3oGLczcumg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655351;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nGJkgPTc3NCTS//MPoZm5qoJU3yXIAHWmrGCSrg7lT0=;
	b=e4OhRfh4/eFxgn4IAvufHW/GJp8HQbfiPCZHpOBbvgdYozSM5gMH7UIs0YqFK4U+V0Yr
	 F0oEbb6pZA/ZIUFdmGSgryB5X3ETQQZLRptk3f8DOYFb9aRuUgKL3a278Hoj2jXU2JT/1
	 krEydy267qhQRKRkCdD880NINBz70hAAt1sF0Kl7SB6S2+W9sPOHtrTAuvUoCNXMXdsSH
	 yNuDz8QS/YD7SU8Mj0Qfw4vi7pKY+q8xDFm8xBW3Cye8tnrEP8xynMxzTo03X0hslU31u
	 bY8lwRowve+9AKYs0S4MJPBnnQbkiAcS288OtsympOweTGECqErYwVhYlyOhGNrjvVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aZkiNkQX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BAA606A31B
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Oct 2026 07:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aZkiNkQX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAEA1F000C1;
	Thu, 22 Oct 2026 07:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792655350;
	bh=nGJkgPTc3NCTS//MPoZm5qoJU3yXIAHWmrGCSrg7lT0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aZkiNkQX/C/SzT1rrzEvceWhafrEhF4Mm9zQ9Pue26XZypUmLmOhikB+qWrq/YV7F
	 zWb/1miKkR291sjGYlZTO4pXZCToL4zpYmLbFVZ2YUJDzMEw3fEGvcVwca6x6wjnq7
	 R1yKOqZDwXxUNDXLYMEmVq+9+efa3fFb2finTA/uBlEUVFek1qwNYuectCGDrNfclH
	 YtdYdhMNmGhYXcRdUtG4H+9LrlH/FCaMqAg4H45W6zLEfrmZ8YsrAE9xteURTMHS/j
	 LG4p6ypCa95lhS6a2UQlec7Sdkd2EH7jZgiOaseVeckYwtND55cKRTTEVmhyB556G4
	 tlNuHG/nppAFw==
Message-ID: <sashiko-outbox-181135@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/7] x86/hygon: Add Family 0x18 DF node enumeration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261022074218.667049-2-wanglin@open-hieco.net>
References: <20261022074218.667049-1-wanglin@open-hieco.net>
 <20261022074218.667049-2-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 07:49:10 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The AMD node code locates function 3 for node N at PCI slot 0x18 + N.
> Hygon has no equivalent node-index-to-slot mapping: DF F3 devices are
> discovered by PCI ID and the PCI BDF is only an access point.
>=20
> Enumerate Hygon DF devices by PCI ID and read their identities from DF
> registers. Build a dense node cache with Core and DDR Dies (CDDs) before
> I/O Dies (IODs), providing node counts, identity and PCI function lookups.
>=20
> Guests may expose a supported CPU model without DF devices. Suppress
> the cache-build warning for -ENODEV in guests; keep other initialization
> errors visible.
>=20
> The node lookup helpers remain local until Hygon consumers are added.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022074218.6670=
49-1-wanglin@open-hieco.net?part=3D1

