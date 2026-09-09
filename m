Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4251368D40
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 18:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979312; cv=none; b=l6JpW8VrKeCsvigulnYCpGEwsqHoBTMn+KoT9inXaZ+J9xtvbnUSNODoWq39f289cHJjeuSOeNHis6jBFyLNXNl3AQ0EdD74JLXcau+H4ZC+g1YYt9Abk5lka9YYZUgFEPcazODcT4rEWB7Kof4ulLs9NTll1Dq3f3MxVgtOoLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979312; c=relaxed/simple;
	bh=uK6F/iwU/UjODP+LeZvsyXQleLG2405v7/KbuSrB++k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GKk6Gen029oueQKVQPkOdkSq6OLH2tB+Iz9mjdLgfDGecsoLHX5PyxeYgl11aEm4jB10oH0cYnN/a6AAGqPK5gPL6J4GMr1zH7VPGAGPjN5f+ahGti7MXdlOXETxk1mHDwMXRfGrFevviEx9n4DL/7Wus5pd1qtQkZwjacjaPKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guo9bhLb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guo9bhLb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633E91F000FF;
	Wed,  9 Sep 2026 18:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788979310;
	bh=DggpkVLBH6lblf+IpoZl0cbul8pZYxIliwJr12Pf244=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=guo9bhLblsrNP4i8xKWGjB7WXKWLoUvPPFD9Ru0Ga72NttbKfCBrmcZjJWj7Ptw1P
	 404BIB9X6kivzIJGtpk8ZfTekTGCTHivIJg0JUrMI4o82qaFrjC5dTmSr1pdrGsBcT
	 1Ieg6u1DQDoqnZkxxLNCwkRcemiiqoxbOSMJHwDkf2fiArUcNaBL1HLxNsuKwixZ11
	 3lqlq1VQUuG+WcvgStK7J6E6UAM12EibSKlxY6nBdy5zFuK8PPj/WtW0fpl8fl9t9+
	 2A1D8arGejHXJtvtoe5c4XIBjPT9DkrNUGmLhsA0ob/DJnoSUBNn2ivne2UliAwsA2
	 z+W5gRZXBQY+A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] hwmon: (nct6775) Add support for NCT6126D
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260909-bootlin-hwmon-nct6126-v1-2-4e85615fef10@bootlin.com>
References: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
 <20260909-bootlin-hwmon-nct6126-v1-2-4e85615fef10@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 18:41:49 +0000
Message-Id: <20260909184150.633E91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add support for the hardware monitoring functionality of the NCT6126D
> Super-I/O chip.
>=20
> The NCT6126D hardware monitor is nearly identical to the NCT6116D: the
> fan, PWM, temperature, TSI, alarm.
>=20
> The differences are:
>=20
> - Device IDs 0xd283 (A version) and 0xd284 (B version), which both fall
>   into the NCT6116D ID range (0xd280) when masked with SIO_ID_MASK.
>   Instead, compare the full value to distinguish from NCT6116D.
>=20
> - One additional VIN: VHIF scaled at 16 mV/LSB.
>=20
> - The fan count limit registers are documented for all five fans.
>   Also expose fan4_min.
>=20
> Assisted-by: opencode:z-ai/glm-5.3-flash
> Signed-Off: Paul Louvel <paul.louvel@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-bootlin-hw=
mon-nct6126-v1-0-4e85615fef10@bootlin.com?part=3D2

