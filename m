Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DF3411665
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 19:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781034585; cv=none; b=S0UTGxedDbmjFVcTthgL8cP2CM+ptFn6Tf+Axxg5qSEtstyS8jI6PGus1cQs4ks4H0mCwFkcyoAdeJtDjZ0eFjWIY5j9fT1Fh548vxiTK2GwtnDLeqMYvUZUgU8D7dWmLSX1xcWE3DSErzFQagRDEYdiD1hXR1dPScKPSEiruYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781034585; c=relaxed/simple;
	bh=OdG2Pzeif2F140kGGDqnSWYhAEub+U2ptO8TWTCjJU0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=biXqCb2w3tfIJJVoOFSyxvKARnOLDrkWABNxTT550xLwaYH9/qFDgav+2ssUQRin4iR+fHAPu+VmML4nd2XCNCG0iP0KWPZFo+pd8ek1ByajfRSjz3psl0fIwMI4Ncugd6tGRGC4uJSQS1zeroD2vodfc6Bh6gOfDnOszM17Ux0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGpgABxa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGpgABxa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF851F00899;
	Tue,  9 Jun 2026 19:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781034580;
	bh=OdG2Pzeif2F140kGGDqnSWYhAEub+U2ptO8TWTCjJU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cGpgABxaD1NkZFjV+Y1n/e03OcI4xbC/edeS8NbOxBezlATLnQNp9A+fIpFcSv5oq
	 vY1x6QiGPgG9NJC9ebQMpGpflkvqau2HQDGSNZK6yvp81y4DikJyYN9rjPATB6O7GE
	 fRpyPh2FR+JPA1vROebUAO5mjU91JgTc2/tF4MtE37uVXSIe5gZz76MWX4gQ4BWot4
	 UGkZn80P/7kUP7d4lGaZqubwadiTx8cbRd9VjN9vKxpRJkaEiEM+e7dOWmUsuL+4QJ
	 MxLpG/8eI0v9kRhj+VHn8Vd0MfpJsEOi2akq2+Yd6RGJgDzxe94uRji2JVBBbuc3+2
	 cDnSnqjEU25uQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: ina238: add update_interval_us attribute
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ferdinand Schwenk via B4 Relay" <devnull+ferdinand.schwenk.advastore.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260609-hwmon-ina238-update-interval-us-v2-v3-3-016b55567950@advastore.com>
References: <20260609-hwmon-ina238-update-interval-us-v2-v3-3-016b55567950@advastore.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 19:49:40 +0000
Message-Id: <20260609194940.AAF851F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
>=20
> The INA238 family supports eight conversion time steps from 50 us to
> 4120 us (SQ52206: 66 us to 8230 us). At the millisecond granularity of
> update_interval, the four shortest steps (50, 84, 150, 280 us) all
> round to the same value and cannot be individually selected.
>=20
> Add support for the generic update_interval_us attribute, which reports
> and programs the same ADC cycle time as update_interval but in
> microseconds, giving userspace full access to all conversion time steps.
>=20
> Both attributes reflect the total cycle time including the active
> averaging count: the reported value is the raw conversion time
> multiplied by the number of averaged samples, and writes apply the
> inverse mapping.
>=20
> Signed-off-by: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-hwmon-ina2=
38-update-interval-us-v2-v3-0-016b55567950@advastore.com?part=3D3

