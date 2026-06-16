Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C9B1FC7FB;
	Tue, 16 Jun 2026 06:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781592747; cv=none; b=ripO2/No4fCrzm6oK9mNGf+SJA+Kb0AQW1PhuagqIX7Y2huHZoY58ylrNrqrDi8nS1oRsGERGbF9/3KljQUxZw4CuNVfXE4LEFywGbR5Yy24ocDGarRajZKyFr6giFcwHFy0+/FA1tMJ46ZESF9WR8g1x3mtyAj+Mo2jAY3iLpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781592747; c=relaxed/simple;
	bh=iD2NJtVbfaM8feooFnQNDlFyw/5WKvxM7OzfXyNrMpQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g/vg5VT928crp8brA+mMTlBSiPN/y/MWVnRfR7vSojqwpDDxOTfdp4hgvY/U1GXPXM0mxX3QYCwQg6fj/GiydHIT4mmZRWVCWSkIUBonACXmfnGHN3x3xnbmODxVsRjfvhOIUvgAmWvtcwljLg8Jdp3Cbh6M/s9ccwISf9nm9AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JR5KpHP6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JR5KpHP6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E451F000E9;
	Tue, 16 Jun 2026 06:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781592746;
	bh=iD2NJtVbfaM8feooFnQNDlFyw/5WKvxM7OzfXyNrMpQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JR5KpHP6UuuwifLgkSFxW+wMZ7CUbN2dM4XmnRTF1YTeV78ehG/OQalzIjxaOZazB
	 Mx/Ag7Jscj70WPyD6ZnTk5X3JGzuU5OCeVJqlWtXJZZ1vDSvIij3ryhykdFiv9wBF2
	 PMMlDcwFTTjd5R8J2I7KELXvIPdvBAegq4DflK9bkVal3NOdmiFmQAVGf4/Fx1vZSt
	 9t808M1TlkMcvXJVNE9km53mHVaR4L+KCUn7E3YPG13gWJzABFwPXM2h7II5wLdpsM
	 VqQi3/OhW82o+sH0xohjY+lSCiMmTRAZuT7C8cRN/TQvv7cDrCEZfkmNypGoJGo6/c
	 0UsHnn8ALy/xg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] doc: Add ROHM BD12780 and BD12780A
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <be64833b78ab8f915fce6209cfab0a458991033b.1781591132.git.mazziesaccount@gmail.com>
References: <be64833b78ab8f915fce6209cfab0a458991033b.1781591132.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 06:52:25 +0000
Message-Id: <20260616065226.49E451F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>=20
> Add the ROHM BD12780 and the BD12780A to the list of the ICs supported by
> the adm1275 driver.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781591132.gi=
t.mazziesaccount@gmail.com?part=3D2

