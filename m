Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E97363C6C;
	Thu,  1 Oct 2026 07:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790839974; cv=none; b=GM9uTs1ZPMHzzZbm0oO/L/1T6BLMSJlYl/yETNRhfskE8KjoeofIA010kwosLyPWg75aN/H0CGN/8WiCk8gi9URF5dU2QxB4uQWTs0y1fo8Be6n+XCa+t85OmqZ9PANu6frL6t2wVmDyXjz/uT6kJ13cfhp0+Ql7SomhguA+VAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790839974; c=relaxed/simple;
	bh=TCM++s8DCwUBjlIC4pb1fHch0v1ZYV8nFTo8IIvDXZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JFfWzFeyDiYoaUy4gF1ciguD7wHOlHKnR4djjPM3itGGFgpnUBCJFb8EIC+wNdgbDIligqqjPdaxem3i1YxJvXuL/fVtMRyDZmsERv+Fr84cEKGeIDwGPjLfOzWPaV449jVIRGsKwbC8XXdDOQWNpflIs6n+bMBKxcPk6rPDMWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KbK2lw9c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KbK2lw9c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403CF1F000FF;
	Thu,  1 Oct 2026 07:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790839972;
	bh=2+rb7f30T/hSmCdoiWdzCSDXh0O9v5ikZWEzWhUGJ8U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KbK2lw9c3iDWm2H6SLC1cJ/Lec/yEVhepysxZi1PlSxJ0uQbY+FUxPQ5Wl9UngSfO
	 4g+cCjEGxftzWUtnqpZqWqWmTNChmANHK188ZohP+elQlCVVK47icLRn9c2uUyMsPG
	 1GgnVBD9Ls3WdzMgnnIvT9yGsXax9MDHzVqjwlrHJee7MPXSqnpk8pIOo2O5NsE8rz
	 9LGjmUqre/Ex5bVanM8HGeoUBltFHDf6eK+BSe+6Elp69SYay+XeRhYRHYHC3eC3HC
	 Y0YQA1lAiZHLaMsY0a9TAbY2/Fo4mokX+Wfe1An/ZFVVBKtdTxTqvtl3tYoqUz77lc
	 fTAHcP6hH627g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon: pmbus: mps,mpq8785: add
 #thermal-sensor-cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-2-07d368dcc662@free.fr>
References: <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-0-07d368dcc662@free.fr>
 <20261001-for-upstream-dt-mpq8785-thermal-sensor-cells-v2-2-07d368dcc662@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 07:32:51 +0000
Message-Id: <20261001073252.403CF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vincent Jardin <vjardin@free.fr>
>=20
> Since commit
>   3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE=
")
> the PMBus core calls devm_thermal_of_zone_register() for every
> temperature input, so the devices of this binding can be referenced as
> thermal sensors.
>=20
> By code review, it should work for the MPQ and MPM device bindings.
> They register a single page with PMBUS_HAVE_TEMP through
> pmbus_do_probe(), it means that one device has one
> temperature input, temp1.
>=20
> The PMBus core registers the first temperature input as sensor 0, so no
> cell is needed.
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-for-upstre=
am-dt-mpq8785-thermal-sensor-cells-v2-0-07d368dcc662@free.fr?part=3D2

