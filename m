Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794040498;
	b=R4Gt8PFet8wLMeijZpLIh/XuK87ApXy5sDTkyihg4nQ3B3JC1vWjeqFn0+HcksEu78I/
	 cFmoZe14LEdDn462iqxdYacAE6WmWJuxqEjGB3l+rlKxRR4cdrCI+LOEbSPW9c4ECePJe
	 Bl2avW7n8L2ZFV5B4kDfrPsFz9MUs8Th3nKHSfsUXjlC4NfJyP2MOSCoTMKUJluqkMj27
	 zgvB59MMrdZWoM42GMWmidcwsZM8h2bxGRfpFamTfrXhTaKoxrEwKFJsOGgkyhKRiJwD5
	 y5/9hPAOBI2RrXccTMqQIL0PvCwL+INV+weSAlKP74EjcoqHZZa3Stvx43YCJOyavVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794040498;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=E7nyAvzElNi1B2VoXUDC5IGRGyHEKvFsEJz2O3RwDAo=;
	b=NYeCxWRxa+gqqCRsFmfjDKFVhFdyVVfar5rLVLNMTY6GxsWyjWFqyilh3GfkMDucSGY1
	 cSRrs4AlLMh/eMkIZEIb3r8+cVKuj1xol3gnOLib1mRNRyOHZAxqg8+Sqx5sjZl3lf17K
	 WSSyHnyyTXZj12He4o3JkMBp0eLnS+XsPQJXNn6dqmwcPHEWhJg+yVeWXTE0zAccyfkan
	 omJOaJvTzLODaB4/SNs5viQCuRRsT3xmNSfWYJb1VxRkU1q3uCibzFn3sSVHcMPuMC+qM
	 KrCYNraW9BOwCE9GNpus2OvF2uVcxWPB5e95AjzT2z9kr2oLdgdb//UVBJCVkPtQhew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=huaH4krH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C05606A32D
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Nov 2026 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=huaH4krH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17AF1F008A1;
	Sat,  7 Nov 2026 08:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794040497;
	bh=E7nyAvzElNi1B2VoXUDC5IGRGyHEKvFsEJz2O3RwDAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=huaH4krH4N87jGmU01kdbjcHPl7neXlL2phUOYiBorRtYAm+EIXjt7lNK2faiVp96
	 lBOoO3tybf2kGWBXPzEWPZbt92okBO8Jp4W/2MUZOAqieJyKTkw51b6q4gEnf1zNdq
	 uHRpLD8ia8h0RqQGJ8kSVlwfmj31uIvqy3mSLqjvi37oZ8Q0KajflolXsUYjdNrSxl
	 CT6QXB/0DUPr8L6aU5kB7+6xES5OKZmMFiq4H1UFjcO9ktvGGar84hUeWUJG/OPC1u
	 XEREo3hOB7RGrbsO8H5CpMGa4tQ+efizptyf6AwN6oVPHp7B1oE8NfWi82BJNq1Lmt
	 abm/dRp5ub7Kw==
Message-ID: <sashiko-outbox-202744@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: Add driver for MSI Mystic Light controller
 voltage sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomasz Bojanowski" <tomasz@bojanowski.me>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261107082821.8257-1-tomasz@bojanowski.me>
References: <20261107082821.8257-1-tomasz@bojanowski.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 08:34:57 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> MSI 800-series motherboards have a USB microcontroller (0db0:0076) that
> drives the RGB LED headers. Besides the LEDs, it measures a few voltage
> rails that are not monitored by the Super I/O chip, and reports them in
> HID feature report 0xf0.
>=20
> Add a driver that reads this report and exposes the rails as standard
> hwmon voltage attributes with labels. The values are cached for one
> second. The driver never writes to the device and keeps the hidraw
> interface, so user space tools that control the LEDs through hidraw keep
> working.
>=20
> The controller has the same USB ID on different boards, while the rails
> and their position in the report depend on the board. The driver is
> therefore only registered on supported boards, which are matched by DMI.
> On other boards the device stays with hid-generic. Probe reads the
> [ ... ]
> the cache, and hidraw access works while the driver is bound. Loading
> and unloading the module repeatedly hands the device back to hid-generic
> without errors.
>=20
> Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107082821.8257=
-1-tomasz@bojanowski.me?part=3D1

