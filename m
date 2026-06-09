Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844DC3FE668;
	Tue,  9 Jun 2026 11:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781004816; cv=none; b=qnNe13anvIK0lgw6DfYfnTVL789f0AWdOmLOh0UmOUhVDGku3TQ87sMs0RnptgOJVwBUvrDSapLDuxiHwsjxE4gOR7LxunqBFyIhfl+ziz/Mkc+IKiYijzpwMY3Cy8ni20IV6ou8Yqz9SLky2tJ3IwVO/Yv5qPAm9/mXSan7PCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781004816; c=relaxed/simple;
	bh=RMCAUX115ZVyS5biRIxXdRMF2387AiFTst2iru25BMo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=c//7wAWENnVZNgsiGRzF1yd8m5d75UW+GTPvC+jjujM/BiLhe+q5HLTyxxBs80iYLfYL0xHfPRpMZT3qVgOXqre7QTf8SdRo7EVqbFxG8S3IIdIy5wZk2d/NT2GDqBj7qzLGsfDqZkb588Lh6qZJBA0njWZo9/biI1/CxDN1OIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zkh+vz19; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zkh+vz19"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781004814; x=1812540814;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RMCAUX115ZVyS5biRIxXdRMF2387AiFTst2iru25BMo=;
  b=Zkh+vz198V45d8mGwwyblpKnC75rl1VIn5YJ9AO6OFoXh05MYUpY5bbL
   s8OmiHvIID7eRKBCNrRdP2yV0/Mgq0lTkxi0Ey+Ys4FRJmiokzuvD1QHb
   /BpwUtYQM9HeiOlYjmpajpJAuBCsNCQRdp4A4KF94fu1ROY3xegWan3Kn
   /9Prx+sSTEC+tSyQvtL4tvnD2zoHAU2PU+Cc9soPkuh37Nsqqf1OlnaxA
   ai5N40jjjpolCM36mS+WT6+4XYhXGEaMhQ4T+ddhJ9UltkxGDs0JWBl+K
   Cbb8Eb4WSEgWUhteq3cTCCrqTq8WWBWrTVr4d0GYQhJYLc448HCwJd8D3
   w==;
X-CSE-ConnectionGUID: t5ESixBpQJCtH+V/SkQsnQ==
X-CSE-MsgGUID: DKRxnOenRKu2aT6d0/FZpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99179292"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="99179292"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 04:33:34 -0700
X-CSE-ConnectionGUID: 8bgMKEk1ScOZzZVlvl9UMg==
X-CSE-MsgGUID: WxYkMMooRQmTHuHCXqYyqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="243394292"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.81])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 04:33:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Jun 2026 14:33:26 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org, 
    soyer@irl.hu, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux@roeck-us.net, linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH v5 7/9] platform/wmi: Make wmi_bus_class const
In-Reply-To: <20260605205937.530897-8-W_Armin@gmx.de>
Message-ID: <ed90d7ca-f981-1d6b-55e3-2a15c2b131a3@linux.intel.com>
References: <20260605205937.530897-1-W_Armin@gmx.de> <20260605205937.530897-8-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-288204477-1781004806=:1206"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-288204477-1781004806=:1206
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 5 Jun 2026, Armin Wolf wrote:

> The functions class_register()/_unregister() and device_create()
> both support taking a const pointer to the class struct. Use this
> to mark wmi_bus_class as const so that it can be placed into
> read-only memory for better security.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> ---
>  drivers/platform/wmi/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
> index 5a2ffcbab6af..0782ebc33c00 100644
> --- a/drivers/platform/wmi/core.c
> +++ b/drivers/platform/wmi/core.c
> @@ -1088,7 +1088,7 @@ static void wmi_dev_shutdown(struct device *dev)
>  =09}
>  }
> =20
> -static struct class wmi_bus_class =3D {
> +static const struct class wmi_bus_class =3D {
>  =09.name =3D "wmi_bus",
>  };
> =20
>=20
--8323328-288204477-1781004806=:1206--
