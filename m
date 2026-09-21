Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2029F3F23CC;
	Mon, 21 Sep 2026 07:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975783; cv=none; b=VS1D1zvCL747G4PheayKbR/zK0nFpYSz+YKRtyrImJEoin2YpLDmxbsgYZOp15DdKu+AiFV6Zzg1G1jcNaoBunVLLrDCOtGSrHaLiBIkf4kN3nqBzXjva0DM1tJQIqNm4CRd1ym53gCldKS3NvsV3U4GMIIlDhptn7O0dSFlxKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975783; c=relaxed/simple;
	bh=7lc9QqmKCw5tzmBALMa/mVO5kPo2Xqt2AfQDW9ZpBYs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IerqpkGmF59qUKidiUBnOPBIdRn3+7/py119M26Fa5qOCFwJwxEl488ZyVDDyPWXulyHS2dTLFRO3Q8wdpsLC8PE49SFR+ok/QprYuvKT2w+MuBXuZI5DROo2aNeTRlX+KVFC7QsXqDfKfsFtqKiu1mus+W4CBaC1uNPyDL/SEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5HXLeQk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5HXLeQk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF041F000FF;
	Mon, 21 Sep 2026 07:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789975779;
	bh=7lc9QqmKCw5tzmBALMa/mVO5kPo2Xqt2AfQDW9ZpBYs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H5HXLeQkwgb/hBt10scvWlCEL4uqRp/7DnkaZKCe4Xv/5WDDgENd/FlzjCeYqc3Db
	 Gj4uBo/6hY1oN5aTvv26/E75knBbSJoGbIPn9B/QCwjF83z/Ml8ZTTKX//Ca4LyIJo
	 D812C9HtBq4zwVCMP8GDnEaP8d2bYDC7cIJFPsqvfib+9HGoDLBFhpxDr1HBOXyQ+J
	 QA0iWGqrTg+eHHs7ClBE0DHdLu5sLMeEAhceop0rfDCRSOfbEcxGnOmW7x20JFCmmI
	 015SGEChwUYFv/rOT8DLKk9V8hLdPZ/CBAMun7yCfq92ZDV1WRyfI//D6xWaIFv/fG
	 0vxn0S3JctT7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: add Axiado AX3000 and AX3005 PWM fan
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921-axiado-ax3000-pwm-fan-v3-2-3def8b6ffec9@axiado.com>
References: <20260921-axiado-ax3000-pwm-fan-v3-0-3def8b6ffec9@axiado.com>
 <20260921-axiado-ax3000-pwm-fan-v3-2-3def8b6ffec9@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 07:29:38 +0000
Message-Id: <20260921072939.5BF041F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add support for the PWM fan controller found on the Axiado AX3000 and
> AX3005 SoCs.
>=20
> The controller uses a hardware tachometer block and interrupt to measure
> fan speed. Fan speed is controlled through a PWM signal supplied by an
> external PWM controller.
>=20
> Register the controller with the hwmon subsystem and expose the standard
> fan1_input and pwm1 attributes. The physical fan is represented by a fan
> child node containing the PWM specifier and the optional
> pulses-per-revolution property. If pulses-per-revolution is not specified,
> the driver uses two pulses per revolution.
>=20
> The driver was tested on AX3000 and AX3005 boards.
>=20
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-axiado-ax3=
000-pwm-fan-v3-0-3def8b6ffec9@axiado.com?part=3D2

