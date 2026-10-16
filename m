Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CB24E5342
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Oct 2026 16:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168610; cv=none; b=rw1X6vjojYt86ZFYorcr1cJyVwCjw9XA/pHOHj4eyoyckmTaXvSIv/E4j+rVc/PHOg2luqm8zmy2E4h+WU8tH96rKq1r0JR4oqbTpN6RsoPTJoWxtvzBXVd/k0v8+osnNpKnCyjy92y9d/sTSShkmCCtBPvf6CLou5lNN0IrcPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168610; c=relaxed/simple;
	bh=Hqy+Apnxnd66zRdO47g3nwVDTEB7Ljak+6gMkkl8x+8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=cnfxwaUqVSQtXYn1aKOymO/24sj7JMyoiFbM3iyotcsVqmiJrNWooOtOuOo2mcUADf0YkgkGwLjCXgTbOqOgiKJ7i7GYwQ8UFn343VQWsWGW+NsS1UfSgZmvnaaXCCjC07VoqzTFSeyaeXlW5ISd2GlsLtvi0vO+MIEkjjQxVJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWvspUDG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWvspUDG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F191F000C4;
	Fri, 16 Oct 2026 16:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792168604;
	bh=Hqy+Apnxnd66zRdO47g3nwVDTEB7Ljak+6gMkkl8x+8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WWvspUDGzjKMFm8o2pixkUMBxQl1Evkl+uACNcXCbZhn1NkvFgACa03d+BBLgD99E
	 kMNKwDhBjavabSXEWOIflOvl/BzBidcOyzgR6Gdvk0SOUiTF2MKK9qaQqQJjfVPNDQ
	 wzbggeYV5LulRwVPDAPrQY4x3z/jg1XgRyJc7GGO1V2sWB9sewJGWAngH8uw2DQY8E
	 TXM8PuxMbZsbNs9rdY46RoCslkZ91ts7X0FtQKKWj8jDhW5nlmQHeI83rTRiMzwSbV
	 aTVcnDJ4HuTL33z3YOZnZfX9W/9fEjQeqwNmpnsfI1uGgSuqAhTTxOn4Y5CfjR1h6L
	 R7K8Yid3U2lwg==
Message-ID: <sashiko-outbox-174648@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (asus_wmi_sensors) Reword BIOS upgrade advice
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qian Xiao" <heyheyco@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261016163509.249020-1-heyheyco@gmail.com>
References: <20261016163509.249020-1-heyheyco@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 16:36:43 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The Known Issues section suggests that upgrading to a BIOS with WMI
> method version two or greater should rectify the problem. However, the
> driver refuses to bind when the BIOS reports a version below two, so
> every system using the driver already meets that condition and the
> advice does not help.
>=20
> Instead, suggest that upgrading to a more recent BIOS version might
> help. While at it, fix a typo in the preceding sentence.
>=20
> Link: https://lore.kernel.org/linux-hwmon/CAFGXJCm6ZWK0NsFhZ1_ycgYtTTT3nh=
qj9mose60t+Rrry1aPvw@mail.gmail.com/
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Qian Xiao <heyheyco@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016163509.2490=
20-1-heyheyco@gmail.com?part=3D1

