Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ABD2D7380
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 06:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367920; cv=none; b=fzvRK9CcrMUNJj1AG0HquXTCfu1Whv3UL5EIy0IqiVvnYOmaImX3hPCi4hMtRw0xImToGXtZs2ZlOEqoUzXXEbF8DPtwWxTdm60BC4M2C6h0HaY9x2vpfkcS3rC4onmoZJv/dLkP9fmQQF4wSSBAyTwVTTCEiizfbqHtZnsMTc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367920; c=relaxed/simple;
	bh=KYffiQuhrekYqZjTHY1h1umEDxhq9+6MCIoPwyCKAZg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TLcqE99uCM91UK2r+MDnJvBRl446IttHRNw0+Ta8VffBZtOEd8IkAqF6pR8b9IE1XhvF/7aG28OyldrxTOVj1aOJLosN3jVabVd8H9kbNp0uk5mDAXs3OgYjXygeAFpgQicVBIhmbg1SebCmikFjZ2zE5sPKZalfQ4OzV1lB4fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+4O4eYo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+4O4eYo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9621F000FF;
	Mon, 14 Sep 2026 06:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789367919;
	bh=KYffiQuhrekYqZjTHY1h1umEDxhq9+6MCIoPwyCKAZg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T+4O4eYofYz7RPzhnVghFirZVvBqe/V2apkFHk9CJGEwSlwdbjyuDbcrj1lTrl6Yh
	 HWh3RhHTqV0zOTb0qqO0aORyipHibthxY5VulXDGGkSUC+fAjxELopmZ0BBhw43LB4
	 MW8erFp5bqGKVey8FSTiDtIn/SLpUZU2OHGo1r0ja1xebuk2rn7qBZSp6Mf96lPsuE
	 dHfmicc3lsQM6SU2db/DOOIOeMn7BydZT2iayJEQkA0EqL0slMkpVDdYf+SEJjFs8g
	 0248P/y0S+IeuAzILhH5WljKb9Vazl3iEppx8zG6qvPoizMmT7e/krh8v/29tCdheW
	 pXMBPYJ83uhEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83791d) remove fan/pwm 4-5 sysfs group on
 remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260914062809.1650538-1-lgs201920130244@gmail.com>
References: <20260914062809.1650538-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 06:38:38 +0000
Message-Id: <20260914063839.1B9621F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> When the fan/pwm 4-5 pins are not used as GPIO, w83791d_probe()
> creates the w83791d_group_fanpwm45 sysfs group on the I2C client
> device.
>=20
> The probe error path removes this group when a later initialization
> step fails, but the normal remove path only removes w83791d_group.
> As a result, the optional fan/pwm 4-5 sysfs files can remain after the
> driver is unbound.
>=20
> The callbacks associated with these files access the driver data,
> which is devm allocated and released after driver unbind. Leaving the
> sysfs files behind can therefore result in accesses to stale driver
> data.
>=20
> Remove w83791d_group_fanpwm45 during normal teardown as well.
>=20
> This issue was found by manual code inspection.
>=20
> Fixes: 6e1ecd9b8f13 ("hwmon: (w83791d) fan 4/5 pins can also be used for =
gpio")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914062809.1650=
538-1-lgs201920130244@gmail.com?part=3D1

