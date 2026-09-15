Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB51480DEC;
	Tue, 15 Sep 2026 16:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491217; cv=none; b=bDHnh9NtiW2u76eyysqL7z+o9LxpfTIacM7tSplU9ZaXRwWZklIoYAk4mg3EXEuTD2zfMR0lpkRRqmJ45dD212isroztI9lc34vvlah8clajY8YU34gblKgAAYUFM5LaWb7OERjznhYeIQ9x/B49E0vvgaDR7I8Dp39M4GPBnvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491217; c=relaxed/simple;
	bh=a5/UUMQqiqCK3S87gA/xHyCm0CMPxz23Bj0/DgSNw4I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=inLH5WIxRcYsig6Wvx+i6YaJ43goYzTNUU7RtykHVnU5jWuNYiLTbbO5N2zZTZY6SeT92wawNKbjJ1OwER8jD7Iqg27ouQtJ3+gP4Hlu1+JjoHo479BxPDxmG6QxnsvulZCSmTuZlEMdfQXY+T+KeTSeLM2SsjO6TU/bqKT/GD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oz4BUvaj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oz4BUvaj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4DC1F000FF;
	Tue, 15 Sep 2026 16:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491214;
	bh=a5/UUMQqiqCK3S87gA/xHyCm0CMPxz23Bj0/DgSNw4I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oz4BUvaj7Sxlwuta5546E3UahGUiCyrEDTdSjZKs6BnVUg2Tpv+cQqB7yVcYXgcIg
	 h9dlGHW4Ud8Z9O/rWtmXBOe1VQofvMQMlUJVNqj0ThZdUSMZnYaY+TGVQzX668jN9U
	 DcOOql7TF16VVkhYMq71f+790kGAvWq9ENe/mM3LRHyskGowE+19tnpcpQtcY+TVYA
	 cO4NnAipP7nSokDjrOaJXDcyPhJ/ot58sn4meUmZqtdqGZVb8ZF87SD12nEnHYU25M
	 y3NHJM961jNE1TwOm+MYSbcQAQZ1rsxQpf+E0nuiYzMb9+91HVHL48Hq2CuCuT5Ct0
	 vOHRDjqwo9CxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] hwmon: (pmbus/tps53679) Fix TPS53676 phase page
 decoding
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260915164823.160977-2-sanman.pradhan@hpe.com>
References: <20260915164823.160977-1-sanman.pradhan@hpe.com>
 <20260915164823.160977-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 16:53:34 +0000
Message-Id: <20260915165334.7F4DC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Sanman Pradhan <psanman@juniper.net>
>=20
> tps53676_identify() reads the USER_DATA_03 phase configuration to count
> the phases assigned to each channel and derive the number of PMBus pages.
> In each 16-bit phase descriptor the channel (PAGE) is encoded in bit 4 and
> the firing order in bits 3:0, but the code tested bit 3 (0x08), which is
> part of the firing-order field.
>=20
> TPS53676 supports up to seven phases, so firing-order bit 3 is never set.
> As a result the existing test classifies every enabled phase as channel A.
> On a dual-channel configuration the phases assigned to channel B are
> therefore miscounted as channel A and page 1 is not exposed.
>=20
> Test the PAGE field (bit 4) instead.
>=20
> Fixes: cb3d37b59012 ("hwmon: (pmbus/tps53679) Add support for TI TPS53676=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915164823.1609=
77-1-sanman.pradhan@hpe.com?part=3D1

