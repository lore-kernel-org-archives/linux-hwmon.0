Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C32639EB59
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 14:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779545603; cv=none; b=dIU79bQyTCElyrPigSqjcV6Ab/dSU01OWO/UAz5ZXdTOrIi/Ji/4DYIT8kJj+PpdvVUqMItJwp0LegUXcHIWpWwizSA/7NeHveBJBoZbaHLAaeELcI4USOUsPv4d7pPjnpk18Wvwi5uNvwepN0Bw81rgBFlrCIs9CzpU+gshX5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779545603; c=relaxed/simple;
	bh=pAVObDito2FQepQU7kmHVYABad/X0W9y3KDOf8ifpTM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NooOhmPuNVu60UmraEOdezyDQHC+rfWn6mSpfAFp0EElE1RhLFu5GSBxY/HWdOQfzbqWqq7uWDBjvzV42jsr950U88CSDUp6KdT5obTvIo583b2/tmc7nCyMrVPacDdGlMqxmNKh/J7mScw0tsGW+d/kwReUFaU2oZeQ64joz3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZdrLNYz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZdrLNYz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1821F00A3A;
	Sat, 23 May 2026 14:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779545602;
	bh=pAVObDito2FQepQU7kmHVYABad/X0W9y3KDOf8ifpTM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FZdrLNYzC/rfoZ//IaoenZaPIKyP7onSi1sCngQBmITIzrnrKS0n9WKZ/KWNnxWwq
	 Spqf12LS7Z0zKp6n67O5ekGXm9spkSnEyjO6+vpOjGN/B8i0TFii0QjqiXECpgVtL8
	 3IDjXPowGgvse21WRkisqQGJ/o+AFkCvHQ/gXG5o5FWBAdCDoU0Trs61BzI57o45mF
	 2fpFGfrOg+U8HrS8uUoup5n+oXFmKIQx96HAbBCWOHDQhF3xPUfsssozr9zqgYq+OV
	 YzuE7Tj8f2EGpKvf/Uk/UaIAjfLNfwYZhUbJLjfoV7LhSuv4XHrkf9bWnP65HbHcZb
	 gca4A50yclduA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] hwmon: (lm63) expose PWM frequency and LUT
 hysteresis as writable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan-Henrik Bruhn" <kernel@jhbruhn.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260523133617.3439102-1-kernel@jhbruhn.de>
References: <20260523133617.3439102-1-kernel@jhbruhn.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 14:13:21 +0000
Message-Id: <20260523141322.2F1821F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The driver caches the PWM frequency register and the CONFIG_FAN slow-clock
> select bit, but never lets userspace pick a different output frequency.
> Add a pwm1_freq sysfs attribute that selects the closest SCS + PFR
> combination for the requested value in Hz, gated by manual mode like
> set_pwm1(). PFR is clamped to 31 so that 2*PFR fits in the chip's 6-bit
> PWM register (matching the existing scaling assumption in show_pwm1).
>=20
> The hardware LUT hysteresis register is shared by all LUT entries, so
> the per-point pwm1_auto_pointN_temp_hyst attributes can't be made RW
> without N-to-1 cross-attribute side effects. Following the max31760
> precedent, expose a single chip-wide pwm1_auto_point_temp_hyst attribute
> holding the hysteresis amount in millidegrees; the per-point attributes
> stay RO and continue to show the resulting absolute trip-down
> temperature for each entry.
>=20
> This was tested on a Linksys LGS328MPC switch hardware where the fan
> would not spin with the default PWM Frequency, which is why this change
> is required.
>=20
> Signed-off-by: Jan-Henrik Bruhn <kernel@jhbruhn.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523133617.3439=
102-1-kernel@jhbruhn.de?part=3D1

