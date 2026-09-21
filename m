Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7903B3C05;
	Mon, 21 Sep 2026 07:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975210; cv=none; b=f3Lkn6L4fFdw5J2cLDdUJxrL4G5a7W6106TbeWnfMtmbQd0xTX1ea2jAszxaIk4UJGBDX+GBqv3opf0GcrlLxW+VqzT4NXJlrDxCInWwURtvUdaZGVWOZVYkQOTd1oQTIrWXRMO4xBwj2G6rErUumN5svT6J0fDpQ7wEDR9+U4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975210; c=relaxed/simple;
	bh=+aX2JJ4Iswh1L6Y/sBiTWUIPKfx++Z1d77AYjAKHyNs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tAZCGcFrePihh0ltFzDhGvALIVI86dKunIGFfq/3/U7sZLDWC7+zJAaZGm8n8hKfNf1T2owxn8Z3ENgQ8GfhbFUep1da/x1z/fy+KfTOhOckUD3Pd/U9oodAyJaIzCyEiNDKsh+qV70RpBHKLnKJ146Tq3/U6YxrkxV/7kd9Y5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZzQfup1p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzQfup1p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD4381F000FF;
	Mon, 21 Sep 2026 07:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789975209;
	bh=+aX2JJ4Iswh1L6Y/sBiTWUIPKfx++Z1d77AYjAKHyNs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZzQfup1pnBd0airF6thFcYc7EWy4eNe62VQdcIC8zx3KFp1YdvnLotWpmg43Cs6da
	 2yKD/0z78o4fK66iGhSmKp9Wwc/y/B7cHgzattaIjR9fOrvV7uDtlEH9PM9eRohgBS
	 4DOBnEv4XWPcwSsNbnzSpziNNHURCLmUgtnHIaX9BZTJminMA7V76+gpMw30D800X+
	 sLMYaRw5PormYjee35kr23at6tOCdp/IWUTGlti6594DNCoa3SMQ6gzrbDwgKkjD1Q
	 E4RKf7hXS23r6Kkhse8rLqzmt8jgjSUaRwfk6Uer41WKpxI7YYpdFxpBvfvAdXR5+p
	 AawP8RP6NFy5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/isl68137): Add Renesas RAA229639
 and RAA229640
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <u8813345@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, linux-hwmon@vger.kernel.org
In-Reply-To: <20260921-add-raa229639-and-raa229640-v3-2-b104ee8a70b2@gmail.com>
References: <20260921-add-raa229639-and-raa229640-v3-0-b104ee8a70b2@gmail.com>
 <20260921-add-raa229639-and-raa229640-v3-2-b104ee8a70b2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 07:20:08 +0000
Message-Id: <20260921072008.DD4381F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add support for the Renesas RAA229639 and RAA229640 PMBus
> voltage regulator devices.
>=20
> Both devices are supported by the existing raa_dmpvr2_2rail_nontc
> driver variant, so no functional changes are required beyond
> adding the corresponding device IDs and OF match entries.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-add-raa229=
639-and-raa229640-v3-0-b104ee8a70b2@gmail.com?part=3D2

