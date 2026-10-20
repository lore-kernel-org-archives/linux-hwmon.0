Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515081;
	b=guTkNfigIMx84W9gMDWd+ADE8YBsFuF0gHh/Ck1uUMHOpJmZnyxzDYE3/UXQpeGL0vMS
	 QWFXjnI9f9GDMRMZr5pGT5Oc/SWbr1ms2eEBzKlWCootU696tifZyUmf2kNDHe9gQo86o
	 0q8P0NZ3dPjVpd/eQxUvil1/nqrjWqjVJW+nUpsGyBjR4OysJ2B5lnpe8T+0U/ebjVeci
	 vspiViPcqjsSvivhA/w3/aS5Jj5l2l+PPpEbl6bj5dIYUTNIufYj55xI0e4Tp+QprU32N
	 Tfc8QjcBC6m5zqZTKjCyQJlstImSecqrcrvgBD04ks/50zZRAcT+Xj0EM2iItIyidLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515081;
	h=Received:Message-ID:From:Subject:Reply-To:To:Cc:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4jPtC44fG9ZGpdMlQn7VoARy2dfSXgShqorH1pq3mDs=;
	b=pBkG8E8Viinlw0BBbLy9VpzlFxJSj0IWRx04SvudD4FRKmihxuTfewMpMJA/DicgFPiv
	 Ko8ZVZW7pIUpx5r6k6HfNWRWAF+pKlKmXjokxk4cwMvXm0FlFvgiNlY0THovboRftm+5a
	 C67IypEzX+6fvJXaxPweLfJaEDyACMw3S7x04/oOYI6oIQJ704oqz39M8mX4LtsYVTbBN
	 KRPmNn0iBDLdl/cR1NMBALuL1Cc5aKavFR+BVY1+CcaCmsUQvsPKDI/GBSsPH2UfpIrTo
	 M7g6vbTlSlmIGz8Ci3+7Rvlq/IQndH4sYya7NDhhPuDk08oiFyJ7UNvBRdthEkmuh8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31067606A31A
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 16:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0651F000CA;
	Tue, 20 Oct 2026 16:51:20 +0000 (UTC)
Message-ID: <sashiko-outbox-179381@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (fs1603) Add driver for TDK FS160x and
 FS1006 uPOL converters
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kevin Jia" <kjia@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261020-fs1603-v2-3-0986107a5cd2@nexthop.ai>
References: <20261020-fs1603-v2-0-0986107a5cd2@nexthop.ai>
 <20261020-fs1603-v2-3-0986107a5cd2@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 16:50:49 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The TDK FS1603, FS1604, FS1606 and FS1006 are uPOL DC-DC converters with
> an integrated inductor. They report input voltage, output voltage, output
> current and temperature, plus over-voltage, over-current and
> over-temperature status, over a proprietary I2C register map. They are
> not PMBus devices, and their register numbers collide with PMBus command
> codes: 0x21 is a status byte here where PMBus defines VOUT_COMMAND.
>=20
> The parts have no ID register, and the FS1606-0600 and FS1606-2500
> presets change how telemetry is encoded: the -2500 uses the 20mV steps
> of the higher voltage parts, and the -0600 needs a current correction
> derived from the IOUT_GAIN register and the output voltage. The model is
> therefore taken from the device name or compatible. OCSet[2:0], the
> programmable over-current protection level, ships with a different
> default on each family member, so probe warns if it does not match the
> declared part, which usually catches a wrong device name.
> [ ... ]
> reads within four steps of the output keeps a ratio of one.
>=20
> Co-developed-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Signed-off-by: Kevin Jia <kjia@nexthop.ai>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-fs1603-v2-=
0-0986107a5cd2@nexthop.ai?part=3D3

