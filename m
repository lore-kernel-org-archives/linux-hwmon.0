Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7436A4746C9;
	Fri,  2 Oct 2026 09:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932434; cv=none; b=Pl84aRm8IJ1N1O9f7LNCzUeRImEPenXRkvaKoKxNXt8UsEjtDu4mQ262bcJEtpskg516MgJxCoGCfjx7UGyH2sFodYF25k5KZtWZEI4mKtOD06JiXMIuduV5hPWnZFtK7Tiz+nh7hoWdNPu8o4Roa4OmLBo5eyxpjZhpGGLkeyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932434; c=relaxed/simple;
	bh=iRfWW6GdIxfM6wIYoQU3h7nV1sQbx4s4wARqtMp0YKs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oxzQ8UCg3qyIp4/XByClP9usmmkZ+319K+5l194C0+QLgmHyuQ0PG5QR7X/7k0F4xtBkGEF/vPpKeISd9MDcn0JBDaoHVUYgIMU18ux64kSWSG7kbX4emlK3owKH808LN3lI3bptgohV5E+oW2R80xlGVvMkeEeYqksaqSCWi0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ysmala91; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ysmala91"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FFF71F00899;
	Fri,  2 Oct 2026 09:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932433;
	bh=iRfWW6GdIxfM6wIYoQU3h7nV1sQbx4s4wARqtMp0YKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ysmala91YVHy+oGevc9rQ0Wd0q9iNeSp7w9DjAQ8ILeyiPXDHZxdUivwVhdqrukt4
	 naztYzPCi06Iq4+SatiZjA318EK1JML5Jcqr5ROubm+77ifcw/M7zW4MMl95kM8fSx
	 yE6cm4+ZsbIVQauXpdM6qfCQX6+LF+vv1ihq/NXna+7yDmzRftK+G8B68pLtAWKbGy
	 8HS9UMvTdeSOPjlcuIr3ps1RtrsqiG9VqFiwhva1ClfrhFGDTNp+LVIE6lUoZfCsqS
	 n7yDcvw1W076ExyTXuoZrts5ZttpqCnizTS33A3554wzBaixAfZPRjqrgECv2ZQsYf
	 8dn1nb/yTYU8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: hwmon: jedec,jc42: add
 #thermal-sensor-cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20261001-for-upstream-dt-jc42-thermal-sensor-cells-v2-1-6edd30b082f3@free.fr>
References: <20261001-for-upstream-dt-jc42-thermal-sensor-cells-v2-1-6edd30b082f3@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:13:52 +0000
Message-Id: <20261002091353.0FFF71F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vincent Jardin <vjardin@free.fr>
>=20
> Since commit 032c1623c9de ("hwmon: (jc42) add HWMON_C_TZ_REGISTER") the
> driver sets HWMON_C_REGISTER_TZ, so the hwmon core calls
> devm_thermal_of_zone_register() for its temperature channel and the
> device can be referenced as a thermal sensor.
>=20
> The chip has a single temperature channel, registered as sensor 0, so
> no cell is needed.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-for-upstre=
am-dt-jc42-thermal-sensor-cells-v2-1-6edd30b082f3@free.fr?part=3D1

