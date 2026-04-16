Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED26239DBD7
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776336097; cv=none; b=Nql2UUGO4/wPDSqjjoGodWAnjkzyuogAsSP5Lcb5f4ebaBtC60DoE1s0VJlG4vvAmllEBtIe6mqkpvGx3XYFlStG0dOY7+CDsPbYPvwqPloBlQZ5AHjWJ3fGUmTv4z2dHChvvAU60sA0mv2spkRCLAA7cWyi7bPfFgLPb1d5fVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776336097; c=relaxed/simple;
	bh=oWuCtCi6f2lyiwnVXftN7G3dXYJXgqzg7IyJ/ivImPw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fCtLKd0c0fe5GQW4JDqANoLc9MOi+Sd2EnbCJSimPHLpoyR5hSp7e5XybhS++8bdYMY0RG7d31buB+ocYNu/p9AOmig3aCPE7xCemjyaxFhIbyN8/bNKnmT/d/NCAI7TJ9iBvb0f0W2uZd1Cy2U/peiBXT/c6QxuGSUGO5fRphY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrZ8bEkS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrZ8bEkS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F14C2BCB0;
	Thu, 16 Apr 2026 10:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776336096;
	bh=oWuCtCi6f2lyiwnVXftN7G3dXYJXgqzg7IyJ/ivImPw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lrZ8bEkSKxpypVR1HBVQLK8v4atQg5vd15aWig23lrgI5RHVvCvdY+PnbpXNJ4jP3
	 5OgCHARjGzoUr1xJBsc/Mrlgf0jpay3OzB4eVqd81LQsdfZ4m8UEyqAxt5XXXNKLCA
	 n3XeBBdkp4tIiCPVQQK6YjzuzXUHNlCMoQPEkPurg3SYzbyTk29SoZKR8KXP8isqTD
	 9M8vY+B7v0CtVRwwakdf3THctIZLGV+tvIqirdrFKmPkWjXOjiV3K3l3Om+PcLXN54
	 326HfGeVMEQ0gNaxLrUc1JljmL4HlOD7XCevDS6GhBBQXcNzLFcEE4q+8gpkC4mVhP
	 o0U3N+pDTpl9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (lm63) Convert macro to function to avoid
 TOCTOU
Reply-To: sashiko@lists.linux.dev
To: "Gui-Dong Han" <hanguidong02@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260416090752.97392-1-hanguidong02@gmail.com>
References: <20260416090752.97392-1-hanguidong02@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Apr 2026 10:41:35 +0000
Message-Id: <20260416104136.63F14C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 2 potential issue(s):
- [High] Incomplete TOCTOU fix allows compiler-induced divide-by-zero crash=
 in `show_fan()`.
- [Medium] Lockless sysfs read in `show_fan()` causes torn reads and violat=
es hwmon subsystem locking guidelines.
--

commit ebc10731137639981842ea19f80f0b969db71842
Author: Gui-Dong Han <hanguidong02@gmail.com>

hwmon: (lm63) Convert macro to function to avoid TOCTOU

The patch converts the FAN_FROM_REG macro to a static function
fan_from_reg() to evaluate its argument only once, avoiding a TOCTOU
race and potential divide-by-zero error.

Link: https://lore.kernel.org/linux-hwmon/CALbr=3DLYJ_ehtp53HXEVkSpYoub+XYS=
TU8Rg=3Do1xxMJ8=3D5z8B-g@mail.gmail.com/

> diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
> index 035176a98ce9c..da132b267c584 100644
> --- a/drivers/hwmon/lm63.c
> +++ b/drivers/hwmon/lm63.c
> @@ -109,8 +109,14 @@ static const unsigned short normal_i2c[] =3D { 0x18,=
 0x4c, 0x4e, I2C_CLIENT_END };
>   * adapted accordingly.
>   */
> =20
> -#define FAN_FROM_REG(reg)	((reg) =3D=3D 0xFFFC || (reg) =3D=3D 0 ? 0 : \
> -				 5400000 / (reg))
> +static int fan_from_reg(int reg)
> +{
> +	if (reg =3D=3D 0xFFFC || reg =3D=3D 0)
> +		return 0;
> +
> +	return 5400000 / reg;
> +}
> +

[ ... ]

> @@ -333,7 +339,7 @@ static ssize_t show_fan(struct device *dev, struct de=
vice_attribute *devattr,
>  {
>  	struct sensor_device_attribute *attr =3D to_sensor_dev_attr(devattr);
>  	struct lm63_data *data =3D lm63_update_device(dev);
> -	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[attr->index]));
> +	return sprintf(buf, "%d\n", fan_from_reg(data->fan[attr->index]));

Since fan_from_reg() is a small static function, won't the compiler likely
inline it?

If it gets inlined, couldn't the compiler optimize the code by reloading
data->fan[attr->index] from memory multiple times (once for the 0 check, and
again for the division)?

If lm63_update_device() concurrently writes to data->fan[0] in two non-atom=
ic
steps (where the first step can momentarily set the value to 0), and a relo=
ad
happens exactly when the value is 0, could this still cause a divide-by-zero
panic?

Note that the subsequent patch in the series ('hwmon: (lm63) Add locking
to avoid TOCTOU') explicitly skips show_fan(), leaving this unfixed.

Additionally, is it safe to read data->fan locklessly here?

According to the hwmon subsystem guidelines, drivers must implement locking
for attributes registered outside the core-serialized info API. Because this
driver registers its attributes using devm_hwmon_device_register_with_group=
s(),
it should lock its attribute accesses.

Since lm63_update_device() releases the update_lock before returning, and
data->fan[0] is updated non-atomically in two steps, couldn't a concurrent
sysfs read observe a partially updated 16-bit state?

Could this torn read result in wildly inaccurate fan speed values being
reported? The subsequent patch ('hwmon: (lm63) Add locking to avoid TOCTOU')
fixes similar locking issues but explicitly omits show_fan().

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260416090752.9739=
2-1-hanguidong02@gmail.com?part=3D1
