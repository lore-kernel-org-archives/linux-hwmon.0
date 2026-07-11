Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184462D1303
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755379; cv=none; b=HJSlhj9Ge3xaNSOsdEYzKMHsZbsUv0wt2E0y38m4co2enL4E+dm/q4dbk6zuNVpMGAVJJB/dM40HFVe6Qvm6IJK2FDRDYwEdQUE16GfLXSn6X2S8WJmiMz95JMz4nPWSbjogXX8m58X/e+BkzpD74+udSZ7SoIUH37/w+FRIO9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755379; c=relaxed/simple;
	bh=NRu7yrkSyDlXO/oxm5fJ9hDXLf22YyB9YIwGNBjjtww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W2mJxp+rTqbbx4JOlM1rdT2q7DNHG1hhA/DqMNcsu0HhpSuDMDbuebRnqoG/yco/YrkewCJUjnCNZEF7Vgjmdbh+UQcdgeo5IhpaM1tskDvode/vOZGAH3ukJhbcinjraWk8+W/p9y8WYbxtqYdiJVkLov2rxikGLg6iOWJW8AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2UoLk3z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2UoLk3z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25F01F000E9;
	Sat, 11 Jul 2026 07:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783755377;
	bh=NRu7yrkSyDlXO/oxm5fJ9hDXLf22YyB9YIwGNBjjtww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o2UoLk3zOBN6IbpFu5PveySvty6XNGICL1h9CBsqa3lQ6z2hKFTy7nAVSoqRZcSPz
	 bhHJSGKWL2plnaPADrJZRtSUk+j4EiUxKDXYeH2GXQumHQuZMo/imDU1yGx9jNdZOF
	 iu6ROR12jeVF6jWA1heycfTOclnh0TNIml4+lHKYzCI56rwrotAHstI08W55s9ZP+q
	 SY2VCvtIn7QTc9ABQxg4vJHvqxTl6TtE/PxW2mwsquU4u1UQ/84UqgCwtvG+buV5IG
	 mb8nbF5GgPatg7qFe6LOku9NQ5+XbwRcmvYB1CUuzhEd7obgqHyuBPuV+AHFlWITId
	 q0wtrt9co7CaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: (asus-ec-sensors) add T_Sensor for ROG
 STRIX X870E-E GAMING WIFI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711073319.553163-2-eugene.shalygin@gmail.com>
References: <20260711073319.553163-1-eugene.shalygin@gmail.com>
 <20260711073319.553163-2-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 07:36:17 +0000
Message-Id: <20260711073617.A25F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vishaal Saraiya <vishaal.saraiya@gmail.com>
>=20
> Enable T_Sensor for ROG STRIX X870E-E GAMING WIFI.
>=20
> Board specs list the sensor, reading at the standard for this family
> address without the thermistor connected to the motherboard, returns
> -62, which is one of the known blank values (the other one in -40)
> readings for temperature sensors in the ASUS EC when there is no
> thermistor connected to the motherboard socket. With that evidence we
> conclude that the T_Sensor can be enabled in the driver for this board.
>=20
> Signed-off-by: Vishaal Saraiya <vishaal.saraiya@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711073319.5531=
63-2-eugene.shalygin@gmail.com?part=3D1

