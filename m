Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5312A361975
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 02:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786502276; cv=none; b=JoJLctpjtIlLaEGMVYMMPVbnAlLOh7vQ1S61fKHfEJxVB0rAFsx3KHnbTe41MmKZMCk6UNhvDjguS1pIrxvSpgaHEqHp0yxBiu66QbNhBO5Bi+D24/ecyGpgRTQKssbtO6uQsdMNKKMXgaccmN16non+9VhwmqRtol0teigBhFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786502276; c=relaxed/simple;
	bh=hZx35Oim3eFvZcvalwB9csN8gGmLoBjLRDi2np3hsu0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ev8bGVsnJTuUpAs7tw7u4oJB/nRLxXpowIOedFe3kgG2Tpoi3HDPHa3GwIYFK8Hu1MbNTOY48BEMTwHuZTit+gn6imLcm1PLGN/Lg6G8OZ88y+hyLAQwzbUdOH8XlVR/CtxZV/d+hTmndCHgwv6kniLsmTQIw7DK1H5544mK7Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwyzryoh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwyzryoh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA51D1F000E9;
	Wed, 12 Aug 2026 02:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786502275;
	bh=hZx35Oim3eFvZcvalwB9csN8gGmLoBjLRDi2np3hsu0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lwyzryohZhIeeMbjPtc0oC/k/KeQCuihd4eC6r+osk3zZ9w7PxdzqpzHnD/eVt2e8
	 kSIR2m660k8ICg3e7Gbnhc/cGA95uwHuxb4flA7p3XN1K9NLYKj1m5PeeJ/xBrXbO2
	 iFJWEzERfd2uPOox5ep6DTe2k+XsFLgQsL6k1c6z0cfZmpG/1XK52I9i2eQml94gNm
	 HPdSAMvcA/7/0QRqqJkr0VZbENwqwjuoEmwvZADp9BZgE0lzWVP4vr4vIWhC6vf3Mg
	 teZFL/2nM54P3nmaVHBr9bBxc3CMpIK8PkscGeFYfBjMTN4MyJrDiLdhoeA2uI3KGz
	 5MAWuVavAs+NA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: yogafan: add Lenovo Yoga Pro 9 16IMH9
Reply-To: sashiko-reviews@lists.linux.dev
To: rahlquist <rahlquist@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260812023114.131005-1-rahlquist@gmail.com>
References: <0b6f2990-9ad4-4977-9b28-287f6dd65911@roeck-us.net>
 <20260812023114.131005-1-rahlquist@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 02:37:54 +0000
Message-Id: <20260812023754.DA51D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The Lenovo Yoga Pro 9 16IMH9 (83DN) exposes its fan tachometers at
> ACPI paths different from the generic Yoga configuration. Add a
> model-specific two-fan configuration for the PC00.LPCB.EC0 namespace
> and document the corrected mapping.
>=20
> Tested on a Lenovo Yoga Pro 9 16IMH9 (83DN) with BIOS NKCN35WW: the
> patched module registers fan1_input and fan2_input, both reporting 1800
> RPM at idle.
>=20

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812023114.1310=
05-1-rahlquist@gmail.com?part=3D1

