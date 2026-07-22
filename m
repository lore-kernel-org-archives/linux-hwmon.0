Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E23334D916
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 01:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784684352; cv=none; b=LkZGzMvAanlxMdugBtArJqNF4wXP7hb/MlGqNuGCV3QlLJlKT4rb77p66k10LRbvv/mrkP8QTMd/i8bZlInyYmWXKb9HMZHm/wfJo+1MY1BRSzozoqGq7y4G58qocTCZBsDi2cm9ITPV+v/YlsV/IV5tjdO1A4TBOjIYN1WcA8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784684352; c=relaxed/simple;
	bh=iNUv63N0/Pi/uapF+buNKIzKMvFum8iU7Wm1i3TkDdc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oAZlHd4C/lts7wjA6EPYcdzREVhsc2DdZfrTraXCLRVsJR04OQ54EetwdvS1sT8QGB9cTL47SL7ZFTtFR93kMgAvEM0ieZaYbJqud12BvsvxKm9M3vaZLXOqH5qr/E1vflgS8Pc1qqXpWw4XCmH/RJoFqb2/3OFo0RRpi6miWfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJdfrddg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJdfrddg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13051F000E9;
	Wed, 22 Jul 2026 01:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784684351;
	bh=iNUv63N0/Pi/uapF+buNKIzKMvFum8iU7Wm1i3TkDdc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EJdfrddgXEBkAW/Dwm9zculrgLpABD1/PcmvJfnMcQQbT2wlhSlZHpCT26GXcQf85
	 zSXTbjX9ARxjZinCfQ/CD4cgyk6OKZKILqC2Zt9xhaLzzOZMPfE/1M+PGD8mIr2xzY
	 /7E5IY45YsUfIQHtu9Xxeg1ss1g2Am8q3vr3D/RWhGypBvEUstHCSCaLDyitrz6WAt
	 O+Nt5N8I7GbJ4zHzai9cP6w1inmC3HYb/Vch7n6H8R0+ZJR19kS0N6PiRZPMk8Vq2O
	 rqChlaTeEc2YCc/oV5IeI3Nfdg4Rzkri6998QK04aViFO6YdmLbgItne6W+RwN0Jcu
	 kwnIkGoypB3vA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (pmbus/max34440): Add support for
 MAX34452
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260722-max34451_fixes-v2-3-bbddb18ec1d6@analog.com>
References: <20260722-max34451_fixes-v2-0-bbddb18ec1d6@analog.com>
 <20260722-max34451_fixes-v2-3-bbddb18ec1d6@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 01:39:10 +0000
Message-Id: <20260722013910.F13051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Carlos Jones Jr <carlosjr.jones@analog.com>
>=20
> Add support for Maxim MAX34452 PMBus 16-Channel V/I Monitor and
> 12-Channel Sequencer/Marginer. The device is similar to MAX34451
> and shares the same configuration function.
>=20
> The MAX34452 supports:
> - 16 configurable voltage/current monitoring channels
> - 5 temperature sensors (pages 16-20)
> - Dynamic channel configuration via MFR_CHANNEL_CONFIG
> - IOUT average monitoring
>=20
> Signed-off-by: Carlos Jones Jr <carlosjr.jones@analog.com>
> Co-Developed by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-max34451_f=
ixes-v2-0-bbddb18ec1d6@analog.com?part=3D3

