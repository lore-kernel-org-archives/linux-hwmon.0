Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E423F231A23
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 06:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783750630; cv=none; b=icmiKH4nVmd5iTHHm6iBQp1bseBDnHaV2DiWxUM9VbUlOAY/Rz8odTFlCF6+3jB7uisN0cdCK8EoJNqghEzwq8H81vFV+aOMeBKqDrQ+Ki5Ang5WJMpTSzuAVH0PBq0OVbxGSQCBuEIkMlL8q+WlVihYodINZHtm0c6N9axvkaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783750630; c=relaxed/simple;
	bh=d9ADNE7Zvk8M0WbgojeQK9OWEbIc1kJmqf/tVbAYQMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CiaQddknCkXMX3C8ydj++Xxcko0hcdfVIb0kgzMbDDwyVZWZFBiDAij2DeIdrIkn2ZUXNh1kTDvh0ClWIQHXgOuL4wk50wU+mwSFxP794q0ml62WhbeXmDEjvaZfTcVMZVjUjsoFePpXW/v8Yhyw3XB1lrwTq1Lpzh/XULlXdu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ovf6z/je; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ovf6z/je"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD321F00A3A;
	Sat, 11 Jul 2026 06:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783750628;
	bh=g257Zd88VeHeUoXWFdt8DDJa60T3pudpkDRFrk+FRCk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ovf6z/jeK3SM8V/LFSzQnIDkTtP71IULcmHrNjx1MWLK3m1JSwviOvVaR1FQPI/oe
	 ubkAlk5kAdrYvkc8zhb3txjdnetl/EEVfUYmbmBt/q5f5Sp3UIAjTJkehuoXTN/ERj
	 uUj7GscXMNhJV8X3tWz9uWdG/DQq+2/gSi7F7/xQBjzXffVqFpu+xQycKelcIqArhK
	 fLFzPTclbgoOZ8ulSEEBew+RqSB6XoxXuZB+Hu853HmWmVdpb2jnqlXzYA/5A3p+Hu
	 juJJazaVTByvSL+DixZcbWfqNDfondJUqJGhHQSbBeRc9/zG956p99VUjQ7pcSsz6k
	 whdwNRFQ830kA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/1] hwmon: (applesmc) Convert to
 hwmon_device_register_with_info
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shih-Yuan Lee" <fourdollars@debian.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711060634.5794-2-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711060634.5794-1-fourdollars@debian.org>
 <20260711060634.5794-2-fourdollars@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 06:17:08 +0000
Message-Id: <20260711061708.ACD321F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Migrating to `devm_hwmon_device_register_with_info()` inverts the =
teardown order, causing a NULL pointer dereference race condition on module=
 exit.
- [Medium] Using `devm` allocations in `module_init` incorrectly ties the h=
wmon device lifecycle to the driver bind/unbind lifecycle rather than the m=
odule lifecycle.
--

--- Patch [1]: [PATCH v4 1/1] hwmon: (applesmc) Convert to hwmon_device_reg=
ister_with_info ---
commit 64b6fb798f7a912d4278236bbe004e5659b03109
Author: Shih-Yuan Lee <fourdollars@debian.org>

hwmon: (applesmc) Convert to hwmon_device_register_with_info
   =20
Convert the driver to use the modern hwmon_device_register_with_info()
API. This migration moves the registration of standard sensor attributes
to the HWMON core.

> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index 90a14a7f2c4c0..a93b1f91a35dd 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
[ ... ]
> @@ -1343,17 +1434,97 @@ static int __init applesmc_init(void)
>  	if (ret)
>  		goto out_smcreg;
> =20
> -	ret =3D applesmc_create_nodes(fan_group, smcreg.fan_count);
> -	if (ret)
> +	/* allocate hwmon channel configs */
> +	temp_config =3D devm_kcalloc(&pdev->dev, smcreg.index_count + 1,
> +				   sizeof(*temp_config), GFP_KERNEL);

[Severity: Medium]
Does using devm_ allocations in a module initialization function cause issu=
es
if the driver is unbound via sysfs?

Since this driver performs its setup in applesmc_init() rather than a stand=
ard
probe() function, the devm_ allocations are tied to the device-driver bindi=
ng.

If an admin unbinds the driver via sysfs, devres_release_all() will free the
devm_kcalloc memory and the devm_hwmon device, but will leave non-devm mana=
ged
resources like the input device active. Additionally, without a probe()
function, rebinding won't recreate the hwmon device, leaving the driver bro=
ken
until a full module reload.

[ ... ]
> @@ -1398,12 +1566,9 @@ static int __init applesmc_init(void)
> =20
>  static void __exit applesmc_exit(void)
>  {
> -	hwmon_device_unregister(hwmon_dev);

[Severity: High]
Can this lead to a NULL pointer dereference during module exit?

By replacing the manual hwmon_device_unregister() with a devm managed hwmon
device, the sysfs teardown order is delayed until platform_device_unregiste=
r()
is called at the very end of this function.

>  	applesmc_release_key_backlight();
>  	applesmc_release_light_sensor();
>  	applesmc_release_accelerometer();
> -	applesmc_destroy_nodes(temp_group);
> -	applesmc_destroy_nodes(fan_group);
>  	applesmc_destroy_nodes(info_group);
>  	applesmc_destroy_smcreg();
>  	platform_device_unregister(pdev);

However, applesmc_destroy_smcreg() is called right before the platform devi=
ce
is unregistered, which frees and nullifies smcreg.index and smcreg.cache. T=
his
creates a window where the hwmon sysfs files are still active and accessibl=
e,
but their backing structures are gone.

If a concurrent read to a sysfs file occurs during this window, it could
call into the new hwmon read callbacks and dereference the null pointer:

applesmc_hwmon_read() {
    ...
    case hwmon_temp:
        if (attr =3D=3D hwmon_temp_input) {
            const char *key =3D smcreg.index[channel];
            s16 value;
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711060634.5794=
-2-fourdollars@debian.org?part=3D1
