Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D204B4025
	for <linux-hwmon@vger.kernel.org>; Mon, 28 Sep 2026 11:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596195; cv=none; b=uGieqMiN9rxBmobVC4ggaACuYcVEPw6CCk3t8myOZrmgKZ0pFmwOEgDdTSIw4oDPv555kHbaACQyNiq9h/YXrUEJVfQXTSFN33Kb47VL1a+r6HEfXi0g66Vl0Mkpntlj2NG9pwijClMHPTzA3HO3U5nVjInQCXzOOv4JWvpvL2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596195; c=relaxed/simple;
	bh=v59QuF0rXcDi8D3rPQvExTvp5FgziHQtnMfDWeqtzR8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eLlmwjXxJCxXLKIBqIKIkorwuThmWAb9n2XsmTD3eLDR4QcYouf0O3EjwbI15XLNUd1oSYleaicD+hQsj6ozP/ZurpXtx5P1uDCvqXGBDSXYbZQxDpl6ciWZmD6YQGpQ614FWFfCCfckv0bUi8yRnknuM9KCpj2+t+SyRFQp8ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8UJSQ/T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8UJSQ/T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C95A01F00898;
	Mon, 28 Sep 2026 11:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790596194;
	bh=v59QuF0rXcDi8D3rPQvExTvp5FgziHQtnMfDWeqtzR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B8UJSQ/ToMsO/CelIyOOb7f5NPd22ppMKrwg5MuabKrv+q6891BJjTT1gSAXZYvaI
	 9XhMjugaEdpKPyxcb9Zxns5RYSXNidFjrd4LiIy293V5WzpVSa1tb92vX7Jy66bPF+
	 iE4h8e1/lE30f6k8JDytdxHLbCqBbTza7bavBHvFAinys+1B0+l9vmSo3HZHg6XqmJ
	 tCNKoh4fLF0z5GapM94ctZwjaVXcqMHp2Ocg/b1HndG19ciaB46xBRpL7z9PGseNuD
	 B2IUUeRPOwifBKjgPDCDSZhLmu5yn6D+GTZDrHnUdXE7q1H9IsEls9QnR/prfbNrI2
	 3DQ/Zug9ykJmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (asus_rog_ryujin) Add pwm1_enable for the
 Ryujin III pump
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zac Lanzon" <lanzonza@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <8bf4a14fb5d3e2ecffeeef2948f7536518f0298a.1790512964.git.lanzonza@gmail.com>
References: <cover.1790512964.git.lanzonza@gmail.com>
 <8bf4a14fb5d3e2ecffeeef2948f7536518f0298a.1790512964.git.lanzonza@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 11:49:53 +0000
Message-Id: <20260928114953.C95A01F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Once pwm1 has been written, nothing in the driver hands the RYUJIN III
> pump back to its internal controller, and user space cannot tell which
> source controls the pump.
>=20
> Expose the pump control source as pwm1_enable, read from the cooler
> duty report: 1 when the pump follows pwm1, 2 when it is handed to its
> internal controller, which follows the PWM of the header its 4-pin
> cable is plugged into. Writing 2 sends the reported duties with source
> 0, and writing 1 sends them with source 1, with the same neighbouring
> duty write as pwm1. Other values return -EINVAL. Writing pwm1 still
> selects source 1. The attribute is not created for the RYUJIN II.
>=20
> With changes in both directions, source changes can follow each other
> closely. The cooler ignored a source change sent 500 ms or less after
> the previous one (7 of 7 trials) and applied one sent 1 s or more after
> [ ... ]
> pwm1 =3D 40% (pump at 1710 rpm), and writing 2 handed the pump back to
> its internal controller (3585 rpm).
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Zac Lanzon <lanzonza@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790512964.gi=
t.lanzonza@gmail.com?part=3D2

