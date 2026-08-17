Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853643CE096;
	Mon, 17 Aug 2026 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786962037; cv=none; b=oCjxhB709Yax4oYUSSR3vNQc5LkzIfjQsjFy6RB7NrWqCxH6hDmNOtveePy2X3vcqgeZOa26Fgj6nLjAkMZ/kt7bzhuGduEyq9Ntelrfc8Xb9nUz4rYpQScIFxjdX3Bz0u6u8Uy7EPGDFUmwBprEIIVlcIQxrUG254pF5Oo3a3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786962037; c=relaxed/simple;
	bh=XcezoyoI5IRR40Z8eoQSZMlB79Hc4Ucm290GhcwvlHY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FRwcl8aXzsMW6bmwwGqIBbt6Bug70dxdAmE+tqh9lOeyC7r6z2tZX/AhvcigmJ9kGiBhRaG1Mt2JlpqDdI8AaPie5lpt8SCCBQykzWns54NUAIHW0+5BKcVp274LaeawSeOc1wqCsks/4WMUtg0qjjeQDHNXfYWFHa3dJlO7QP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivRY3pZI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivRY3pZI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCF6D1F000E9;
	Mon, 17 Aug 2026 10:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786962036;
	bh=U+TExSKIQCbLWX8HDu5kXz7kZpK49E5nEeAj0uNnpwc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ivRY3pZIWNQZvErYfrQJOwRMShfpZGD2ONmsWPfJSPGCuQtwafOpHwUNaaheZvvvV
	 Ykp7L7bU+7TvZmhnOCF4tzBpW1jab3cHh/DA1Qfo4lCKgO8hpmlP54DPM4LPg+fJVF
	 oGwPCGUIaa0G8V89wv+KlVODfWV+1ZcSvcI44+zXI9+flb1Ow0VWGLzrpVRfoRv+zC
	 jaTXHy7kQhpMjDBLHoSVUN4Kem+CUBcRJSoJrW8yiBIsfiuvfufifCVgpmuHVM5QVk
	 nfvDvYi8E5xkJxsTkgyqizy8//nUgtjepqqioYCJ2VzUltFsNt48OrTwwhLr2nVT8i
	 xUkWQYmT9r5tQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/3] hwmon: (pmbus/tps25990): Rework driver for
 multi-device support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stoyan Bogdanov" <sbogdanov@baylibre.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260817101455.3526260-2-sbogdanov@baylibre.com>
References: <20260817101455.3526260-1-sbogdanov@baylibre.com>
 <20260817101455.3526260-2-sbogdanov@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 10:20:35 +0000
Message-Id: <20260817102035.CCF6D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Rework existing implementation to allow adding support for new
> devices to the existing driver. chip_id is used to identify the
> current device and differentiate logic where needed.
>=20
> Changes include:
>  - Add an enum listing supported chips
>  - Add a structure to hold per-device m, b, R coefficients
>=20
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817101455.3526=
260-1-sbogdanov@baylibre.com?part=3D1

