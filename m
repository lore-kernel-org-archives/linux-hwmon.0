Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C10838837C
	for <linux-hwmon@vger.kernel.org>; Sun, 13 Sep 2026 21:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789336281; cv=none; b=s9RB7oilBl6dU+RKt3aGk/I2LwqPrUbMXNRIpY5EDS9tIjqtYd4BA7rW27IZFBvyLgrU29ZxwG6TWu3R6jxPxahuUQ9C/xR/uUQTchjxaaxUhhQHWYHTQNnK+j0FpFjA4PWeYW1uR04je6H8ur0QChHnVwKOPaTY+Sm5X5mQ/jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789336281; c=relaxed/simple;
	bh=Jhh10f0PomSbXxRSWmpH1t1X5Mx5PnLR7P8zcp6eCVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ErRgQFT91EfPY/Cs4RQS2LexDQSbfo29LrSkXTHoNZOBHGagjjZ631wa3OeUjFzrg1ImaqiDPx81mIZUsyZ60jjgQZxIJegJPoyhe/YHpaRIWkVTLpoEC0OiZRvST53Y6LxF9oHwnSbVpGhm1heO2CM8TPu17V0FDb2DaESZU6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K20/lOVF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K20/lOVF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277111F000FF;
	Sun, 13 Sep 2026 21:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789336280;
	bh=Jhh10f0PomSbXxRSWmpH1t1X5Mx5PnLR7P8zcp6eCVo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K20/lOVFoNqGLStxwyKzayLInM2rPlXMrkG4Z3bNDpkcrfEWTSs1kHvS8ZNNhI25H
	 wEYplke53OidNziWdMqUx2xhdq5MqPgVQ8cRReJTLCPIQ9g5xvLX60VH9bWiW5r8u1
	 mf6yGwtP2iqD77HSUr+USprnahIllQfiKFPOWfPn4mPGDaDgvm81rQDN4+uL2F4uOn
	 H8z1UWy0cNknEp4Pg5i/EHTKsXVb/B4ZCenObVgEqN/eY3wV34/B2Qdbr1aToYVme3
	 AOmsXY4JuzpapH+nWXFV/dMAflByV6m9UQqKlMhG9gSszFhufKGw5pY/7kcGA9n1hB
	 A3IrN4/e42JvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Fix fan paths for Yoga Pro 7 14IAH10
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navon John Lukose" <navonjohnlukose@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260913214713.205208-1-navonjohnlukose@gmail.com>
References: <20260913214713.205208-1-navonjohnlukose@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 21:51:19 +0000
Message-Id: <20260913215120.277111F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The Yoga Pro 7 14IAH10 entry names \_SB.PC00.LPCB.EC0.FANS, which this
> machine's DSDT does not have, so probe matches on DMI, fails to resolve t=
he
> path and returns -ENODEV. The EC exposes its two fan tachometers as FA1S
> and FA2S, and loq_15iax9_8bit_dual_cfg already describes that layout. Poi=
nt
> the entry at it, and update the reference table row to match.
>=20
> Fixes: 9c110a467686 ("hwmon: (yogafan) Add support for new Lenovo models")
> Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913214713.2052=
08-1-navonjohnlukose@gmail.com?part=3D1

