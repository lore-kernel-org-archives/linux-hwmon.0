Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E69319617
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 16:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786639940; cv=none; b=ny7dO073/hudgf2uHfil8LAj7eu2CRLPtf0+klSoMorOqywnhQm5pUn7AioRQpazMThPugesj8/dKJAGApr3BAO853b/uRyNr++rQpwl2bkDngQX6+UESdijTPZfXmtjiDJHTpe4RglRr1nMcrtWhaoTvbj9AoCwmjOiH/6IuRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786639940; c=relaxed/simple;
	bh=sWnDtpW9PEnH7vRiC4a13onTWooYeqQsVAJz49Pcfxs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BD/yBqla1LOamdKZf/RlenwpwXC9xII+wa0RcRDLfebvJvQOJlRB6EwB+fkbSe3ilyVLqQP4AWfWrz1EQE4OgvHmXjyL7OKn73YbP15Q7jjHmYhRxLyVDcznMRTmuEERDc0Ndm0p1+ER6SVuows/qePPADRRqnFYOVbEO5vQLWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ScrbbBWM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScrbbBWM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99D11F000E9;
	Thu, 13 Aug 2026 16:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786639939;
	bh=sWnDtpW9PEnH7vRiC4a13onTWooYeqQsVAJz49Pcfxs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ScrbbBWMY7tJvTN/ztOEqTTdEO2tp3MYzXlthB2KVHJMvUwbQsEzS3Xa45ixrD8s1
	 5ub7Rjndk34wxPGoEPTfu6s96NBVIpnu5/iBTOzaYKrk+zOTMkJcGDesMWKilGoH+0
	 prKdrFOFbllUvDEh0u5Bm8w0zFR8mPD9MZUVcQlPjpPmJEI5BjNhxMePDVLZaYp0Cu
	 +mSNhHSywJYscvmHpk5JoD2ent/zht+FUzn0n4qtsR1d4vjXIcdiN2JIMtR7bTc6j3
	 ixjna5t1Le4EABXyzoCMQWjVx1ndDawQGgQXpWhYSCUTrm1qcdYpvzwVpMGpAuSuMk
	 z+dnd8EBqUH+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: yogafan: add Lenovo Yoga Pro 9 16IMH9
Reply-To: sashiko-reviews@lists.linux.dev
To: rahlquist <rahlquist@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260813164746.105154-1-rahlquist@gmail.com>
References: <68b8866c-72d5-4ae7-9a41-ba8985d672a2@roeck-us.net>
 <20260813164746.105154-1-rahlquist@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 16:52:18 +0000
Message-Id: <20260813165218.B99D11F000E9@smtp.kernel.org>
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
> Signed-off-by: Richard Ahlquist <rahlquist@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813164746.1051=
54-1-rahlquist@gmail.com?part=3D1

