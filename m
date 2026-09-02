Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5D71C8604
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 00:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788308029; cv=none; b=YS9fhPkrPs1PqQbzkN3KDFlvoiKRKtN22g6cnH32Ccu4bm+voNYQ22qHburMvCbwgOkSaEWU637Mo5bQF9J3ECOQMsRwA7ahexEu5P7cDOFlv6hkEThe7X9qby3hugb3CJPgidaR+qswFINiPYBAJcUVa9BKqALtrxGOb4qfHGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788308029; c=relaxed/simple;
	bh=imCC6vmRemIb5DhTarFNE/Qr4IMSUJg7LB8SuJ4D0ZM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bN8GEaInGV/sCBNNeTbleSkd3unrIAUnSOH/UmMqeH0B3Q67JJzetiSIIn9eFiy5UD2zwvnsUKsvkThbp7m6haDfs57OqKvz3+fBQDZU4aRb8idJvu69O6BxGOm42QyY5MJ55ubmmfkt2kAHC4jJraeT+vF3MidwCVKibgpWXyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqP4B0NG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqP4B0NG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB901F000E9;
	Wed,  2 Sep 2026 00:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788308027;
	bh=imCC6vmRemIb5DhTarFNE/Qr4IMSUJg7LB8SuJ4D0ZM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kqP4B0NGN/hm/n1waRo+blVewSA3CUGt7awrkWKlLzysnyhPaJLbNhw1hKMo/6/rn
	 Q0A4jw0DLcU/Rwbx4o1UMbHpPyL6xihq0sdbznMBa8afnbLcpNSuf5kjGCFXgwxlr7
	 1GKSkEiVCjL7th5t5JoIHfO0uq0KmhFmbgzQIKOdFYMDnwoTsy8MVtVPhM+KRPsOUw
	 YXI0LAnqhxLouW0QqpmMZpHPS2rmxgnnF27UerY8wyqZHefgko5asTcYrAPxo6i5Y3
	 71DETv5mf3HoIQgxz1nOrReto2UUGAiMpg743ebe88X2j2kaRmX9zlAJLTR4cFhLlt
	 7uctAR6V6nMTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] hwmon: Add Minisforum UM780 XTX EC monitoring and
 fan control
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U2ViYXN0acOhbiBQZXlyb3R0?= <speyrott@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260902000509.191115-1-speyrott@gmail.com>
References: <20260902000509.191115-1-speyrott@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 00:13:47 +0000
Message-Id: <20260902001347.9BB901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a DMI-gated hwmon driver for the embedded controller used by the
> Minisforum UM780 XTX with board revision 1.1 and BIOS 1.06.
>=20
> Expose the CPU and system fan control temperatures and tachometers. The
> tachometer protocol returns one byte per OEM command, so serialize
> transactions and use high-low-high sampling to reject torn values.
>=20
> Allow selecting either complete OEM CPU fan profile through pwm1_enable a=
nd
> changing the two validated system fan transition temperatures through
> standard automatic-curve attributes. Cache coherent settings and restore
> them after the firmware reloads defaults following resume.
>=20
> Signed-off-by: Sebasti=C3=A1n Peyrott <speyrott@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902000509.1911=
15-1-speyrott@gmail.com?part=3D1

