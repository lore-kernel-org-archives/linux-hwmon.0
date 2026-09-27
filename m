Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3E037F748
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 19:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790537085; cv=none; b=XCBi8ZPmbK41A26vI3uok17cV3B5oxaPFF/EzJUy4EZ75QEO/irO9xRtK/GaThkl12waem6nN5R79SxbiiGG0rQGPB+X8Ox4TeCc4AWHYHNKfhZBnWMgal7zIbcRCAzE1FdGcAo6/2akPKyM63gBIS/QVaO/t2IFxZmglXbPWn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790537085; c=relaxed/simple;
	bh=GZ41ZK7WS/nqX0bnL7MfGMOLGv3tOcbnxA86whMfRgQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dQVDk2WW2e771sD7zcOaeQUBg92c7VBKoAl0ruXYn0hNCCecHNUUNzqxST9Cb7jF6Yp/zSoyKsxuFiXyB34l/6MT4JnbGCslLz5yrUmkN9n5C4EP3UwLBKLJUx5HRzHvP7gJuS6ipzwAdeVDU1C9CxT6moMoy+oIIxF18jeFlFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5b0IEIr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5b0IEIr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB29B1F000FF;
	Sun, 27 Sep 2026 19:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790537083;
	bh=GZ41ZK7WS/nqX0bnL7MfGMOLGv3tOcbnxA86whMfRgQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T5b0IEIrfMaOsYSTd3ta/u2wjFH7Dc1OUwmEByHRPMmU251mCHnwiSWqT5qab8ilH
	 CrF7ogTt2EmBlFS/mQ+oTUkRdTj0QhEqD62y2YW9QvDYccWvGLwCgExR8V9drW63ET
	 lyR24e/R95Ey1D/zj30Pl9+DcHPulKX4hmwsGexDaSuBq98Gg9VkzGsOVOu0WsBL37
	 Yj+4MtJpDKiJedT3rxSgpDs+pPSJ6yLWAYkWdjFQ6Lsl9OwFHt2C9iTuUd7em2WLa0
	 RxwKLaLFlEX1YCMl/iaJ//gru3Dhb78E9gzqfZlSSBBuPKZO3LDyPJhLNq8aDiiPDO
	 byWHx7GqEOQGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/5] hwmon: (aquacomputer_d5next) Expire the initial
 sensor cache
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vas Zayarskiy" <contact@vasily.cc>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260927191316.4137752-3-contact@vasily.cc>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-3-contact@vasily.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 19:24:43 +0000
Message-Id: <20260927192443.BB29B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The initial update timestamp makes the cache expire at the current
> jiffy. Since aqc_read() uses time_after(), a read in that same jiffy can
> expose zero-initialized data or skip the first legacy report request.
>=20
> Initialize the timestamp one tick earlier so the cache starts expired
> for every supported device.
>=20
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927191316.4137=
752-1-contact@vasily.cc?part=3D2

