Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE15F2F873
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Apr 2024 14:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713019447; cv=none; b=V/hG9/zukC5ezvd6jpqm1719G4Hs6U8ebW5YIbzRmUVQwN9CbpPsasCptbuVn+G9np8en4Hxql0TvvqhGTeW+++JTfEvm6jEAZJD9g0kNXgbzCwvCgoK0kv1/zNuvDiODpvtwx2/KFg0eCa0X2Q6YFaD2WofTRoBdgKiWvHGv6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713019447; c=relaxed/simple;
	bh=NUdL+EQs1Io0o1CPQjQaA1cf/BK86jp7+Qv4Aa3Uphk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=txzHz47GS+w1tG6wuT+6mUGyP4ZMvJijNKQ+w+/hh7AV/18REQcccsM93cqxTpnrP6gRO/4YErCTbnI308uLp+Q22e3K1yPZnxfbKHBi0pcl3DCCixk4w80Kyn1oK5GdXesPruuwZLq4IJpOPRmBwAcPemICFMS40iRhOFaT3bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=NIlaQVWz; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="NIlaQVWz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1713019432; x=1713624232; i=w_armin@gmx.de;
	bh=okYUqaoqD8t5ZTf7MMRnKc8ZwAGpmdU73/pbDYl1/xY=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=NIlaQVWzL8cDI1q+f1Wk9eJv6cUY4DMwm7oQE+x7z7+OPYqp7p01mMxLtrOGH/Ae
	 YH0Se2wToSsMkGwDJyj1RcFA2tV84il3bGu6uAaiHqv8yd7RsJy76rkscRJu4T/Qa
	 lx6BEk/U/rvl2x5nF5Zjrhb3IYqkaOlJlGPpeV0hDKRzqo156PTWr3lGE0/yLrUxP
	 YwthpfBr1kTFAXsBJ1hci2yNadwy/Ne6B5mL/TE9zUOnPxtDqZMIy2P2harpeGXjT
	 39GAyJ1z/G51GmMCPqPcs+oSUY6wmG+3OQXJm9emtTYH9Minzli14cmkJG4E4aoz8
	 x2F8SNZ0IkEMrzpFew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MdNcG-1sUiNM32y8-00ZP3o; Sat, 13
 Apr 2024 16:43:52 +0200
Message-ID: <55e00433-71a6-4b41-a65b-0a8871398cdc@gmx.de>
Date: Sat, 13 Apr 2024 16:43:50 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/hwmon: Get rid of devm
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
Cc: Badal Nilawar <badal.nilawar@intel.com>, Andi Shyti
 <andi.shyti@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, linux-hwmon@vger.kernel.org
References: <20240413001031.481961-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20240413001031.481961-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:guEmR/kHCCyycEzCbg+VHqKgqbUY5IEchqBoHzYTn8vACoeRB7z
 O1fANTuetCdumrhy+h3bkcVP3nbf8TaU7bJhCk7FQs8kiQ25Bonyg/5Pscz4FUBqgx6S40f
 0qBu8TY8AqlON5vY/CzxxWJEKhaf7xmH57ikMX3+JpuGt2ihBvZ99q3hwXhA7Q8b+gR3DGw
 kzo1p5jjXj0V5GNmig5zw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8Wfrg2rgGLk=;obfjgpvlWuaEXGPuvktmKj0m2AX
 XKr1XxOfWzPEh9yza/uOU2Ulkbr4L5LdV8HtqIebvkuMhUrz69fFcKAiBIHyR7PMPOd0U86RT
 PXvo215iLs7CVbfMQZM2FSyxnDO+cFVKGUiDxfYFbMpZMZHdKi0hcZAgS2fNPlFGpl69LpdkH
 SFmIpBuyJVlIWu5b1LQBpGpu/w7aC42Bf/k5xDQZdpKB5dnH0zWS7/xK1eDf2g8Ssj5CQdMQ5
 yQ4Aoeqwm2/IpgYiLWWrit263djRV/6DmZ0QKNkwpF+Zgw+RelIBJNMjdVzSOrjAhEpByt9dD
 WxRtRdcohS+uRT44FnXLD0Tqzs+7Ku5aXL4XCa28GdMQ0iwRlqmaOCGVw7ZMZAs98YL8GYprS
 572i1/cTtbc8GOg8puaiH1rVsAZ8LFqmoWFHa8wW1oVS5esuQEEoQgLsHh7A/Z5JorfNLTkIE
 rL4/vl56wecC2fAlf1lil46ZctFs9QH6SuUq361HTcKF3dfGxh8Da4jFiUCwzqrs6Dj8u799l
 VSKjQAuSVxaU24LDS+rqNKCsV5nkS1QiV2oxDhsMIBOgIDBXPpCLqEerL5d5WxzpDBq0uRAhH
 HhJq19Gv2oYixV8Tq/FrM4wauwujFNn/sBPf1sTz1zEiCoAQqLPCfjTR1O4MsWuexP+oDzDTV
 WuvK7l3IPHJSXkcewScQNtTd0+EjCEDRsDvLpsAUA345VPvqKdFxHoTXKGzpFCGjOd34Fzt8P
 OvP5rR7ujEBpr6rP2tCcAytxoSAbetxBO34weCFs9N0pMRdBEm8l0jvaI8+1fP1aH7QFI1K1A
 Og1bHKqiEGk0e4kTmUNcU4Asxno96jZY5WfINSGgz3yrE=

