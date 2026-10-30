Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392831;
	b=VeOEXKPlkSyK9sS9fH792YA3Wrfqhc+mHpP5KpxjIKlqNPPef5jrkTRj9bf/kXQrnhqc
	 YskRtOW4n1+uTQo3VFtGeIi0j3WSUCjzEatVh7VQEnVzPT9fZl4wYgoWC/+1DmthzBRHT
	 uvWIYrY+Mb3Q964MhHFiemy9CbhVNb3yqdoyEyuD4z7ziK6A033tSNODNmhow3TCaKsfO
	 oyPd7cdZGKPZur6hZf8vdauiGykPI/wZOY0t9Lda3YyRexxztXpzuAXVnAcY54c2vZzad
	 OoJRSeYsLjVHaA/t11BSYTtKru8MDYZ/EOf68T7iYFaSjSlUbiOaJLY4Fhod/f7o8Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392831;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nOg08W60RCEWdrDjUyCpWbkoQ13vF3yicrI+GQP0AAI=;
	b=TaQOj26ajdngYmFeTQZGy3gIW7YvmPdhUYuAUZsa6bpCv/uU0SrhF5d5uuqxWTCUow0n
	 WLuVrKIgROW+6lkN5EJn5qrBXSOwm8dXhEZ3ZTe9OEUR3U8u9EJXXIQu4us7bo4Spkkb/
	 4avbEpNbcLGi87MyHCXI9wt72O9J9DjTUHjI5wvyOi2bN9x82omC7eTfCjD5hdnuoarBT
	 l0wzE/TA+NztIVFk42OHZZ6NC0Itdqi2wwoCRi7fnaViXzI6OA/Z10idVeuQu26oCKC6x
	 mhEgL3MMPparolpKCNwNVC6hoXBFPt0smfaVV29pzhMF91LljMv7vWdZkfebcXglw9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AZbjdz1T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A10606A320
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 20:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AZbjdz1T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEBC1F0093A;
	Fri, 30 Oct 2026 20:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793392830;
	bh=nOg08W60RCEWdrDjUyCpWbkoQ13vF3yicrI+GQP0AAI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AZbjdz1TuicBgWaBtICzvbdOQjgQlzuNc1DnPAqGF5dPrZJSxIJ3AsE0oPJslParN
	 dxjqIduHO+fEtWG6kkhA0dwcenzZsIXC/2GQ2TRBqnm3OeNVfIrV+ZHblXe7hKPPFg
	 ul3qNe66cvf9GTZLXIjlD1cjb98pxjnKHnSXcnNmksadFlwFVmZ9O4BEeir4tpicMw
	 fijydTJm7FkryEgIBEk0Y90bEspeLTBmPNY9sD716GizcPsiigG3JJ6ePSO7u882V+
	 6CT4iK+sMzzofDwKJGqztbCIyApKQCQxS+xcQZ9uM/qHRHFGz2eTpI0qCP4OJfirje
	 J1b/5FMKTpRWg==
Message-ID: <sashiko-outbox-191489@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (fs1603) Add driver for TDK FS160x and
 FS1006 uPOL converters
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kevin Jia" <kjia@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261030-fs1603-v3-2-6f8963a74def@nexthop.ai>
References: <20261030-fs1603-v3-0-6f8963a74def@nexthop.ai>
 <20261030-fs1603-v3-2-6f8963a74def@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 20:40:30 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> The TDK FS1603, FS1604, FS1606 and FS1006 are uPOL DC-DC converters with
> an integrated inductor. They report input voltage, output voltage, output
> current and temperature, plus over-voltage, over-current and
> over-temperature status, over a proprietary I2C register map. They are
> not PMBus devices, and their register numbers collide with PMBus command
> codes: 0x21 is a status byte here where PMBus defines VOUT_COMMAND.
>=20
> The parts have no ID register, and the FS1606-0600 and FS1606-2500
> presets change how telemetry is encoded: the -2500 uses the 20mV steps
> of the higher voltage parts, and the -0600 needs a current correction
> derived from the IOUT_GAIN register and the output voltage. The model is
> therefore taken from the device name or compatible.
>=20
> The over-voltage and over-temperature protection thresholds are
> reported as in1_crit and temp1_crit. The over-voltage threshold is a
> [ ... ]
> reads within four steps of the output keeps a ratio of one.
>=20
> Co-developed-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Signed-off-by: Kevin Jia <kjia@nexthop.ai>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-fs1603-v3-=
0-6f8963a74def@nexthop.ai?part=3D2

