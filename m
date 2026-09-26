Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF54534250E
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 22:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790460607; cv=none; b=rRk7EbraO6d/JqB8hbIHoF3BON7c3FwfT2yYP46xHzDpnG8z5ydM7A3oy/VegDjlZlBpctoSkRvW7OgyH2OgbpG1AyNiytuLZY8p7napTTkh2ahkQFEUOphpgnr452oAowRl2Z6ynW87vwRQoCIsxRAmGTO/yUpxkNIw+VppfxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790460607; c=relaxed/simple;
	bh=6BnaMuYN4tE7Dg5DjrceLhRhepFYFYJyhuWxPUX9f3E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=npSMktYnFFcYab1tii7ZNJXVyJivwWSMQfXQOO6pRhwZd4LKdUD0h+wMkFQQ6rqUsEbSRhlpLxcDsdtTVveXTWrsVQqomi/Fawp9W8g8p85I3xC6ymcDiEIz21Nxb/HOj3tkVQGQd1fZzWiewJCOT2zigM9Qfb99zrIEG2viQ/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQ/ZCt1/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQ/ZCt1/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F291F000FF;
	Sat, 26 Sep 2026 22:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790460605;
	bh=6BnaMuYN4tE7Dg5DjrceLhRhepFYFYJyhuWxPUX9f3E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OQ/ZCt1/OAyexNGPy5L9hcnZWz6YjpcuqdN8daTtt/YERhxR0ers2ugLA1lztCLAR
	 XGocQLycSF9Fa71oXFr2wdh0uScO6EXZWxE/etOCbGmvRkpAp28eDvhec4bS+/V0RH
	 n76ZB13hG8NCf6vZAvCmANb0QUDbj0AZ3jFraw+WdS1/UJKM7ciHqCl+fMRo0i2wO7
	 GQF3C5uIert5g4qNX01/sNi4rFnRITOpcA2njPPx/Wm6csgZ02VQKjJ6ot0jQB8c1z
	 4zgVV/I041632EgI0+4smTkCJMuu+1Nzjoag2KXspyw4ltRuoGfPV6nDhF0mO7NvBk
	 w/4UF5rGv9mIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/ucd9000) Add monitor types 5, 6, and 7
 for UCD90320
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jason Luo" <jasonluomath@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260926220522.GA63217@DESKTOP-F7UNNQO.localdomain>
References: <20260926220522.GA63217@DESKTOP-F7UNNQO.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 22:10:04 +0000
Message-Id: <20260926221005.21F291F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The TI UCD90320 power sequencer defines additional monitor types:
> - 5: Input voltage
> - 6: Voltage with AVS
> - 7: Input voltage with AVS
>=20
> Because ucd9000_probe() only checks for monitor types 1-4,
> voltage rails configured with types 5-7 are ignored, and thus
> are never registered with PMBus.
>=20
> Add handling for monitor types 5, 6, and 7 to allow these
> voltage rails on UCD90320 to be detected and registered.
>=20
> Refer to section 10.6 in the documentation below.
>=20
> Link: https://www.ti.com/lit/ug/slvuaw9c/slvuaw9c.pdf
> Link: https://www.ti.com/lit/ug/slvu352g/slvu352g.pdf
> Signed-off-by: Jason Luo <jasonluomath@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926220522.GA63=
217@DESKTOP-F7UNNQO.localdomain?part=3D1

