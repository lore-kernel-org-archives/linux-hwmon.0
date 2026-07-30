Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1733A641D
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 15:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425287; cv=none; b=aZKMYqLMXTjpJBcr+Tq3Ky5puExvy3SgMyvb8gINbWGKhTjClwNY5ObHxt5ImIz60nxiXkNtwxuCzagnZ/Mn5aeRSbYnKzvsmXV4y52768vLI94eqyQPSeqeymPnZKEh0M1mAwAs+zHMZrKtxS5mZ7S9/rgQrFHDcDN6watL3WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425287; c=relaxed/simple;
	bh=Ycs4dW6Yf/2QB6G2RilbQL9VgVwZlpwr7k3jwmApzBg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k1LPzJzOY32yZAZONEyHgGsWhpYlgWUQ45C3B3+6P8N021ww3WV99M2PEBlwuXMAOURHggvwkqLaWxRSweagGZFdXP/Af3rij34IQMta5WpadtwFHKFl5K93/hECa7esHl7SkZgyUU+M9Jv66ZqLaX8W95gyhPsGZmVALwtEDd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MlTC35PU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MlTC35PU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293191F00A3A;
	Thu, 30 Jul 2026 15:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785425286;
	bh=Ycs4dW6Yf/2QB6G2RilbQL9VgVwZlpwr7k3jwmApzBg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MlTC35PUcpHLYqwQXfxRAMRwVTlt4e2ve8LoKaiYiG2XRzmup3gd6O0170HSD+uZ0
	 F0lzqGsOaVJMjnOgGVvwz8r0X6/6N9sQAKDFCGQ5f6bSXDMWozV9MGt+2w1N5ZxJDQ
	 ctCFIQyTV1+OMKHinyVmgZ3vTo/nY3BOQlatGpU2bi+LmpFXXo5e9MnN5Z2FwcfZfe
	 AqYHAExCppnULRxPnmY0IyZjBhfN6kBzGzAXib0LhuOhcSlx/aW0JSyIHdnGXS6O41
	 azVvuvLDnfw/hCEOVW7B4pxqa83Z3E/V/PudUSpJJV9LaSFYOtYjloYBpniCzG74Xc
	 u1TjotUnD+dqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: (cros_ec) Avoid threshold temperature
 conversion overflows
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260730-cros_ec-hwmon-overflow-v3-1-c7198ba034ad@weissschuh.net>
References: <20260730-cros_ec-hwmon-overflow-v3-1-c7198ba034ad@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 15:28:05 +0000
Message-Id: <20260730152806.293191F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> If the EC returns non-sensical values the temperature conversions might
> overflow on 32-bit systems.
>=20
> As these values wouldn't make sense, clamp them to 255 degrees celsius.
> The machine would die before reaching that limit anyways.
>=20
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/lkml/0fbf7f69-bb90-4209-b9d5-258759711496@r=
oeck-us.net/
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-cros_ec-hw=
mon-overflow-v3-1-c7198ba034ad@weissschuh.net?part=3D1

