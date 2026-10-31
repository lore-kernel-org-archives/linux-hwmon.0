Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793469117;
	b=RZomylVmlrPCqbSsXDuv2g7Om0pIyCsQAKPmqOjB1qiHCbRh1Fgg65bc8Doy2tjCG9WO
	 uvHAr+GXqSTMszgEd9sF2qGEI9foqN9RtIYoWxgp7SSskbBcTuIZJhG0m0wPLCQYa5jsC
	 dkl1j16XNoab+6XXjoor+/djEGU92P6Hz3tc+MD/tPHcoHDi78/O3r6R2vmGoDIgue+VR
	 22RMPiGKbUbN82KcX98NRURfOw+x580ceuA8/F+Gs8h+Y+PJuCgaRPsQhycMVCQ+EApsS
	 whAHO0gnGf/DLXyuPcaSmjeyxHRvGZ6PuV6FR94ovpqE7EJqJ2CQIVZkpVXOS8eLxmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793469117;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6zRVfeHq8CHu8HVPvI1ww9PwMxiqvYEnwu136Y6uxcw=;
	b=Iw+kerDXtBdJt/XvOR3atN8oZWWxSxjB3533P0k3mHw6hs1BKJbyRXwGnma6rFFGto56
	 yQWdsW6dFoXPkgeRqYyYmPtOoAQzJm0L+UBt2o2NBQFvlGSBc9JCKrnwyadtWAoxS3Y9L
	 S/rv0UPVBotfDmyyIiNpXO751d2MnhQMpdGRMXeYLjTvYbP3cr0GvNulZiAlu28nS3w2j
	 8GTBeOJCraRovLYbcc08KnFan8g6R4afY3bWrkxJsIy/L0feoStYhUQOZqfgvfV6OriF4
	 BWF7JWc2QW/d5ScNpxeyfWeadHZwoivxH/M6yKDR570MRDoP8QK1beJNkj12YsdMp4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gx7l3RRD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39FA606A323
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 17:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gx7l3RRD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1C71F00919;
	Sat, 31 Oct 2026 17:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793469116;
	bh=6zRVfeHq8CHu8HVPvI1ww9PwMxiqvYEnwu136Y6uxcw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Gx7l3RRDVvRW7IzvSRhKaCWGO3VdRcV7hfYd3jgMvVHtebpVQWJG66nLkCv4wbiMg
	 mljcrJA3zzta14Yx2pQnkHPXNwF5f7ybpUO498hq3VGEUKf7yQcYewAAcDwACT6IbF
	 LGe2wK7nD5pqaWRLer6KsBM1CSCrhxP2RI725NHQfwlIYYi5c8qWEeSuxGadoIS55B
	 Eq0lgDDUyGdd8xz899P8hNLJsNajtpMFQX0VQ4laIEh7iVWTVD58xKJFnJ+wu2qlI+
	 jjkPlWIcvsDskC1/wgA9wz+l09Q4XfuzHydN1G3Ha9myS/tCsk3B7XrVwGyJJtl1tf
	 PzCBtIuv6Mi5Q==
Message-ID: <sashiko-outbox-192075@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: (acer-aspire14-ec) Add driver for Acer Aspire
 14 52MT and 52M fan
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ethan Jimmy" <duhxu0@gmail.com>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261031174651.856627-1-duhxu0@gmail.com>
References: <388aa474-3606-4c7f-b073-224d5e0880fd@roeck-us.net>
 <20261031174651.856627-1-duhxu0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 17:51:56 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The Aspire A14-52M and A14-52MT expose fan speed through an I2C HID
> embedded controller that also serves the keyboard. The same product id
> is used by other Acer keyboards, so the driver binds only when DMI
> matches these two models.
>=20
> Signed-off-by: Ethan Jimmy <duhxu0@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031174651.8566=
27-1-duhxu0@gmail.com?part=3D1

