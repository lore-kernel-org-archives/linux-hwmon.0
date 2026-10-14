Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC87153CA9A;
	Wed, 14 Oct 2026 14:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986423; cv=none; b=HNBAz7OU9cX14IIbBsprKkFDaYivE1tSyGQ/Mzhrq1oYNfCp3kd73t0ddpXNFWjb810A9o3ltmXC+8nOc0bqCn6r+xK3GTyNiFeEDp6XYBKDaB/9F4l40BFZRTA6e6PH/Rpjd1IEky+oF/CVJ3G1FdNeHpvJC3HgwNy0vrUe3co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986423; c=relaxed/simple;
	bh=b9CXXtcashKP76vye/xkZHzz54m+XySmhG1AONZ/mM4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mGGRQLaUhD17ZiXWkZZpreljA2qocdxs8wIEACqaAeEziMgxQdKtiC6ATHbVgBrJyz07ne5FL6q2Tv+uT4wjobipcRY9MzukEgCDF/dDoEXOX3pjPQhQzPeaWXlxacgs349V/ynA0yVhAq6Q+AOSQOn/hS4N0llU0G5F+K5j5Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TcYYVqZZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TcYYVqZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791986413; x=1823522413;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=b9CXXtcashKP76vye/xkZHzz54m+XySmhG1AONZ/mM4=;
  b=TcYYVqZZZNH1IRFIPGLFwGnYt9pcS5jkVA8/4ANbLd573mG5qvvcgf8I
   ratDosj6kybfsFdS47s2nUVHcTXszgMCyOfA590o0IBqQU08K9PL+GAZV
   xPFufARjesnCHcp9qKpOL0vLwMFBNkhb56XhsMOEJN07dAjh4YZr473xi
   0bJKa3B+FrC04aXcsTjIx1c18ljD+pvt4Lkxss7XEtzPgq4M7JL5kOw+x
   UzGEDY3/w/fPMzcS/eeraPRmAn43nrR3Vy+VwzINVypgkQR63L72TwovZ
   fVj1ylNzc0JKcvbPNyNaM0BZPTqwAfOXkko3b0EVhh5NiNFOnfpCCteNM
   A==;
X-CSE-ConnectionGUID: XVw47yJtQYWvWbYjgN5bbQ==
X-CSE-MsgGUID: Re5uxRpjTg+EbkPWHVGIPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="735969"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="735969"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 07:00:12 -0700
X-CSE-ConnectionGUID: fUyB5PeUSoesp9Y5TVqs8w==
X-CSE-MsgGUID: mx0QbGqrQBGnJ2FYFU80Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1329530"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 07:00:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 Oct 2026 17:00:03 +0300 (EEST)
To: Oleg Keri <okerixx@gmail.com>
cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
    linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v6 2/3] platform/arm64: add Lenovo Yoga Slim 7x Gen 11
 EC driver
In-Reply-To: <20261014132315.4659-3-okerixx@gmail.com>
Message-ID: <3df5fce1-509b-1362-3b78-8f79337ebc05@linux.intel.com>
References: <20261014132315.4659-1-okerixx@gmail.com> <20261014132315.4659-3-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Oct 2026, Oleg Keri wrote:

> The Lenovo Yoga Slim 7x Gen 11 (Qualcomm glymur / Snapdragon X2 Elite)
> carries a Compal EF06 embedded controller on I2C at address 0x70. The
> platform firmware describes it as an ACPI GenericSerialBus region, but the
> machine boots from device tree, so nothing otherwise talks to it.
> 
> Commands are exchanged with two raw I2C block transfers: a 7 byte write to
> register 0x02 carrying the command and up to six arguments, then a 6 byte
> read of register 0x01 for the result, with a short delay in between before
> the result register is valid. The EC offers no way to match a result to
> its command; the delay is the one the vendor ACPI code uses.
> 
> Expose what the EC offers that the rest of the kernel does not already
> provide:
> 
>   - the board thermistors that report a value at probe, five on this
>     machine, as hwmon temperature channels. These are charger, CPU
>     voltage regulator, 5 V rail and ambient sensors, not die sensors, and
>     read considerably cooler than tsens
>   - CPU fan speed in RPM
>   - the keyboard backlight as an LED, off/low/high
>   - Fn-lock as a read/write sysfs attribute, matching the ideapad-laptop
>     interface. The EC reports Fn+Esc as an event but keeps no state of its
>     own, so the driver owns the bit and toggles it on the key
>   - the mic-mute and airplane-mode keys as KEY_MICMUTE and KEY_RFKILL.
>     These reach the host only as EC events; they are not on the keyboard's
>     HID interface and have no GPIO of their own
> 
> The EC signals pending events on a dedicated line, and keeps pulsing it
> until they are read - so the queue must be drained completely on every
> interrupt, including codes this driver ignores. Leaving one behind makes
> the controller pulse indefinitely.
> 
> Fan speed is reported but not controlled. The EC accepts a manual setpoint,
> however it enforces no thermal floor over it: with the fan pinned at
> roughly 2000 RPM under full load the SoC rose from 69 to 91 degrees in 30
> seconds without the EC ever overriding. Exposing pwm1_enable or fan1_target
> would therefore let userspace overheat the machine, so neither is
> implemented.
> 
> Note this is the Gen 11 machine specifically. Its EC differs from the
> Qualcomm reference EC that the reference designs place at address 0x76,
> which is not populated here, and so EC_QCOM_HAMOA does not drive it.
> 
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---

> +static const struct of_device_id slim7x11_ec_of_match[] = {
> +	{ .compatible = "lenovo,yoga-slim7x-gen11-ec" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, slim7x11_ec_of_match);
> +
> +static const struct i2c_device_id slim7x11_ec_i2c_id[] = {
> +	{ "slim7x-gen11-ec" },

Thanks for the update. I've applied patch 2 to the review-ilpo-next branch 
in the platform drivers (pdx86) tree.

The other two patches will need to go through some other tree.

While applying, I added .name = into that id struct.


--
 i.
