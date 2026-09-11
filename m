Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C94C388E76
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 17:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148241; cv=none; b=bb3mDiCkRBMEGT12NjaJvTAQ5Ojd//KCt5T1Sx60gpO2P7xnul2wmX5wXGmcCfsLVjhNyoqepHAst+xL7zbqrThBYaV24Qm0GC/tPii+Ln8S9FhKNPD+nOAc3/49/txwHnhfJjGGwoBwbRCwkBeI3YppsyTHonbUWIXvuMDLzGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148241; c=relaxed/simple;
	bh=xyJv0ELsgBKP8oitCdEI6sklHO/RZsQMp9GH2Z43sbI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jMcnVTk2x45Y02KJIwo4ZTFT90kLHjX9VscAjPiKk22drYfMM5kAQRa3MqnTYMAIXCfZwDKEpEvMzULfYBJbHbz2Hepf7nkBojmy64g5LhoeM8/RHB8q5ciVRC4SAbo17GpSfKstfCr2en1xB7cXX3iusLnLHvtGMzA9KPmEVQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ib653IKX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ib653IKX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B7D1F000FF;
	Fri, 11 Sep 2026 17:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789148239;
	bh=NmhQ8rDJ2xRaQeq0Bp/0DcZ4JlJBnpS37bTK7vQ7hgI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ib653IKXglZ9X0UjayRBuMcT/UFt0N6U09UUw0BvC5Ye50OUUfWDPeIM/1jX0xqpA
	 B7RyS4s0wMrNGouFlQWGF9xSh4kC7+RLTQqdweg2WmBM/ihQdyy1YvxBfmGFbXNoMt
	 9aJ+LI/bkcKOpePgKvbRQCzJEdZngUahC1iXZh0tiDjMRi7MPCjT7RGop32g9zocey
	 wPm1xzQplGjvPjaxVHUHsgNOly5ZS44Mr0sbhYISZH3JmTqDEuqgIpFN3FgNQcF65o
	 tl1xRvggee5Z66WMxe3QJZcMfWh5AWxl61/bvKLgcOeuA+NpOk4EKKqVERV4J/W1dL
	 xuLiOBAisbj7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (cgbc-hwmon): Add some sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VGhvbWFzIFJpY2hhcmQgKGNvbmdhdGVjIEdtYkgp?= <thomas.richard@bootlin.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-2-0c6bf078d173@bootlin.com>
References: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-0-0c6bf078d173@bootlin.com>
 <20260911-cgbc-hwmon-fix-and-new-sensors-v2-2-0c6bf078d173@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 17:37:18 +0000
Message-Id: <20260911173718.D1B7D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add the following sensors:
> - Alternate Board Temperature (temp11_input)
> - Top DIMM 1-7 Temperature (temp12_input to temp18_input)
> - Bottom DIMM 1 Temperature (temp19_input)
> - 12V Standby Voltage (in14_input)
>=20
> This fixes the following warning on conga-SA7:
>=20
>   Board Controller returned an unknown sensor (bc_type=3D1, bc_id=3D11), =
ignore it
>=20
> Also update existing labels to match Congatec documentation.
>=20
> Cc: stable@kernel.org
> Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring dri=
ver")
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-cgbc-hwmon=
-fix-and-new-sensors-v2-0-0c6bf078d173@bootlin.com?part=3D2

