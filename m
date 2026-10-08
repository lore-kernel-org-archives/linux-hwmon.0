Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0528336AB61;
	Thu,  8 Oct 2026 11:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460135; cv=none; b=WeW93+wuzFnmuf4sh99m7cTh7Hu8FaJymkARjWYTPr+zEXTsM/dIOmJHN8r3qqw95F5etz9w4oHbWsOfGCUBH3U5UoWkOXPdgxzeAjhq0wTAIDn/Nolyk4M9PGWbOVWV8756NXwroHv8KqRPkRLdLxMSbiPZFSmdeGZrjllonQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460135; c=relaxed/simple;
	bh=mu1PhctK9S9DwO9616SQTrTCyaL3Zr4ouixRpGwpgso=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LdVKhj4MSjV6u3shzusEIrXcJttHrlpX9df/yr3dAtgDc7n8by+lZUs/FDb0S3uC2ucEgZMXNA0501hSzdIidt5arDADoB3/Wt6oYK8QV9J/ekIpklQ/5m0OChmlrnuu5FOb16xWPGj76YlOn9AaBIO50oGiVVxWb8pj+mCOZwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwIZUprM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwIZUprM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E791F000FF;
	Thu,  8 Oct 2026 11:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791460134;
	bh=mu1PhctK9S9DwO9616SQTrTCyaL3Zr4ouixRpGwpgso=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IwIZUprMBkFFnHa/Scd+PIMfrw0N9APlAnX8u5wKLwFXeaB3k0uYtFX3+8vySsCLw
	 DcM2BXYpyYuTr6ZqX/6WJMJ8hz7yhyYlKap3lZaLE+29RvI833v5BgEygekX70eO+B
	 5I0t/eQaVbs2eSVBgOhrIgIyZg4nWo1fsMz01CSybCgRwzd2Znndd+/VXpDclBCCGM
	 MOFkX1C0+69TiS7p9kpyG6GrhAD3Otn6xofu0oHWi2I3Lyr4leUm43gBiTm+pKm8So
	 ikg+m4ltnC25BbCBID42abwbVtU1OYt7uDU/wlq5jFfxYmuU7GAceDXEBE2RB3keVZ
	 JgO4z2EZUgffg==
Message-ID: <sashiko-outbox-164104@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/6] hwmon: (peci/dimmtemp) Add support for Granite
 Rapids (GNR)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008100623.7085-7-changhuang.liang@starfivetech.com>
References: <20261008100623.7085-1-changhuang.liang@starfivetech.com>
 <20261008100623.7085-7-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 11:48:53 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add support for Granite Rapids (GNR) platform in PECI DIMM temperature
> monitoring driver.
>=20
> The GNR platform has different DIMM topology from previous generations,
> with 12 channel ranks (CHAN_RANK_MAX_ON_GNR) and 2 DIMM indexes per
> channel. Define these new constants and update CHAN_RANK_MAX to use
> the GNR value since it represents the maximum across all supported
> platforms.
>=20
> Since the current peci core does not support domains, accessing GNR's
> DIMM_TEMP_MAX and DIMM_TEMP_CRIT via PECI commands will be rejected
> and return completion code 0x90 (invalid request). To handle this, the
> read_thresholds callback is not defined for GNR, and the visibility
> logic is updated to skip exposing the max and crit temperature
> attributes.
>=20
> The minimum PECI revision required for GNR is 0x42.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008100623.7085=
-1-changhuang.liang@starfivetech.com?part=3D6

