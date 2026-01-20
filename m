Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3E443CEDF;
	Tue, 20 Jan 2026 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920528; cv=none; b=VbfFdTF44vPyDWkurWDE2yVQMaRYnyIQ7lwGNYFme3YYGVGnLWBlcEM/2VXXE6e8Ctinb7uo3hfd/a0rRx2ajOg3mNlBgPNOf7uXWTLRN+crl1y2L3MunANuvkDhCsGsbDKbsxpC2VMytYKKe6co76GbgpYkGEZKl1fVwww2q3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920528; c=relaxed/simple;
	bh=zRjVCNf+qKm6DXzBY3yYHFZHZ//C7HSVeSvdiBeET28=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VLZghayZvsaic9N8hq6mT8meFkLSfvTl/v3DPseQOnQy1R/mZi9e3kavz7E6twiOdKdzJ1oIXcUTt1r5fjH02WDRnMWLpOFu3jWIAqDAWpY2iBVhx55WwTOX0tc3R+eS3cPLvxe3BoHbHipqBTkkbF+FAUx1fbUJcMWjUPDolWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpNu9McO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpNu9McO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768920527; x=1800456527;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zRjVCNf+qKm6DXzBY3yYHFZHZ//C7HSVeSvdiBeET28=;
  b=BpNu9McOV1T60E0IEo/h4N5tvJzZVpTgtqiPgfoefk1fkrDrgRjRzoxV
   SEcNGyYvFG3i5K4bvYxypLkF5QUccIc5N9Pi7mnbGKgtDI3Co/aOA0Iug
   OAzIKL0SAkWVnKwvIrOgCtFm+5XJvfVjDjCsI1Qzd+1F9KZbdXzslpxku
   7FKn75BvldoCx7E8PdBqC5Cc39yyQckF/EKLVQ+iO9ZkgTP7C0llnjaOA
   djVh8vjTrOFC/crImAd5e+taoZCUs72P1qUHAGHl1lmFdz475X6NuL3Gk
   69M8ukwEwGjC/eztGuOicFLwpI2Ld8S4EmqmmdGQpkO7/c5/awEA3D9aM
   A==;
X-CSE-ConnectionGUID: Kjg7Z+t7R0ealAi3451Q/w==
X-CSE-MsgGUID: GhkJ2mcnRVKXPZ/ZnLLEdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81503201"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="81503201"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 06:48:46 -0800
X-CSE-ConnectionGUID: MYEuuaXkSoCi5SS270nT9A==
X-CSE-MsgGUID: tWD7JN/GRr2yEws6Piuwug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="206390717"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 06:48:42 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Jan 2026 16:48:39 +0200 (EET)
To: Rong Zhang <i@rong.moe>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
    Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v10 2/7] platform/x86: Rename lenovo-wmi-capdata01 to
 lenovo-wmi-capdata
In-Reply-To: <20260117210051.108988-3-i@rong.moe>
Message-ID: <dc356678-4be6-3ba8-dd9e-18ba910f5e62@linux.intel.com>
References: <20260117210051.108988-1-i@rong.moe> <20260117210051.108988-3-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 18 Jan 2026, Rong Zhang wrote:

> Prepare for the upcoming changes to make it suitable to retrieve
> and provide other Capability Data as well.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>  drivers/platform/x86/lenovo/Kconfig           |   4 +-
>  drivers/platform/x86/lenovo/Makefile          |   2 +-
>  .../lenovo/{wmi-capdata01.c => wmi-capdata.c} | 124 +++++++++---------
>  .../lenovo/{wmi-capdata01.h => wmi-capdata.h} |  10 +-
>  drivers/platform/x86/lenovo/wmi-other.c       |  11 +-
>  5 files changed, 78 insertions(+), 73 deletions(-)
>  rename drivers/platform/x86/lenovo/{wmi-capdata01.c => wmi-capdata.c} (60%)
>  rename drivers/platform/x86/lenovo/{wmi-capdata01.h => wmi-capdata.h} (60%)
> 
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
> index d22b774e0236f..fb96a0f908f03 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -233,7 +233,7 @@ config YT2_1380
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called lenovo-yogabook.
>  
> -config LENOVO_WMI_DATA01
> +config LENOVO_WMI_DATA
>  	tristate
>  	depends on ACPI_WMI

This series is in the review-ilpo-next branch now. Thanks to all who have 
participated in getting it into shape!

While reading it through once again while applying, I start to wonder if 
this config would be better named as LENOVO_WMI_CAPDATA ?

-- 
 i.
