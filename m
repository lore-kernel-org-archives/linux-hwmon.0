Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8933B2ECE83;
	Fri, 21 Nov 2025 17:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763744460; cv=none; b=G432G1DIkz3lZg9+/pgX9fcXt0FDFyAFAL3WZ+AHLOMmzBqvMArbKxugn5TaimOQ1JJv7IR6g71xVKksZRNtWXMNAgtVj4tH68Ep6ADLjufx5z8UPHAzPRJs2gHVYWuRJOAJdFbLpcfhIsDF1eDbIe4J5L5/daRsy1qxIwpxiFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763744460; c=relaxed/simple;
	bh=ab9AbPLbjAAxuAFKgcOaTDcpTcosXRGjg6LcalKCHfs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k1bQQNxS+lyGWs7T4SsJFMkTGPj27PxO2EB/Tmn2LG5/94YpazibUBKmhpUaJDfegLi58od0MqlsMiMiTGF80SBZPl6l4GHEnrbZl2Mzy0e/dDgtFMN9GdTw8pcQ3ADjGaTTbngjNoXcl7fbsMWcGgOh0fEpBovuutILittqulg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTt0k7x/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTt0k7x/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763744459; x=1795280459;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=ab9AbPLbjAAxuAFKgcOaTDcpTcosXRGjg6LcalKCHfs=;
  b=VTt0k7x/OPuJwVM9RRm01Nx7//P66FEzvk3IcPzqmqwPLNvNfbfnXJuv
   99u2vhO//6LyYaAi62Zo9bx38yp1cxs4KR5MBKx1NdeqUDuWwmuy+Fifq
   nUFak6Pe10DoN7NnmCOnkp46gNTHsgnJ0KbLcs3VjV7eMQqymRN49yLwO
   ZSpNxaSWyPEwAFPdAmsXFMSAPgqps/SCyi0lFxyzVgzeoULrNagwQH+Yv
   FYutVyEFbV1cUFuM/ABwhLEVWJ0Fp3ClPN2wpVqwgBsK457YivSk1wCFM
   T36DTRL7O7LuzBKezsa+LvQZiqyBto2eopQUgy49W1e1+zY2CgSpnH21K
   g==;
X-CSE-ConnectionGUID: Lr0cUOgpRJmQZ6j4U9OB5A==
X-CSE-MsgGUID: 8ALMYVutT2O/lP4zAGYCog==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65883541"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65883541"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 09:00:58 -0800
X-CSE-ConnectionGUID: A3wGcvbTQeuGGBVxvj+j8A==
X-CSE-MsgGUID: +YcV82j8ToKs5aOvPZse6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="192509218"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 09:00:54 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, 
 Antheas Kapenekakis <lkml@antheas.dev>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Hans de Goede <hansg@kernel.org>, 
 Derek John Clark <derekjohn.clark@gmail.com>, 
 =?utf-8?q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20251119174505.597218-1-lkml@antheas.dev>
References: <20251119174505.597218-1-lkml@antheas.dev>
Subject: Re: [PATCH v6 0/6] platform/x86: ayaneo-ec: Add Ayaneo Embedded
 Controller platform driver
Message-Id: <176374444974.14895.7833039607877044343.b4-ty@linux.intel.com>
Date: Fri, 21 Nov 2025 19:00:49 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 19 Nov 2025 18:44:59 +0100, Antheas Kapenekakis wrote:

> This series introduces a platform driver for Ayaneo devices, ayaneo-ec.
> This driver provides hwmon support, power management, and module management
> (for the new Ayaneo 3 device). Module management is done through the new
> firmware attributes sysfs interface.
> 
> Luckily, all Ayaneo devices with an ACPI mapped EC use the same registers.
> Older devices also use a memory mapped region for RGB[1], but that is
> replaced by HID in the new Ayaneo 3. Therefore, this allows for a simple
> driver design that provides robust future support. The memory mapped region
> can be upstreamed as a different RGB driver in the future or remain
> out-of-tree[1].
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/6] platform/x86: ayaneo-ec: Add Ayaneo Embedded Controller platform driver
      commit: 70a4a815d9b74f17abd1ae46c6cb93b736e02d91
[2/6] platform/x86: ayaneo-ec: Add hwmon support
      commit: 536522f0355cffe8478502ffbb041769e2f61bfe
[3/6] platform/x86: ayaneo-ec: Add charge control support
      commit: 6d710ec3584227a9c393c478b1cd4a70e74a3c88
[4/6] platform/x86: ayaneo-ec: Add controller power and modules attributes
      commit: e921a8b4dea50b9c20f1ee9b2b69cedc00b7570a
[5/6] platform/x86: ayaneo-ec: Move Ayaneo devices from oxpec to ayaneo-ec
      commit: 02c15e3ddcc5a50fbdf1e586d94f0372f5b40ed5
[6/6] platform/x86: ayaneo-ec: Add suspend hook
      commit: 2643187ccb8628144246ee9d44da5e3ac428f9c3

--
 i.

