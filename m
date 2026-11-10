Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284766;
	b=kugXqLGz41QnjoFpcLdyBtB16cam9jicDnbp8kM72nGavUlq9jdADcKhLO+DJGvQOspO
	 xJm1RKQtyRv8HMglDVcHer9QAjWKA/hZ11xXLt3Xnt+9sI3ArYOJq+nF7P9WuvBv7UjOn
	 B1vrvotBP87M9or+EAzePhJJEJre7clq0kfFrvsZbrqqTnyaTqhddWikkY54+43CXJlBG
	 dis72c8wDLJfv3u21twrQQ148vJm9Of1ZQNG9N6923MyjB3ShIjwopTEi5Ax4jWXiPZ5Q
	 DdI6TqhOjYUUSMqixLcnHevW8FQmS8XHyuwv61A6bjJG6Sd/EWpfcNv/l8+NDQprd7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284766;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jKjErJpntdo3rA9QcRkMEhX0eyNfJQ7XdUbcVQ9Qafg=;
	b=lroBRoXducQQUrfYTBRbTednC9ZSEuOTKW7af2ISgx1BT/zeFW71RMllFvgc9erjG09c
	 tkJEXkQHLF+1wUG1T794qQvQ9NmhvCjf7qhQzR0TJgHmmVtmchP3pMHfpMMn10G0izK7B
	 6oULCA4dUxTpIucZ8hmSo1d92/pSvaR6fQCCavJHJtLj+OcyQ86N2WQ3oawpndEkHny+G
	 vLny//YecJMOYYZ3TTaWsVq35Ejur8fAFMAeEtwcJFmCNNfUdTJIWTSouz0sHqZlHbAGo
	 GMLBe6uV10X8QiGBWvp9leB/nE1YQMiHrOuB/63eMdFes/Yj1fN2A4zGaZAQu2XgeiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrDMOGAU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C481606A321
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 04:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MrDMOGAU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8C41F0089F;
	Tue, 10 Nov 2026 04:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794284766;
	bh=jKjErJpntdo3rA9QcRkMEhX0eyNfJQ7XdUbcVQ9Qafg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=MrDMOGAUzwpP3AbRE0t2vOPMUkwXFLbf4gRFepHQwn4dapj6BEVHJCsMBOtnmn7iE
	 DgT+hjwqx6hAYSdrGPiER6V0Dhz2QFc7eXiP4DVoox7YgBm1IaaaEGBLn0j+6JnbGq
	 zdCL/bVbaTnn+jWtDmFY8DI0A8/12rtC3jhJihdKG/mgL7mrHguliTlm08YngXXzaA
	 tKsLF/bwyQaMjcs/hho+j6VJyywhvbGWC7GJPSF9lTo8XZMS8oSASR2o+FGLaj+hOY
	 /V//jN9P35efqEzUx5NXYUaxqxkIrrh7Q5UmvlYE1nYXNPPNlnhaoaMcEzxOyjsP0s
	 icIeRlUidQYhg==
Message-ID: <sashiko-outbox-206194@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFT PATCH 3/3] hwmon: (nct6775) Fix tolerance bitmask when
 reading REG_FAN_MODE
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261110035955.3968731-4-linux@roeck-us.net>
References: <20261110035955.3968731-1-linux@roeck-us.net>
 <20261110035955.3968731-4-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 04:26:05 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> On NCT6775, bits 0..3 of REG_FAN_MODE hold the temperature or fan speed
> tolerance (tolerance_mask is 0x0f), whereas on NCT5525, NCT6106,
> NCT6116, NCT6126, and NCT6776+, only bits 0..2 hold the temperature
> tolerance or low 3 bits of speed tolerance (tolerance_mask is 0x07).
> However, nct6775_update_pwm() masks fanmodecfg with a hardcoded 0x0f.
>=20
> When bit 3 of REG_FAN_MODE is set on chips where tolerance_mask is 0x07,
> nct6775_update_pwm() includes bit 3 in temp_tolerance[0] and
> target_speed_tolerance, corrupting reported tolerance values and causing
> pwm_update_registers() to OR bit 3 back into REG_FAN_MODE.
>=20
> Mask fanmodecfg with data->tolerance_mask instead of 0x0f in
> nct6775_update_pwm().
>=20
> Fixes: cdcaeceb74ff ("hwmon: (nct6775) Add support for automatic fan cont=
rol")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev
> Cc: Anton Lundin <glance@ac2.se>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110035955.3968=
731-1-linux@roeck-us.net?part=3D3

