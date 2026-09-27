Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A093EA97A
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790511581; cv=none; b=OX3Br6QYfy+FH1UFiA38P1qsgTq71AtQLEslhbPlMdzelRuU/3SxCnOrqma/LuzYG88hiTOHweFIVLYVA0gG6s3PTl/opnQ6uvdh5+rsWdzctFQT/poxEPd9m7RcIf/UN+X+JbKpkvOyfverObbJx6iHhEhpzSUP0B/Uyij4v3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790511581; c=relaxed/simple;
	bh=eMGUu5ShU4UhJ0pRjvP/3Niy2gZsaex2bG40ja2+zyc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F8iMwKiWoQogjbeKNTRXK6ihknXZ0d7ntzL3TxAi6Xb+TKvqYBt/RGRN4kqG9f+qqF1DC64aMUY9lTXfYw55p79+ot6dD62LTU8U0NXAtgtbG63r+yjjV3yxaixKBHCVJJT58V7AB14gy/+O+/zIPTchVJrf94nVuONqh2So3VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcdaOBQZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcdaOBQZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AAE1F000FF;
	Sun, 27 Sep 2026 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790511572;
	bh=ktptQcTp1NAGd2L528KI3nFSO3qXsnkm5AJ8e6DZ4PU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EcdaOBQZdDCBRdOkGrF0gLAohZjGyVBRz1F/9GdYOgvyOcE6/Fl9nHbTY7B/fZyQl
	 TdueD37fTgFW4Cixp9UBJzBUes4duPhMu9LjIcj36zhqTrh6dyefs7PwOSmkef8xPt
	 ojtYBBHhdRb3+y4bYt+GoC73SanPAUc+EI7yZ48ZzFsMhVy0zT/zl4KBPwEoMO+7tL
	 Dr7qa9gfoZwABKhzLSCfJ//i3Gn/Ik/8RCVHD7a+M0tYiuEOKrkp/SNYJrW1Myat9b
	 6ey0tmRbK0c9onD6VJsLbeGnzGKzqkdSx8L5aE+6mWomPEr87CvCw/e6MeEAZ/fP0d
	 h+0m4PpV/0VuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (asus_rog_ryujin) Add pwm1_enable for the
 Ryujin III pump
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zac Lanzon" <lanzonza@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260927120927.72810-3-lanzonza@gmail.com>
References: <20260927120927.72810-1-lanzonza@gmail.com>
 <20260927120927.72810-3-lanzonza@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 12:19:31 +0000
Message-Id: <20260927121932.72AAE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] hwmon: asus_rog_ryujin: massive msleep() due to jiffies wrap-aro=
und
--

commit 9b0f4985a76174c3f4abba0e61bb854848b7c94c
Author: Zac Lanzon <lanzonza@gmail.com>

hwmon: (asus_rog_ryujin) Add pwm1_enable for the Ryujin III pump

This commit adds pwm1_enable support to the asus_rog_ryujin driver to expos=
e=20
and control the pump source. It also introduces delays to wait between sour=
ce=20
changes to ensure the cooler processes the commands correctly.

> diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryu=
jin.c
> index ba188e8679347..c89d854b2ae92 100644
> --- a/drivers/hwmon/asus_rog_ryujin.c
> +++ b/drivers/hwmon/asus_rog_ryujin.c

[ ... ]

> @@ -313,6 +330,46 @@ static int rog_ryujin_read_string(struct device *dev=
, enum hwmon_sensor_types ty
>  	return 0;
>  }
> =20
> +/*
> + * Send a set cooler duty command. If it changes the pump control source=
, first
> + * wait until RYUJIN_SOURCE_CHANGE_INTERVAL has passed since the last ch=
ange,
> + * then wait for the cooler duty report to show the new source, so that =
success
> + * means the change took effect.
> + */
> +static int rog_ryujin_write_cooler_duty(struct rog_ryujin_data *priv, co=
nst u8 *set_cmd)
> +{
> +	u8 source =3D set_cmd[RYUJIN_SET_COOLER_CHANNEL_OFFSET];
> +	unsigned long now, next, timeout;
> +	int ret;
> +
> +	if (!priv->info->duty_channel || source =3D=3D priv->pump_source)
> +		return rog_ryujin_execute_cmd(priv, set_cmd, SET_CMD_LENGTH,
> +					      &priv->cooler_duty_set);
> +
> +	now =3D jiffies;
> +	next =3D priv->source_changed + msecs_to_jiffies(RYUJIN_SOURCE_CHANGE_I=
NTERVAL);
> +	if (time_before(now, next))
> +		msleep(jiffies_to_msecs(next - now));

[Severity: Medium]
Is there a risk of a massive unintended sleep here due to a jiffies=20
wrap-around?=20

On 32-bit systems, if the elapsed time since priv->source_changed exceeds=20
2^31 jiffies (for example, if there are no source changes for 24.8 days at=
=20
HZ=3D1000), time_before() can wrap and return true. This would feed a very=
=20
large wrapped value from next - now into msleep(), causing a thread hang=20
when a write to the cooler duty attribute is attempted.

Checking the elapsed time via unsigned subtraction, such as=20
now - priv->source_changed < msecs_to_jiffies(RYUJIN_SOURCE_CHANGE_INTERVAL=
),=20
prevents this wrap-around issue.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927120927.7281=
0-1-lanzonza@gmail.com?part=3D2
