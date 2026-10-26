Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007469;
	b=kYq+JRbA8GFlkXOZxoLchHO9Hs3RFGV/JS/sB1YUKmuK+Wv135Q0AkrBYY+rqcRvIYWZ
	 7SK/rhrEuG+XIV+gm1hXC/6pL53dBYJjBwYvmOBQ9xsOzrCGgDiD8+/MHGc6HC/OjXgZz
	 RC6nEMD2HqaG+QoLKEv3rCMhLcx/8Q2PKHED/PgXnKk3mZXtvyAeVwk59XvYAgmtdIxEa
	 oZYmh/XbUh2LIi7NazarZcXGjRFwiBhPvGe8p4pZ5MfiuYHvV5CejdB7exa3SuejumyS1
	 66542xABUrZxe0phnTTqM4aOwcJp7dNniSwCDnjNTF0amwJ3T2HncOwILoWc4Z480xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007469;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UmXjLJOP0mzdBm7GFoPR8yYMqhsvVQOQgwUqLKU0OJM=;
	b=kJdrWHBF5c7XAc1T+H7qM0jgg/LqbImF+xT4U7HKK7S82+inFIOLhXdSDFJPXLR0X/JK
	 emrtLzWDA/sRjPYjgrqwp7YwNcflyeMtxvnB1C77qKiNyWJvAiWt/ceXbAxBFUGN470R1
	 lJYM5uNQyPPYki6jbDTVhgn7l2jc9pq3kSU+pdak8nED8lA4yqf4OF1VR9M/1ME4vkX9s
	 vCcaNgymidz3Sd87L+Wnmm36ssdzjYlm/bT9IEfiBm7IVlAMo6U2fEGyu6XUC6vBGlfvD
	 gVNbVffyFneibkhvGzCSv84OH7D7l/KmjF2/waoaaVK9kg7DkG6k4HSF+fXgDQdq96g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=QWZhw8w4;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8469E606A31A;
	Mon, 26 Oct 2026 09:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8469E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=QWZhw8w4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=UmXjLJOP0mzdBm7GFoPR8yYMqhsvVQOQgwUqLKU0OJM=; t=1793007469; x=1794217069; 
	b=QWZhw8w41+a4kOuxG1p3BX45Tc3xsasC2I8+s8kM/cDcjTDueHdyrzPj4PPaxI/8dwuIHAnFKoO
	eyP+D9gFE2OqrVkI3F1Sr9vSUrbNiCRJguXow0pmNnUMgnDrOKwEIJr0Ch+H+NW2K55Q3aVje2pZa
	sWW8ieoK9+W+pVbVS4ZKe4kwUUStNPwtNVHETgQGvwxnuVJcAn0K2FSPuX619IWaK5sZnf82n3dIr
	UO/eCR1mQIN3fCQ2c74Qwr1iiqIpAljSVYv3UiPRiHuUr6JEKNnTDCBnKajFxI1IVGO9L7iJm1fTf
	NRd5w5SkW/8p858TaqV6K7ocsFTxeoxtSzcQ==;
Date: Mon, 26 Oct 2026 10:37:30 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Alistair Francis
 <alistair@alistair23.me>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-hwmon@vger.kernel.org, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] sy7636a: power the panel only during updates
Message-ID: <20261026103730.3a79c2e6@kemnade.info>
In-Reply-To: <20261026003918.155321-1-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
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
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 00:39:11 +0000
Pablo Mazzini <pmazzini@gmail.com> wrote:

> The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
> can not power the panel only during updates.
> 
Yes, that is the common use case, power things on, tune update process
to the temperature, update, power off. So it makes completely sense.

> Read the temperature in the regulator driver instead, as the TPS65185
> and FP9931 drivers do, and remove the hwmon driver. Boards that relied
> on VCOM staying on mark it always-on. The regulator also switches VCOM
> with VCOM_EN, gains VCOM voltage control and binds to the I2C device
> directly.
> 
> Tested on a PocketBook Verse (B288).
> 
Which kernel do you use? Just curious, maybe some further upstreaming
actions might be coordinated or cross-reviewed.
There was discussion about in-kernel hwmon readout interface like it
exists for iio.

Regards,
Andreas
