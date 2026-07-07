Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4463B36DA0F;
	Tue,  7 Jul 2026 19:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452540; cv=none; b=ZPJUZwbPhrrhUiyN1fVbmmQwV9Jq2MF8JF2PfbuBBXalOifidPGip9CQJ/hvGj6CmT6TIUjhBHN2gtTF4GW/pBEA+qOjRBHQaFjduUjRHCKznojUB+O5vcQMcKGXaPa2hrHtRdQLSudm1LKdV3avOAkFzdD4qlFPvthMKH52jO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452540; c=relaxed/simple;
	bh=0hxCHjqOVvmXO1u0zYMNquu/0hl2sy06FykdksBZ1jA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RVDfiJbcT5WT1XIKNVTJywd0NG8Khm7A8U3bvKejwnNipaKHKA/PdhYB7dJ7jXf/OspUddIM/Pj4PM6RfMerzF+legET39vumnT3XWXGpodbKAeANQlfojPQb+DC38L+ByzHvWvbcJMIBXP6TQWh3el5Lvy8VOPBOMdRUxwGBD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvALe7hm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvALe7hm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57501F000E9;
	Tue,  7 Jul 2026 19:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783452538;
	bh=0hxCHjqOVvmXO1u0zYMNquu/0hl2sy06FykdksBZ1jA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UvALe7hmfAknV6DE+GdIAFCsB8o3z/Phdj/hvpomQS2N6YsGAv2ab7GXOuz8BcJ+s
	 Z/EZDsrGKWKELotE007Sogqq9dPKAvpEZ/TTT+7L4tXQ87p93zCqNlUXyt6pbUsLmz
	 n1u2BkmPt/S3/Iq0SFE0Xq05Ml7NPWXerKe+ClsES1mNvse2iMhTPnIvjS1PvWTSrE
	 do5S4lK90DVpPMmx+kKjwGturgBdgg1/RjN0ABz9mH7MC/7anxtVkJhfr7IEtBnAaN
	 S+fQJCWurpt5AJjEeQmST0qyOcPBw6LiSS2CIlmbA+VPmAJUgtSuCEywP/9veZlj/0
	 S8/049OIQH05A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260707192228.14647-3-daniel.lezcano@oss.qualcomm.com>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <20260707192228.14647-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 19:28:58 +0000
Message-Id: <20260707192858.B57501F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Expose the Lenovo ThinkPad T14s EC environmental sensors through
> the hwmon subsystem.
>=20
> The driver now registers a hwmon device providing access to six EC
> temperature sensors corresponding to the SoC, keyboard area, base
> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
> are exported to allow user space to identify each measurement.
>=20
> This allows standard monitoring tools such as lm-sensors to report
> platform temperatures.
>=20
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707192228.1464=
7-1-daniel.lezcano@oss.qualcomm.com?part=3D2

