Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D9926ED4F
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 01:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784684235; cv=none; b=mFJbNxq7a6cC90Gol7pPGYEPfOwIdHLtXFKRuoGxT6vBZMumY/M17XIBMeoWWc1Nch+5KaSFzJw40+qRTBveis++vpBpTpSVseoi+QANY2QUBqkUb2YSpCypYkdNiUUlLXND6yWhoBYG/G4ej78EXy99WFX32P3sercGxyiWwGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784684235; c=relaxed/simple;
	bh=MmbSrZQ3a/J8R/yNfTg5zfnwcY5EYJN+ke1dObFpgBY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eNkDd9kxamugu1/NryUMGHexMRaxbLc7MOtz+GyAlNurEFHJ8iior6M1LZ+WCCz3828XzhpEpWH8KO68yOF/xZuSIxnS7Kcr5MdjANb+x/rmVFLvS+0EnpvwiowEhfLKK6UVxg4mIZMVryM4hNYKEWb1JKoYaS6uGAp6IHU2+as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AjjKaic0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AjjKaic0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E8E1F000E9;
	Wed, 22 Jul 2026 01:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784684234;
	bh=MmbSrZQ3a/J8R/yNfTg5zfnwcY5EYJN+ke1dObFpgBY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AjjKaic02IU1oDgAO/BdCBQ166DtksnYckH2OpejclvZ6bSRQ6VxpHmwXabi/86/R
	 5WN+6xwtRq3Hgx1iNBmDusVwL28quVgqJVOVCjDrGeZGgV07VoS9k5NVTBTKOgaxMx
	 qMINOZdgAJoyCnzOWTVVTeOhT7BkoMlBT/VMOzpdiJnLPle1g88Vgwjx23A0h3W97u
	 2Hl/XBeGyeVfoxP5surcp6PEf917wJsZyOxlrtqaQRYoqYzNf37QiGrFqyIoHE4yVx
	 yZY3Ycn1CwyvmXzYbrg5HBa1DlsCO5LwtgBP9MXwaJ3irSiSn2yU+48Am1Ly2cYENr
	 Or06SeiDrogjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (pmbus/max34440): add support for newer
 version of max34451
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260722-max34451_fixes-v2-2-bbddb18ec1d6@analog.com>
References: <20260722-max34451_fixes-v2-0-bbddb18ec1d6@analog.com>
 <20260722-max34451_fixes-v2-2-bbddb18ec1d6@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 01:37:13 +0000
Message-Id: <20260722013714.31E8E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The MAX34451 released a newer version called max34451etna8+.
> This simply changes the direct format coefficients
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-max34451_f=
ixes-v2-0-bbddb18ec1d6@analog.com?part=3D2

