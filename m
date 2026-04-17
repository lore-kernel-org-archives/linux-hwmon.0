Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4B02744F
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2026 05:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776404966; cv=none; b=P75pRl/WeMk2gKTRvJzbMG3hwWIhfoOsMwnRopTsbAkK3QzQ4eLd9SNBCS4eQAkbMND00ZvPcRRymG98cReSTptxDjYIYIOM6LgrjZhf9yb4EiRlhXn6YP5lng9WL+bZUApJLsTIKTxnhWvYjRqiTO23KvKb4JCk6ovOjGotoo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776404966; c=relaxed/simple;
	bh=rOP3jY1WgimkY2Rjn1iORVmBscfHrz1obFc09WNpRLI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=du+ETymFu34cb4rKudU5N8wrXKb3MrgOK1MIolfi6/6SAbZhnkzM+vOA7cRa2m2epCM0wzsSWuEEOiRAQr+NvxQAhl01UFASq913XZkgpcDRr9uZQfxuXyCx+XR55h1wIqLFqvo3diCR2bm142QCLlfi1UhOQrDi/7G5UxJaBiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kg/9Fl01; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kg/9Fl01"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16CE3C19425;
	Fri, 17 Apr 2026 05:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776404966;
	bh=rOP3jY1WgimkY2Rjn1iORVmBscfHrz1obFc09WNpRLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=kg/9Fl01sydzLor1Vfka9aNHbSktR7ujT7IGyMbfCex0oYWIqN6O1vtK35RTtQs9i
	 ZPEvgHTeCBJEAnuap5TPHeAcjf7nzIdPJigexZ6sJHCodjCh/X808nEIlLGruwpf8y
	 ATTz7+G0c+YY91hTaIjy7RUsiSk0DsgkR4amY/8IYjmJSkSTTqyPRp1CAy6MSIaQpH
	 dKtSFHdw2hdPR1aL2NoPCz2wDffBrDGS1jhp83A4cVMvvx/o0DY7Sz2Obk8unJadiL
	 ONpLkaVfA+Jjavhss2FK2abIdpEOruCSPgT6FJjssa5rO9r4158Gu3Wz8O6c+9Hga8
	 +I2BnAHwp+BhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] docs: hwmon: (lm75) Add section for sysfs interface
Reply-To: sashiko@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260417054511.5432-1-flaviu.nistor@gmail.com>
References: <20260417054511.5432-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Apr 2026 05:49:25 +0000
Message-Id: <20260417054926.16CE3C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 3 potential issue(s):
- [Low] Missing `temp1_alarm` sysfs attribute in the documentation.
- [Low] Inaccurate permissions documented for `update_interval`.
- [Low] Extraneous trailing colons in sysfs attribute names.
--

commit c1dce0b929df71ecb8a78067d9800bb8e1c93d8f
Author: Flaviu Nistor <flaviu.nistor@gmail.com>

docs: hwmon: (lm75) Add section for sysfs interface

This commit adds a new section to the lm75 documentation detailing the
sysfs attributes, their permissions, and brief descriptions.

> diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
> index 4269da04508ef..288cf8485ea61 100644
> --- a/Documentation/hwmon/lm75.rst
> +++ b/Documentation/hwmon/lm75.rst

[ ... ]

> +sysfs-Interface
> +---------------
> +
> +The following list includes the sysfs attributes that the driver provide=
s, their
> +permissions and a short description:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +Name                            Perm    Description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +temp1_input:                    RO      Temperature input
> +temp1_label:                    RO      Descriptive name for the sensor
> +temp1_max:                      RW      Maximum temperature
> +temp1_max_hyst:                 RW      Maximum hysteresis temperature

This isn't a bug, but should the trailing colons on these attribute names
be removed? Sysfs filenames do not contain colons, and the update_interval
attribute below correctly omits it.

> +update_interval                 RW      Update conversions interval in m=
illiseconds

Is update_interval always read/write? Looking at lm75_is_visible() in the
driver, it appears to only grant write permissions (0644) if the device
supports multiple sample times. For chips with a single fixed sample time,
the attribute is restricted to read-only (0444). Could the documentation
reflect this conditional permission?

> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

Should temp1_alarm be included in this list? The driver code exposes
HWMON_T_ALARM as read-only for chips that support it (such as the as6200
and tmp112), so the current documentation seems slightly incomplete without
it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260417054511.5432=
-1-flaviu.nistor@gmail.com?part=3D1
