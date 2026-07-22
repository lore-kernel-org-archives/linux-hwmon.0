Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B43E402B9E
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 22:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784758684; cv=none; b=rDN3yx38sK7FewxCkPfPSmIqz2jbJyLtb2hGN9JsCl4GSSM/oRN7ye6/8nCX04zIJPvY6QWs7INrRdB6bfi93C0rHnEsZ2Nv+tWgVKhUMcy7OQKQbEFAZUP9N3j9JHbyiKx7Ydh44wkviCTRO4qt7ztlvU+diqnKZ9qXELrtBXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784758684; c=relaxed/simple;
	bh=OCzGFirbrMISpvQPbWTgJxEK3SgfNPMRRAvL2aFVMT8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dCd6UbUC/s0bkI7+7QdvY2VAnWRclsZDjnLfDmo+c9q8Rbo4snOFiViLBdYR6XxBeCHm7VCiwCaIxKniD2IRamZgW4azrznbUoRkyUuRJ0rLZ8MTu1qWHQ2uqfR+NnVrBGE9+xmCXt70o8YImsDbytnwVZCl8rstWdIldg9ToIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bngylbCZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bngylbCZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8E21F00A3D;
	Wed, 22 Jul 2026 22:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784758682;
	bh=lokAasojUog25u3Qon9YSl7aujeGru9W6UOChwvAaaE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bngylbCZ1B7s6RZ5F2vGxWjpl7blWK43XKFKc53cVjMVbS4I7L5Sw8QiA8RdlKRlE
	 ZXOWh5c01JutX3qfX3gJGXxrZX51una1CjKstEWKFOXV8Myj01DaP17q7gXrkLylmA
	 5bTqvp4seAvc1A864Qrnn8i5e0mnoL+P8rL+kpOSFcGhAaoNqpF3eZRxQjBHr/EdAV
	 bCrlQx8Fs7FCcyEvFJiHutFTmmufLXzPT6ejWk1ZOSzeUIqixTrTUD0ah0rrDPM4Sf
	 ZtcUh+tFEKC6jeLyz2PBHxsDwaqcMPTrogkmQUW2bOgbEdUvEtd4K2mwOzJuFqXub8
	 aVsS4WN2dwa2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 6/6] eth: fbnic: firmware notifies hwmon on
 sensor threshold events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260721221540.648272-7-limzhineng2@gmail.com>
References: <20260721221540.648272-1-limzhineng2@gmail.com>
 <20260721221540.648272-7-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 22:18:02 +0000
Message-Id: <20260722221802.9F8E21F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Uninitialized sensor thresholds default to S32_MIN, causing alar=
m checks to always evaluate to true and trigger incorrect alarms.
- [Low] Missing IS_REACHABLE(CONFIG_HWMON) guard in fbnic_hwmon_notify_even=
t causes a linker error when CONFIG_HWMON is disabled.

Pre-existing issues:
- [High] Error path in fbnic_fw_request_mbx saves a freed IRQ vector, leadi=
ng to a double-free on device removal.
--

--- Patch [6]: [PATCH net-next 6/6] eth: fbnic: firmware notifies hwmon on =
sensor threshold events ---
commit 47c1b3bcb6116f975f3ccbd306542f2c5e9bd4f2
Author: Zinc Lim <limzhineng2@gmail.com>

eth: fbnic: firmware notifies hwmon on sensor threshold events

The firmware sends an unsolicited message via the new
FBNIC_TLV_MSG_ID_SENSOR_THRESHOLD_EXCEEDED_RESP IPC message when a
temperature or voltage sensor crosses one of its thresholds. Parse this
message and translate it into the corresponding hwmon alarm
(temp1_{min,max,crit}_alarm or in0_{min,max}_alarm) via
hwmon_notify_event(), so userspace listeners are woken on the relevant
sysfs attribute.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/=
ethernet/meta/fbnic/fbnic_hwmon.c
> index c5cddd9cef124..eb910ba47f378 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
[ ... ]
> @@ -214,22 +216,72 @@ void fbnic_hwmon_register(struct fbnic_dev *fbd)
[ ... ]
> +void fbnic_hwmon_notify_event(struct fbnic_dev *fbd, int id, long val)
> +{
> +	enum hwmon_sensor_types type;
> +	struct device *hwmon;
> +	s32 attr =3D -1;
> +
> +	switch (id) {
> +	case FBNIC_SENSOR_TEMP:
> +		type =3D hwmon_temp;
> +
> +		if (val <=3D fbd->fw_cap.temp.min)
> +			attr =3D hwmon_temp_min_alarm;
> +		else if (val >=3D fbd->fw_cap.temp.crit)
> +			attr =3D hwmon_temp_crit_alarm;

[Severity: Medium]
Will this evaluate to true if the firmware does not provide a critical
threshold?

It appears that fbnic_fw_parse_cap_resp() initializes these thresholds to t=
he
sentinel value FBNIC_SENSOR_NO_DATA (S32_MIN) when they aren't provided.=20

Since S32_MIN is the minimum possible 32-bit integer, any valid temperature
reading will be greater than S32_MIN, causing this condition to incorrectly
evaluate to true and preventing subsequent valid threshold checks from being
evaluated.

> +		else if (val >=3D fbd->fw_cap.temp.max)
> +			attr =3D hwmon_temp_max_alarm;
> +
> +		break;
> +	case FBNIC_SENSOR_VOLTAGE:
> +		type =3D hwmon_in;
> +
> +		if (val <=3D fbd->fw_cap.volt.min)
> +			attr =3D hwmon_in_min_alarm;
> +		else if (val >=3D fbd->fw_cap.volt.max)
> +			attr =3D hwmon_in_max_alarm;
> +
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	/* Pair with WRITE_ONCE() in fbnic_hwmon_unregister(). Skip the
> +	 * notification if hwmon failed to register or has already been torn
> +	 * down.
> +	 */
> +	hwmon =3D READ_ONCE(fbd->hwmon);
> +	if (attr >=3D 0 && hwmon)
> +		hwmon_notify_event(hwmon, type, attr, 0);

[Severity: Low]
Does this result in a linker error if CONFIG_HWMON is disabled?

Since fbnic_hwmon_notify_event() is built unconditionally when CONFIG_FBNIC
is enabled, and hwmon_notify_event() is declared in include/linux/hwmon.h
without a fallback stub for !CONFIG_HWMON, calling it without an
IS_REACHABLE(CONFIG_HWMON) guard will cause the linker to fail to resolve
hwmon_notify_event().

>  }

[Severity: High]
This is a pre-existing issue, but does the error path in
fbnic_fw_request_mbx() save a freed IRQ vector?

drivers/net/ethernet/meta/fbnic/fbnic_irq.c:fbnic_fw_request_mbx() {
    ...
    if (err)
        free_irq(vector, fbd);

    fbd->fw_msix_vector =3D vector;
    ...
}

If a device resumes from suspend and this path fails, fbd->fw_msix_vector
is left holding the freed vector number.=20

Later, when the device is removed, fbnic_remove() invokes fbnic_fw_free_mbx=
().
Since fbd->fw_msix_vector is non-zero, it skips the safety check and attemp=
ts
to free the already freed vector, leading to a double-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721221540.6482=
72-1-limzhineng2@gmail.com?part=3D6
