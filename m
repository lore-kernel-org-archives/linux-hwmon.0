Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2571F4BA1CA
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 21:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161771; cv=none; b=AqZgWojatUglemoLxjNc/U8Dp8W0qYDBVSlvfCdR00q9kPWpY6L7aNu84Vyf9NgAMjZPKd9tT6QlyL2RlHP/kUXmQBG0IFGxDxK+Nnd/iRAV1qisMdsQLdEm8bbsIQeX9nZZU7m0RU7m+qvWwS0YtA61mi5Z0eOB1TyMaYXKwJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161771; c=relaxed/simple;
	bh=5HYuMnis3/THr/ZbNC/W+jqPuftD5Ue57aaltbwx1ZM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TNq6J8x4g1cNQdR2J0HBwgu19BXv+ItuRnMx2dEWMw6oVwPEJpY2f/EcmGPyfFdw6qDLTCeGENZNMgBN5/8w2kicMgr+injPUUJS03K+3H5ScqeqdmAJnPX3eGi/HB9wYmcPxy71YVkNF80/wFJ2UI+8sz6YG1OOeHhOI3XEHrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n4zRhH3d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n4zRhH3d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B286C1F000FF;
	Fri, 11 Sep 2026 21:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789161770;
	bh=5HYuMnis3/THr/ZbNC/W+jqPuftD5Ue57aaltbwx1ZM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n4zRhH3dtNLDCbV5G8TSi4kEA5xR8WLdKTZquDj26CvYfORW4MwdoYjCmEzqmtmon
	 yKz2/dWnOkB6MIRy9ifHL4IGvNVZHsarBGcpdmHW6ZKA7Q2ATBZbe96u0oEcXMLdmA
	 Cz2Ts2mOyoUTrEsKK2ZZvoI+J7mIUomx6UmC5LtN1l01Y+4tmWFrB2F9W91vT2A+eM
	 Ka5Nu3d2ibhunrq+0Tc1sN86sSQgP51fSoO+agvnhSfiE5uxOrfUjAxeUEeVe4Tqm1
	 /MZl25b4/rG7W2DPajf+QPuHnKAGcM22oDZCAUBXmQhzg76kGFPjY+bxbtGRfq5TeU
	 eteT6AfwZEN4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] i3c: master: enable driver_override for I3C
Reply-To: sashiko-reviews@lists.linux.dev
To: "Meagan Lloyd" <meaganlloyd@linux.microsoft.com>
Cc: Frank.Li@kernel.org, linux-i3c@lists.infradead.org, linux-hwmon@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20260911210935.1353126-2-meaganlloyd@linux.microsoft.com>
References: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
 <20260911210935.1353126-2-meaganlloyd@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 21:22:49 +0000
Message-Id: <20260911212249.B286C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Opt-in to driver_override sysfs functionality for I3C subsystem.
>=20
> Update some I3C drivers that are assuming that if their .probe is
> invoked that the bus match function already checked the ID table. Go
> ahead and verify in .probe that i3c_device_match_id() returns a valid
> match before using the i3c_device_id pointer.
>=20
> Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911210935.1353=
126-1-meaganlloyd@linux.microsoft.com?part=3D1

