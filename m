Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3CD33DEC2;
	Tue, 22 Sep 2026 17:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096464; cv=none; b=BNTYiSX3sy9Cxyqj6M6m6VhMTFw3Ta+PMkOP7TYZBZhovLE8JjLeGPHGpaVgug54Xrk66wurOLusUdKFesDEpISimi078dxK5AjsHW71haBpNfM3SMxIWn7Q/M5tnYH2oU7dFhYY5nBFVLpjRnwVQvc1bROZUESle8oGDZ3vmKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096464; c=relaxed/simple;
	bh=LBn6rMgoGu15bLzoHANJaDLbbuGxD7CDLjbGL1FT/7w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X9vKQQeng8Tn7iufbSGPJAqgba1zTgPqNQJV8oOlgsgYXgpuGtoIB7bc5OGflAbU0gwnkgaVI3i63D+/BECsaRFhr8kdVnKytsUSHVCM1M8gp3uZeBljhhLGpk/B1wFalLPAXa846vcRRnn1hwwNglF0LsGDfUGljbWHQnHPnhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/8jSUaT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/8jSUaT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4201F000FF;
	Tue, 22 Sep 2026 17:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790096463;
	bh=LBn6rMgoGu15bLzoHANJaDLbbuGxD7CDLjbGL1FT/7w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V/8jSUaT5K7oGaQAQlaM+vy/kLYBxSOze8dKZH5Lnh7HImOFwWheFcpXOziLCTZ45
	 qYXdXpU82cm4oBvwlMN4xx7BXommfzW9rnSmlEx/IGDdKY/zRnAnS4LFSMZ1xNrPwi
	 Kmir6XB/C6ZPvzHVGDhGNu2YLHT2sHjFQzz6QeS6mXRJ8xG309UDfbAmT9qJnaKlyz
	 IS4e8wTq/sIiDm4L27F67HmXrSQJZdLIEaFpHcze1DJd5kho4DpvwFIa6OXMJMb9jf
	 752BUoBawOnegqTVzkBgyutRuhx2tMXcIJV0wWfWt5OpgHo2HJbWLsgVUTIluUg1AL
	 uTAo2CnixzSQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add
 the embedded controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260922165737.260443-4-okerixx@gmail.com>
References: <20260922165737.260443-1-okerixx@gmail.com>
 <20260922165737.260443-4-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 17:01:02 +0000
Message-Id: <20260922170102.BF4201F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922165737.2604=
43-1-okerixx@gmail.com?part=3D3

