Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CFA2C11E4;
	Sat, 25 Jul 2026 21:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785014791; cv=none; b=mNiEGMexh4vafG6WPRvVVqD2nu+i9ljCiooIekm80L50Hjga79ccA2yD20sWcmgIpnNLRVRybGQ3K/n8cpsC4OeTQNCvjEHNQFD3xmPzxh560bzItxwSz1Riq4eBqjjNz7Ph3aWPGAOXc75vDyk4bb9jfhwzLsWtGu4SDpfK8/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785014791; c=relaxed/simple;
	bh=mIMKdvktFfLIHLgFUOWL81fMVJ13rTd5v6qZ72+LrX8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=taBhbQxWMhS9SltCEJl4gDw4kUfktTjvYiBUT7WhSoSpgT92/misBEK+s/0YJVWNPhrZPFCGtrS8IGw74IogI1lAWRPAVbDF4LJYKQdNy1/pQtcjHxRyAnkQ9lfd2qILgQmQVdYdL6lVfpFISeejiOWsXmBwICroy6UYHPk00bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEzP+KrY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEzP+KrY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58BFF1F000E9;
	Sat, 25 Jul 2026 21:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785014789;
	bh=mIMKdvktFfLIHLgFUOWL81fMVJ13rTd5v6qZ72+LrX8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TEzP+KrY8TKj2xdDnlEJeYNYHWghwGFSFbgQigiHdVhIpvKc6O0/NLtBE93avcNDd
	 PgxUZ3Uq3/rjVkkltc7x+gXZEWXEk/cMtUPbOdny3+4w2A8EMilu3AXb+tp/CRxOnh
	 Xvrw1cLIFUMzA1OwElWmYh1EWByJc9NYg+4DUqzBWQ9blh4Y9/6EgwQ+PN4YA+7WJ7
	 JJPAqCnQMLzmZFYuSyiLtzE5+HRKXZkxxalhMwALXyleilEIYS7m1Gy8PqjIC2ytYR
	 RUscoMhetBW3x0Q8BQqQscVIwqKwcHPRhr9cVdimzlLoSiGA7zH/BPMnxwLgF4nEQ+
	 8ZLvKMjdkCV9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260725211945.288415-3-sanman.pradhan@hpe.com>
References: <20260725211945.288415-1-sanman.pradhan@hpe.com>
 <20260725211945.288415-3-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 21:26:28 +0000
Message-Id: <20260725212629.58BFF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Georgi Vlaev <gvlaev@juniper.net>
>=20
> Add a PMBus driver for the Analog Devices MAX16545 and MAX16550, and the
> Volterra VT7505 controllers. The driver reports input/output voltage,
> input/output current, input power and temperature over PMBus. All values
> use the direct data format. Peak input voltage, output voltage, output
> current, input power and temperature readings are exposed and can be
> reset.
>=20
> The reported current and power depend on the external current-report
> resistor connected to the ILOAD pin, which can be provided through the
> "adi,rload-ohms" device tree property.
>=20
> On the MAX16550 and VT7505, the severe-OCP deglitch time can optionally
> be configured with the "adi,ocp-severe-filter-us" device tree property.
> When omitted, the existing hardware setting is left unchanged.
>=20
> Co-developed-by: Dhruva Devineni <ddevineni@juniper.net>
> Co-developed-by: Debjit Ghosh <dghosh@juniper.net>
> Co-developed-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>
> Co-developed-by: Avadhut Naik <avadhutn@juniper.net>
> Co-developed-by: Santhanakrishnan Balraj <sbalraj@juniper.net>
> Co-developed-by: Brian Mak <makb@juniper.net>
> Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725211945.2884=
15-1-sanman.pradhan@hpe.com?part=3D2

