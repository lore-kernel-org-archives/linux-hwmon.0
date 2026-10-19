Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22F63033E1
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 11:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410570; cv=none; b=UMYb09TgAosEjRmFjSbXyoVV+/jWJRiI8NkQ2Nm9yL3cGc1vLZIyoB5qsPFiMCTwQOzFTeS/tW2sqWoPl2dIFF4UmIG18rviLvdHZHn9bKIgUU9HvRAf1HXIpw7zY4FC+GOpg9UKjIG2AR4hc1BQiReJ6GX3GZTKZtEToPpYLDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410570; c=relaxed/simple;
	bh=thd+1XJ8kyNMSLBPLYaFxRuVZKRXvzKI3Nbq8BUhcxo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=O/n2wsVF9OoKVM+LlVtmXCi13s+EwUyV8IemXqI8PQf9yxKBuSfgxsaj2qffrtCP6OBdESW4rWTSeuP3dwzEfBG6XKyvJCgEbaw4wHFPluiO16b/bV207QlCoI36QbzuX75PKE4rm/mJxrjMdqP6S288VJdbTokm2aotLm6txPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GuhECrlc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GuhECrlc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4BA1F000C4;
	Mon, 19 Oct 2026 11:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792410569;
	bh=thd+1XJ8kyNMSLBPLYaFxRuVZKRXvzKI3Nbq8BUhcxo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GuhECrlcxelMVk9/XaBNqf6yg+qYarqP9zcil3y+tl/YcEh+QX73gqJzay0O66hYi
	 FFbz2HGVleAAcw6TTIB3IR6/YQw7lFu4vhgorbD1NfFIfYKsPwWmlajAxvwP9Ir0BM
	 KOtONM+m6yeE2CdDnFAtuyLqpmcb+xVjZb+oRlcDy/vElLZ3XKdPD9BWBnHVSADwLY
	 RiK3+x6BfckCpuZ5xE6VMZ1eC0R54ScG/PpFe4lA9jV9KyC1aAnY2Pb4bTNrQYnxlF
	 nvT/1iGWxmsbozUL5/3e8pjOTYO5LWV/1LjAhJXbvA7BYjhk9UWiDEvBrpZ16uV6Ry
	 qp6lptIyoCMcw==
Message-ID: <sashiko-outbox-177052@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/6] hwmon: (peci/cputemp) Add support for Granite
 Rapids (GNR)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261019114502.55307-6-changhuang.liang@starfivetech.com>
References: <20261019114502.55307-1-changhuang.liang@starfivetech.com>
 <20261019114502.55307-6-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 11:49:28 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Granite Rapids (GNR) CPU support to the PECI cputemp driver.
>=20
> For Granite Rapids, the resolved cores mask must be collected from each
> compute core. This implementation is relatively complex. Since we do not
> use the resolved cores information for these CPUs, we can explicitly
> state in the driver that the core mask is not supported for this model.
>=20
> Define new cpu_info structure for GNR with minimum PECI revision 0x42 and
> the thermal margin conversion function dts_ten_dot_six_to_millidegree().
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019114502.5530=
7-1-changhuang.liang@starfivetech.com?part=3D5

