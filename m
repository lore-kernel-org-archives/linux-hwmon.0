Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F01F238C36
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 04:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785904018; cv=none; b=jOgRvQjBpdFNBKYPS1R9Zv6KeGQ5byUO1ynnKh8anPmL74+Jh+I9/FlfpTTfPl9c9mh9omgpkvkKN+ot3x0prFlKOdckoMM8XauhTKkFE8Mn/CWDC8mRjRz/bvCaugYXqrv5ZAofFVZXXpGhTDzBHValb+eY8qFm3NgTogCiENs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785904018; c=relaxed/simple;
	bh=m3qyEJbj31NISP59PR3YGUAYwvu1gPY5D0DXfePY45A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CE9j6xBlZn1kfwoYMYbg8+S0gnMofSfWNitDw8qUD5BoN2RJsmJXyxFnmc0qwX8DZKe5HsWjiAxsOQGwYRJavgaIvsY00BXgF0bjdde5tGysFHQwzeDsizg3uv1ZUAzvmrvGDc447Yi5n5h8Bok5dgSA1L3IDVdt/0XJ+0KZh7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NI43FXOs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NI43FXOs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C481F000E9;
	Wed,  5 Aug 2026 04:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785904017;
	bh=W5QcfbZfiY6i2X9wj8D9FUZ/EagVcjmwkJiwWjwGYLg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NI43FXOs2797eG7cfQOysDyg8Hmg5eyJ6h/JE26shLJmRc8KI8nX1UnDOKIjUf1LZ
	 Oyg5nW3/GF9G3KXRqrSj8FIYja5DXhviB2S8b9JmdqW9QL1O9nXwNnvaoKk58u1v1v
	 WX3JPpY9YUNqv648db0pbP1FeF1pMEiXcgwZUuOa5rC2fYJbRVHPK9JdPHp66fiB7h
	 CeQGZbjrmKZRPZ0jdF9bQYliTxUFpvJkJwmmD/I8DMwmzH1wdUzHjhxm5i3ho4vkGX
	 99W/LCDVdN1CfTFfvDfu05J6QcQS1pRhSz4xNLLJjuPAkpOBRjCvsYK1smx73YJVuQ
	 xwlmRad/jPrlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] hwmon: (ads7828) Fix external VREF regulator
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qingshuang Fu" <fffsqian@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260805042101.1177736-1-fffsqian@163.com>
References: <20260805042101.1177736-1-fffsqian@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 04:26:56 +0000
Message-Id: <20260805042657.54C481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Qingshuang Fu <fuqingshuang@kylinos.cn>
>=20
> The driver currently has two issues with the external VREF regulator
> handling in ads7828_probe():
>=20
> 1. All errors from devm_regulator_get_optional() are ignored, causing the
>    driver to incorrectly fall back to internal VREF even for transient
>    errors like -EPROBE_DEFER or genuine failures like -ENOMEM.
>=20
> 2. The external regulator is never enabled. The driver calls
>    regulator_get_voltage() without first calling regulator_enable(),
>    so the VREF pin may remain unpowered if the regulator is not
>    configured as always-on.
>=20
> Fix both issues by switching to devm_regulator_get_enable_read_voltage(),
> which handles regulator get, enable, and voltage read in one call.
> Only -ENODEV (no regulator specified in device tree) should trigger the
> fallback to internal VREF. All other errors are propagated to the caller.
>=20
> Fixes: a8ddfea09566 ("hwmon: (ads7828) Accept optional parameters from de=
vice tree")
> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805042101.1177=
736-1-fffsqian@163.com?part=3D1

