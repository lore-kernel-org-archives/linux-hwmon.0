Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE4B3EC2E1;
	Fri, 12 Jun 2026 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270207; cv=none; b=LUG7AuV2DiqaeHrkglM1T1l/zn6gThXTz+eSeDGPr46S4XXI69OvkuaXboAFGhANc+xYlGcA/qWtxHnq7DD2uwYOjdWZx44q3aNzQ1WmAv1nQfIXVkKoOWJghLED5XRiFNXRV383+V1N2jwZPo1PInBF3KrYszD0x96rxzScZ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270207; c=relaxed/simple;
	bh=8jRBM/T7N/RLxQzA/gLPQTyvnY2bDOp6HFMSk/mC13c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tUiJ19Z4rBIkwtHLJm/HvxhC5AddaxszTaaIdPLX0UoYgpn/2piHLoWBzAzEdHe/YBpendiaPmEmThf71PcTvltgK8mBSogA+I7V+b153ywNW3B+mPxKRss3HX2ElU2wkavCDtoxAIIyDlnEDA9yQRAJea1gdd1SCea+snBiSwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YdViKkFw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YdViKkFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781270206; x=1812806206;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=8jRBM/T7N/RLxQzA/gLPQTyvnY2bDOp6HFMSk/mC13c=;
  b=YdViKkFwCvI+bMh0tuQNx1nWRvrIZxQwRDEEcpwhwakHs7k5+xUG0Txd
   1fQ+5iaESb10XCGb7yo8v+oawomeHQcp1xFuIuzD/4q8HUM0HsZxVAmZX
   h4Di0ng5L7nlSIqisVxZVaUDBviLHNw95pKNQ8jEScPrPoFcbIwJuQmXu
   kx7WfsxCNrbV5KCxcqaYrjChJFXtFOLgvSXlZdD5KGsjLjKn1NlKwe4Z5
   0PsHoOlH/4UzcKbMSsbn1tMsowZOj/P45TuKR563DXi1VnWMKaqg195Yz
   86A4p2Pdh/H78WOP6zb2yUt5hTxPxKw9xYPHPZltnkCzQy8lzW3JE6ppR
   Q==;
X-CSE-ConnectionGUID: BizGWw4TSBu2DYWTvfyq8Q==
X-CSE-MsgGUID: uUAAzskBSNiLaCSkdHg+lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82290039"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82290039"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 06:16:46 -0700
X-CSE-ConnectionGUID: MP2BuGy3TZu/Bc+LtQJeGQ==
X-CSE-MsgGUID: +4z1A0/oR0uYWiVMjs10UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="243885091"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 06:16:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Dell.Client.Kernel@dell.com, pali@kernel.org, mjg59@srcf.ucam.org, 
 Armin Wolf <W_Armin@gmx.de>
Cc: soyer@irl.hu, hansg@kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@roeck-us.net, 
 linux-hwmon@vger.kernel.org, mario.limonciello@amd.com
In-Reply-To: <20260610203453.816254-1-W_Armin@gmx.de>
References: <20260610203453.816254-1-W_Armin@gmx.de>
Subject: Re: [PATCH v6 0/9] Convert most Dell WMI drivers to use the new
 buffer-based API
Message-Id: <178127019722.31486.6141646420423582072.b4-ty@b4>
Date: Fri, 12 Jun 2026 16:16:37 +0300
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Wed, 10 Jun 2026 22:34:44 +0200, Armin Wolf wrote:

> The new buffer-based WMI API improves the compatibility between
> different ACPI firmware implementations by performing marshalling/
> unmarshalling of WMI buffers like the original Windows driver.
> 
> Convert most Dell WMI drivers to use this new API. This also
> removes all ACPI-related code from those drivers because the
> new buffer-based WMI API uses abstract WMI buffer objects instead
> of ACPI objects.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/9] platform/x86: dell-descriptor: Use new buffer-based WMI API
      commit: 0f2d6a308210caaa5e0ebf9c085d87f4a2c06bfa
[2/9] platform/x86: dell-privacy: Use new buffer-based WMI API
      commit: 1719340487e63da13f2ac25e488c72737a545772
[3/9] platform/x86: dell-smbios-wmi: Use new buffer-based WMI API
      commit: 6f918e3d95c9b0b4e6a6881692a9b5f9bf0f36b0
[4/9] platform/x86: dell-wmi-base: Use new buffer-based WMI API
      commit: 982b0e683aa3b1d20b1512cde53207ba1c80e22b
[5/9] platform/x86: dell-ddv: Use new buffer-based WMI API
      commit: 7fced293bbd00ee8d20eaf4654849ac9ff332973
[6/9] hwmon: (dell-smm) Use new buffer-based WMI API
      commit: ab1eb37dd63ff3555e4f98918f1bd3498522f765
[7/9] platform/wmi: Make wmi_bus_class const
      commit: b79ad5e8ba5cfda93a83e0cf71d4743829cc9f83
[8/9] platform/wmi: Make sysfs attributes const
      commit: c3cbac4be03d769571f32e7f27241b2c58f722f5
[9/9] modpost: Handle malformed WMI GUID strings
      commit: 3429ae7b2f02a4a6ad40d36ee06641d433d75a1b

--
 i.

