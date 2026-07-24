Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784071C5D7D;
	Fri, 24 Jul 2026 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784912028; cv=none; b=ZLXam0aF212uVDhZRZUfMNAEveCcvF6aDa1Rvri3uE7C/CaFmHuKiAFtfKC0WWlv6Hi8L2GJm4m1Y/QtqBik9dXZSKIyKegX41J6cunh4pz0VdD8qvdDypU1KPIliGmknEiniS1SQZYJSebC+bVSZN18Sx6RdqMB6O84hlYvqrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784912028; c=relaxed/simple;
	bh=w5bVi972XEbFIpszKIZ6oxgAkWwOETqM4piywIzhY2I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tQMoEmORv30mUrF3r1qVfSuEm1VUjPZA9Yae9lceU95V7LfgbXSp1wUByA0nuwmrvitg4tgkYJ+M8/m4yHs6MKP1TJdBFiT022lPHmXTZL9wDXHtOAVarhC2Z3xA6qiLWjXY20Tc19C3TKf2fzS0u51Y0KBB0i4JC4l4tY7M4VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iocV83Pb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iocV83Pb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49371F000E9;
	Fri, 24 Jul 2026 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784912024;
	bh=w5bVi972XEbFIpszKIZ6oxgAkWwOETqM4piywIzhY2I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iocV83Pbk/3m4t2LWOr7HAyeKriPe60KF5VQOiOhTrBhipq/n6FwA8nAISKpu/guI
	 R0gKJDt/OQYa7dI3fYwtqXZ6TcOoJfyjlbqLcqsy8PD6dLe7lXrbrdya2gkheV2SXk
	 vmXrBY8og2XE92dGoyjp8p0CIrbtRGv22shN4U4GcXzlH/ua2Zxq3/yaQCZL3K8kNt
	 IDI8Nrs9reZxFt6h+da6glZo4j/r/ccAgw2OzHUQtFTk/j79LdxJqS2J1MKQ3uMYkx
	 ZDagtQlvs48/q9AWxyJ94RiqEQOngml9ru3HASi+4O8o4vrabXLHHn9lTFIElJ+gXO
	 0QWvZaTZAoZNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX16545/MAX16550 and Volterra VT7505
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724164919.247162-2-sanman.pradhan@hpe.com>
References: <20260724164919.247162-1-sanman.pradhan@hpe.com>
 <20260724164919.247162-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 16:53:43 +0000
Message-Id: <20260724165343.B49371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Sanman Pradhan <psanman@juniper.net>
>=20
> Add device tree binding documentation for the Analog Devices MAX16545 and
> MAX16550, and the Volterra VT7505 PMBus controllers.
>=20
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724164919.2471=
62-1-sanman.pradhan@hpe.com?part=3D1

