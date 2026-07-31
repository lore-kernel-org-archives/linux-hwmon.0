Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09F23F9A15;
	Fri, 31 Jul 2026 11:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497860; cv=none; b=RKfhPZ/R/MDw8kXMopfWZCYk9IjU83TVeHJNA9JXgzJapZA9JiudphjCRde2lJOnh5TzgqeK+FcYtM4U8cY+oaUQqMHmAz0XBXAoy7g5mc8Cr4KIRsIrPCvjtfD4OMNWx1FH1iO1nQbtex+3SU4VVkcIIzIe9YpOJkCE7V+ZbE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497860; c=relaxed/simple;
	bh=S5Mz+9r01O/TpURpQ92XbekJ3iNr9IzFYxPupEQnUyU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tMNdN6mGA8nsbX35vNRvPkClAn6+dhuK24Bw9jp11OtCZG2Y791z1LoMfodHtfgZYur0+JPCmt1F1aJp98dYTBGhdye9RLNMwKDEs7itiDDWrZLxfFSTEm6BODN/ZQW/Nlf8oiRSBj+FZpNP5ANs3XtnXOFQI7z9QeNUE7U8Y8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWaxMdBa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWaxMdBa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159311F000E9;
	Fri, 31 Jul 2026 11:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785497859;
	bh=S5Mz+9r01O/TpURpQ92XbekJ3iNr9IzFYxPupEQnUyU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MWaxMdBasE5sDATDV6PhJiE9hlQUpdhcWzHZLpZlWV/ElAiY3NamWy+fsRzsq4LxG
	 mMV8GZTyM6uttggoYz8rWZlaIi0XnhahoraLPW54yEkGhGip5dwHIoaOs3CbYpxHsU
	 QrnjvugtwzhInHubj7oe/JA2VUu3XSJJ+1YGoQJvss2mYpphPY/zptwlUBU+Vtgru7
	 VSWw/oG0d6nqN0Y5Rgkn24rc4DHrkxYpTedpY0UDGtZsJNCfFVUN2xFc0sKB1p7gxS
	 MobjAQJfLAJPCRE2FNlpyTTs+BC7FBlv02AK9UFQZgEA0KY/NRs5NGJdjioNMwY3hs
	 x/LrOT60zIPEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] hwmon: (emc1403) Add regulator support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731113007.145322-4-clamor95@gmail.com>
References: <20260731113007.145322-1-clamor95@gmail.com>
 <20260731113007.145322-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 11:37:38 +0000
Message-Id: <20260731113739.159311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add support for VDD power supply for this sensor. It is required on some
> devices for the sensor to start up and work properly.
>=20
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731113007.1453=
22-1-clamor95@gmail.com?part=3D3

