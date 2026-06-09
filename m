Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5E6374A11
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 19:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781034543; cv=none; b=UR9LzCYAhToVekDsvBTgwuVUU6dfBhf/vLkW4kexulEWFEx9bMBmUQZDb+7REohuiTfTir6Tr7jYgEZmSuNsWGBhHvfXzgdmGqHwBNtiqgGPlb8mWttCIqT5n+1/7+fA8YCairXjnepLIgI6aPGlb4UJSK9NNnODV1Qs2ArR1eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781034543; c=relaxed/simple;
	bh=sIdkrbVpEeqo+dJntQ3OlWOufgn3n6QUO/QB6+5jO/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QeHrbVERsnILqeuK/SZ4zBcBMWkcfuLMYcLvxNNlQLPnG7DNbV7vbHcA77XQ9GkxLVkCYAJo12ieinwrIJYYQkSM2hTIhkfkGrJF02o2/8Jqsctp8YHPBFP5N4XhxvaKSd1ag+LUCx9u4tP39SocaRVMuMZ2r1IN5EEjFgjwbSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FuBUlmPb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FuBUlmPb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614A61F00893;
	Tue,  9 Jun 2026 19:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781034536;
	bh=sIdkrbVpEeqo+dJntQ3OlWOufgn3n6QUO/QB6+5jO/k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FuBUlmPbkwkpIeI0n9VuiO0/8iLhuyNwUNzMaF/OQccyZH64F1XwQIDuiLnTGjB8x
	 OUogS2nz534KrN4AZLQmtf9cTBXENtyrd6WUTP7WKvuokws72+iZulJ6cVcy397Xxy
	 Sk+rNEsbRk87Lx9ko8f2qybmY+0pjxJP7irKAU8rrptIrTbgZe1hfUQcT6VhalI2h+
	 /vMC+3xJHCeQbZeswBe8vOZLWtBByev35xHxc/OHeDKB7gy/4Aq2doDTdiby03GoYS
	 AbWkj0S62v6xFt8c4JxqUbj2x/YiLukfR5Q5ujJEhrqa/0eIm1oz++qOpuxQLqp/kG
	 BlKpAuFMKtg8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: Add update_interval_us chip attribute
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ferdinand Schwenk via B4 Relay" <devnull+ferdinand.schwenk.advastore.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260609-hwmon-ina238-update-interval-us-v2-v3-2-016b55567950@advastore.com>
References: <20260609-hwmon-ina238-update-interval-us-v2-v3-2-016b55567950@advastore.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 19:48:55 +0000
Message-Id: <20260609194856.614A61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
>=20
> Some hardware monitoring chips support update intervals below one
> millisecond. The existing update_interval attribute uses millisecond
> granularity, which causes sub-millisecond steps to round to the same
> value and become inaccessible from userspace.
>=20
> Introduce update_interval_us, a companion chip-level attribute that
> expresses the same update interval in microseconds. Drivers
> implementing this attribute should also implement update_interval for
> compatibility with millisecond-based userspace interfaces.
>=20
> Signed-off-by: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-hwmon-ina2=
38-update-interval-us-v2-v3-0-016b55567950@advastore.com?part=3D2

