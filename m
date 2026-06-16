Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530993D8138;
	Tue, 16 Jun 2026 10:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604557; cv=none; b=i940ptgpLRwBVbNITetRJW2yOO1t1EqOcuEg5BNeyhv6Riu5T8tEUVNAIZJh9WDwdpzN00JUcBiFhz8XtV4UcIr5ZUueEnYz7Q4PLYX04XOddxXu/Guf6ZVZt/q1d24yDwk7xlfp/7Te+8XVU8qpdnI+OSGWIyXOYZvz4rlBSIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604557; c=relaxed/simple;
	bh=LlxRaBG6eynzLDr/yz1klgDK7E/0N48+pbMMrQAbWNg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=utN3z5YscAHJdia6aY/0dyd1cY9kUevDGhdYONRe347ZN3GWrX1BbZbmEApWtC6nwKLQD4OnLJ2bAc2VYbJXI0j5B8Y9SJRcyp1Ws1U1lnOzhWJ+0xpEVVu6PLq2iseuPAmib6hEez4Ruwa6VILu36JoHB8ZkVVu51m/LbtMk58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwprP4mA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwprP4mA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E93E1F000E9;
	Tue, 16 Jun 2026 10:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781604555;
	bh=LlxRaBG6eynzLDr/yz1klgDK7E/0N48+pbMMrQAbWNg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OwprP4mAR/J7E7R8/ZYl7LEfrHITNYzx5AWBu69tMCeV0K6mjhRzNgWNcQTOA7MDv
	 BBU3z7L30lu/TUKkzM/2A+GSyeEXelLO1G+NKJ5LzjifGI1gpD6TAN1NAbIMwOzJtV
	 VN0fbLxRk/vQjsVFTBMc1yfoZSVgc1z78VBy2TVGmMsyqCDgeOSv4al35jSLQegnUU
	 Ytk38vcGG9d+l1sCsu7MSuSUC9/ZNhTWsPDXpjsJPRdIcRDJNylJaikssa399qrp+l
	 lozX/2Z4ngNUtCrP/IrZi8dT1SMNCJJMq5WnvQnICWrxoQbSBJLARhea2bgP9TGXEL
	 rThWmrK7QOPNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/12] i3c: dw-i3c-master: Add ACPI ID for Tegra410
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616095429.3947205-10-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-10-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 10:09:14 +0000
Message-Id: <20260616100915.7E93E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Update variable names to generic names and add Tegra410 ACPI ID to
> support the I3C controller in Tegra410, which is a DesignWare I3C host
> controller.
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616095429.3947=
205-1-akhilrajeev@nvidia.com?part=3D9

