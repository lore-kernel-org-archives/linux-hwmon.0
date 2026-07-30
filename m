Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953EB438FE4;
	Thu, 30 Jul 2026 13:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785418978; cv=none; b=ACmDO+Zdk/+Xjefu4TQYn+cX/WV+rs1XiidyIALBv8Un6gdk7JZPVoSXRi1EO2rl1F/pwozN8py9BcWzhDimjxXtKctfjgOQaywP+7RT23c5GaIQ7oXxir8DAabB5DvKYnJC/8oERw35N4jTkQzmMlAjayPUbyOKTHNvSv+xZqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785418978; c=relaxed/simple;
	bh=EmMjA5WZjBmCs0Wkz3EbMDtAA1SKrUrovV+oXQM+Aa8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rBkfTB8if3EdVSY7zqT5JUOtk9mTKcmeGzij5dmQ1nlHJ5drVUiC442zFc2X6fo80GHMi89U0QMK7x1h3bLUdS6G0tPnacMvqs2dtKT6IzT3Ac2eLgyVk0vY0NZWAUV0h1RkWTGA89WU+VfbrXcN+6dn+AqGj2kD4Mxi1djwNc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idA+3ehz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idA+3ehz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E9E1F000E9;
	Thu, 30 Jul 2026 13:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785418977;
	bh=EmMjA5WZjBmCs0Wkz3EbMDtAA1SKrUrovV+oXQM+Aa8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=idA+3ehzm+v5O6WUzLUFJyJ37JCpOsLHxtKGn+L76gbE6zQWSxLU0ydMNnwHTwvUZ
	 83UXfvBlG8AhVm11RXVF2Lu7f1f7vG7pi6tm/e/+RZ1tnIjsyfF4PcP2qLD65Pg8tx
	 75Neaav6HsIU7EL1nbblQFrUwhK6YbNkgupP682KJVQTvO4lFAcrx8DDNq7E9jtAyn
	 sL3oExaJhKoZGs3vxRHSyUv2An4v58wdQEuY/Ni/KGNrmNi3lTo6tf4b90uib5G2rk
	 Ls560PQFlrGsjWDkBYlXXSzU3ygK4Ta6gPmS4kW2bqLSwcRsR8GVdSjNoWddo/MiW9
	 fZ604LnBqi5RA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ti,tmp401: Add label property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bruno Thomsen" <bruno.thomsen@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260730133058.14731-1-bruno.thomsen@gmail.com>
References: <20260730133058.14731-1-bruno.thomsen@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 13:42:56 +0000
Message-Id: <20260730134256.B9E9E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add support for an optional channel label property similar to other
> hwmon devices.
>=20
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730133058.1473=
1-1-bruno.thomsen@gmail.com?part=3D1

