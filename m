Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1231A8F7B
	for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 05:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779429501; cv=none; b=HRxrLS6fRIQf99OkA/XxA7zlY04N4zcCTWYDPP+WpZnZrsbS1Hv2toTeOanxUyePTKARtFbqYPHFFb4v1NP8k+ofIP9W7OVivYqUdF3bcuNNK5eBDT9sBCkymQECvFXVOuNLr7zl54tKH2yUzDX0MPAyigGw1I4udwDLdMnsWos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779429501; c=relaxed/simple;
	bh=vWRncBBuRA5ddk02CMjWGPIYEUcBF1MW2l7h8ciX3mg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q5aWeNIi0ULJtuuN9LDshYdf3xmwiB2G2ARJ2ewP+PhTNLe0p+AMXk6Z8lI6nbNbCjQzdT/1rGps1W1FOyV7QvH+NK/SR4dwqmhzS4Ir6rqqiYkz+QFBtiinyxoItF/6EkKnPsbeNxHM2bHpvXLgEAX/F/eXXCROrXCDe2Arqos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+938mLx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+938mLx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459DB1F000E9;
	Fri, 22 May 2026 05:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779429500;
	bh=vWRncBBuRA5ddk02CMjWGPIYEUcBF1MW2l7h8ciX3mg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c+938mLx6ojuOqUPUxtvASU/bDIOumspq2d6nPtkjcSuK/JOr72s8HB8j9eE+FNI9
	 SiYOnYE6oy9Z5koL0NW/DSrkvUzYiMb1cGGgFFk4Q0KPOLJHykg/nmwN9hkTbUHLZY
	 IvC46Ou8vg6nO8LpsXSh00aysY6KSuwcJm0emXQHc0xSb37P6XQV/Dbuff5pejkHHq
	 WIi4aQnSf3WEJldOY6HyeKcF1Cm3lN00TZ0NMAl32mvP2PMnfs1OBGMX7cvyNUgQPD
	 miGeHtLqzmdiIYAI1ZVvn/5eWM3Sopo07qlvJWmogLoRJvsdFLoTCexJlQyEw9GY7W
	 lXwUnOjoyVQow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (adt7475) Add explicit header include
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260522052352.12139-1-flaviu.nistor@gmail.com>
References: <20260522052352.12139-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 05:58:19 +0000
Message-Id: <20260522055820.459DB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Since device_property_read_string() and similar functions defined in
> linux/property.h are used in the driver add explicit include for
> linux/mod_devicetable.h and linux/property.h rather than having
> implicit inclusions.
> Removed of_match_ptr() improving non-Device Tree compatibility of the
> driver and drop unnecessary __maybe_unused.
> Header linux/of.h can't be removed yet since macro is_of_node() is used.
>=20
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522052352.1213=
9-1-flaviu.nistor@gmail.com?part=3D1

