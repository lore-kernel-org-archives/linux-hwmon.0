Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6BC134CCF
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 01:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780883528; cv=none; b=QM6ckQmOUEfx9XM1Y/ayCrwLtJhF3OEhduf2KIlfmTPMVoe9pR000iedxzXTEhZ8MdwUF3C3StmqQunVQZLlrigAe/FlAIW7X96Db++/ybpLgxj0jSDed2/cYlOGFiKg+ePT5lbLg1cDuf5qq+YjMZ1cg9c6zYdAWaOnX8HpGXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780883528; c=relaxed/simple;
	bh=YH9Huh3a4zq05ui4ehw+Ejs0COvkpTa+XJdDmBGj7nI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nRWz63gCEP5tiHkPQf+oH1oygY1yduq7PsTdAm4fBogvUet1kBmWc0ipAGsC0vNHTmEPlwveKqdBh022Bu9Sy1lY1mpZVYdwOM11sRWupZprnuyloh248mDXIgud1n9Tj5EfbsRK8yrhSqbKz8XzHQ8GfG/CWIXPZ0y0LS/Abgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlq2ByfZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlq2ByfZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA641F00893;
	Mon,  8 Jun 2026 01:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780883527;
	bh=YH9Huh3a4zq05ui4ehw+Ejs0COvkpTa+XJdDmBGj7nI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mlq2ByfZND3x8iQWmbMev+FNzredvLKfVr89oyq+c650DWsv1F7lEqPyzKr3R4ZEJ
	 LfC9LPOgQTGI9X6x9ntDSi2QC4nJLNMBces+NFuPF+1GkQadbxNr8pRRDh1YoQ0dus
	 p2re47WeIPwDhnIky231eSrAMeUtMtpamP7qKuV1/cmyfvAfp/IKOk2ehtvg6o3vuX
	 26cc7Xf87bqq7KclSNALIMyQ948e9Cv/NCqYPczSoqE/U1wd20FdOw/ilbocqdh//q
	 Z3PWuy3fPzg40qzuxE7JVnr5dMpjM4QEbqMP9hucXYovBsGhi0LZbHa5+JcMLrJZf5
	 5s7nWI6Dy3KnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] hwmon: (gpd-fan): drop global driver data and
 use per-device allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: xiaopeitux@foxmail.com
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_E4CE09DC1CB1AB4C0411F71B9507E4A49706@qq.com>
References: <tencent_E4CE09DC1CB1AB4C0411F71B9507E4A49706@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 01:52:06 +0000
Message-Id: <20260608015206.EFA641F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Pei Xiao <xiaopei01@kylinos.cn>
>=20
> replace the global state gpd_driver_priv with per-device private data
> (struct gpd_fan_data) allocated in probe. This allows the driver to
> support multiple instances in the future and aligns with kernel best
> practices.
>=20
> No functional change intended.

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780880972.gi=
t.xiaopei01@kylinos.cn?part=3D1

