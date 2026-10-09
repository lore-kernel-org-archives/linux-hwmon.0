Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7EB4E2F2A;
	Fri,  9 Oct 2026 12:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547303; cv=none; b=EoyRBd/nLISHfCror+Le07UrBLAcNoD2mUvuuz+Mf0jeeDivCQ/Mn9koq5DXfepymPIz7bv+xTXSS1A2eUP75gPkSkRF1fd3kYsy39W9o9UHkRhdcD6bNvA6SIMIzK/bBEogUlLRZ5l+oy1tWVdKVQeAPHk0DqVbUwrn5xcvK/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547303; c=relaxed/simple;
	bh=TCAcFJPKlfs9z0j5fkTS9ZyrMRSLqfgRODhb2lystjE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=q0xB5G8fdLq/AdIkdwfq1Z87zAYOLDS2Y4QoqvSQBFNuWMnBg9uSqu1eIrBaG3Bs9fBIRoSMakds06Z4zesZsYfPH1XLcfz55xCrBPbErPw4B/cZMxkT66yJtDnXlVkmF68a0kasBDmq+IlbBzhFG6lqCt3WJBtKVpWbgsoDZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pj0+oVtT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pj0+oVtT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333761F000FF;
	Fri,  9 Oct 2026 12:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791547297;
	bh=TCAcFJPKlfs9z0j5fkTS9ZyrMRSLqfgRODhb2lystjE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pj0+oVtTBn29snmuNelijPZ7ERZEev5Lilu3HkhXLI7D2rY3va+QQHcPEoKM5CUXd
	 RX5ZZV8TPwWveqizKlgSWhOlicsmoQyyg24MwIBN6Aw2JZYW4GReP69zaf6ENj3UiF
	 /K75f57duR/niPGAh92impbVtyDed17XwDKM0wkRSP6VxVMUaqNgVDrWivYrrnug0o
	 ZrYY9RPys7fEuwdNvlodpZ8KTHtkS6Oln+/c2Tw3xgo6Vc3H5ytkDTfI5Pr6vT2y3r
	 TMtaqnkxwmuQVLr09Yx+mCr06KSOymPF9ZKBwMzD1XDzY+Z2XimmebbtPoYrS6dTjz
	 ND2T09WPvSAvQ==
Message-ID: <sashiko-outbox-165463@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: lm75: add MAX31875
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Erasmus Mari Geronimo" <johnerasmusmari.geronimo@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009115617.1976-2-johnerasmusmari.geronimo@analog.com>
References: <20261009115617.1976-1-johnerasmusmari.geronimo@analog.com>
 <20261009115617.1976-2-johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:01:36 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add MAX31875 compatible string to lm75 dt-bindings.
>=20
> The MAX31875 cannot reuse an existing lm75-family compatible such as
> adi,adt75: it has a 16-bit configuration register (instead of 8-bit),
> four independently selectable conversion rates (125 ms, 250 ms, 1 s,
> 4 s) and four independently selectable resolutions (8, 9, 10, 12
> bits), and reports its alarm through a different configuration
> register bit. These differences require dedicated handling in the
> lm75 driver, so a distinct compatible string is needed to select it.
>=20
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analo=
g.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009115617.1976=
-1-johnerasmusmari.geronimo@analog.com?part=3D1

