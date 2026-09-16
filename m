Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82FF4AB3C7;
	Wed, 16 Sep 2026 17:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789579369; cv=none; b=KYQu+dQPAmKKm0cHvVeGdLoOD1mzbw4pStio4qfeYDJ2IMHD8v20PvhN3zVFZDQ/jRj9i2pfdlwrmf/XvSV8/5YiBiNnpOets3VGU+BrddBwIK5BXzAP5rW7tZDT6Zs/calCZmtddXeiwAqlsu5VhuDijg1WkK6I0WyeMwujnss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789579369; c=relaxed/simple;
	bh=DWgt2LzcztFfh2+x/mFEkw6gG1oj4varf62qZTyeixM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fF9cYcXx0ENvvlTM9BsTn6hVZUouA7Jz53QrGZ5y4zQaiMvOh0KCL1SJnXQi/N40kF/HkA1+GNHQm9GfKqxjOEZ56GGpgnv5rthcsHwPP4i0pOyr7JJCmrnmEVY/RPyMTAB4alwC7bCFmSmFwpClaDfvr4VXhFpLzojEtcyO1Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=iGWrL/EK; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="iGWrL/EK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1789579359;
	bh=DWgt2LzcztFfh2+x/mFEkw6gG1oj4varf62qZTyeixM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iGWrL/EK7qATmCY5X22oQrljzYdFkH+oJGYk0iUCfxWvPITvZ4vl2H+9xOvCfPTT9
	 MppvZTIOrPj/SdwOfxmKiAD5+JTNmDh3CDNvl1GDYnqP9NZwisMs5SZ2a0Cwgif0OI
	 vybx76Z5JQSVrpr1lbXrysTPTKR8YSdxumSYeHhk=
Date: Wed, 16 Sep 2026 19:22:37 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jordan Brough <jordan@brough.org>
Cc: rafael@kernel.org, rydberg@bitmath.org, linux@roeck-us.net, 
	lenb@kernel.org, maciej.wieczor-retman@intel.com, pawel.chmielewski@intel.com, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ACPI: sbs: add battery hook mechanism for
 SBS-registered batteries
Message-ID: <3bf6e328-f0d5-49d8-807e-9a212fbbb7e0@t-8ch.de>
References: <20260913231410.416922-1-jordan@brough.org>
 <20260913231410.416922-2-jordan@brough.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913231410.416922-2-jordan@brough.org>

On 2026-09-13 17:14:09-0600, Jordan Brough wrote:
(...)

> Add a parallel sbs_battery_hook_register()/unregister() mechanism to
> drivers/acpi/sbs.c, mirroring the existing CmBatt hook API in name and
> behavior so that callers can support both battery registration paths
> symmetrically. This is purely additive: no existing hook consumer or
> code path in drivers/acpi/battery.c is touched, and sbs.c's own
> behavior is unchanged for any driver that does not call the new API.

(...)

> ---
>  drivers/acpi/sbs.c     | 147 ++++++++++++++++++++++++++++++++++++++++-
>  include/acpi/battery.h |  16 +++++
>  2 files changed, 162 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/acpi/sbs.c b/drivers/acpi/sbs.c
> index 86b7c797585..305bf62eae3 100644
> --- a/drivers/acpi/sbs.c
> +++ b/drivers/acpi/sbs.c

(...)

> +/*
> + * Battery hook support, mirroring the mechanism in drivers/acpi/battery.c
> + * for batteries registered there. That mechanism only sees batteries
> + * added via drivers/acpi/battery.c, not the ones this driver registers,
> + * so drivers wanting to attach optional functionality (e.g. an extra
> + * power_supply_ext) to an SBS battery need this separate copy; see the
> + * comment above the declarations in include/acpi/battery.h.
> + */

(...)

This completely duplicates the hooking logic in battery.c.
Also it forces drivers to register both kinds of hooks explicitly.

Couldn't we have a single shared hooking infrastructure and registry
which avoid both issues?

(...)


Thomas
