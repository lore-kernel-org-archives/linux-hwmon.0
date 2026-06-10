Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3B41F03D9
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 01:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056476; cv=none; b=tgzdbHJOhGPvecZTZy23BWR1G4rVKLFAeg6Lmym6na3I2X/JmJ5A9ed42khiIxPBV6Tz/I4AYG8XGeHmhQtRq16up2VnZkkwTzrYdF5d2G1CqoeZ4fH8BCgGtFrn+54shpwfi72BfRCs01NhESvwCIDmc9u9x+t8zAas7Uzj5Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056476; c=relaxed/simple;
	bh=dficSiNNPsH6XpS3O2P/aULaXzlnjoYIr/pvp0afwlc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GBawfZuWtPYVWGAjCecqX2UjId0ID45f1fhIF2Bt8u5ShrqrLXR8A+PHTCTjwCr5aJ093K2kFGDa/wqpwn3F5uyxZhQ+BGF714zS0RvGpoh1tFwQg+JLEwTQbIjYquOse73sygQoTJUGhxx5C2nbjJmDaCZ6EBUoQJfL5fwzbHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xzz5x00x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xzz5x00x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FBEB1F00893;
	Wed, 10 Jun 2026 01:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781056470;
	bh=dficSiNNPsH6XpS3O2P/aULaXzlnjoYIr/pvp0afwlc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xzz5x00xy8wTkt4WY8DQ7mk2x7G+j+rqD/sHgLSLogkBhXGQIsTaGxnYeS738n08i
	 H3ilZMwr2dEWU3vjfvZ3OSoqYcm/atWVfS4IVtmmGzUQNt9RrfAz1YOcvd9ONUEffL
	 4rkBu2QjoJmkwitDBoyeqGKoy6wj9nj1b377U/XUH+ieJvZ+ER1PBcA1EAZMKPZZsW
	 xIquaID+AcQcb8A4d3na268xjmVaQNBPvIhXghndSLevFqpnpdherwejPsd15GtfHy
	 MqbeJXbrySZ3OPFgC2pUoShX61J8xb12yhvKl/VlCAglnh5NKd7pJ65M4kGQfnLX9P
	 znEFsEeldIJZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] hwmon: (gpd-fan): upgrade log level from warn to
 err for platform device creation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pei Xiao" <xiaopei01@kylinos.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <aeb2eaa6df90178b18057a8022a0eccde7bbc82c.1781055639.git.xiaopei01@kylinos.cn>
References: <aeb2eaa6df90178b18057a8022a0eccde7bbc82c.1781055639.git.xiaopei01@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 01:54:28 +0000
Message-Id: <20260610015429.5FBEB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> When platform_create_bundle() fails, the error is fatal and prevents the
> driver from loading. Use pr_err() instead of pr_warn() to clearly indicate
> a critical failure.
>=20
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781055639.gi=
t.xiaopei01@kylinos.cn?part=3D3

