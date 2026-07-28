Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B363B7B83
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 15:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254069; cv=none; b=GD/LhxOxKGk32TbwPX0H+58/v/CNOrVTJ4O+U9of5eAuMqk0FE8+4rqcvTFq4DcFlsX8OYAGea/5wJ/wl4dQrse4S5fcOiXzAx9wesLTH4mEIhRWw3h78+rXSmSH712Wx+2LOym0oQ2l75eN8H9W8tvajsBdf4dM70ouuk0dJoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254069; c=relaxed/simple;
	bh=k0xglawJ/zDr6wJDr7H/biDRtPx9qJiNQ+FDH532hPU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hEgox+7TqVH33VdAncX/qoIvaOnXEdHNWRUz5Fj5ZHp60R3IHpYRFv89V6/drI8cwHwJSakNr2sUSqlveftlJ8HPkLVL6RQu/FQ7T0p/WENfKJNcoZTwYpLnUhbL3XCUj3wK+CgZYAZmMa9tDiKw4I1i2cHtn+AnKl5NC9cNDrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bO1H1Wft; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bO1H1Wft"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3141F000E9;
	Tue, 28 Jul 2026 15:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785254067;
	bh=k0xglawJ/zDr6wJDr7H/biDRtPx9qJiNQ+FDH532hPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bO1H1WftdrDX73v3AN1dS1SNq44IwRjjJ5DJxblmlCKoMt5w28D7Su1FRZWwbpL+2
	 3VYj4tDToDxcy6fxTa8Ug+I4fcibMtwz12JSPDV5+smxYOoJ6e0ekOhFzJg0PmQed+
	 RuXqVmDDBA9CV24yrMjSR2FLnCvnJXB/y8CB2t+SuX13bhSUXSDupN2pNngrahJcOh
	 FjCVZql/wzOXRBmVWdZajFDilhna0Mkt2QiBDeT6/VLV5NxolM1C2y3ZQkOIdD0DwY
	 CHnQGgRR2AJcJ18irqYxBYtF6o52HQSAbHKguLUP7GTNxOJtgf51DBy5JRp4YuFgb3
	 oY2cY6ql1LU3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus) Fix return value from
 pmbus_update_byte_data()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260728154657.3910899-1-linux@roeck-us.net>
References: <20260728154657.3910899-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 15:54:27 +0000
Message-Id: <20260728155427.BD3141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> pmbus_update_byte_data() is supposed to return a negative error code or 0.
> However, if no change is made to the register, it actually returns the
> register value. This can result in problems if the calling code explicitly
> expects to see an error code or 0.
>=20
> Fix it to return 0 on success or the error code as expected.
>=20
> Fixes: 11c119986f270 ("hwmon: (pmbus) add helpers for byte write and read=
 modify write")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728154657.3910=
899-1-linux@roeck-us.net?part=3D1

