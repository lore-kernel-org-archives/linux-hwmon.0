Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331A53AFD12;
	Mon,  6 Jul 2026 18:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783364121; cv=none; b=qzn/bBEqeQzf/whi02F+pwGQHNc9n3oxzaABeYJl/3trP0Kcf17ifpG5Y7+AzKGtal6Jm7HRwctj7tV+Ar3z8Rv3Jbqms9X25kxqsIDNZSttHgRFOGnt5uYU6MS8OyfQ2ItyRJvHPkXRkrGjLFyuW8x1UwQirFhqWSsQcSAlDI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783364121; c=relaxed/simple;
	bh=BEDx48x/XWxouRMDXkE0d1IiMgSLzxrijzFV26mT0Uk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uwAvwKMtaYcJSuKnnN9i+shLCr4VDWwgkJnnaVnwfH6K3glhbv2LqMPEnvQbn2BCiXp/T5AGBeDOD76J3CP3xgapeXE1sa5Z3RHO6lNmgKdhR4EK+gYwpZ6TF4Ah0QvSGtBvMCsdFTw33TImynaEhuJc9CrYpaHwdm83hMIfvh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwXH+3Jh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwXH+3Jh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2161F00A3D;
	Mon,  6 Jul 2026 18:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783364119;
	bh=BEDx48x/XWxouRMDXkE0d1IiMgSLzxrijzFV26mT0Uk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hwXH+3Jhezeqb4HeBjZIsI+hi1pTL9xH9xTkTQc23LwHb6zfSgAZ4JD1BjossaOmu
	 FLqSSZLVUyilNb5+IQy7V7+ecTKywHG2FlzXEtI9c5PtW7utiSpJLFopmSknM5+IyO
	 xIsSuNexv+cLiFwi70L6ClnSaM0fcNtr5MF5g9i9FEnlct4CDDkfyY2k1YBS8vPKhL
	 ZVWNsJZ9iJwi+ioLWzIoryfxO6K/eQLR/6OI+jJmJ8OVbYUzZ3yYwki+Y0lpwDveg3
	 ZlVxDRFbbLSpvvNS/Etwo/g2L8qXoZFdIVxfpZfPGPNSC4qJBibhvTpXdEGAMNNV/D
	 F0JZgr88lPvHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260706184648.35613-3-daniel.lezcano@oss.qualcomm.com>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 18:55:17 +0000
Message-Id: <20260706185518.AB2161F00A3D@smtp.kernel.org>
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
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706184648.3561=
3-1-daniel.lezcano@oss.qualcomm.com?part=3D2

