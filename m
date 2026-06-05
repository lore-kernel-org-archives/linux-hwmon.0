Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CD6416D0A
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 19:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780686398; cv=none; b=hYWyjwXsnnG0NIz3g2s952ma2yYdEj0TnOukmRfAZN+7WZISedvk0E0pviWq/qWhaqlFVI3AG+8bFD92Xu+NHbpj5FKFdZ9wLn2R6OzcrBdlV38yX9B/ZDKJNHNYyAVgx4k3Tc4JAOCHA4fmzk9EgQ79FlUR+ykeAFqqsD5cIMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780686398; c=relaxed/simple;
	bh=FZ2t7FP88uVt7Pdit6/BdElRGdhtogP61M4oVv+gN50=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BR83OS7EKD4JNRMN5bUEapiQh2wnLY8F7/SHIF9x/tvtXG1T9lkkApXP7M6BSlaZLtEx5Mz9V9PC2KXMpH4OCTt/GQeEjewoo7G3lVKkPDpH08xblngYR0tGZMZRlNd9JTwiUSzSNl7lDxM2LVE0J9dRp48UA19GlNYGguRVGLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N1Y63tkA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N1Y63tkA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9F91F00893;
	Fri,  5 Jun 2026 19:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780686397;
	bh=FZ2t7FP88uVt7Pdit6/BdElRGdhtogP61M4oVv+gN50=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N1Y63tkAnMxmiVvEHBRUmjeF1btatrDt02gROUiAGPG5ffhVmv7le8PZ187odbqnL
	 SMG0lTIrOk9kjp+DkH4qcNuiNK3DOFCnEhd2bUSRzOSUqKA4+ebUpI4yEvKBndHp1T
	 xI+hCIuUF37LJlvr7KgqP9RKrle+ZJG7uVGxzRqQwjszwc53NOyqU0hzWICuWEOhYX
	 +pywg/jWD+5TXrLPyWzwuiqIxpKpjGjKMqI00LEsUXav1J6ADSobHXAYBHQBuStl/b
	 Dsbh/4AQiBN7CWmVe7/F1JFmDFenXTE69liKrgSsI/WGe+eLfvcmA1541ovxipgc7K
	 WaDtLN9HAZ5kg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/9] hwmon: (dell-smm) Use new buffer-based WMI API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605181433.188847-7-W_Armin@gmx.de>
References: <20260605181433.188847-7-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 19:06:36 +0000
Message-Id: <20260605190637.4D9F91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Use the new buffer-based WMI API to also support ACPI firmware
> implementations that do not use ACPI buffers for returning the
> results of a SMM call.
>=20
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605181433.1888=
47-1-W_Armin@gmx.de?part=3D6

