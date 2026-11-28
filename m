Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795834506;
	b=hT1UlKo15mxoEFw3stY3i0Yx/zLuvxfJ/RI1QLtLiUXAU2WVQBJUijOAq8JhERmrCw+Q
	 aPv1LsEeV394D4JzfuJ0AVenOeCorKCB+FAGXKnKAAVRP7ayZreocK8sC16ZgTpxD4hW6
	 bwM3+jlMvIhmiBRfejBcRrFc1JHpjcL6220X2HHb/s2nn8onMteyECLTNjA//3rZdeKAq
	 TyK9IWRbKZyKG8HCUtgI5ZsXmuXPNOqwyKc2KyqGt+MPfhiNJONbvbqqE2061qTtBGp1E
	 iDWz6t/Rhq6duc+TJ0Ei4X7y1ahA4xdv/PF6fkm3Bf7iCzVgoEae5wuy4yVgADJXPXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795834506;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hrojyhlZmvYv67M8ZV9LFTY6szYa9aM3eisSp+vDTvs=;
	b=RgqgCpz353r9eJnFwAWEzc4wmaeGzSQeftCxwDvxF+mifOs5eYLBzGIlpEFKFZblDtL3
	 P5MWRZYMuTSB9AHg1d4F8rOGkfPLzY6j/djCA8Po8eSv+gNAMZjtmgyZjNHhwWPjD/FQ1
	 8yni6hGh/qDLxl2SsZyOYKz/tARgDs45EVA6i8sgtGYEv1UyKbnm4qTMgvzlOifJrxx/V
	 ym+AELdTXjEGE/r67iWzqtCyywEjNVBBYx0FQrEtu/WuKpmCfsLz5qSntOZRLrnxxQDR3
	 ilZCtgmGhQwO1IO6Sjh2BkRkErFFl89zCmKlqv3Eb6W9087ODRUlFji7KGN/0cOtdig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P55FprPK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C78606A321
	for <linux-hwmon@vger.kernel.org>; Sat, 28 Nov 2026 02:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P55FprPK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BF51F00898;
	Sat, 28 Nov 2026 02:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795834505;
	bh=hrojyhlZmvYv67M8ZV9LFTY6szYa9aM3eisSp+vDTvs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P55FprPKRAy7v0xPk+VGd4597mRaVOXfNqHwuQSyygD6iakJV+SiXCcsGgP1jG6bb
	 iM6cpw+5HY1kQX14Enm9xpBB6Os//lrZyyA+zj2ODNfmSCSw4ci6b5hBxQxsk5q+L0
	 NXp9glbyDSQQidU3Gpog6m87wOs/5fztyBHQxHGyQeLwipWfO2cB6+IuXbuerfvu0w
	 Ams4x91zZCCAhV/xz05ipJWHfaf3INx/M2U+02FjMkswTe5peZ34v4He7bA+dhxUBa
	 SyG5dvbJFw1NF/+0pw8b3TNOj8tPaxhsvnFELjDgfFFrIB+VPaesh/Enr+5XGlv706
	 QzKX5Mv4lvddA==
Message-ID: <sashiko-outbox-238422@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/max34440): Do not treat ASCII
 MFR_REVISION as MAX34451ETNA6+
Reply-To: sashiko-reviews@lists.linux.dev
To: "William A. Kennington III" <william@wkennington.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261128025223.2680033-1-william@wkennington.com>
References: <20261128025223.2680033-1-william@wkennington.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 02:55:05 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Per the MAX34451 datasheet, legacy MAX34451 parts return two ISO/IEC
> 8859-1 characters in MFR_REVISION (0x9b). On an NPCM730 BMC, both
> MAX34451 devices (MFR_ID 0x4d, MFR_MODEL 0x59) return 0x3236.
>=20
> Comparing rv >=3D MAX34451ETNA6_MFR_REV (0x0012) and rv >=3D
> MAX34451ETNA8_MFR_REV (0x0014) without checking the upper byte
> misidentifies these legacy chips as MAX34451ETNA8+. That switches
> PSC_VOLTAGE_OUT from 1 mV/LSB to 8 mV/LSB, reporting every voltage
> rail 8x too high, and exposes unsupported VIN channels reading -8 mV.
>=20
> Require rv < 0x0100 before applying the ETNA6+/ETNA8+ quirks. Tested
> on that hardware: the voltage rails read 1x again and the bogus VIN
> channels disappear.
>=20
> Fixes: 19932f844f3f ("hwmon: (pmbus/max34440) Fix support for max34451")
> Fixes: 596f410c05b1 ("hwmon: (pmbus/max34440): add support for newer vers=
ion of max34451")
> Signed-off-by: William A. Kennington III <william@wkennington.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128025223.2680=
033-1-william@wkennington.com?part=3D1
