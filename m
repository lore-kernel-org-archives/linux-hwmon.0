Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10E43382C9
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 13:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780924246; cv=none; b=skuWXaARGMChbovHYEWKTdpXqLIU0L9BM0A5aPSyltp5AOB0w5nqHfknBI0n9Gq9hxSFgGlU93Cpn909elO35uTtyMRgELcdUXOwX0PP5w+ySNoY+SfOadQVctHtC7mETr0u0jBQW1F9M8hPW/mSjipYPmLkIxonmJbMOmpkGdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780924246; c=relaxed/simple;
	bh=LfzGfrENXYrGYO+DshwwqcrJdI+dTgQNIOXWsrCrULo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QWwmMou2md1EVw/oQbkVuSi88axYTNddO13r/PUMmsyZG2DvF+LwjbMnNQveOCyCrdKqqJkXH6SSViN0HBzbAGjJ/gxb3Za1UfuPjYOVxASi0CzhI3WLhhti6DR4d6qmPGl8wQrAB59TlWC540b7ULoRaYocWDjc+5kKURBYXB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D6cf1f0r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D6cf1f0r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4537A1F00898;
	Mon,  8 Jun 2026 13:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780924245;
	bh=LfzGfrENXYrGYO+DshwwqcrJdI+dTgQNIOXWsrCrULo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D6cf1f0rwoBLQUPjgZix/Y3KNQQQ4wqitNxkNPZq/T1pyTkH/jaOYgtCayijeAU55
	 LhPN3W2NG5S1bCjbs8RCj4foEyxK+oBvivhAaQ7yhFmlxeSXPtzbqxqZSPl7Mujvz7
	 KMScOH+mUJ4h701mc++5fiG04YJO4ItlyA8VjZ1dS/jqstCcSOIddHfa7aV/94ZXze
	 RO0kBITb/HDlEd+XJOzHAbfY01ZLGb3cbdytWJL7GqzGUKqOMFADFYfmmTMsKSGafE
	 AMfybMtVic4+WAIoMkemOt1GUNt2/J2PvC88CNOampn03oAtjqcwNkzXz+H1zM6NMy
	 LzWTQr+MIXLdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: Add update_interval_us chip attribute
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ferdinand Schwenk via B4 Relay" <devnull+ferdinand.schwenk.advastore.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260608-hwmon-ina238-update-interval-us-v2-v2-2-2d939fbb2ea1@advastore.com>
References: <20260608-hwmon-ina238-update-interval-us-v2-v2-2-2d939fbb2ea1@advastore.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 13:10:44 +0000
Message-Id: <20260608131045.4537A1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
>=20
> Some hardware monitoring chips support update intervals below one
> millisecond. The existing update_interval attribute uses millisecond
> granularity, which causes sub-millisecond steps to round to the same
> value and become inaccessible from userspace.
>=20
> Introduce update_interval_us, a companion chip-level attribute that
> expresses the same update interval in microseconds. Drivers
> implementing this attribute should also implement update_interval for
> compatibility with millisecond-based userspace interfaces.

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-hwmon-ina2=
38-update-interval-us-v2-v2-0-2d939fbb2ea1@advastore.com?part=3D2

