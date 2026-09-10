Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC8039768D
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 08:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029411; cv=none; b=O73jG9BYIQ4hIWVzFYTZ1ngNV7Cj8XcXwKR6DcdKMY8QBkyme9Snl6Vk1zuhV3uoEpUGKU1AQWe/7eVdEVBv/q9B7HPZWuXtL8x9hG/nTqq+rRdn6YIW2cv+JEXehbRXjEWok3I+AoFHxie2HIdzi6rQZAntQFKiN9t5GZ3Nmmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029411; c=relaxed/simple;
	bh=h8AUoXpXxaIVVloeOgLzHhauGQ0dvlJj3rQtRp01Dzo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I0SOZLxjfaSt36B6gEE7PZr53FKC0Fp4/Bd3BB4lNsZ14JHntL0F4l2+yQzSNqUENVc1tI6BVfMiCyd+L1rK3S9twSxlkJkM+vrP0bMP63NZzXScUSRpyyXu3OqVoaV6RhvSwOTMlN+rIxERYLYmnYzaHffjItGBwyo/vIaZRUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyJuMvuQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyJuMvuQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CAC11F000FF;
	Thu, 10 Sep 2026 08:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029409;
	bh=tNJT5hhRfMYQPJHWqv7hiV7RPRDYBiJZk7C1Ld1Dqc0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fyJuMvuQP0cJt9WTPxL5Q53LEnL8+n0o+vzYDA2aH5/s7qBsDdQ3aFhB/VtR5mtEu
	 hULBz8fWG2rrp+wYZ2r4khJb5CWg8ErVKjk82Tpgs2dDfyjX6SCPYinTnOAVietWFo
	 D99N8Ub1oLIjYVyJQD34ibE29a5RfLlAWfmC6SUNhsdRfhaaTyLJsedaQekaMX2Vcz
	 up7TrJt3YmKIAbfBQpATe4CIEMxSc1ZAbrYje3T1sjnJv45/FJqgktP7F2wltiHcO6
	 /RciEqBYpVaq5Nz/mi5WRyHG0rTtOqG87NolMlEZQW0SKiiAuD0DkNimY+IpgD1KJP
	 Ftu3QXZ7+A/ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/8] hwmon: (k10temp) Stop matching Hygon devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260910082734.3771675-6-wanglin@open-hieco.net>
References: <20260910082734.3771675-1-wanglin@open-hieco.net>
 <20260910082734.3771675-6-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 08:36:48 +0000
Message-Id: <20260910083649.4CAC11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incomplete removal of Hygon support in documentation
--

commit 5233d0bb0c626dfef82d25286284d5ba59e76f21
Author: Lin Wang <wanglin@open-hieco.net>

hwmon: (k10temp) Stop matching Hygon devices

This commit removes the Hygon PCI match and the Family 0x18 branch from the
k10temp driver. Hygon temperature monitoring will be added separately, as
the derived node number currently has no defined relationship to the Hygon
DF node or its SMN root.

> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index 75a45010d687a..20a5470e6593f 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -475,7 +475,7 @@ static int k10temp_probe(struct pci_dev *pdev, const =
struct pci_device_id *id)
>  		data->read_tempreg =3D read_tempreg_pci;
>  	}
> =20
> -	if (boot_cpu_data.x86 =3D=3D 0x17 || boot_cpu_data.x86 =3D=3D 0x18) {
> +	if (boot_cpu_data.x86 =3D=3D 0x17) {

[Severity: Low]
Does Documentation/hwmon/k10temp.rst need to be updated to match this code
removal?

Currently, the documentation file incorrectly lists the chip as supported:

  * AMD Family 18h processors: "Hygon Dhyana"

If a user consults Documentation/hwmon/k10temp.rst for driver compatibility,
could this regression mislead them into thinking the k10temp driver still
supports it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910082734.3771=
675-1-wanglin@open-hieco.net?part=3D5
