Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA2811CAF;
	Thu, 15 Jan 2026 13:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768484746; cv=none; b=NzHdJVWgetiW/bYAr55p5GjzsdnVfiMhEZKVa9nRhmLbfhGdL0hzukBEXpVznQ6IgCCKHekeGpqfoC3I9TnWgdEwxPQvRidlkMqjHIEb4h/hBH17woNpk0s1W15a13Sd+LYWLgdFlDXvwo1cDf3m1zOvplI7xJ/GM8DXGjq5ngs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768484746; c=relaxed/simple;
	bh=ItDVnxhe2Ix+ULDbGwyYuN7+iWNyciuGpvu0QRDii6M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=An8ONif7PdA8roEl+vIag5+RClPHE2PjhTGv79v6iq7I46q2O6giIxonnQQHNEan3xe8lheG/v0LU3bmNP0P8BmuGlBqifUAQ0LVMSNV6/Vq5mSjyiBovcEb+Q0h75tIDshB6f/CqL6wdb8pBCxw6buA5rvQEk7CgWxTjbULhOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+eBbrqP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+eBbrqP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768484744; x=1800020744;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ItDVnxhe2Ix+ULDbGwyYuN7+iWNyciuGpvu0QRDii6M=;
  b=P+eBbrqPUHMmXMMGY6Q8NnECiyCov5o3RB1HIpwO9ffCJTrElkF2SBHh
   CBAjVd/AZSF/Dkz00BqAQ0UZZvxUclqDx7zB1dpDFaKmxzAkLxgaj3OKq
   n9NqMY7Qx+8zBdHYXvfNEFlRlcwSpsoM1fU0+ffgMIM6MmhOLkCUtk6w6
   U3Vkl5t9sSOuxF/sHhmWyjiCzbqc5TnZHbcZOKvB/eKyEet3v9n37Tv6C
   oPqEex+bQMGNTi2MWku096tamS+BFRHQJRu1SAyS7myHp6lchMKzD9i5c
   ACGdCMOh1SdGj1+DFoC63l7XhcrS/xoE2suQsh35TtO78gVX+mNkQjYwu
   w==;
X-CSE-ConnectionGUID: KGvHt2m3T42BdB7z3qzqyA==
X-CSE-MsgGUID: XK/GSWzJSy27feGDfO7ruQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80432531"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80432531"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 05:45:43 -0800
X-CSE-ConnectionGUID: UhmLyDjITJWiXwgUztvKQQ==
X-CSE-MsgGUID: eRd1gbqzQOG6Vbdnz/TnLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209435526"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.248])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 05:45:41 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hansg@kernel.org, linux@roeck-us.net, 
 Krishna Chomal <krishna.chomal108@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260113123738.222244-1-krishna.chomal108@gmail.com>
References: <20251230145053.516196-1-krishna.chomal108@gmail.com>
 <20260113123738.222244-1-krishna.chomal108@gmail.com>
Subject: Re: [PATCH v3 0/3] platform/x86: hp-wmi: Add manual fan support
 for Victus S laptops
Message-Id: <176848473669.15451.499475802697727364.b4-ty@linux.intel.com>
Date: Thu, 15 Jan 2026 15:45:36 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Tue, 13 Jan 2026 18:07:35 +0530, Krishna Chomal wrote:

> This series adds support for manual fan speed control and PWM reporting
> for HP Victus S-style laptops.
> 
> The first patch is a trivial fix for ordering the include headers.
> 
> The second patch refactors the hwmon implementation to use a per-device
> private context for state tracking. It implements RPM-to-PWM conversion
> using linear interpolation based on the laptop's internal fan tables
> retrieved via WMI. It also introduces PWM_MODE_MANUAL, allowing users
> to set specific fan speeds.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86: hp-wmi: order include headers
      commit: 60f2d5d0f04365c41ad4f9eddf48c80dcd0b01c9
[2/3] platform/x86: hp-wmi: add manual fan control for Victus S models
      commit: 46be1453e6e61884b4840a768d1e8ffaf01a4c1c
[3/3] platform/x86: hp-wmi: implement fan keep-alive
      commit: c203c59fb5de1b1b8947d61176e868da1130cbeb

--
 i.

