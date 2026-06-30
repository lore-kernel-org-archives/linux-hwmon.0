Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BE63CF1E5;
	Tue, 30 Jun 2026 02:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782788186; cv=none; b=kB0rEK3TQuYr0BT3L1ltgqfqFI+gtFYIrQ/MdAuWOUuDSD6wSyTiG287guegrjiQhISw+4+ELCElOcfuPYDG+aCZA2GFjv1AM1pYFAWq7iHNF1DF7P+CckobWycydxl4iwF8c4uCBciYfnSFPDxDZDyuzoKUCl2IvOgamlUU7zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782788186; c=relaxed/simple;
	bh=1pNulGEhfNt3df3fCA+oRJooPbmhHunkOEDD6pSFgZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UZTVsJBVgkwjEErfyczSFWeaG/8P/JGSIS6235PC0zagoWTb8N0RRXBpwvz0h3Jhmvj1tNyJ+7g68JAsWJ5u/M3QqTXTDIK22hu7GCcTUjY735kTewQ08obu0XCVJnVQxWzlAFzY65m2ftFPBFvn23DRR9Sf3o4wwGB6186wYSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J38X9EhX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J38X9EhX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890631F000E9;
	Tue, 30 Jun 2026 02:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782788180;
	bh=1pNulGEhfNt3df3fCA+oRJooPbmhHunkOEDD6pSFgZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J38X9EhX0auuj8AGRDy9oAKxerQpBMcUfvbJX3G4D0ngTRgXbX2/qk1daytkBlSV0
	 DmPG+j2SPC1sR02XfD/x+kCwi1beE1sRKuMptqPRc2ts5+sbveTZRZ683QTBL6nfQx
	 /AJLYtJNWUfQVr+5n19U4+4Vol5stqVqmDahX1tCsb4UYXwRNvWnA/6tbsWtW9VT2k
	 Un7WpZM9hqKwh7TP/NQ4u9SHDamWcGwVjFvUtHMP0OLFBxsGmBs/UPnQOErhvJ2kzt
	 1XKs7SRPLtM9/1W1uzoE41Wod0srBZnA1dYfJVTB9jd1mNxJpOYRLTXjtL/fA6dH/L
	 33VvEZ9wE5DCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: hwmon: (pmbus/max20830): add max20830c
 and max20840c support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260630-dev-max20830c-v1-5-a02786bde470@analog.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-5-a02786bde470@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 02:56:20 +0000
Message-Id: <20260630025620.890631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add compatible strings for variants of MAX20830 which are MAX20830C
> and MAX20840C. These devices have the same register functionality with
> MAX20830 but with a longer IC_DEVICE_ID.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-dev-max208=
30c-v1-0-a02786bde470@analog.com?part=3D5

