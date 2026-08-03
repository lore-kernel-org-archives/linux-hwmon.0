Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1792427FB0
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 19:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786226; cv=none; b=ia5mg/CbCfyRkE9n6Ck4cSzxYmsG7+TCmg2GEWORzt4OQrgW1Ar8Nm5js1Z4jsuLAYI1EEn6q4hS+1oa/djUQ8eM3Sgjvgd9+cJgYfGYtDCMhAFKQdUa84ubpC92mTuAtePCwoR99XRakDJzxP3sx+Ca3XW5Oh+sMWHo09EJjP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786226; c=relaxed/simple;
	bh=V9ECbcUdv0mQpE5K0T2b2UJTC4ZSUscUfpYm4QMASPU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Me/I1GvtDAmXRUDjxSeVeob/r0n95D0472c+FDNXWQqANqteH/ltTXMvXyEh8vOVnOksgjcnz2mCCEupwQCwDhgWGJg3kHK3arlPJ02mMW9Vna/0q9B1GEEZgYw8vlF2TYu1ckl9uGEqkEAhbLLAGm/KCizgn5x5sQ1Ky7UtwkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/Z36jFt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/Z36jFt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19AB1F000E9;
	Mon,  3 Aug 2026 19:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785786224;
	bh=V9ECbcUdv0mQpE5K0T2b2UJTC4ZSUscUfpYm4QMASPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E/Z36jFtVsbMlHgvhImo8fExEJNJvK7FhyNychbTGa29Y+ocxbdIh/xLSSFhhriMp
	 cM80OoRz/U78AMkVS6BhS6G/2wwIkyG9vqpTj6HZQOh1COq19If+tFxD7qh0rSlySs
	 31RAYuQVuOaCa+kPhHVfudkOSSvkQzWu5uhevWLZZObQu0mb+LKsKNMdmVvLpCazau
	 55xWjpFaTHA75+9HEINqJhYlV0HSnCxDr7+aOj1PFrqyciSB5qwe+NpD0GdxHYX6/1
	 UJFSh2zbdMNA+SS1oh4oP0Qe17kClfxNAyDKkI7oyAR4fHr/g0F6Gl85xUxOOuP/2M
	 WjoDULr4ruQhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] hwmon: (pmbus/max20830) Use
 pmbus_read_smbus_i2c_block_data for block commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260803193535.2286578-5-linux@roeck-us.net>
References: <20260803193535.2286578-1-linux@roeck-us.net>
 <20260803193535.2286578-5-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 19:43:44 +0000
Message-Id: <20260803194344.B19AB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The driver tries to use both pmbus_read_smbus_i2c_block_data() and
> i2c_smbus_read_i2c_block_data() for PMBus block commands.
>=20
> Use pmbus_read_smbus_i2c_block_data() instead to simplify the code.
>=20
> Drop the functionality check to simplify the code and to trigger a return
> with -EOPNOTSUPP if SMBus block commands are not supported.
>=20
> Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> Cc: Nuno S=C3=A1 <nuno.sa@analog.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803193535.2286=
578-1-linux@roeck-us.net?part=3D4

