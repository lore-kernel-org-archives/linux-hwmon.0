Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0D011CAF
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198778; cv=none; b=BkLG2c2V+Wo8owF+jWz5hlC5CD+30TlW6DBXuvpCDFLr4T/GwCyt8HICBXJlEJIlOsbG+j539bIApLLD0xfI4HLhgMQCEhdLyzh6CX8711Mfj7P4nwzF8L04enJE9ftgpb4oqTnGczUIAhArFuvAygOFBjopYoGqfXkwgqKue8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198778; c=relaxed/simple;
	bh=AzLABQu2GvIDiZl580RGtwXs1bEVGttfO2pxlFtQawg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JfP3Mq5l39Rb6mRjF1EVg6KJ+jKoJiyBBC+jEjf0TAZcsE89lTuNH67ylE3jETWXROpuNUVfRQg2VamQAhKytkA0Feei/wCaOv2SfCDZTTd2B21PtSaQbp1zwt6d1tGEXSE5UT85c2r7HEAUfhpyj4otQgssgT2TVlMCluRryfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgodwNLJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgodwNLJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B62A1F000E9;
	Tue, 28 Jul 2026 00:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785198776;
	bh=AzLABQu2GvIDiZl580RGtwXs1bEVGttfO2pxlFtQawg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dgodwNLJmig7s0cupEjjKMXODnX0J6fZfKXymPQoCxDSb7H658GrgHwdyPpWtBM3R
	 ZOWbZy6duiQyZJfjiD+BUfxSzzvO9C19S++yH18YrxYfnoUH2EHPV7/gz6ip8fZ+Tm
	 w1q4j/p0jnwZRKYrczQ+c72zOdo4dhEal0BirX17cZccr3HZIUZ2aYHLTXIn0DCBk6
	 TpLGqTPhD3V9m4i6gYxPotNpWPkEfJa0F51lvEp5cF3k6I4lK8TJ3MwZVp4sRIYtGh
	 ZXtjKbZxv6seDnAOjE40qe0Nha/lLuKt4J5EYZaUDDvONGqQZ1EpVXeHSRQ50EgsaM
	 EAHRUg7X0C7GA==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v2 5/8] hwmon: (adt7470) Fix temperature alarm
 logic in hwmon_temp_read()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260727-adt7470_fixes-v2-5-598e38a46ba6@gmail.com>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <20260727-adt7470_fixes-v2-5-598e38a46ba6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 00:32:56 +0000
Message-Id: <20260728003256.9B62A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> During the conversion the alarm callback started interpreting the
> channel index as an alarm bitmask, resulting in incorrect alarm
> reporting. Compute the proper alarm bit instead.
>=20
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/r/20260717211224.B9E291F000E9@smtp.kernel=
.org
> Fixes: fc958a61ff6d ("hwmon: (adt7470) Convert to devm_hwmon_device_regis=
ter_with_info API")
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-adt7470_fi=
xes-v2-0-598e38a46ba6@gmail.com?part=3D5

