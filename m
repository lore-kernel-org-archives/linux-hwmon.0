Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1A04BB7E2;
	Tue, 15 Sep 2026 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491470; cv=none; b=m7SKuokjGumA6AVTyxn8in0ucZCX3C7o6ETXhPYlSvOIn3KktRQx9srkqw9o88r9TH6JIXgIvsSGtQoCL6NRFNMxbobwjgSdyMbrHLCKOsJHsk0mL4oZbmWaBp5FPnYZG/jZzLYBBD2P2lXr1BbwkDXjC+JlSltwg2vLBFLHmQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491470; c=relaxed/simple;
	bh=jlH2J+m4dM5zFg2zlvQ8cHjEGk7QWZZc+Wts/W6X4dg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=blCUjlsmjWFoLMoe31wbYbHLkTp5p87LN/M+vH+dez0xjtRRhHcljdjmdmzaHRQSwKAylFdTYuhY0NPccjpc7Cv49xiUfu6+w0IGfNm/B3k4K6zWDEiuSxdcxsbRGvF2h5cd0pLbbJD9F+yDK6EkZRXxzixrkAQ/keyHMkticTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXPHGiLD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXPHGiLD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BF61F00893;
	Tue, 15 Sep 2026 16:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491458;
	bh=jlH2J+m4dM5zFg2zlvQ8cHjEGk7QWZZc+Wts/W6X4dg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IXPHGiLDCM/3ALRbFsJQryTJyqy7qv0pCHWXrKrsz/n9Ypkq4th+AwD9ahvkatxCa
	 QflbL+Aurini65nrEHmBIrmYjHvvQ3M3IPNt+BDofPgJlVhNvN9CjpZSACekk3U71V
	 IzZuQ0JB9rROYWiHW+XPANMO06Jl3U4WWC001Q3Bcyhhil1y0+cA2UStkZg3ZnPOwd
	 qGzZaHdvN8ZeRBz13tdyoO56aHWhRbGj6quPCem9RbVXJDFWKou7DBrfGBq/b7AKtP
	 Wafxq/XnC0765ABV9a6TL8Wz0QaKh46ETWFK1hUrS9CN55CkaRzeKeknxZcEKXWaTg
	 8VIOzZj3y+XbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (pmbus/tps53679) Add support for TPS536C7
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260915164823.160977-4-sanman.pradhan@hpe.com>
References: <20260915164823.160977-1-sanman.pradhan@hpe.com>
 <20260915164823.160977-4-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 16:57:37 +0000
Message-Id: <20260915165738.31BF61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Sanman Pradhan <psanman@juniper.net>
>=20
> TPS536C7 is a dual-channel D-CAP+ step-down controller whose channels are
> distributed across a configurable number of phases (N+M, up to 12 total).
> Whether channel B (PMBus page 1) exists depends on the phase configuration
> register, so the page count is derived at probe time.
>=20
> Factor the TPS53676 phase-map parsing into a shared helper and reuse it
> for TPS536C7. Only aggregate per-channel telemetry is exposed: leave
> info->phases[] unset so the PMBus core never programs the PHASE selector
> on every read (and because TPS536C7 can place up to 12 phases on channel
> A, exceeding PMBUS_PHASES). Report VOUT in linear format like TPS53676.
>=20
> Since the core never programs PHASE, set it to 0xff on each populated
> page so READ_IOUT reports the aggregate channel current, and verify it
> [ ... ]
> so only those two identification reads fall back to no-PEC.
>=20
> Co-developed-by: Senthil Muniyappan <smuniyappan@juniper.net>
> Co-developed-by: Vaibhav Agarwal <avaibhav@juniper.net>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915164823.1609=
77-1-sanman.pradhan@hpe.com?part=3D3

