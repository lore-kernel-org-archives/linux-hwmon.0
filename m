Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCB41DE4FB;
	Wed, 24 Jun 2026 10:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297212; cv=none; b=X255w61yKiwh0PZk9mAj1gIAUownhFywL7D5H3CP70gHvxCokF3aGLZ8a9f3ltIrC+VN4dliNLj1TU9RkYNr4M2WlsNJ9v92NTWi6LaSxBcB43+9pX2XjgDZtTJsvFrqZ8LBv0D21+cen76aDYhpj55IqwaIrxnDKt7h4JXQF94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297212; c=relaxed/simple;
	bh=QprwepZLXAT5gLHrE6GyGbBtV3tiGZlNVbTYKnjkiTY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=husmrcxmvhyw3X7IEQDuYZ+I1WESDfEGaJzKEvMTX9pVf7U8vIDKSFJKqgXlorz5bLV4LoYivTxFt2DTKMTsPMiIGyJl/JHTUBfn1abBd/noitUbTSiayui7RU7pw5MzEZX3X+CzwP3m2ktLPRKgQVJlzIfEjab38Ai1kl/+JIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNhkwowD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNhkwowD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683E61F000E9;
	Wed, 24 Jun 2026 10:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297210;
	bh=QprwepZLXAT5gLHrE6GyGbBtV3tiGZlNVbTYKnjkiTY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dNhkwowDOt9/KRWv/v+jfYQ105T376d5r+js8Ad/wMjK6PZeVGhMRB0QjNcx2PPEq
	 bTJGvSiZ9rwmcoGx0YjmlHWqi3hve8XeJoolUjuOSduPy9t0CpJWeHsEU5BxEXRlOd
	 jMAK2oQJ03gutlhdfUdBrSvHGOG61T3o8TAFAEnKMNxrwZQTymOEPNhwZJVb39hhdo
	 xNUJWYVNNoZ+x5MGs/IcXj/nn0BcdnA/o7FtGuW5UsFE4zGYGOfgqwmduzzUD514Ls
	 FdZ0XiKS+nrrqGlIJP4Yo3TWLoxVsxSk51pzVV9nqOObvMVzRMKw0govJXpeNcmPbA
	 LnP9jUw022FQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/12] hwmon: spd5118: Remove 16-bit addressing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260624102153.1770072-11-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-11-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 10:33:29 +0000
Message-Id: <20260624103330.683E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The intent of introducing 16-bit addressing was to support I3C, but it
> turns out that I3C does not require reading the Legacy Mode register,
> nor any specific encoding for page translation. The testing of 16-bit
> code was limited and there are no known users for this feature. Remove
> the sections that support 16-bit addressing and prepare the driver to
> support I3C appropriately.
>=20
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624102153.1770=
072-1-akhilrajeev@nvidia.com?part=3D10

