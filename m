Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776A9331A56
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 18:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534850; cv=none; b=VzBaLLLTbKOk42rVtfCusFHYCXxLWoXxwUAVm6DuiwW92newFzifAQrqvijgvGgW4VgjNP+vBpg8xHIsfiye3E6Cw7ktSFQsaOlZtuoCoy7C/161cTdvHGZm//fN5yj8exAUa8/wn467Tjb3tzEB1Zssl8MkpvNZJnJ3y3fRYqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534850; c=relaxed/simple;
	bh=tXUCvCyhnnnhHL02W+zmo/K5qwPYirUF9fuEW1nxZEs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gzERB0E05TvEJkaBBFFnr4ygp9AseXVwR0EawA1UVnR2vXW0H0h6BGqd9DPR6HDuF5OY04UkXmJIYsvYOKQOAtmB2LwkxBY0BCTWiD4mUNmZIehrPX08LmS/GkmDyvreqzzLHWusctXAk4534stgpjG4qm/Naari4Z/M50pJIO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPjvg1/Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPjvg1/Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E041F000FF;
	Sun, 27 Sep 2026 18:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790534849;
	bh=tXUCvCyhnnnhHL02W+zmo/K5qwPYirUF9fuEW1nxZEs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HPjvg1/ZuOPOmgtldUUueY5KF8pj5mWSfEiW4OUmWaTd06E2IiNZe57GcrLXvmjCh
	 RXkLWjPhpmFs+X+SSUa6P0d6FeNTb+F5gDnsPOfvtMSf5+nzzwhUeccqXwYmigg3od
	 w1gKI9GLBQMrhrR3b7XSUJ/VLzpjBWLg5iJ8xDssQKVrnIoRnKtoAlmVgeEaE6rASx
	 CW1OSsyprE7ZhTu9GskQ++2kUn/gJaHnSIaR3wDb3kprBcdXLWHtC/q1jOvfD9BSGw
	 5vM26sHnd5h11RSfUGF7gIoFYZHZyShpEOZNVhqXGQBsh9zDDO07fke18cgN198Yg8
	 RKEGrhXglWgbw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] hwmon: (aquacomputer_d5next) Expire the initial
 sensor cache
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vas Zayarskiy" <contact@vasily.cc>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260927183723.4078226-3-contact@vasily.cc>
References: <20260927183723.4078226-1-contact@vasily.cc>
 <20260927183723.4078226-3-contact@vasily.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 18:47:28 +0000
Message-Id: <20260927184729.04E041F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The initial update timestamp makes the cache expire at the current
> jiffy. Since aqc_read() uses time_after(), a read in that same jiffy can
> expose zero-initialized data or skip the first legacy report request.
>=20
> Initialize the timestamp one tick earlier so the cache starts expired
> for every supported device.
>=20
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927183723.4078=
226-1-contact@vasily.cc?part=3D2

