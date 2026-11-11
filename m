Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419139;
	b=A2+3wyQpvop3mMIDn+vKYu5z/+776YHpSs7ZOXoJpocMHT8tnER5RoWsQK+DAjv2w2yU
	 PfQgMpSc6msVpSnlzmLG+Fi2vUMIGtbcTxtrfNKjV+yfD2TLDybHcfd44oEOU4yUWDwd1
	 HXCMjrJ4WtsCpm8y9fnfWz6MiE1xPnYT0zDPztlzxv7+BZdFxykfCAk8JqPL9J0+2E0nO
	 6a+JtT/aIDBaH+dnWlb9V3ENIfNhx5r9N/X04zXkHyzC0JA8nmzIIYBTqA1cMZM6K65a+
	 UXzkby21xSfUNDuqQ/RxaBf90MXEDNVj8NYtczXaVyn8HTezeUlTK5IhmJsIpLKnqQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419139;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rk/+rU0Ncz/a+fhm8EBPv8+qWH7Onrero1Y9owCVj+U=;
	b=LuvCJ7Jfy6fVBCDiKbXIT+JSdO+PCfdomM+HAhZuV5QlSH7vzW+0uNoKVVlJtYJi6h7z
	 8BphD744+TWXpEn9Qhp9yyKf31Oi9dcbLcQYwAkW+ERUxSZLZvUC665h6ZgNZa0yzv77c
	 Ee0qcSzlv4rQ7RALU7fUH5T4+peI0lAZIRH7z/qenNN2vOwSi4coqCqrMQ4ZNObQFR9rv
	 +XIU/KYZ/Fv/Cip092I1MIHslLBHrol2eHK0XQ4TDlYtcV+sy8Q1HJ5i4dFDYQGQpkh9g
	 0t6+GI83yhYNlJAPaJnQBAde81uwhSYdSORUPllFjXSA41g2PTPW2AMUpe/vsvidCnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CcDyQmbh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E22606A8A3
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 17:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CcDyQmbh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5578A1F00A10;
	Wed, 11 Nov 2026 17:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794419139;
	bh=rk/+rU0Ncz/a+fhm8EBPv8+qWH7Onrero1Y9owCVj+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CcDyQmbhxntnpg8w90Tzn6PrQquO4EcAPyyoYSDG5Yupt8lHjF2G/9LMgd69pREV3
	 0PAuR/FWnuDM1sbCuhVd12bSAi3wTpuVZpCDBHk9XLlnZJ4OuNhlRP328tAW2eKT94
	 HtbEV9DphQhtOjxQK4r9dka26rw2t1ohJunJh+4U5uVPdVw3gN/qyftzyrTCWL3PJE
	 wTCbHY9Jn2MQzRhZJLWtkOH9IMGy0WyqgrHAIZFWWLMFPkKr4Zi9LnfMwr8wq/XsRB
	 euMxpOFjNovVLJEtPFOkDQ59u93hk8xL2oZk9mbIfoiY0n0DO/FWFLQnaxpbD5i3C4
	 xC9oQSVzbf7TA==
Message-ID: <sashiko-outbox-209435@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: (dell-smm) Add Dell Pro Precision 7 16
 PW716260 to fan control whitelist
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shady Abu-Hussein" <shady.abh@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111172733.84217-1-shady.abh@gmail.com>
References: <20261111150435.75965-1-shady.abh@gmail.com>
 <20261111172733.84217-1-shady.abh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 17:45:38 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> On the Dell Pro Precision 7 16 PW716260 the firmware fan control
> cannot be overridden using the default SMM method, writes to pwmX
> are ignored and pwmX_enable returns -EINVAL. The firmware AC fan
> policy also requests speeds below the minimum sustainable speed of
> the fans, so one fan repeatedly stops and restarts every few
> seconds at low load.
>=20
> Add the machine to the fan control whitelist using the
> I8K_FAN_30A3_31A3 SMM codes. With this, writing 1 to pwm1_enable
> disables automatic fan control, the fans follow the requested
> state (0: off, 1: ~2500 RPM, 2: ~3950 RPM), and writing 2 to
> pwm1_enable restores automatic fan control.
>=20
> Tested on BIOS 1.5.0 with kernel 7.2.15.
>=20
> Signed-off-by: Shady Abu-Hussein <shady.abh@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111172733.8421=
7-1-shady.abh@gmail.com?part=3D1

