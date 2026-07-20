Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FB23A48C2
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 06:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529834; cv=none; b=fUgCefP5Gnb/NP+Lce2vOErL6YviqxVWBss1p+pXdky0dxlCO1CHP9y6brQW1R8WnLrZenmnCbgI4DbRZVQwYFb3tys6Js9Y1S5uU3b6qNBHX8RMZkB1E8o95mHe2AqSzefA6d1pqE5fFH0EKP3cUy5R+W6/wAc1Uau6ebzArPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529834; c=relaxed/simple;
	bh=UTGR1yLEUDVtlk5988leW4t3YIazY0nNQapmv6DVCp4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hglm7qlO/GPhxE6mBiZdrbi9fenNfgb3xYE0NznU0L0HDHJNbQ9N89Y+w3Nwfdj+UsIcTaO5p5UF6kjD7Uoyr8ug+rsvoFIqwq0Lx9JZaote/GIxbUfMxvRpmYIAknCZi+hQIltP5LSpgEPioagVO92gTkz5EOyMlvNRjWxdKU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFsstMIu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFsstMIu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971DA1F000E9;
	Mon, 20 Jul 2026 06:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784529832;
	bh=UTGR1yLEUDVtlk5988leW4t3YIazY0nNQapmv6DVCp4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SFsstMIuSdFh0ihdYUNHiixNPFStiK8Yx9oQJqX0IUyxb0LvN5kBTR/p/3EsDryFH
	 U8umcI4nnXlFxgDlhFruWLF9+u/kMWntarjk2DV3sj8ZDRAFYINsZAECJcuBUpS16z
	 V49hFOupoGc3IXdDi0h8iWJqYh0OnoHTzSqqZW8UoYwwqXZN6ucLNqo9OEQle8xL+0
	 mhEg9LPc4b/UJksXqga9LWN4DZm7u/T2czGoWI8abM9PYJyI5FQC1N391no/tmoY1G
	 NJ1kNpcF8st4xCJx1xRk6szg3qhAXhBfrQ01go7qPTl0z0u6ZhF8zVlvr15a83If2E
	 haz8//WD/h98g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] hwmon: (pmbus) Remove redundant dev_err()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260720063745.309331-8-panchuang@vivo.com>
References: <20260720063745.309331-1-panchuang@vivo.com>
 <20260720063745.309331-8-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 06:43:51 +0000
Message-Id: <20260720064352.971DA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() call.
>=20
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720063745.3093=
31-1-panchuang@vivo.com?part=3D7

