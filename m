Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C0C23909C;
	Thu, 24 Sep 2026 08:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239607; cv=none; b=DpkP9PmMb2LISRMYRrO/Gwltjv+HyGSyWFJJXHMWAsOfk/hO2i80PXGtsXIU+lxZ55j+llFPQMw7VTDKedrVFjBo7demyrXbZHNFaXgtKaeZPxLPsXMDbZivS3HwrPgWaSwHMT6Nu9hFdA6EnSj3DQE6HXrq/6TLBVHa9ji8Drk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239607; c=relaxed/simple;
	bh=KgklrhLhFHNpt/t1Qta3bLb3HUwDLAiVWyXKgUBQ4DM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HGr+SCrSRfW2JzMnxBvZje1icSj+/vszmEGZJaAhfi631bZqn9a5H1BvUwty9iemvAfKxy8onqVkEyCXqZgMaPnQ7WOeme4o2nEMXY3IvH4nVKVTpNWcIBT0QkZ/lHhyDHEnuP3USv3L2BJOlsNHnKbP3TV6IcJaBN6/vmbHYB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xl4AdrKY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xl4AdrKY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860421F000FF;
	Thu, 24 Sep 2026 08:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790239605;
	bh=KgklrhLhFHNpt/t1Qta3bLb3HUwDLAiVWyXKgUBQ4DM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xl4AdrKYoBXgxRAfdrjnO9YmmESY4M6PVL1Fw44fXu2BTATmp2BlsJcr/BzobtQPL
	 YPbwTV7MOAuuLrVGe4p7jjmDPuweC6c+782zF1cLWJ3Chq5866xrq267y99Vx2ND1k
	 q3uepfvY3cEwsQwo3K0Zzg6QNEm/uJ0BeC66bO2Ioai3jknNde8eonV8UXkUHkQvcK
	 blcK1TgSIfJobfOlg0BYHVHi1dlwYMlBU4FAMbra1zyO+xrJaYt/CJdGAnREj9lnVw
	 v68nVyCs51UNJaQNapd6KyltJ/O9YXY02f2SNzRoW5XpNWJAiVAB1DXNfEahydLZUe
	 70znDh5CBpysQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (lm75) add MAX31875 documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Erasmus Mari Geronimo" <johnerasmusmari.geronimo@analog.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260924084121.82-3-johnerasmusmari.geronimo@analog.com>
References: <20260924084121.82-1-johnerasmusmari.geronimo@analog.com>
 <20260924084121.82-3-johnerasmusmari.geronimo@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 08:46:45 +0000
Message-Id: <20260924084645.860421F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Document the Maxim MAX31875 I2C temperature sensor as a supported
> chip in the lm75 driver documentation.
>=20
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analo=
g.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924084121.82-1=
-johnerasmusmari.geronimo@analog.com?part=3D2

