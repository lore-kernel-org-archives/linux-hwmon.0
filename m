Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A0B3D8133;
	Tue,  9 Jun 2026 07:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990170; cv=none; b=p+qgCftUKnrmhdBxe5/TFr5S7ONM2vk+TWeb8PTP6N123lxWSH2r27IGqe3X3zIQdBred5A1FJBM/vEFekbGcpL5ghIIg0/PkGGiYsUDPcMoBD8lHpnEVt+il+b2M+UaOXyl8PSrYXCemf9xR4q43+BrmqDPfKeL6uC7xGmlNig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990170; c=relaxed/simple;
	bh=OfgtpsB02oaBrxeSv9R85Jh/So79y77Koq9Sgp7WRhY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=us+9F7j+ZKRWn7silEFyUD1LAiqKdUs2Vx1ebA4FPpRIEGeRHUoeR1X2zBPIxwG3YknGvnFWCTp1AUIcaawhkrhAVJHGwQQDi+38rS3oz65tGVn3aGIIcqZGHnc5kTGFNfA6ypwosjQn+LsRyobWIPv89ZRnuYINP9KDxRIGYt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BCSeMwc8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCSeMwc8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636751F00893;
	Tue,  9 Jun 2026 07:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780990168;
	bh=OfgtpsB02oaBrxeSv9R85Jh/So79y77Koq9Sgp7WRhY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BCSeMwc8dMWoZyahAGAsF+YB6fw/OSwLHok7ydOYVnCm3DUd0RhNlYB7U273FNihf
	 sIadXVgwdkE0qcZSAWPj4ZZDrJuTYpKSH4wBIBKlGVseOQJr0C6/fMEtGMtYSsnhkN
	 6zvmU97HqFCjHcV+tltefUSMRQKP4CwoKo7Xga3w2fSPm1/D9QCxQo3SVsPAKMZcHk
	 gyjCOtJaGBWwCb0B3h0pH9FMkqteIYlWC4IG79EsMltZazK6iQQ/aVM+c/MNg6Nkxy
	 R8WDA9WYA3Kt47kW9U+GqxZqDnTO9V12xAVYTNqFdm34r8/w1g0SyLm8StMOdhGWuV
	 u8Qc0a5m93h4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: hwmon/pmbus: Add Infineon xdp730
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260609072231.15486-2-Ashish.Yadav@infineon.com>
References: <20260609072231.15486-2-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 07:29:27 +0000
Message-Id: <20260609072928.636751F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ashish Yadav <ashish.yadav@infineon.com>
>=20
> Add documentation for the device tree binding of the XDP730 eFuse.
> Rename node to efuse to accurately reflect its hardware function.
>=20
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609072231.1548=
6-1-Ashish.Yadav@infineon.com?part=3D1

