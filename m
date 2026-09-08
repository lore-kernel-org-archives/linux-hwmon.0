Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163FC551990;
	Tue,  8 Sep 2026 14:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878244; cv=none; b=rc0/oWnL8dy+RMtlv+WNE6Gvw4Am5tsZbkmqTfvteNu6Xh8Kx4ip5Vgp7tchXybC20y2AP2oDS86uDYXhaMt2xdTUViH2Td/vZDyf4cCcfSi51nNoFcQgS90LvTwR0j/ud9vb7+adh3GPh/Bgp/I0vZ9IZI4EHdtSmaJcIj+dZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878244; c=relaxed/simple;
	bh=8qCo7wq2kJJd/mk6c6zgCWgno1Cq6z3O3XNK39eDfTU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f1H03nOC8MWpScel1MVEvyXS0wTvmGKVgfsISP1ft+WphPF42250pDHJlbUZ4r9h1srBdS71T+lcCZwdwNZMMIM9Yyv/ugyLS7Fo/nWHOKu2xjX+FRyPpRVsMehHL2l94k9DhruAwn0G/zdU1DYRPxRGaJjK8bwdAUhRRn2YrjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=dsCap2eu; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="dsCap2eu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788878224; x=1789137424;
	bh=8qCo7wq2kJJd/mk6c6zgCWgno1Cq6z3O3XNK39eDfTU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dsCap2eu06hBUy30FpqcqOfH7O/VSgo0GsCTn79kzBkMkahIuZ1G1/Xi3UBbkBauE
	 M9N6HytdJvPN7lVz7ldLKrY6JEKTWSnfQVHmhC1UVy6hBGz3ktM0GE1UaOWaHvJ/Qz
	 0YC/aNrkYrOazoTbdfbNWE3qNGm9O98da5z/yz8mxzq/W9ZpQLTnMJ9gtQaFqNvxXw
	 jTGITdiAsb3b1GD9iFoSM7FDbaIXHy9lYWCohMVQfv2AAulKJRcsoZU3jKlAYKksdy
	 AK/A0mEEtPRVk2SRZU3VrGIGMBDKkcky3OdWiNQZUKz0dORsQFnvlW2B2x8MR/qK2M
	 x5dOLaw4KIqig==
Date: Tue, 08 Sep 2026 14:36:59 +0000
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: sashiko-bot@kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Daniel J Blueman <daniel@quora.org>, Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/2] platform: arm64: qcom-hamoa-ec: monitor Slim 7x legacy sensors
Message-ID: <20260908143650.30134-1-birk.skyum@pm.me>
In-Reply-To: <20260908140849.229ED1F00A3A@smtp.kernel.org>
References: <20260908135801.81436-1-birk.skyum@pm.me> <20260908135801.81436-2-birk.skyum@pm.me> <20260908140849.229ED1F00A3A@smtp.kernel.org>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: a210bb27742837e3d48be788bfd9beeaede88ef6
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Anvesh,

Sashiko flagged the pre-existing SCI cleanup gap on the reference-board
probe path. I reproduced it in KUnit with simulated I2C and IRQ devices:
when the thermal-capability read fails, SCI remains enabled after the
driver core releases the interrupt.

I noticed you already proposed the devm_add_action_or_reset() conversion
and agreed to split it out after Konrad's review:
https://lkml.iu.edu/hypermail/linux/kernel/2607.3/10628.html

With that conversion applied locally, the failure-path and removal tests
pass. Is there a standalone version available to test? Happy to share the
reproducer if useful. I'll keep this separate from the Yoga sensor RFC.

For the other v2 findings, I've queued the named I2C initializers for the
next revision. Guenter left the driver split to me, and v2 already moved
the documentation out of Documentation/hwmon as requested.

Thanks,
Birk

