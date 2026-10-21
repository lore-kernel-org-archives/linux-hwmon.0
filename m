Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578404;
	b=aND1YWr2OoQ73R85HnG+7rtzL434NviM+F3upeQXuLacXPTWHeeCa9Kp+cAfSV33MkR+
	 7np4NfZNFzCZXNVFgBBfGZbxnmZZvNggsHXXQwDHeqAEzGO9ZrTW2FDA3ki0O6RR3V5Zm
	 eK/CoQFrX4XcclpBqu1GEFc1Oc1UaddDlqDuDUy+LEbhjVyL3NdRehoSYu5Emf6aIz6sE
	 TfRrP6Hai39CyW2KH4MOyrghgrwfoapy5vZERKnL2cbYSiXcwJjGA8h1ZgG1FvC9pMMa8
	 K/H4M8FE65anjBXLwtHmu9UyrO2ULkBKZadZXG/8DM6fcnsk7lRq+rCOHYRg36u5c5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578404;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SH1IVRX9MLeLyRoSb0tmjWyWA29b3o1mS1w26oeK1hY=;
	b=DyIdi3pS4v9mXKNgUCKI0DZEkCLpq2BAaTytAoLf6fOmFmP1J7tZnHslKZmaabV4Ki+P
	 Mxm2c4L7pR7+Ji45EJcld+j6CPIN3gDnou3AebexXZnSXSSMENpWdIu7Op6YVpOJwUE2f
	 uhpR7L0Cugp4LVi83VU8rnZbfsUZ0q+xnfhAxwvfxRVBB+LW1ddgqNm+MBY5cZGWtcF4o
	 QWtlJbgX+p2HzUTmB12OsZt3REBlQovK4/+AKng8vaYyrGsKGMIeCDLE0Z7FgKNjq8LzM
	 SHYgWbzr8TC6073MaTCDZRePgZVHDm2EAtjsEbT+1ZOcAJq6+AOj7DQru7h6pRA95Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W8qBKjfr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93905606A31A
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W8qBKjfr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB5E1F000CD;
	Wed, 21 Oct 2026 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792578404;
	bh=SH1IVRX9MLeLyRoSb0tmjWyWA29b3o1mS1w26oeK1hY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W8qBKjfra4WeKA2kExcMkpHpwWlLg6Qv9TJmWOAdxxmuThpWOsxWzkfZIrjeAfsZk
	 ftny3k4pwbFj5W2aePGM5/UuO2I13Jr4lJ1xjUz6Nz2SUehB7zm99XrxZZBQBIF/am
	 TkwqBw6uPaEh4hU2kTi+1MmYIaXo4qT2j/7uCoKtR7fhd9k5uoLRcO6mAKfUcFAoe9
	 QBeGu/jUIx0tkYYRuogADmQEQcCNiODIgiukSp1uokETtJ64lNBJAPkXhdxtPnznEk
	 dplTp1gt8JfUP0VshedfkXDC7atAb32iZH+80BD6iixAH/lvJGDVbSx0xsYi0rz5/A
	 wnFLAREhd622Q==
Message-ID: <sashiko-outbox-180097@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (mr75203) Fix maximum clock divider
Reply-To: sashiko-reviews@lists.linux.dev
To: wuliwen <liwen.wu@spacemit.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261021102327.2619070-1-liwen.wu@spacemit.com>
References: <20261021102327.2619070-1-liwen.wu@spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 10:26:43 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The MR75203 hardware documentation specifies that the clk_sys to
> clk_ip frequency ratio must be between 2:1 and 512:1. This limit
> is also explicitly documented in the existing pvt_init() comment,
> but CLK_SYS_CYCLES_MAX is incorrectly defined as 514.
>=20
> As a result, both the divider selection check and the final clamp
> allow values beyond the supported range. At a divider of 514,
> subtracting 2 yields a key of 512, causing the 8-bit CLK_SYNTH
> LO, HI, and HOLD fields to overflow into adjacent bits.
>=20
> Correct CLK_SYS_CYCLES_MAX to 512 to enforce the documented limit
> and prevent invalid clock synthesizer configurations.
>=20
> Fixes: 9d823351a337 ("hwmon: Add hardware monitoring driver for Moortec M=
R75203 PVT controller")
> Signed-off-by: wuliwen <liwen.wu@spacemit.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021102327.2619=
070-1-liwen.wu@spacemit.com?part=3D1

