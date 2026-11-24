Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542417;
	b=1ZixKIfejVjhUfHMUx3tNIn7F7AOZhw+1HBme7BVfO2qSDbBIaAtEoKKTH4RYGlyeKcv
	 y30gc46g8qazhRG2BCYHHQwUDvxHfYpSh7Wb+Z1URSNoCh/vIbBCQppqXhTT068eEVDO4
	 rZ5UY9KgqXFuy0sR1KCV5f2K1fE6mh8uqFQYBXvWHLlg9eDQaFt+fWF+zUzK+ZbkmBRd1
	 srPyns7NxzTKklspLwQsEvlolQTm112dwcTH38WZWsFth7ksT6bjtK26eKsd7qWn04kJx
	 F6mjHyy6NkHU53Xyk7GfWKce9nrYfJ9Q1PhRjrsGqtIX8EsRi3VPhxqxWT7N1tBpA1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542417;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=v53isDqlCdiEQplpqwXp/f4hSlKlea9B9CFYgoECS5U=;
	b=SUuXRrMWg6HpIvHBnMdtDImlVzBtj/LZpec/t6pCc5vQchT4DwS/jnmEzcZ7C7XBRKHc
	 z5JMtA0hoAwURGWbE43rD9W0KdB4aR6620ksy0lRmXi/KL8dmHoJ8Io8LfHOZ8aGfc/3d
	 JvTM57fddvFpScO4X2NFjXqnQFqVJKgaokV5nxmbL2U6ayl7qyv5USxZgMotKupfPO5oo
	 sZcV9p9GqZ+nqpAUgJGAheH+2++7WsLH0aWCrbI8JXl6Udv43Ooa/VhmY7xO0Xa9nNZeL
	 sS7SHDQPROAL5W+Ct9itgG9JlOxpGnYotrzF1PfnjT6eXJ/Unln8ueUM+T1giFFBgbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WlrfVsTc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6E4606A329;
	Tue, 24 Nov 2026 17:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WlrfVsTc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59B21F000C6;
	Tue, 24 Nov 2026 17:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542417;
	bh=v53isDqlCdiEQplpqwXp/f4hSlKlea9B9CFYgoECS5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WlrfVsTc6RKbR7qdw3y4mGBxKsPgOcyZ5CWSw5vL0jB/vK5M9YB1F9W+Xaqx4ozfc
	 LmN8FU5FG6OgtkiMOVvoMdsddkB+Z/j1fvDKqrsJGoDexZ1tRFcXE43FOJvwwuu9JX
	 6uMEH2dxgxlDWfEzua+76h2AFZl9tOuWH0kUebcqxOckst0LQVLHaldWtqyNE/jj1F
	 tdDxkgTkUfDPq0qKQvtz4pJMVcc3FZ5SgseRFpl8rOGUsyHw62sFWBJLoNszLNo9iw
	 1WxlW552u1O64wnv/cBs3W3XnnqGJ0LixMK9T3Ctz47UJH97nDV7cVWvv5i1uqcD36
	 ykYyDKAhclGEA==
Message-ID: <sashiko-outbox-231741@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/3] pwm: rp1: Add RP1 PWM controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrea della Porta" <andrea.porta@suse.com>, devicetree@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124173658.31030-3-andrea.porta@suse.com>
References: <20261124173658.31030-1-andrea.porta@suse.com>
 <20261124173658.31030-3-andrea.porta@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 17:46:56 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] pwm: rp1: u32 overflow and invalid offset in
  rp1_pwm_round_waveform_fromhw()
--

commit 44a8d1ea8978f906a50c0662a30ab9153df78f82
Author: Naushir Patuck <naush@raspberrypi.com>

pwm: rp1: Add RP1 PWM controller driver

This commit adds a PWM driver for the 4-channel PWM controller in the
Raspberry Pi RP1 southbridge.

> diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
> new file mode 100644
> index 0000000000000..69ce0db4e9aa0
> --- /dev/null
> +++ b/drivers/pwm/pwm-rp1.c
[ ... ]
> +static int rp1_pwm_round_waveform_fromhw(struct pwm_chip *chip,
> +					 struct pwm_device *pwm,
> +					 const void *_wfhw,
> +					 struct pwm_waveform *wf)
> +{
> +	struct rp1_pwm *rp1 =3D pwmchip_get_drvdata(chip);
> +	const struct rp1_pwm_waveform *wfhw =3D _wfhw;
> +	u64 clk_rate =3D rp1->clk_rate;
> +	u64 ticks;
> +
> +	*wf =3D (struct pwm_waveform){ };
> +
> +	if (!wfhw->enabled)
> +		return 0;
> +
> +	wf->period_length_ns =3D DIV_ROUND_UP_ULL(((u64)wfhw->period_ticks + 1)=
 * NSEC_PER_SEC,
> +						(u32)clk_rate);
> +
> +	if (!wfhw->inverted_polarity) {
> +		ticks =3D min_t(u64, wfhw->duty_ticks, (u64)wfhw->period_ticks + 1);
> +		wf->duty_length_ns =3D DIV_ROUND_UP_ULL(ticks * NSEC_PER_SEC,
> +						      (u32)clk_rate);
> +	} else {
> +		if (wfhw->duty_ticks > (u64)wfhw->period_ticks + 1) {
> +			/* 100% duty cycle case */
> +			ticks =3D 0;
> +		} else {
> +			ticks =3D (u64)wfhw->period_ticks + 1 - wfhw->duty_ticks;
> +		}
> +		wf->duty_length_ns =3D DIV_ROUND_UP_ULL(ticks * NSEC_PER_SEC, (u32)clk=
_rate);
> +		wf->duty_offset_ns =3D DIV_ROUND_UP_ULL((u64)(wfhw->period_ticks + 1 -=
 ticks) *
> +						      NSEC_PER_SEC, (u32)clk_rate);
> +	}

[Severity: Medium]
Can the wf->duty_offset_ns calculation overflow u32 or produce an invalid
waveform when inverted_polarity is set?

In (u64)(wfhw->period_ticks + 1 - ticks), wfhw->period_ticks + 1 is
evaluated in 32-bit unsigned arithmetic before subtracting the u64 ticks,
so when wfhw->period_ticks is U32_MAX it wraps to 0 and underflows u64
for any ticks > 0.

Also, when wfhw->duty_ticks >=3D (u64)wfhw->period_ticks + 1, ticks is 0
(wf->duty_length_ns =3D=3D 0) and wf->duty_offset_ns becomes equal to
wf->period_length_ns, which pwm_wf_valid() rejects because a non-zero
duty_offset_ns must be strictly less than period_length_ns.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124173658.3103=
0-1-andrea.porta@suse.com?part=3D2
