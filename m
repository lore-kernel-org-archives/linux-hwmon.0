Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACAF35A398;
	Fri, 26 Jun 2026 07:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782459181; cv=none; b=OIMaJZiAfF7ygyFYXhFRAWCB5vjZHUxhrYxv1o2bpkDLEyH/orvvFMuopKpYo7zWmjYX0ungnLTbA2lWM70Q89NqqDmHcOA4GygbeTenxAXQhRRg9vfkRNkmtrCFDO1P9Va8f8IYQUU7U8RB31Wxbmml0Io6G/nX5OiBU2tlJZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782459181; c=relaxed/simple;
	bh=8qd7QQuFUSNJXUy/+ZTkKo0lXDtkwNsrRfzvvbsDleU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dEvFA+FXf1wFD3zA/o8hSIpJbCBgBPKIoyeZKsVbl7TB1VH41nX31ytWSCJNZpIsQ0jLvAvW3txtM0MHIHfVxq1+kgoxkGWvWS6fGf2rkH3fqR2pNavNGtsVCS4ERn90WSTRJXBxcFvR2tq9OUV1QvnX9KpHvulamcKqjGyg3Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CkHzbDBB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CkHzbDBB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECEF1F000E9;
	Fri, 26 Jun 2026 07:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782459180;
	bh=avS9x+BgEcaX9/PaB//aT/BhCUqxq2XrBIf8y0xHkt0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CkHzbDBB4poIW644AbQUUn4r5qPPYlljJ5YFzs1waxOnIthFG7Rk4i9fWYMMpsIS5
	 A5PC1wLOudNDF7fNRZ6fLGjN4mW0LQaH49G4NzYAQtu/QfqfsuWIGsdAFjsncm6YKt
	 /VvqSqtidAz6/Hd9nusSJd0NnaFXX3/YL5GciYRJHLYR2W8rsa1jc4NoPc/fO0n6jj
	 SDlmZ+IZ1CqjScOxSkhR/I4bw4Qk89en4et8to5UtA/iYPHaZlTz0FHTjs1t9SIETc
	 7N6fd6kV+Q1l7sMe/ee9bJiqY/8crOSFrxQ0oevXRBN7+eeQFQR2RrLxUYIa1SjDg6
	 Bmn9vnRcc42rg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/9] hwmon: adm1275: Prevent reading uninitialized
 stack
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matti Vaittinen" <matti.vaittinen@linux.dev>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <c8ad38e0cdb347261c6245de2b7965e747f28d22.1782458224.git.mazziesaccount@gmail.com>
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <c8ad38e0cdb347261c6245de2b7965e747f28d22.1782458224.git.mazziesaccount@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 07:32:59 +0000
Message-Id: <20260626073300.5ECEF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>=20
> While adding support for the ROHM BD127X0 hot-swap controllers, sashiko
> reported an error in device-name comparison, which can lead to reading
> uninitialized stack memory.
>=20
> Quoting Sashiko:
>=20
> This is a pre-existing issue, but I noticed that just before this block in
> adm1275_probe(), there might be an out-of-bounds stack read:
>=20
>     ret =3D i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buff=
er);
>     if (ret < 0) { ... }
>     for (mid =3D adm1275_id; mid->name[0]; mid++) {
>             if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
>                     break;
>     }
>=20
> Since i2c_smbus_read_block_data() reads up to 32 bytes into the
> uninitialized stack array block_buffer without appending a null
> terminator, strncasecmp() could read past the valid bytes returned in ret.
>=20
> For example, if the device returns a shorter string like "adm12", checking
> it against "adm1275" up to the length of "adm1275" will continue reading
> into uninitialized stack bounds.
>=20
> Prevent reading uninitialized memory by zeroing the stack array.
>=20
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782458224.gi=
t.mazziesaccount@gmail.com?part=3D2

