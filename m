Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C398423A7B
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 19:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780686884; cv=none; b=C4uNcqnCxmxCIGpcA3xQlhIHICGaB9GfG2Uh4DMhZawaGIFplCuxS2JMCBP5KPW/agVM1oER85aCDjWHUTIppT7lKnA3Kv9ZZ+7Jo+D5xO1IOxKJ67EHMAV/tT7A+IbtNN1PEkA0EdYLCKDhLS9+I0A4aDWbmGEmAoQBCVxsUFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780686884; c=relaxed/simple;
	bh=QTbIWKFDDhudmoGvexw+8mfESaah2m/KUpzgl+GfGYw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WdGhDygUuL7oGVxjnDQKEMv2UeXFGp9zFNJVDtWZcHBPijgHmu1zTzv/W/r9pJOwG0B9VyvGfAP/TZz3BpBEXMfPz4e/mUivDNK8EHWkV1xW7fDhRdwmatzLsmCP9GgNbLxP/INNtE5cfGkusUoYlHAO7h0jt6dFskq51U3s/so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Of9FjHDc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Of9FjHDc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2EA51F0089B;
	Fri,  5 Jun 2026 19:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780686878;
	bh=QTbIWKFDDhudmoGvexw+8mfESaah2m/KUpzgl+GfGYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Of9FjHDcsrN9/sH1qgi5rR3cqB+qY54TGSFc4bip0Q/D3gTw0+6f/XKdOQ3XTY7fd
	 vzHS/IkAkMV7mkWekLCccOnmQ0a7wIc2KFdRPobBq/lV2V6pOcGlIskdbx6uovbuH3
	 THZXzw8I0ou1H+DGFi1GMjjsgxf+StZ5z0M/XR+0ZuIokCv9D2Ew8g7RdghmhOIcbN
	 +jyebkFW/td/Kdy/vgymEkWl6/qB3GnVbtYLaQ45IfNVN6oqGWyJ/J0fJTVsLtCWNy
	 VGlklQMGCe/Y4mWcU9kSHs0nkn3NxszuCTfUUqY4c5mQmouvicfQiSEijDtu1vvgQM
	 pGIP0WGG5japw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 8/9] platform/wmi: Make sysfs attributes const
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605181433.188847-9-W_Armin@gmx.de>
References: <20260605181433.188847-9-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 19:14:37 +0000
Message-Id: <20260605191437.D2EA51F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The sysfs core supports const attributes. Use this to mark all
> sysfs attributes as const so that they can be placed into read-only
> memory for better security.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605181433.1888=
47-1-W_Armin@gmx.de?part=3D8

