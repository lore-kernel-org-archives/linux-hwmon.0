Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4A62EEE75
	for <linux-hwmon@vger.kernel.org>; Sun,  4 Oct 2026 14:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124363; cv=none; b=ALPA/8chijr7uno286Z0E5Vs9P+cENh23oTWzG70zY9lgbMC2rSMCjNScxPNgN1nUOobmYEBqqFWD+JDA3aeJbdQJITwynyCDh083/GaaBuWUBpUN026xuez+5yhvgmy6GSIP/d6+PmSO33U+hfmMQtiH4iDiFpFcCaI0kGZigQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124363; c=relaxed/simple;
	bh=jtYuII/XHP21/VeZ/jrP4g7eb+cLyLcXYEmgtxT3U0I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uxRhFemCNCvlVOmq698kj9lkJ0/qWjabpduIxs1DMsaUVbvVmGSmWU8awTv2zOGMjhjfy8q25XXATK7fZYD2es/M+BT2nU1wtPAjEPN3qzjp724dEa4ytbgo/EBlP+JGaFYZJz/0HtMDc3wvEbmDdZ2VXJtA7tYMCZnrf1cgXAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hs1wc9RG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hs1wc9RG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3DB91F000FF;
	Sun,  4 Oct 2026 14:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791124361;
	bh=jtYuII/XHP21/VeZ/jrP4g7eb+cLyLcXYEmgtxT3U0I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hs1wc9RGVdescIH0IBPwwS0rT2kUxcHnTxXRU6AkNhba40qle5MfRyHRZDQYEB+58
	 +WxHUG1SENmkOuqJOcbc44xdSkMJ/FMk6i5Z6MsMquZZC76IPGPfSNGOswOiN6iARU
	 goWNJUOteg5o67wQYCf9NFnnKId0Y+0Y0HUP1EiqZQpGHyY6c+DxbVajxhuC3Tj+Dt
	 x8JWemMWiKPkPVG/au6zcLMr66FOlNmXztKQAV9UqrEjNENjBCtAyOoA7KWNwNFHow
	 tYwLp4A/a17SHc3xBdhRUC5lXqfb6NnBFH8/yORQ3wLY41pC38Jfc3TpW2/dZzMn31
	 P8YTbMO2QcNuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add CPU_Opt fan for ROG STRIX
 X570-E GAMING
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Layher" <mdlayher@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261004-asus-ec-x570e-cpu-opt-v1-1-d9ea371c30d5@gmail.com>
References: <20261004-asus-ec-x570e-cpu-opt-v1-1-d9ea371c30d5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 14:32:41 +0000
Message-Id: <20261004143241.B3DB91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Matt Layher <mdlayher@gmail.com>
>=20
> Enable the CPU_Opt fan sensor for ROG STRIX X570-E GAMING.
>=20
> The board has a CPU_OPT fan header, and its UEFI hardware monitor shows a
> fan connected to it spinning at about 2000 RPM, but the driver does not
> expose the sensor and the board's NCT6798D does not report it either.
>=20
> Reading the EC directly through ec_sys on this board (BIOS 4408), the
> CPU_Opt register used by the rest of the AMD 500 series family (bank 0,
> 0xb0) returns 0x0580, 1408 RPM under the operating system's fan curve,
> while the chipset fan register at 0xb4 returns 0, matching what the
> driver already reports for that fan.
>=20
> Assisted-by: LLM sparse
> Signed-off-by: Matt Layher <mdlayher@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004-asus-ec-x5=
70e-cpu-opt-v1-1-d9ea371c30d5@gmail.com?part=3D1

