Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90693C81AD;
	Mon,  6 Jul 2026 18:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783364253; cv=none; b=g0F8lTt8Rj4BafTJprlxnt9x1W0p/bS8NO2MoFwWIA6WCnHEav0mOAWUzUiFfBx+Pr0fQXKiRw7L/cSO5b7UxcEBXtj7PbsqDCZuLzWkoZFZT1gbc74D8xizq2D26y1/qAuvyt3ZSVsJ/++GzLflrUznkAJVYgak7pfbXOa7Ep0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783364253; c=relaxed/simple;
	bh=kUJBBHlBjJQT3YNthc39e/yWqTIqJKxrwKw39rsK2WM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OdkDj3IBNQdqdR5x15Z+fBMc6NsS8EvNOsDcZKB/i512JXrq+5gESyixvb3Ti317Myfe5tjGaLmaovmnYdZp40Zb0TegdWwP2RzSqOt1fGnergFKV7XBHzhbOtLN60KfNShj7SCNFykhSyiHmDJh3b5WGE1VrihK75maoV+DxUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaqE0sX6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaqE0sX6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2172E1F000E9;
	Mon,  6 Jul 2026 18:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783364252;
	bh=kUJBBHlBjJQT3YNthc39e/yWqTIqJKxrwKw39rsK2WM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QaqE0sX6F6sY+k18e/7B8/bk6wRFNYFXahL6SwXyjGXMOgwLNkHJfSkjlJ1T+TaN8
	 HrsjlxP+hHeyv7wALKIfohlD1slJtdZzLHRSTyz4ybGg3Wa946iwO/9paLHkdYv3bE
	 m0scGZa/O9XJcytFgJRJHTKiC6srq39VJ+DGZZNU4muGmmCVZnomBsQoYR1ys8Wnhv
	 /vXavk19Mvw2PfrhyfhVdN8JBt1/r6zZ9l+wumRKUcBQAeVGUQxaKG5GrfOgRt/xN7
	 zOJbEMdpR6hMjyW0uACqHeuMjvVIl8ElRvhNhWBWMSR/GOamlFs0MTnvlDE8Fd5jmO
	 5gVV5563TuIJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: embedded-controller: Add Lenovo
 ThinkPad T14s thermal sensor provider support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 18:57:31 +0000
Message-Id: <20260706185732.2172E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Document the Lenovo ThinkPad T14s Embedded Controller as a thermal
> sensor provider by adding the '#thermal-sensor-cells' property.
>=20
> This allows the EC temperature sensors to be referenced from thermal
> zones in the device tree.
>=20
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706184648.3561=
3-1-daniel.lezcano@oss.qualcomm.com?part=3D1

