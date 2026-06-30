Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3804C367B9D;
	Tue, 30 Jun 2026 09:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812166; cv=none; b=NpPu+Hov6dW6sRti99W86BNNwIFiOQRfRIC10/5a0/XRZqWO8eGOmwojPzFwGL1GKxlcQtvAirmz91aczgYpN1n2HSKcLrywv5AD48Xv7T5mo0xqX+Vqn3zc6zocQV+Gs5WU/7DUE3Wb2FgkO1WL5UASLR7ejPTxdSGB+Lo6Nco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812166; c=relaxed/simple;
	bh=RT7/6cIzCxpUH+LuBvNaCrYYzvBL9cNoNOjxER+dH90=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gasgLUcMml79irBj7GZzxebVGpu6IMaFjWwT/Y1pSTRNPawjklBSsa0Fok+dtjXVbmh0EgmwrieA6ZusHvnA/anHf1Ac449psPDOVIkpqmtRnpqscHlwCjOY2lf3npm1NCaqc2MgrsYY7g2X49IbMyw4jihAdjbzEqwMtb3eqnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9iBlf2z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9iBlf2z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A72C1F000E9;
	Tue, 30 Jun 2026 09:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782812164;
	bh=RT7/6cIzCxpUH+LuBvNaCrYYzvBL9cNoNOjxER+dH90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a9iBlf2z9I+qfWLUuyZSUUGZcrAgLDo00f46vkmIslH4q3+4rFKyoZQiQM16seigc
	 feFVS/KpBnFQyVKulVa8GRd8C1SxqVts9UhwudMxE5/nIf7aDK5Np5//YARqTIs3Vq
	 U7LZF1MCdK9KCweX+RBtonZ4pAdyC2HSLIDuO/QXA01SOih08OKL5kxjrn7Rmbw0zK
	 xgxrn5qIZAN7sP9rdLXr2mAEOIQw+RhZFyFVLRZofQNyP0RNasNKWstKnRo5cheeq/
	 PxmzEY6U2deGo9IzOU4s7LDckg+9eDbHWW5CNU1neHLuff58P0tbsFjCM6jujx6tbB
	 e3MHk6bMBWmhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260630091220.1608-1-dongxuyang@eswincomputing.com>
References: <20260630091040.1407-1-dongxuyang@eswincomputing.com>
 <20260630091220.1608-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 09:36:03 +0000
Message-Id: <20260630093604.7A72C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Huan He <hehuan1@eswincomputing.com>
>=20
> Add support for ESWIN EIC7700 Voltage and Temperature sensor. The driver
> supports temperature and voltage monitoring with polynomial conversion,
> and provides sysfs interface for sensor data access.
>=20
> The PVT IP contains one temperature sensor and one voltage sensor.
>=20
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Signed-off-by: Huan He <hehuan1@eswincomputing.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630091040.1407=
-1-dongxuyang@eswincomputing.com?part=3D2

