Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BA03246ED
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 20:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785960508; cv=none; b=MUqfArN/Xt4qmt7Yldj/aELWuKbVGACG1XJYjld77uA0DUPxgalfQnP2i7xSco+33+hTXwera1kLQV3mei0sBLKUBj0jR8bBE4EuIEoS5Pe5nvlPK7JcYSYSgXCvl/C0d63El3DRk2nkrFrQ3PuhcFHj/iFbrjuviPdI0zWBB5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785960508; c=relaxed/simple;
	bh=U1DXdN6J1PUZQcthbtDps8ur9T6SJcIe/5SgUtMFqAo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ADQVsdheSYnWFJy+R+QCFG5PnUJf+InpU90/iVeXI0ODgPUtFLkMjoaGDSEHDUEkDEnbkYYNBBD5JqXhNKuez4Hl2untlzwgOlJs4UQA2qW2NJN334Xw5N/ko7ZsdAeHng6sF8hnxLdlE2KWBAjw5OqogK5mqguJSnxHGej08Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bs+eKIlw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bs+eKIlw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDC91F000E9;
	Wed,  5 Aug 2026 20:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785960507;
	bh=U1DXdN6J1PUZQcthbtDps8ur9T6SJcIe/5SgUtMFqAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bs+eKIlwi0q2TDu67S39OONVHkNwUF904ElzChCRS2KDaYMxha2xjFqXZwqnK0dl+
	 UzcQcIfZeXJ2ro3XiNbyb7MXOBhCzHUMrqqqj1h72V2X3IyHvOJFcJZ9wvunULzu+3
	 CA3QfRRAcsGizDvaPt/PFzC2yKi1NS9E+Ap7mQKyf/xOIbZoARacqTSxUoM6itibWk
	 AUIoYZxV0fcsqJ8jpEOO4WH9m9cdOiUXwZH3I7c0nXzU+5XlempAUuLRgp9vqoMoDh
	 +Pzo/sv9+Zhc99VHfCC+3NtnVhUUjtX2S2aZUGoynOiO88G2bg58io43eM72d84t4C
	 8CRbxfdZyqHMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwmon: (core) Constify device attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFdlacOfc2NodWg=?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260805-sysfs-const-attr-hwmon-v1-1-4c0cb2b290a1@weissschuh.net>
References: <20260805-sysfs-const-attr-hwmon-v1-0-4c0cb2b290a1@weissschuh.net>
 <20260805-sysfs-const-attr-hwmon-v1-1-4c0cb2b290a1@weissschuh.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 20:08:26 +0000
Message-Id: <20260805200826.CBDC91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Mark the attribute structures as const, as they are never modified.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-sysfs-cons=
t-attr-hwmon-v1-0-4c0cb2b290a1@weissschuh.net?part=3D1

