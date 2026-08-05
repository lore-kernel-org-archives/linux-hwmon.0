Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121143E5EEB;
	Wed,  5 Aug 2026 09:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785920943; cv=none; b=CiiGOBNw8V0wv3BbV11y+VPrAeZ7MCbJBn1gAgaEV4UL0gwPbqEptmlT4BrIqy/M7rNyxlDEs0evMlIiN4UaCCjUrfrX6eLv5UeLSPapb3lv5AHhyazj1bKmfVq0zAJEiMSlFgP3QBrKFnYyddInHXHwDcKiBFA7wTa/6stcJh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785920943; c=relaxed/simple;
	bh=Iy9W0Ts0JzwW4Dgeq+u+zUHSbyowYoBxDNyp2kThc6I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qsnf+N+TJZ3fp4U9tGPtMgZzoZY6ANIB9tpC89beGUB4+2bNTMz1src+kSESBI0gL45B+aXnPuOO3bdTHFxhlh7KBP0tEqhWefjjIwftS1nL6qujCg0O2DxPi3uBRf28lC8DnBzt4aqIbd9tSYlih83Ui3RUPCQxfweDY9Y2vmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5KipsI8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5KipsI8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3BE1F00A3A;
	Wed,  5 Aug 2026 09:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785920942;
	bh=J7ZjrCzjpINxbQNZqRdGVYEFiYpwO6V9oaVGXrGySoI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R5KipsI83Ha5Z6vTPCuKI+jrk7JnM+U3nX/7hOaBd1wgCpL1MGmpR2lvOWHlR3aIj
	 qTa6cb2deFClmtI4EgjvpM7escGbL6f1lcKVvEHST8RuAABOZG7EBX9Sd2V3oAXMrI
	 2QdmE25D3FqZLrHCShII82/jGvIzHRw/SUhR9lae30cXldCtLpL8yAjpKNrQKaChxG
	 Pyu+dyJHwaSEMVssFyc330o5kkOvcBkvMSjjm59MvyL/TfPr0IJp9P2D9p+2jvUvuV
	 klcJ+ZRmQWHfb9Jvh55RZjzdGUKtuuNhSC9I6V1uPaTyZGTNmJF60//NNxMyzdFnFY
	 IGM9xhQRbCjDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] hwmon: (pmbus/tps25990): Rework driver for
 multi-device support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stoyan Bogdanov" <sbogdanov@baylibre.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805090400.2059006-2-sbogdanov@baylibre.com>
References: <20260805090400.2059006-1-sbogdanov@baylibre.com>
 <20260805090400.2059006-2-sbogdanov@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 09:09:01 +0000
Message-Id: <20260805090901.9B3BE1F00A3A@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805090400.2059=
006-1-sbogdanov@baylibre.com?part=3D1

