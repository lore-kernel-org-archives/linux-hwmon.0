Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395297;
	b=a5Hdw36phZh8Evh1GIRvLCt3CyxdS/e+uR3wF97WAlHRSXlEvJbpshVU0RnPaW5GHhp+
	 gBCjEP3jAZ+xse5Gh6gZD371qcUZxH1y3CPURMQ+FrZbIiDVLWYgcsV5HHTobvB6c1SD/
	 nPAA4BlQSuctW64C6LoSoS8DAqMInTQOGFce4A0ZX+pVeGKf8Cbqc8z5dKh9NpHHUJFjg
	 zjQT1S29UcuVb4Nl1OmdM3zYIZNvA7R1BrsSKH/a/3mnpU1BY7MWAe2bFpyTHAfcNcrgx
	 aPpniByFo8OQc/l6keNWoHS13T/a8AqCxsHdzYlgrROKsXaF8x3W8bTaxAEFyMbLKlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395297;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7y/jVA7P/gl/w33UqXJz1N/6gdulA/YRVcSvJFErWfw=;
	b=uhjKzsPsfiq10QqC7C21bThbdp7OPuJyMmZbC8IXpEgdCGf9RfongoIyv8TNxQuH/yXi
	 kiaqTa0HJpzD5VQJKcGBeIiDX0T5Czpmirwjks+lfWKOXWPxPmduL+Ya9L0N0kcGSb0i5
	 j+2E3/lzxH5Oo9Vn71qUTPxtFR9hIHVcJRwDEgOOyWiYZE0nU4HEpJe8cWvWGn44iKjrP
	 yqm4N3yK+t8Oh750zojy/9bgW2cRMjnlravn9Xn7FgjnpuzF2YZnZJd1F0OoCTI9R0E6a
	 lujxn6aZduKXvITquDxooiZXh4yvCHw94MDzTBI4gItiqNHlH1j1nNMpsQ+KWRHcIcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eclaafDs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF617606A332;
	Wed, 11 Nov 2026 11:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eclaafDs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 280991F00A05;
	Wed, 11 Nov 2026 11:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395297;
	bh=7y/jVA7P/gl/w33UqXJz1N/6gdulA/YRVcSvJFErWfw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eclaafDs9xk057AaKt9seTlOSm3b1+TWV8p7UDeTel0HAZ244QkR3Y1JlyV3LEHlY
	 7bhxvkw4FpRb29jkoCByPCc2Pv3Q/EkVywAb0XeQ0yob/C0cxk47AMkFBus/W/MhwV
	 AXj2vgFel88RGNcOR7jfkQ9KE7ctIsHTs49U+5MAaOwPvo5k6URUKDCZgyYDameUMY
	 /4AbbD79YmiRknrQn3JvtFRP16lRWTkqOXyipPm50h1MZutyDyGkZFll6McFQY+lEv
	 n6BuwyM+Vezlz3VfnZHCq7ECD3MqA/fk3YneyaUuL8vKla8eVMTdIaTSZspUGRrlIc
	 5VqgBeLuvXnbQ==
Message-ID: <sashiko-outbox-208848@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/7] pmdomain: bcm: Add BCMBCA PMB power domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261111-xg6846b-bcmbca-xrdp-reset-v4-4-17035a5e8ad2@kernel.org>
References: <20261111-xg6846b-bcmbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org>
 <20261111-xg6846b-bcmbca-xrdp-reset-v4-4-17035a5e8ad2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 11:08:16 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Implement BCM6846 BPCM power domains.
>=20
> Group XRDP, its three Runner cores and WAN in vendor xrdp_pmb[] order,
> so consumers can power the complete packet engine before resetting it.
>=20
> Also expose peripheral, memory, USB and PCIe domains. Keep the peripheral
> and memory domains always on; exclude CPU and PLL blocks with different
> register layouts.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-xg6846b-bc=
mbca-xrdp-reset-v4-0-17035a5e8ad2@kernel.org?part=3D4

