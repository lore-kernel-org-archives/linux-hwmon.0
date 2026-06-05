Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9013E5A05
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 18:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780684552; cv=none; b=Dd9IBGEbUbHuQhhmGcFWANfYyNJ3xiTzj+rLKvfUPZgDFfAsWnINBkXLkGHeVyHNZsEtbUCKTZaT3PGSwgpfY6y8Ie1tPJR7nPud5/NKKaw95wZSclU2LdAEz6WkUpI1u9Eg9lMJWrOXMYGnpLk54BnqCCiUBL4Hub3BC3arGp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780684552; c=relaxed/simple;
	bh=Z8N8+qI6qmQTPcUF9aBx2iIv9DMBwZS+synKbvASKGU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iK/8TnXgtAVz5/TADlqkqCmIC8zO9vStwH+zpplS+G/Ii6V/SeovN0WfMotuSQzw7Wxq5MoaaG370hebARS7KywqYQz5CIkz6rsyZ7arNniKwFL6wmqOaRCTfAuE+NPOYqNVTs6PqPB7+K6zKqe3+QQB+Agddvs1oSGSqr9YX4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0cHwRPc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0cHwRPc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01B281F0089A;
	Fri,  5 Jun 2026 18:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780684551;
	bh=Wz47JaDH0EAW1F7s219HNBoZ/teMbxIC80pQzfQrdgw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k0cHwRPcCizJRbdgFTbUN10X8i+tj8IJzgHrb9P3AVZlk2w6bVwV5QwVdPRh++UlX
	 FlTDBKX+n/5SoXkeECCbrB+FtJ1t2x6IIW/+4X/6xuN3L7M3PCgvUaHCzLwom4Zvmz
	 0jbzkhmdFQa9d5NLBNuTR3E/VXB5qvrmdP+PQfHnFblDVxcGLcmipg8IgzXAl9Gi8f
	 gTi0k6+c7yKRIAZeGQsdwSyamIMeqTnUR1UFLh+jJktpPnzq/J0BjPOOeGw2jfZooy
	 gGW4k6k5sbo498r1M4wSfXCePJLoedzmFuYfY7tFZl0UZPwuj5X69qInikmLmxU1Ln
	 TfAg7kdb2NNTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/9] platform/x86: dell-privacy: Use new buffer-based
 WMI API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605181433.188847-3-W_Armin@gmx.de>
References: <20260605181433.188847-3-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 18:35:50 +0000
Message-Id: <20260605183551.01B281F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Accessing `priv->features_present` outside of `list_mutex` allows =
a use-after-free if the WMI device is concurrently unbound.
--

commit a3ad83ddca7fe7cc3bab34b78212f157c5a62096
Author: Armin Wolf <W_Armin@gmx.de>

platform/x86: dell-privacy: Use new buffer-based WMI API

This commit updates the dell-privacy driver to use the new buffer-based
WMI API. This allows it to support ACPI firmware implementations that do
not use ACPI buffers for the device state.

> diff --git a/drivers/platform/x86/dell/dell-wmi-privacy.c b/drivers/platf=
orm/x86/dell/dell-wmi-privacy.c
> index ed099a431ea4d..7bc1bae3a196f 100644
> --- a/drivers/platform/x86/dell/dell-wmi-privacy.c
> +++ b/drivers/platform/x86/dell/dell-wmi-privacy.c

[ ... ]

While reviewing this file, I noticed a pre-existing issue in
dell_privacy_has_mic_mute().

drivers/platform/x86/dell/dell-wmi-privacy.c:dell_privacy_has_mic_mute() {
    ...
	mutex_lock(&list_mutex);
	priv =3D list_first_entry_or_null(&wmi_list,
			struct privacy_wmi_data,
			list);
	mutex_unlock(&list_mutex);

	return priv && (priv->features_present & BIT(DELL_PRIVACY_TYPE_AUDIO));
}

[Severity: High]
This is a pre-existing issue and was not introduced by this patch, but
could accessing priv->features_present outside of list_mutex allow a
use-after-free?

If the dell-privacy WMI device is concurrently unbound,
dell_privacy_wmi_remove() will acquire list_mutex, remove priv from the
list, and unlock it.

After remove() returns, the device management framework automatically
frees the priv memory since it was allocated with devm_kzalloc().

If dell_privacy_has_mic_mute() unlocks the mutex and is preempted before
returning, would it dereference the priv pointer after it has been freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605181433.1888=
47-1-W_Armin@gmx.de?part=3D2
