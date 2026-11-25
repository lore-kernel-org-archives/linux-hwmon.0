Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643840;
	b=UTNMai39wZzMqWgQ3w4LAB5vk7tBV2Zll++A1XCnowx3bLq92ntk430y7z6NMrJJdbfw
	 IfrARE3OH60mf09fOwKmeIbHy9TZTJDJKOqXqOjZveVZRmEagXoXwJ0eAXvv4TNLtN5gO
	 6NYYdf+QrIs+9ntYBXHez4zAU422H1h7h4poqZa40OD4L4f6cYNFEa5WWV7PGqZ803bMb
	 piARD9LS2nJyLG4AZ5jUFoBhtZgu6zaxU6ItEKbmwoEYFKLh3p0dCBRRrAZY/o4/ahbpS
	 gzZPT5kYtbaK9NqFhVEL8USgug2VDOuxvfZYvOS3+bdsOSu1l81Kjs+yvZ2zJaBi8Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643840;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=2K3Db8LNwo4qWMxRImmBccaaTsxsdI5hMj+xr2B1FZ0=;
	b=ZOvquoLlKrsDdu0bRN08E2od6AfZlUB4T2bgTQ/4YSPYA5A0bn1hIVoetohGPjBcjdxg
	 IIgkHfMpwJN4kAZk7bsqW2UgP5V/ZiQXqkKHyWN7nNa98C+tJ+JXDmiM3Gec5IGTCI2/R
	 cH2f2bt1gRZVI5nFxkWOLBg3f6jJgInN7muf//DnVTpwjYiw2wzWa0Vu5UtC5omUh21jc
	 PZ+AxNx1rvHcvArxDX2kOFjU1/K2IDRua1n3layXeYk9bPXEiKvbpcsZor202wCgrR0Dq
	 q66xreXCHiBjRJW9e8k4sVW7Cw4N/RIajs96yoQIw1n1r/+Ld5vsx/OgQjukYOigVOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XBzLmfQP;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39A6606A31E;
	Wed, 25 Nov 2026 21:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B39A6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XBzLmfQP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795643840; x=1827179840;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=DI+/KXJxI3NkcVpi2dKOEaihNHueHSF6UIpyMuXHXFM=;
  b=XBzLmfQPqTB5muMt/+V0Jx8MCrmZeNiLc6Wyq0ROvDVwC9eOFzL3v0RX
   AXBnYu6F5BYPvS1N1zJvH8seNLIMKkWImHPjLcW6k9kIpcLZ54UE1z7gT
   jxv/5CK0/mzH8SFnIHGZXWevWHCk7uen5Xis1MLATu6WdklesEpgerFy1
   +P6eRpRVr6X858qvjd2VnL9zFQRnx5m07dNGu94yGqIX6m/d0tjud+Zra
   pij9jL7HSMNT/yPzboiICdpBoFv2Ieaj1QV/sD6SnQnHC66v2a5R8dlSP
   kQCQaj34/DP+Lc1ZcuLSAkinwRUvv584tCVuEcvqYRVOoB6fcFllS7608
   Q==;
X-CSE-ConnectionGUID: tgXKwFsDR1mMhgBd6j+SPg==
X-CSE-MsgGUID: AGmbWj1wRr27Gv1LTwGt6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4528273"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4528273"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 13:57:19 -0800
X-CSE-ConnectionGUID: EWCvkhejRz2crE4uaINclw==
X-CSE-MsgGUID: 88viNq/0Rp+VAVTby/bghQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="14023381"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.96])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 13:57:16 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Nov 2026 23:57:13 +0200 (EET)
To: Ziqiang Xia <xiazq123666@gmail.com>
cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
    Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Documentation: ABI: testing: Add emdoor-intel-wmi
 sysfs ABI
In-Reply-To: <20261123-emdoor-intel-wmi-rfc-v2-1-3f4a03095f2e@gmail.com>
Message-ID: <13db1531-58e4-1db9-4f1e-5911aec82f8c@linux.intel.com>
References: <20261123-emdoor-intel-wmi-rfc-v2-0-3f4a03095f2e@gmail.com> <20261123-emdoor-intel-wmi-rfc-v2-1-3f4a03095f2e@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Nov 2026, Ziqiang Xia via B4 Relay wrote:

> From: Ziqiang Xia <xiazq123666@gmail.com>
> 
> Document the read-only touchpad_enabled sysfs attribute exposed by
> the Emdoor Intel EWMI platform driver.
> 
> Signed-off-by: Ziqiang Xia <xiazq123666@gmail.com>
> ---
>  Documentation/ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi | 7 +++++++
>  MAINTAINERS                                                 | 6 ++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi b/Documentation/ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi
> new file mode 100644
> index 000000000..6cf85db62
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi
> @@ -0,0 +1,7 @@
> +What:		/sys/bus/wmi/devices/0B30FD67-1B62-4FCA-B10B-50DC7ADE6A39-*/touchpad_enabled
> +Date:		November 2026
> +KernelVersion:	7.4

This ship has sailed already.

> +Contact:	platform-driver-x86@vger.kernel.org
> +Description:
> +		(RO) Firmware touchpad enable state ("0" or "1") queried via
> +		WMCD GTPS (0x03/0x07).
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 981eb3fdb..70c976ffe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9848,6 +9848,12 @@ T:	git git://linuxtv.org/media.git
>  F:	Documentation/admin-guide/media/em28xx*
>  F:	drivers/media/usb/em28xx/
>  
> +EMDOOR INTEL EWMI DRIVER
> +M:	Ziqiang Xia <xiazq123666@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi
> +
>  EMMC CMDQ HOST CONTROLLER INTERFACE (CQHCI) DRIVER
>  M:	Adrian Hunter <adrian.hunter@intel.com>
>  M:	Asutosh Das <quic_asutoshd@quicinc.com>
> 
> 

-- 
 i.

