Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8053E0C5C;
	Wed,  5 Aug 2026 09:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785922248; cv=none; b=DRYhzhLfQKOBVECgBM3xn1RpDka+vOG+QGupMX14djavdAqaIh0aRGjVwnRNzp7QcRdS7JtUSxj4r4AvrRks0f3EFyNZu1IAQ3f/PFTkhWNznJr3OpdPYUbQ7fmBzYVaIwhnPcvFmoeDWD24wFfZQTIsf2Q2QVD6S8F4kzF5I8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785922248; c=relaxed/simple;
	bh=IarXVR9vlsf28fSltRN+i4lHEQJn3fImqjkiWRoDFGw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hyeoX54GYqswhZH4zP1knesAA7MSyARACwGhWEzWsJ4aejGLg2WK90FqRrqRfDUnis1mFmaJ8hGUye/XOkuy7wVtJUwLfukRmx992BcLZ01WPn1JdrPViq8OsU8ifQEbueRcTW+t8xxvd981Bz07nAoWrxNvmsJ7ulU0LS0G9IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVoOkHsk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVoOkHsk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373721F00A3A;
	Wed,  5 Aug 2026 09:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785922247;
	bh=IarXVR9vlsf28fSltRN+i4lHEQJn3fImqjkiWRoDFGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UVoOkHskvbGkxt6i2acKGiFq2Y6BNniRlQk8Le3JwZ9PebObdxmrBLhzUE6zraHFI
	 1jNzY2X1n5B7L9kjdR7rWVu/6v5bom1unQBQV5uO8qzcnvlyZebUlwcf12zPzwxwHc
	 wPDG0OOkxv6mO6c5/9qrECDL5OPl2pw7ZTg73gBpQrIiQGHTTym8pTU+PGdcj0qCGZ
	 PFYRdlRUlt2LPzdw449xhyyy8AVVh/Hva5xHV7k+3GVWhYmg82lhk2ER5pHNon53X1
	 t+kfZDxBOeXXoGg8tVQG2ICnk6u/V2lbLiCC+lh6GyNU8ypYZmnesz8S2QdjFUHjHl
	 DXV+S9QjorI9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805-ctl2301-v3-6-b86c75d1c552@linux.dev>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
 <20260805-ctl2301-v3-6-b86c75d1c552@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 09:30:46 +0000
Message-Id: <20260805093047.373721F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Enable I2C6 on the K3 CoM260 module and describe the Sensylink
> CTF2301 temperature sensor and fan controller at address 0x4c.
>=20
> Set the I2C6 pin power source in the board-level pinctrl node
> because the IO rail voltage is board-specific.
>=20
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-ctl2301-v3=
-0-fd4b8ffb5b0d@linux.dev?part=3D6

