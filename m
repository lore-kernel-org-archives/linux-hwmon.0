Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7503EC83E
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Sep 2026 17:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184712; cv=none; b=m964YUzMEUeZuaHgklD4YHHvSOJgryVq8np2h1nTiQMuGNTNmbHvdDZev6TTu03fnDm2NF57Go0ClhZQ/3A10Ka8IqHHOfkSWgSvDV2WyQfpsKCThfKbPm0MTWVB6dnDi5oCtWLlS/d/FTnRpy0+MeEirQUUaf2FFcMjixVTOUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184712; c=relaxed/simple;
	bh=QrYvaBkclCaBb22MsRHrV+Rrtk/cJgYRHBUgfxSsYQI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pOI201/+KI2bt3j099WtbdpMJRtdbIO+FbLenYkAetStVStarytssAHwQvjf90VKBC57S1Bp5+fhJA3MVbwTmO8jo12dIj0AZWANv4feiJCzbgk9WK6v19G1BTxLIL6aen01KyQnMnBJaWmn83JyELlp5HsqvxL85sQmYhIuxQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0edgz0J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0edgz0J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E7E1F00893;
	Wed, 23 Sep 2026 17:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790184710;
	bh=QrYvaBkclCaBb22MsRHrV+Rrtk/cJgYRHBUgfxSsYQI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X0edgz0JrbFPz/eTBT1lufcWL/cRybAoh6OGaaEqhLIoo6PLtvpECYNOeEDyTkpaz
	 JxMB8Lb6gVHKNw2UwVtE/LT7S7oJPNAsWMCj1OSWGI0IU0fsK2rdgV3Y4Dtb6/oRKZ
	 R9nIW2Fivxl/Nu+qMdMwMnth0+fo3w4MeN/oKTAG02q4aoNIhZQCCpd6QGDZCS3D2I
	 qI+iG+6Bt2oV1TxThJ/pWG1nUpoXR3y5IG0etxP8cEQ+U5CrwnNz8L2ovrJ2/D7/n0
	 QRZsf0JWJyfp8CkJDZeorlKgnkmz/y5u00U3JsvcU2pEBY4dC19pymmCShhrEuwmep
	 f1bvIphTPKVcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (lm95245) Fix negative temperature conversion
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ridham Khurana" <khurana.ridham222@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260923172551.1593798-1-khurana.ridham222@gmail.com>
References: <20260923172551.1593798-1-khurana.ridham222@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 17:31:49 +0000
Message-Id: <20260923173150.12E7E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> temp_from_reg_signed() uses only the high byte when the sign bit is set
> and drops the fractional bits in the low byte. Writing -500 to
> temp2_offset stores 0xff80 (-0.5 degrees C) in the offset registers,
> but reading temp2_offset back returns -1000.
>=20
> Negative temp1_input and temp2_input values are rounded down to the
> next whole degree the same way. The chip reports -0.125 degrees C as
> 0xffe0, which the driver returns as -1000.
>=20
> Treat the register pair as a single 16-bit two's complement value.
> lm95241 had the same conversion fixed in commit 0c2a40e2fe4f
> ("hwmon: (lm95241) Fix negative temperature results").
>=20
> Fixes: fffd80ccc1e6 ("hwmon: LM95245 driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923172551.1593=
798-1-khurana.ridham222@gmail.com?part=3D1

