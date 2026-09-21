Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397B24ABBCE;
	Mon, 21 Sep 2026 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002560; cv=none; b=HNbsZ1tQsCKdO0S8FSwmu/hmqJIq1KE+2pHM4gVbFgyTteE/XcIQQ0pHrlls16ShwCpsHlIbkcTx0z+YqaTEraC5rDLcy78gVpGHeGDv0vCMNju3iU1boarsWGpdCHzEHCETld8l6AMvbyUNhYkcZW/TsFN5OMy/pZ/RfUkfQsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002560; c=relaxed/simple;
	bh=6vV2A+4sRxg9D/aXDJnVNqxfvCbJ5h1TVXK44L7EQRE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fIQ+Ly29Qs57fwJKLPV/1o8o4UtcXqa+9TCmL/ojQi4tLlbuk67vQdXKbdgbs8XFOAFSUuutpdfs0e6taPppkbCrqMkqXEd+L5BQ4QIVBPYYMpVazjjZM/owqP1bVZS3mDnaH/qhvP1xO7vO98k9jeh/ChFcsArQZvfUVzBfw4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k02LeIiq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k02LeIiq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CAA51F00898;
	Mon, 21 Sep 2026 14:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790002543;
	bh=6vV2A+4sRxg9D/aXDJnVNqxfvCbJ5h1TVXK44L7EQRE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k02LeIiqcaGAP8TtyepROpbOG91aEyPp/Kb8f/ybL+PZaJRz7I3hdqqNLQGisr9vO
	 hoGF6q+/FkgmmR+xfUxzVHL2Mx+3nkunVwI/tmBdWmdKf4xeBg0U1H1EON1L6i3UY8
	 ernebpN5FMLV/FOD+vYQPcV2HMMUgqsHM6Db1LtAQCfiMrjmGSmyJPWI1iM/J3IGn0
	 npEOoMXXcNTc5lBaZt2iH6y/wAFhJG3clM4UHU4o8R4PzeJ3W0lsKR/r7gJVm2czsa
	 KVeWxdNdgm3QJyJPdgXed3OBbPkgy9ViHs2HhgU7jxJkj3akT49B2YKJXgj9TlwMnM
	 EfLBhFy9Fbhew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add
 the embedded controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921144953.15113-4-okerixx@gmail.com>
References: <20260921144953.15113-1-okerixx@gmail.com>
 <20260921144953.15113-4-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 14:55:43 +0000
Message-Id: <20260921145543.9CAA51F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Describe the Compal embedded controller on I2C at address 0x70. It
> provides the board thermistors, the battery cell voltages and the CPU fan
> speed, and drives the keyboard backlight. Its interrupt line is TLMM
> gpio66, falling edge, for which the file already carries a pin state.
>=20
> That state leaves the pin without a bias. gpio66 has no external pull
> and floats when the EC is not driving it, which shows up as a steady
> stream of spurious edges; the vendor ACPI tables describe the same pin
> as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.
>=20
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921144953.1511=
3-1-okerixx@gmail.com?part=3D3

