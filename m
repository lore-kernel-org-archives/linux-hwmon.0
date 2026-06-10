Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AF21459FA
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 01:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781054383; cv=none; b=phMX/4w30v8KWiIr1Y1V1U5MW9CNmT7qewWCkCPkGcA/V3RjPzOBGgYqYFPogEv02czxTWOLQ4QDMbgTbivY1VBi7jcdrJKXJBuQi2TqlhPlfyUgVO3OZ1D1sgWGSmvIFj6a1js98rwef4c4tB0jOCxrNKkCWGUK3I2wdZrU1XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781054383; c=relaxed/simple;
	bh=8RdpOuV6FThsL+fj7gSqlpGHTDa7RXpY3GteDngDjus=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gnJOdf4UHc1Nkg3PwYv7HBSJ0XETtsJoChYJH+q0YFwX8g61OqwnDgRvAmIwEkuBaaxm76oZk3zyx3f7G00+WIBtfeE+PfOz7FwEdHxyXyoYNts5O5Xi1AjtczINfyVXC6TY8QgXEzRKNb4U1WVg5ZAH2/Ovjw4poReXh0xyGh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dg7/OPvg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dg7/OPvg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F631F00893;
	Wed, 10 Jun 2026 01:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781054382;
	bh=8RdpOuV6FThsL+fj7gSqlpGHTDa7RXpY3GteDngDjus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dg7/OPvgBwUt3vwm5NlPT6CnPVasysvBoLcnRXjwCfrnRkjeZw7xG/UU9EN4GQDMK
	 aE55R2eCViZb8jKmGS2yXq4BollcKo+ak9C+5FyOtrrI1wYb9mh6ICoQSdXp9T2y0F
	 vgkYlb6/l+0MvtR9ZVJKNDYCjsHMgFpYnASniDmagEOAe3BWymoAoy4VT/DzsJVP+i
	 S9pnkgVsKxmzGnnALbuJonRS0aAfLXw5kWptXFmTro5lvFwuqZUlNHoGzR6Ta5jldz
	 2s6rRr0Hp36/Oq1XxgSDwoeMv5N/5wNqTPFHaJlfCtLsECRrP+ojLqLyp6biYKCIKA
	 RPyXv+SsbIvag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/max34440): add support adpm12250
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610-dev-adpm12250-v1-1-422760bb80da@analog.com>
References: <20260610-dev-adpm12250-v1-1-422760bb80da@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 01:19:41 +0000
Message-Id: <20260610011942.62F631F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> ADPM12250 is a quarter brick DC/DC Power Module. It is a high power
> non-isolated converter capable of delivering regulated 12V with
> continuous power level of 2500W. Uses PMBus.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-dev-adpm12=
250-v1-1-422760bb80da@analog.com?part=3D1

