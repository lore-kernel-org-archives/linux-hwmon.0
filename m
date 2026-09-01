Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91CF46AA6E
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 20:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293402; cv=none; b=C0vXBqgrw/YhLNfglZ08GKfzX1F8mqckxWD8GID0SLeQ3gIO5mrdnVu638r+Ky6J9m4TD7mBCMLz/nRMhHQtJ8upXFzd1n41c/oBNYPiU1KkeJFr9CBAfNxWDjXrNfhmznE+aVHAhv/eCvkcLOEkkogBKoMMyxk5FIkKEkMphcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293402; c=relaxed/simple;
	bh=z+ExcvT+MEzfzpNN8aDlBQmZVbg8gmBAKYwPqu0fVdY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c1WbNvrGkflG+cAzD0fzT0g0NQ2MUT+DxN5xNZF+PfFHA1IbDUjecHcSUXT4s7Obg9BFcFpUQ77DJcM+89RB8/KoDVq5H2pl7W1X7EK1rqC//15YuLqHh4TJnaAv2qwshXQYKgNdpaVZivcoliep33CQrfLJs3XEJU0UigDh9xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZai0z2M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZai0z2M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74951F000E9;
	Tue,  1 Sep 2026 20:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788293398;
	bh=z+ExcvT+MEzfzpNN8aDlBQmZVbg8gmBAKYwPqu0fVdY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MZai0z2M0GA//z02/M+2l5NmwrOYnf89E4TOXWzBsKKbhYLfA8v2vkP+7wDWurMHy
	 sKdwUWKVEq+4M9IwbesDhcdnFPhwlwCeXYsKLgJ7hZE1Haj43y+YH8FlDbeyuw3Uh6
	 +UwqgM4Ay1hroNNnPCTNJce+Y1qh098Yeq5ZGqoaEjBb+CuqUM1WngLwRQ9rtRJeVl
	 8iDweZGr7JzE6NyW/whhK/QmYZNIoTifVk3VfIdO3g0ZESRwmk0hHDAUxte3QfNznR
	 JGS3uhT9QFTz4tpJiiFIvrOHTxP1NdPOIirfIrwIcckDJ1g+tYl4LoV3ZeEa0fJplX
	 4CZYGYd+FHOcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] hwmon: (spd5118) Select page 0 unconditionally
 during probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260901200142.495319-1-W_Armin@gmx.de>
References: <20260901200142.495319-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:09:57 +0000
Message-Id: <20260901200957.C74951F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Some Intel i2c controllers can be configured by the BIOS to reject
> writes to the SPD device. This often causes problems when the register
> page needs to be changed, usually during resume.
>=20
> Avoid probing on affected devices by unconditionally selecting page 0
> by writing the SPD5118_REG_I2C_LEGACY_MODE register during probe.
> This will fail on affected controllers and thus prevent the driver
> from probing.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901200142.4953=
19-1-W_Armin@gmx.de?part=3D1

