Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884C6FBE1
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 03:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785124004; cv=none; b=dirPeJCEPP4I/TAJWLNTjrjA/cFrRaVReJasaLMvlOANmQsVjCI3kKHV1YVPpehM/khhMJqJedTwNx2d1xwK1kehHOvL/BWY8FZS5QvRpxnEd4axhdgi9vOEwwwlVYs99z3Bi8rpBGkrro9BSMV8TCY4pUiNMfCxahNM045unDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785124004; c=relaxed/simple;
	bh=mXWLWrQhPQKnwFeQx0ab3TQVxTisE5zCq46csix8RqU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t1Q2JDHLwOpIOky9S7jWFYqKUAUS8W47X21ZHS3ux8eHvNUyMdL8GtSX3jDWtqT5Ssl7iLEt8DycfDDr0DXweF0n0vKa6YOkvy1a5P68IkHgr4dvvx5vb91n/0H5+QIWHhEN2gEW4Pm2RwiOBVON2qfqeRFLm5LfzkX83zVovVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EU8wv6fA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EU8wv6fA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4921F000E9;
	Mon, 27 Jul 2026 03:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785124003;
	bh=mXWLWrQhPQKnwFeQx0ab3TQVxTisE5zCq46csix8RqU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EU8wv6fAHv93cIIRVgOjexW4gTt5VpgCrJ+O1/2HvsBalYltG+PwM8Dfbh1l7s008
	 lEltVLpF7RrBJbZOBBNjMkRJhA9lGaY5xciriiRs8bdzfRVLalgdotqYtGAva+qfvM
	 4mBDiHTWQDxC5daOIrs53CTZrhp2GDOwOEg3PAfpwxjyW/afw3ZSWMX61XGpFgai+L
	 ruhnq6HdQFoNMFGeS96jJ88ioWsAHd+p4sMwmo1bZd4esuPn65rFr4EJAYYF3E6mTe
	 eze7XdX2Glx5R0ql7pY9QeChfLNz5xWYISd/iv5XqN9IMnmEQ63WZ0Ve47eQdDyY8Z
	 pGIQEisEQaIUw==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v3 4/6] hwmon: (adt7470) Fix swapped PWM3 and PWM4
 auto mode masks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727-adt7470_thermalzone-v3-4-21424d550c3d@gmail.com>
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-4-21424d550c3d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 03:46:41 +0000
Message-Id: <20260727034642.8A4921F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The ADT7470_PWM3_AUTO_MASK and ADT7470_PWM4_AUTO_MASK macros are
> currently defined with swapped bit values.
>=20
> According to Table 22 of the ADT7470 datasheet, the Fan Control Mode
> Configuration for register 0x69 follows the exact same bit position
> layout as register 0x68:
> - 0x68 Bit[7] corresponds to BHVR1 (PWM1) -> 0x80
> - 0x68 Bit[6] corresponds to BHVR2 (PWM2) -> 0x40
> - 0x69 Bit[7] corresponds to BHVR3 (PWM3) -> 0x80
> - 0x69 Bit[6] corresponds to BHVR4 (PWM4) -> 0x40
>=20
> Consequently, PWM3 should use mask 0x80 and PWM4 should use 0x40.
>=20
> This typo did not cause any functional bugs because these specific
> macros are never referenced in the driver code. Instead, the driver
> correctly applies the configuration by relying on the modulo parity of
> the channel index (e.g., `channel % 2`) to selectively apply either
> ADT7470_PWM1_AUTO_MASK (0x80) or ADT7470_PWM2_AUTO_MASK (0x40).
> Since the bit layout is identical between the two configuration
> registers, the hardware is currently configured correctly.
>=20
> Fix the macro definitions to reflect the datasheet accurately and
> prevent future bugs or confusion during code review and refactoring.
> As this is a purely cosmetic fix with no functional impact, a backport
> to stable kernels is not necessary.
>=20
> Fixes: 6f9703d0be16 ("hwmon: add support for adt7470")
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adt7470_th=
ermalzone-v3-0-21424d550c3d@gmail.com?part=3D4

