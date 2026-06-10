Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CE6421A12
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 20:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124319; cv=none; b=PItN2qQLOEloTt40KogQd1iy+B2/kfkHunBIxVLDaR+cLvo/eqLXtmGPQNSLNQXJxb7cqGbhnw9FPq5O5kWvWOrjSV7v4sa0jNF1GMzTxdBvmSITGeJoR6odavaol5oFxkfJCuivaeXsfZoqUrUb3iDdI/ra1iWuYuSwL/Gg9h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124319; c=relaxed/simple;
	bh=p1uG4uRDNX1M8vjd1NTMOfGb2ovzb0yWJXHphc9tdCM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lgcPg0j0Q/pZis6qXlLNpQcrgt4cM8n+RWjEKSOfehpxo6sY4ttUTdtfbl60tV13bZTel3fe9D+NgzxIdvwWQeIxVpfpGkfgmXc2R26WL0sD/9mbyfjbkOUPWN2dR1tridqkoNB822Blqm3JicxbkftuMVoB55C1x2vTIUmvnpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgU8kiMx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgU8kiMx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F021F00893;
	Wed, 10 Jun 2026 20:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781124318;
	bh=1DY4IhHEEtDBiL4o9s21LliRjghGmFfCrJwxaotwjx8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WgU8kiMxUNJLAMwrk+Z2pONt2oJ8zU4MVB3xVadkLIhkNSlUKhFsPM7eZRhUU33MM
	 e2ote5e2vgFrdzkcVOkBxzOvR5rxZujFJju4ynNWYl/S0eTwtUQIrvhpIQ59ceRqa4
	 cSZowNJlrg+2OwwtmjiAVz6pvrdoOaEB3OEI5AOhjJgVYVMGIYwKyFKqGvRREri/J6
	 YMfKirslFV9PZCQ8sW7ZzFyQDyw6IIkcTbXj6+wKEuyZSvQDaKz47SfLPWlAa/NBc+
	 EJzTja4uh79mzR4r9Z/O6gAM6VuzF6eyYq4Z9dxkfM/CdhqA1uuBXvTDgpZCegWi9Z
	 N2rdaOirSh6Gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/9] platform/x86: dell-privacy: Use new buffer-based
 WMI API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610203453.816254-3-W_Armin@gmx.de>
References: <20260610203453.816254-3-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 20:45:17 +0000
Message-Id: <20260610204518.33F021F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] dell_privacy_has_mic_mute() accesses `priv->features_present` afte=
r releasing `list_mutex`, risking a Use-After-Free if the device is concurr=
ently unbound.
--

commit c9150394b4cc5e06aab976ccc95fd348e2c66514
Author: Armin Wolf <W_Armin@gmx.de>

platform/x86: dell-privacy: Use new buffer-based WMI API

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for the device state.

> diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.c b/drivers/platf=
orm/x86/dell/dell-wmi-privacy.c
> index ed099a431ea4d..f9d275b2f900c 100644
> --- a/drivers/platform/x86/dell/dell-wmi-privacy.c
> +++ b/drivers/platform/x86/dell/dell-wmi-privacy.c
[ ... ]
> @@ -185,60 +208,28 @@ static struct attribute *privacy_attrs[] =3D {
>  };
>  ATTRIBUTE_GROUPS(privacy);
> =20

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the file
I noticed a potential use-after-free in dell_privacy_has_mic_mute().

dell_privacy_has_mic_mute() accesses priv->features_present after
releasing list_mutex:

bool dell_privacy_has_mic_mute(void)
{
	struct privacy_wmi_data *priv;

	mutex_lock(&list_mutex);
	priv =3D list_first_entry_or_null(&wmi_list,
			struct privacy_wmi_data,
			list);
	mutex_unlock(&list_mutex);

	return priv && (priv->features_present & BIT(DELL_PRIVACY_TYPE_AUDIO));
}

If dell_privacy_wmi_remove() executes concurrently (e.g., via sysfs unbind)
and removes priv from the list, the devres core will automatically free the
devm_kzalloc-backed priv structure.

If the thread running dell_privacy_has_mic_mute() is preempted immediately
after unlocking list_mutex, will the subsequent dereference of
priv->features_present read freed memory?

> -/*
> - * Describes the Device State class exposed by BIOS which can be consume=
d by
> - * various applications interested in knowing the Privacy feature capabi=
lities.
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610203453.8162=
54-1-W_Armin@gmx.de?part=3D2
