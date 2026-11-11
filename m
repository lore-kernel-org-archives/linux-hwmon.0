Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366185;
	b=Pohyuw/8YEFVxYSpoMRedldDNSge6aGtjWJ58L9L/U5VLnsYMM5+0qrOwcw6OzjhCGuj
	 B8l6lIbGYoDnR7kbdMcUHAn9A2LMcgT+Byh7N7M4axEPwT4lrHquJunMzCpCFe2gzypTO
	 yr9weOJVWNPsFofFmZwYJVf6KyFuZe3bVpmZiE13/J5OltktT0OgT4Qleb5fFQCrqKB87
	 Abra8vXENH5sqZfxPp9wwT9Jo+nWZfo5od+sbMals+vTmc8HlYyhcelACp3r4ROO/MYah
	 H5HkIZVhLaFf6v6O7/RxvTIBudynVTESll49TMZfF+xa507baLYkgaNlXjhmcIERpsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366185;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oIQLDdqhFGAv5xgiSya00tLYOu5UevFKNJYfrciwv9Y=;
	b=fMeGPTXvuf7mkszOsO2isR0/6Zwb40d47o02a2TrzhuKVu0Dk9bNSBwk0Lymit4LwAZ8
	 3occnz+JmFsFf9Y223xofovZPIUayy4VDvQ3CJ+zu3EOSwrutL3w37zphRpZD19yCLOJv
	 tqJ29tkVR7Blh0wIcw6jf3AAJ1NCQIamqtzKdQc9to+KGFLPzSu5MBmjNzVsXjj9ouJeI
	 p/xEf2xJjfUlJiNDQrIEUAY9740ZMl+95eAjfmukInCDZpbdIRvXispyTydKLIsoAgzkl
	 5yiACjfdwNvJwkjAm9Xtiky1ZINdloKB5Hqo4T+ukTMtoNPQe/fTm3UoQ/jAAJK2D9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nqta5LIA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F667606A326
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 03:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nqta5LIA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B90E1F0089F;
	Wed, 11 Nov 2026 03:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794366185;
	bh=oIQLDdqhFGAv5xgiSya00tLYOu5UevFKNJYfrciwv9Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nqta5LIAlTQ7E9/crvm79gYy+6YvWsEKUTdqMSBgMBmq/dP7ZpSiRsTXYDE9IS5pM
	 nVgwpvHC+raxjEFTyohHrbBCGkFk9PVWWZDxql+6asHiovQkNL4wiaArZ3kyZuVK2N
	 ELENgmUQKZn+LpEufPM4ESO+Eqk9cMwCt46WJThuhBEaCtJjl3bZ25wNyl3oX+z4j1
	 qpxmIDB6p1o2a1l0Wc73D0YY1sbO6VfQdpg54v+UkyNNIDwzjxhZaVdNlH6A0U9nSP
	 8zMc4+sKf20vd/kSo1RvscHMKDJ4iehtOc3D/PVtxQDE0vJLrsk+L75XqvoOZYt1Qg
	 n99NCyhcsdJqg==
Message-ID: <sashiko-outbox-208152@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Clamp voltage limits before narrowing
 and scaling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111024524.9627-1-zhujun2@cmss.chinamobile.com>
References: <20261111024524.9627-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:03:04 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] hwmon: (nct6775) missing Fixes trailer for in_to_reg() overflow
  fix
--

commit 942ff78cd13ea05813c6ab30f0bbe111309ffcdb
Author: Zhu Jun <zhujun2@cmss.chinamobile.com>

> hwmon: (nct6775) Clamp voltage limits before narrowing and scaling
>
> store_in_reg() parses an unsigned long, but in_to_reg() takes a u32 and
> multiplies it by 100 before clamping. Large limits can therefore wrap to
> a low register value. For example, 4294967296 mV becomes zero on a
> 64-bit system.
>
> Keep the input as an unsigned long and bound it to the register range
> before scaling.
>
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

[Severity: Low]
This fixes a bug in in_to_reg() where values parsed by store_in_reg()
can wrap when narrowed and scaled.  Should this include:

  Fixes: 9de2e2e84e7d ("hwmon: Driver for Nuvoton NCT6775F, NCT6776F, and N=
CT6779D")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111024524.9627=
-1-zhujun2@cmss.chinamobile.com?part=3D1
