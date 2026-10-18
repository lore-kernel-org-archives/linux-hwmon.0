Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5EA348C6D
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 05:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303182; cv=none; b=G47vGaSTDA+VZaMk97yRA3F+w2jy459RckmTA82tIRctnJDJRd0iTg+V+36pf4v148Vng1wp1QQYlZXuFUbkxyLLuxHmSZ/XCLginf8xYtCBiphJiBjkVGDnVLkjYm7h52ryfJe9zOW63TUFLo8altHOIyKqCTtiLAcwBsYgZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303182; c=relaxed/simple;
	bh=Da2lmUvdF1Mj6UtNl+PMRdOLJO+AA6/7PJfqhbbflTs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JMCCEu/I88V02ftnD7McHLjwXtYihVRp0J8SEf2Li4M4hxmrpRQZWllZvejb3e5o2QjZHUYMaP6doeGQywQz80EGN6j2iTPYMEArq2dGUfoQv8bzDW5g1/8xPuTXt+jZs/437dkFrqWcp52GkFn5Ha8pyS/5kmsaTx2m6bdjOhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBbLo+Pw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBbLo+Pw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE761F000C4;
	Sun, 18 Oct 2026 05:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792303179;
	bh=Da2lmUvdF1Mj6UtNl+PMRdOLJO+AA6/7PJfqhbbflTs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aBbLo+PwpOyyc1Q9qhSIS8PkKHkEBt6yrV4ZKGViK/R/Jz5ZwaJyBPiqhBfEk89CC
	 w7PIHPVLu+iuHbeZGNj1OYCKmTyVbtoDqh42DWGjTfzxdYxjIxd2ES7f9+Eta1T7j7
	 u4rAWDk9bx6Tp2KVMIvMFVKRvRCgGICczgF4Eh7X5PkzIqBUv9oUpy9A0SEftVNMj/
	 Tb9zJFKceYsmSe72BynaQz4BgC7n9vxWpS5P5DUMnIxdht0XGiboEYlnuzQ9WbsqyH
	 cKH2gwQxOrJ4/BuMqOTyeMgNMgTRhf4lnGnmg5SHR8aYPba2D3/4YpBiFVPE3WyyB3
	 bD1U0oHxTBcdw==
Message-ID: <sashiko-outbox-175961@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (mcp9982) Update the interval cache only after
 successful writes
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmFlayBLeXUsIEtpbQ==?= <pocj8ur4in@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261018055750.1318723-1-pocj8ur4in@gmail.com>
References: <20261018055750.1318723-1-pocj8ur4in@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 05:59:38 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> mcp9982_write() updates interval_idx before writing the conversion-rate
> register. If the write fails without changing the register, subsequent
> update_interval reads report the requested interval instead of the
> previous setting.
>=20
> Update interval_idx only after regmap_write() succeeds, leaving the
> previous cached interval in place on error.
>=20
> Fixes: e2fe950f34e5 ("hwmon: add support for MCP998X")
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018055750.1318=
723-1-pocj8ur4in@gmail.com?part=3D1

