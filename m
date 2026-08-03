Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16A73C6600
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 19:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785786149; cv=none; b=Zv0llp/TvM3avUUVstoXsUmuIvAQf8+fGUOLBF9AqqqsOsw9agbtREh0QElkXtxxwg9l7H7mVwIiD2YEgN9mstAYDKpI+4zKpMs2Jak0zafkwkr2fBzn1QGrWCsr3+njjOyRxShIS6EmaIte7ohTFNce5kwy1X/hieJrGPjW6JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785786149; c=relaxed/simple;
	bh=5BzaHKDmQLJsLjTwy8R9XSHQmbvPDrd+HMf8hdR9Stk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UThltX99vHkvrU2hKHlFLkiDN8OnSn3xAZ4z7xGaUS++80vHvFHvpycDApNr6m0TzERDUNAvlK0NUIqHxl831OZmVfFtF54XfjUJdaW4YA3zSeE5GDVh9Jf/wdG5t4MWiErIBDxELioio/Nmq+vO8DhQ3y7G9F/x2JxxfM9Ozes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQuPaCsn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQuPaCsn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEB71F00A3A;
	Mon,  3 Aug 2026 19:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785786148;
	bh=5BzaHKDmQLJsLjTwy8R9XSHQmbvPDrd+HMf8hdR9Stk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WQuPaCsnpKt3/vDf26E1W8DBni04mqvvU9Gc8RLdKZtaWH1+rfAzf7xPBQYPJPz7a
	 JP7P96cPukCKH4s/BCMGE5ygr5u204xrIJ/hs4/IAWjTmtq0X7jXoi3RnBjKb0+tdn
	 fLoDQ+wpFoq1PDhyfVPvc3/CdmsXXncH+hH/G7E2cMRAiPOP5l4jlb8+62GLeEFNhT
	 RDh1hrLJZA+XmD5dQVSkdJfl30RnyWxvlm1WRcfBLKNuRafprDX8GfyBTKPdDjvLjb
	 7Q+GzsNkwP2MPoQvsL3erLARtwQx+NmpvJJ4YU2L8fPMjPjS+zopjP8seEFYRQpkP5
	 J0Lj0GcPBaSDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] hwmon: (pmbus/ir36021) Use
 pmbus_read_smbus_i2c_block_data for block commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260803193535.2286578-6-linux@roeck-us.net>
References: <20260803193535.2286578-1-linux@roeck-us.net>
 <20260803193535.2286578-6-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 19:42:26 +0000
Message-Id: <20260803194228.6DEB71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The driver uses i2c_smbus_read_i2c_block_data() for PMBus block commands.
> Use pmbus_read_smbus_i2c_block_data() instead to enable the driver to work
> with I2C controllers which do not support i2c_smbus_read_i2c_block_data().
>=20
> Drop the functionality check to get an explicit error message if the
> required SMBus commands are not supported.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803193535.2286=
578-1-linux@roeck-us.net?part=3D5

