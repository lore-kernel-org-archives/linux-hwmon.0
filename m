Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092747;
	b=grfx+LCugneZiFivawUzIpK5ekT+8G5IRx7K1mVDE36GeEgW3TDhYNhN2JsUutbcpHK/
	 UEmErFFKHBn4Q48qtllt7XpuDX3TuRnFHFoe+pmLaKRFiB6oAjFmMzdtbeuZQThYKvYvD
	 rMjj5xAsX9oezs4Xhg/P77WxZxn/vF543PZl4lrPF4VHg5fyFBsNE8aAWKAOrYQZ24rNI
	 hPCkrwHhArBdbmVXSIcqUPK5LVQN/B7Wr5OR/pBS5i4L09pS/kOVr8mmivaVZKGMpW16B
	 VfcgXIf5e83ZUXrIg00sqlNbSP6h9jCTGsKTfU5ESxkQPPoqv1imrrBjsHJrajGbi6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092747;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=w51d3Ey+37TwEHPT+bpsc9olaubKgaBtRO6hacL921I=;
	b=ZaW4eWHuFfugRZ53FzzB1efciXlo3BrWHonPfRLnaamHFg1q86rH8aWNWRWbmG8SBs7k
	 cMhVagL0ZItAj9BbP2TFb1s+Al3KhelkHPLKqS0ZrNfmrCXzMrq5/5GA2efe/IbSCLS1C
	 L3In9H8dSKgfIGDaLBiPw4mWfq3rNb61obaZGjoRaZCEOD21NMZsyRkeCzB7jHgqUSH/M
	 +cvfwH6Qz18vKIbBlz/eY4pwEUkPWAtMGACEpXpyxpO5NgDHYkR3YW+RV+ITgVRIbrcJ5
	 tFVZnM7BKfP+LyuT6pehKFdio8y3iYganqzlG8xHSeHeUIXXS3LYpCHfPyAd+pfIspQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=OnQmH4+W;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AC9606A31B;
	Tue, 27 Oct 2026 09:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8AC9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=OnQmH4+W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=w51d3Ey+37TwEHPT+bpsc9olaubKgaBtRO6hacL921I=; t=1793092746; x=1794302346; 
	b=OnQmH4+WofNc7T5cfXGPfnpnGdoiPaw6+ebyeTZM+ltnbWX7BGznmzD5PUSq6+4IzEtVg03qQoT
	YF4cuA0x0lZJwEjiFbrCsg8Hd03tqFi2oIbANFYnUImX08XeSUNPQ6W0PvlyI/xuoUX4xowSW5vfy
	Ztkrsw+SaMT+YxiuWLIR0unq5u1Wd/sky2x0roC2W6z7q7THWvsY6blp2c4VCO4JVELnJDWLkyWlO
	w/hCV9AlHPf+9O/+Gc4JdBdrrHEAm8tqLzgtEFpOyh5tpmNuSCu3u1Gm03xYzKyvbPmuZT5iIVXiE
	bLc/zMPZldQuO35CDq5D+TX9pAhoYSbUQIMw==;
Date: Tue, 27 Oct 2026 10:18:52 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, Alistair
 Francis <alistair@alistair23.me>, linux-hwmon@vger.kernel.org,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] regulator: sy7636a: report the temperature
Message-ID: <20261027101852.39b9031a@kemnade.info>
In-Reply-To: <CAAxh=jsKe95EsKnTypXtfTxGhYCMO1E7U=hWb3y6DBpgoiOVUw@mail.gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
	<20261026003918.155321-6-pmazzini@gmail.com>
	<f68279bc-20f1-41a9-ba5c-92b974785cd8@roeck-us.net>
	<20261027002635.6b831c0b@kemnade.info>
	<CAAxh=jsKe95EsKnTypXtfTxGhYCMO1E7U=hWb3y6DBpgoiOVUw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Oct 2026 07:32:14 +0000
Pablo Mazzini <pmazzini@gmail.com> wrote:

> Hi Guenter, Andreas,
>=20
> On Mon, Oct 26, 2026 at 07:35:24AM -0700, Guenter Roeck wrote:
> > This is going the wrong way. The correct solution would be to convert
> > the hwmon driver to an auxiliary driver. =20
>=20
> Understood. In v2 the hwmon driver stays in drivers/hwmon and becomes an
> auxiliary driver of the regulator, which binds the I2C device directly.
>=20
But that is a cleanup action, which is at least a separate patch (maybe
replacing and exending your patch 6). So the other patches can go into
their separate trees.

> On Tue, 27 Oct 2026 00:26:35 +0100, Andreas Kemnade wrote:
> > But it introduces another race condition.
> > The temperature might be read too early.
> > 1ms delay should suffice.
> >
> > The  SY7636A_OPERATION_MODE_CRL_ONOFF flag might be reset before
> > reading the temperature. If that register does not reset to zero
> > but just keeps the temperature last read, then we have no problem. =20
>=20
> Good points. For v2 I read power good (0x07) and the temperature (0x08)
> in one I2C transfer, and return -ENODATA unless power good is set, so no
> locking is needed.
>=20
=46rom the data sheet we can ensure that power good occurs guaranteed after
the first sampling, so this approach is fine for the most common
use case. It reduces the time window with readable temperature
a bit more than needed, but that should not matter.

Regards,
Andreas
