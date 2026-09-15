Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D077E3793BA
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 13:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480430; cv=none; b=U08dxeIhYiC6tQYv/TLjwh+FPFi/+9KNFAqTTNdL3j87PeZm+hSi/AQdgzl+i9H1C8qFZjBEpy++wu6GMvRz8r7Je+V9T9D5fRnmOdjA0sqSoBBMazesgm03f6Z0Ufj+OFYUZ8bNfFLFFzSIFbyLk1m5ia0iAfME/frrcc8Cakw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480430; c=relaxed/simple;
	bh=56m4y4U3Vj8WPUZf12pnX5ywAAofJyUYVak4u8izgOU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F4nZCKlJHRte3aU/gSr9HjrxysEhEJu6fnWdXy6SsxWBZaoqJbdi+eaXDdefIYB883dSP+78FFVJFi4gj+zcBhROPerezYYk2ZdQRKuyLZEYCCnn3z7Tw4/RdN7RnvW5RetIDYSv+anLhitnreIGEGsTzMYqDeGO//OmqMWu2SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RS+Kxug/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RS+Kxug/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3608F1F000FF;
	Tue, 15 Sep 2026 13:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789480428;
	bh=56m4y4U3Vj8WPUZf12pnX5ywAAofJyUYVak4u8izgOU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RS+Kxug/CuCr2aDvI5qWCGIrRkGUXxw7/9FFNa5Hl/CwtYSVEfVRvID/aBsYBCIUI
	 vbncQsbPgHvb7/AAeXDw+apMRDl0VgOMZSk5ISJrUU8czIuxjC7CLbvq1nwx/YPrw6
	 0krvQLuaJ4yKtVVBkI4BbWInjKTSAEp+6i2WJMs3HQvYicfQho5VOVOOrfWi0WFf5z
	 +tOI2d6+2lji2D1pQy50lGQb++0fQjH+a+r6k/E1RmoMablewEQTTRjp0PJlYJekb7
	 z4TIV+CjqGNMLTYhFlifxdZ9MtiLnJ/CdI9ff5OWyYwmY5pMU1fXlfqf2NazQ+QOsf
	 +ZAQjP3gCzoCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: use named initializers for acpi_device_id
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Zalewski" <pzalewski@thegoodpenguin.co.uk>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260915-acpi-hwmon-v2-1-39d17c748eb6@thegoodpenguin.co.uk>
References: <20260915-acpi-hwmon-v2-1-39d17c748eb6@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 13:53:47 +0000
Message-Id: <20260915135348.3608F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
>=20
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
>=20
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-acpi-hwmon=
-v2-1-39d17c748eb6@thegoodpenguin.co.uk?part=3D1

