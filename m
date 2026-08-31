Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F15299931;
	Mon, 31 Aug 2026 16:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194379; cv=none; b=iVOtMQ9I93YyuQICtaW2hpjs2kGKF5+SHfiJE63HoB43n0IobddlRRM/pt+Q+NkRK+2crlG2nOGNybiO2HwrTKX8wcTM4FPas0fi6773QokIXYl3JIOIropbcTKdg4vM2iGzw9CUQENYF12l42h0WInEsbi/Yo7Eue0Nh9/fACo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194379; c=relaxed/simple;
	bh=iQJ40QcnaK0yOoVL+mmACpws7W65qjlL2LLh1GDN9LU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ovE6X9Rr6HCm++bWjZzMTVHBCBjY1wTLNxrRrog6Dwawu4ErQ5hFfWTkdQHGDQ4izb8dxMSbJTtwLR7ZOdYPj7rXp4ZcGCS9DKSuiWFOuDkR23Xeju4YShROn8jqIgFU3NMybt46ypcXaizZtVXM8jpMA6Zjs0e919TRN97mEqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCnA+K3u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCnA+K3u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843B11F000E9;
	Mon, 31 Aug 2026 16:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788194377;
	bh=iQJ40QcnaK0yOoVL+mmACpws7W65qjlL2LLh1GDN9LU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hCnA+K3uqWc/A9Tn1JBQl40RX/9LUOOvq8PBQTiZiHR8lhAU6bwn7Pg82JdQE+nQq
	 Qeajkt3NQXesiSbMShXM4gzvWab5j9FhPLdIqPPoLIruGk0Tw7GtpicvsSdMU5Xenq
	 035tRwWhZXt0wvXqj1/934QZH23F6eP4y8EXE7/4/a4rLxxrSS5yMwM8mg7T+KwLhg
	 hB0dYrBr74LKRsu3XCUAwNCc7kzQi4HUdqMuGNhOF4MkShDUuF9btFIKztxicKdT1t
	 30eMegTevJlSK9vJDk59JcDElJzjYXVqXEBSjVFBd+C8AnWxjWMuXM0XpP6tnNSnbh
	 Kq/PYUG76zaWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260831-ctl2301-v4-6-b335d52a0570@linux.dev>
References: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
 <20260831-ctl2301-v4-6-b335d52a0570@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 16:39:37 +0000
Message-Id: <20260831163937.843B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Enable I2C6 on the K3 CoM260 module and describe the Sensylink
> CTF2301 temperature sensor and fan controller at address 0x4c.
>=20
> Override the I2C6 pin power source at board level because the IO rail
> voltage is board-specific.
>=20
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ctl2301-v4=
-0-b335d52a0570@linux.dev?part=3D6

