Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AA4421223
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 18:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534956; cv=none; b=GbQ5WclmsM1M4XnrZldlDe/kgRxZ5biEpdE83k8dvNIo9y3bItLw1954+9yJLtxGCgD+gnIW8Wc2zmTxx4lz1/g6uTOrcUScc/n/HSaA/79CcOFNGVHY9l4U4sEPhDIqd3c7Qz/PrKNeQBXWAUpqSmiGi20EdUnFR8r0JxYhwF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534956; c=relaxed/simple;
	bh=yUrwom+PM+rTPHeT7GqQrjcSUTPPDQwGgZOmSHvUjCE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QDvd6OnK1U15G4tlIvMTFFGuYXX+XgKMqxI1xsHOSr1w8geUutt4WmPfYOqrKXx8Hsb+iHOjkcO8Gyi22gMsvHCTSaFABcv/hxYe+eainxZfu41oOMWoM68be3oJiUDgYO6qMlS/U0qe5fZRi1ETU4sh6EHm9q12f6VMz6e/Tv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VG2fhnA1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VG2fhnA1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6291F000FF;
	Sun, 27 Sep 2026 18:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790534955;
	bh=yUrwom+PM+rTPHeT7GqQrjcSUTPPDQwGgZOmSHvUjCE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VG2fhnA1FWgqECbp+2xmhoSCvq2z6nrbDxkluPq5fIo70g41Fvfxnt8NN72VYYgnu
	 F6j22AERyJB7aFUKvr9U4bCpX6cowdVvE2oxIs/99F9+NeF3Xa2KhHDREI3L4CU/vj
	 z6QvZJocn6LzgRsb1+EyqWawnjTEl8qXQFOlHwGyzJ6Ll3ZSF3V1Lf1yD/LHC25prE
	 n3I5fT8XX70V91YpxvSs54GyqcY+KR3MKBtqmqmh4ltaKRwgcU5eRIYDyZrORN41h6
	 AhLEpNVYOw5OMllWMXd6qQ2fz9zlatCSVnuAtLtYSpfh/MH6bNhF4qEm5FXG10WN1R
	 qIQkU3YI1UzxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] hwmon: (aquacomputer_d5next) Validate incoming
 status reports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vas Zayarskiy" <contact@vasily.cc>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260927183723.4078226-4-contact@vasily.cc>
References: <20260927183723.4078226-1-contact@vasily.cc>
 <20260927183723.4078226-4-contact@vasily.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 18:49:14 +0000
Message-Id: <20260927184914.CC6291F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The raw-event callback runs before HID core pads a short report. Check
> that the report is an input report and that its length matches the HID
> report descriptor before decoding sensor fields. Otherwise a truncated
> report can be read past its received data, and a feature report with the
> same ID can be mistaken for sensor data.
>=20
> Apply these checks to every device using the shared raw-event path and
> check the report ID byte before updating the cache. Legacy devices keep
> using their separate feature-report read path.
>=20
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927183723.4078=
226-1-contact@vasily.cc?part=3D3

