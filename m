Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD812379C23
	for <linux-hwmon@vger.kernel.org>; Sat,  5 Sep 2026 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615767; cv=none; b=dyRoI5EPxybam83b9dAvB3D+i8D5VvFZnTaqjfEYFfCzeSdgsfddQWpGjZh3RwAIscvjp+OX/6Eob6XU4fqJIufG6L9IHGrn15liE3SHHiefjwTpO6j7lVQnVuncW4Zzguzb/JEEbB3wsdtExiSl4Uqv4XV7800DjQLCm7iE4v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615767; c=relaxed/simple;
	bh=99+vjXaHogDPI/ofM0uyfB3fHX7z6TNLdFbyw5K5V6E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=loG5+3XYvJ8mkP201sCcdZUta8utwD9VnoMDArLgUILuLiwLFG0zuMj74AnJzFsx6g1MtvYlZ+a76L5lA0f636lWDlx/elWDvakatgStbsSMyrFvKkr2grLCuhcmPpeNVr7xIkCQS2KTdgL/hZJyUgCsPnanDb5VhBSEUmnZFdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZJLeM5ko; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZJLeM5ko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36FDB1F00A3D;
	Sat,  5 Sep 2026 13:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788615766;
	bh=99+vjXaHogDPI/ofM0uyfB3fHX7z6TNLdFbyw5K5V6E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZJLeM5ko4120uT+7pcHXsiBPrTzHfu39j8PLsSugVbddUUbZ0EoDjPYkCeMghlvjN
	 NzygXaNk68T0hRmfSebKJXsfFCfly0WVErgS7/DS4XoysMjSSoc4WB7CiQWqtAU5Ai
	 REkk+lXZKtapEQILl1H922d4sQxLAqdzVkJycKqPpuGZ/Ez+c2FICOi76O3S16iTui
	 P3Okk9X6ypUL/nfFrtZdMUC8DOKznWXfHdtJ1AxjFQ8iU6U+lEBC+8hgYMvsEx+MWn
	 Odnly+I4HD1sQdNuMSx+R3l1gYoddR2y6qex0Hje3e5wCSk9hcoqK5E5zBao8ku+cU
	 m+TLQToUgo1Fg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (xdp710) Publish the OF module alias
Reply-To: sashiko-reviews@lists.linux.dev
To: hpp.iscas <hppiscas@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260905133800.65749-1-hppiscas@163.com>
References: <20260905133800.65749-1-hppiscas@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 13:42:45 +0000
Message-Id: <20260905134246.36FDB1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The XDP710 driver registers xdp710_of_match, but only exports its I2C
> ID table. Device Tree clients emit an OF modalias instead of the
> legacy I2C alias.
>=20
> Publish the existing OF table to make module selection available for
> that enumeration path.
>=20
> Fixes: 35fe06d94e39 ("hwmon: (pmbus) Add support for Infineon XDP710")
> Signed-off-by: hpp.iscas <hppiscas@163.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260905133800.6574=
9-1-hppiscas@163.com?part=3D1