Am 13.04.24 um 02:10 schrieb Ashutosh Dixit:

> When both hwmon and hwmon drvdata (on which hwmon depends) are device
> managed resources, the expectation, on device unbind, is that hwmon will=
 be
> released before the drvdata. However, it appears devres does not do this
> consistently, so that we occasionally see drvdata being released before
> hwmon itself. This results in a uaf if hwmon sysfs is accessed during
> device unbind.
>
> The only way out of this seems to be do get rid of devm_ and release/fre=
e
> everything explicitly during device unbind.

Hi,

could it be that the underlying cause for this is the fact that you are us=
ing
devres on a DRM device?

The documentation states that:

	devres managed resources like devm_kmalloc() can only be used for resourc=
es
	directly related to the underlying hardware device, and only used in code
	paths fully protected by drm_dev_enter() and drm_dev_exit().

That said, since the i915 driver is already removing the hwmon device manu=
ally
with i915_hwmon_unregister(), i agree that not using devres in this case s=
eems
to be the solution.

Thanks,
Armin Wolf

> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/10366
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_hwmon.c | 46 ++++++++++++++++++++++++-------
>   1 file changed, 36 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i9=
15_hwmon.c
> index 8c3f443c8347..5f6022b148d7 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -792,7 +792,7 @@ void i915_hwmon_register(struct drm_i915_private *i9=
15)
>   	if (!IS_DGFX(i915))
>   		return;
>
> -	hwmon =3D devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
> +	hwmon =3D kzalloc(sizeof(*hwmon), GFP_KERNEL);
>   	if (!hwmon)
>   		return;
>
> @@ -818,10 +818,10 @@ void i915_hwmon_register(struct drm_i915_private *=
i915)
>   	hwm_get_preregistration_info(i915);
>
>   	/*  hwmon_dev points to device hwmon<i> */
> -	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, ddat->name,
> -							 ddat,
> -							 &hwm_chip_info,
> -							 hwm_groups);
> +	hwmon_dev =3D hwmon_device_register_with_info(dev, ddat->name,
> +						    ddat,
> +						    &hwm_chip_info,
> +						    hwm_groups);
>   	if (IS_ERR(hwmon_dev)) {
>   		i915->hwmon =3D NULL;
>   		return;
> @@ -838,10 +838,10 @@ void i915_hwmon_register(struct drm_i915_private *=
i915)
>   		if (!hwm_gt_is_visible(ddat_gt, hwmon_energy, hwmon_energy_input, 0)=
)
>   			continue;
>
> -		hwmon_dev =3D devm_hwmon_device_register_with_info(dev, ddat_gt->name=
,
> -								 ddat_gt,
> -								 &hwm_gt_chip_info,
> -								 NULL);
> +		hwmon_dev =3D hwmon_device_register_with_info(dev, ddat_gt->name,
> +							    ddat_gt,
> +							    &hwm_gt_chip_info,
> +							    NULL);
>   		if (!IS_ERR(hwmon_dev))
>   			ddat_gt->hwmon_dev =3D hwmon_dev;
>   	}
> @@ -849,5 +849,31 @@ void i915_hwmon_register(struct drm_i915_private *i=
915)
>
>   void i915_hwmon_unregister(struct drm_i915_private *i915)
>   {
> -	fetch_and_zero(&i915->hwmon);
> +	struct i915_hwmon *hwmon;
> +	struct hwm_drvdata *ddat;
> +	struct intel_gt *gt;
> +	int i;
> +
> +	hwmon =3D fetch_and_zero(&i915->hwmon);
> +	if (!hwmon)
> +		return;
> +
> +	ddat =3D &hwmon->ddat;
> +
> +	for_each_gt(gt, i915, i) {
> +		struct hwm_drvdata *ddat_gt;
> +
> +		ddat_gt =3D hwmon->ddat_gt + i;
> +
> +		if (ddat_gt->hwmon_dev) {
> +			hwmon_device_unregister(ddat_gt->hwmon_dev);
> +			ddat_gt->hwmon_dev =3D NULL;
> +		}
> +	}
> +
> +	if (ddat->hwmon_dev)
> +		hwmon_device_unregister(ddat->hwmon_dev);
> +
> +	mutex_destroy(&hwmon->hwmon_lock);
> +	kfree(hwmon);
>   }
