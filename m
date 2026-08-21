Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37672DE709
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 21:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787349261; cv=none; b=LLanEl7/+mzEkBuwhZcwSX+V0P0WAMmSB/Rd3N6xYiivB2R8+IcA2xsBrrh/op9QKBMltDMOvfTav0wMgrgio9EGCE1yMYnBh7fSMR7nETqxdpaPXYtY/2mAMQvY9EKJR0NbPUNlanLo7OWhWP6h5dWpHHA/Ho7StVF/+SX4Z6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787349261; c=relaxed/simple;
	bh=VcDxjCloB37wXOfswuceH9ASiI3jcLvh7U6+f7m12hc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=idpzzPfXKrtyAbsY4xY4/+rzXHuZRCcTUZ9gVP+s+U8IuF2TFYMrODpJsChpdjq2laIgNIJq5vnyqx4M6ABYnLlYPbKV29+Zz9p7C0nMiLhSQnb6T7WB4BZujW44VgOZyCcxA5AjP40ChuTIF6flG5seNeAbAnSnKEwSlw1H7W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OcFzxTn9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OcFzxTn9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7674F1F000E9;
	Fri, 21 Aug 2026 21:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787349259;
	bh=VcDxjCloB37wXOfswuceH9ASiI3jcLvh7U6+f7m12hc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OcFzxTn9KSURYnGpnTWTbqCv17PuINsRy4PTxmsmwPLKonPmhy1EZ07MhnA1PhPWg
	 y3iHqllQoPsaDoCeq0QlElFeucRGgCqzT45WWz0yxfZh24lISrsCfMcwulBxU9x14+
	 XIYQPbZzUfxcQJk1p4iQhGokDDGCkGbYt+Ff80JCGYFHz/M2yUvRSU3ozlhsl0pVWh
	 mhwm78eN5gGKk0DbmuVeIOvlSvurl0v6VXhSekHYzOC39u0IwB7Wz2fnvTLvU3t0ET
	 EHOG1pB7Jfao0mhjEOrfE563RwSk9vM6oyvwZjDu1KL69Kb/6TBwt31NFUb2mYvS7u
	 sLfRuf2UTa6Wg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 3/3] platform/x86: lenovo: Add Legion Go Fan Method
 curve driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aditya Dash" <mradityadash@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260821214728.87773-4-mradityadash@gmail.com>
References: <20260821214728.87773-1-mradityadash@gmail.com>
 <20260821214728.87773-4-mradityadash@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 21:54:19 +0000
Message-Id: <20260821215419.7674F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Legion Go firmware keeps its custom fan curve in a separate Fan Method WMI
> interface. Method 5 returns ten control values and ten temperatures, while
> Method 6 replaces the complete table.
>=20
> The GUID also appears on Lenovo systems with a different table layout.
> Limit the driver to Legion Go 8APU1, Legion Go 8ASP2, Legion Go 8AHP2,
> Legion Go S 8ARP1, and Legion Go S 8APU1 products. These products use the
> same ten-point layout and Method 6 request.
>=20
> The curve applies to the same fan as the existing Other Mode attributes.
> Add a separate WMI driver and attach the ten automatic-point pairs to the
> HWMON device that Other Mode already provides. Match devices from the same
> WMI provider. Other Mode continues to work without Fan Method. Probe does
> not invoke either method.
>=20
> [ ... ]
> This RFC exposes the firmware values unchanged. The fixed temperatures are
> read-only.
>=20
> Assisted-by: Pi:gpt-5.6-sol
> Signed-off-by: Aditya Dash <mradityadash@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821214728.8777=
3-1-mradityadash@gmail.com?part=3D3

