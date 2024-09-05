Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F64E1527B4
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Sep 2024 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725526542; cv=none; b=DioBg2fn8pUC/DO3z+fJqHQtdPpe98ooSG2K1oWzQFhjYT2L9xEwrtcjOr0sB7b6te1SXpSGJD/n15sY9s/y15M/sO9yGbJl20Pe3XS1UTd2iXTmS1dHU7mws8hsqjPMFFenWi8+HMMnAVzOL7n9GZY2nf4xSLhKmx4xVaS5uX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725526542; c=relaxed/simple;
	bh=6F72mxGq/Qsog6jzv3lDYj+pqXEEAUPrejKf+LUdfv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjqKQeLUutlX++bHUXWEoWgSnLNvRCU4N2fDquB6wRs98SP4SiUb6dhQHaCQWk4v/kD8O0qvqVkTvaUu9Yt7n7AkbZEDEaeP/SmO/ydhKnRLERNmI998DJZVcPCwJNNrwkzAFEm5GIdM+0hu7kaKhoq+1yQmRlBFM3Bm2l3xKPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRt8On15; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRt8On15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725526539; x=1757062539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6F72mxGq/Qsog6jzv3lDYj+pqXEEAUPrejKf+LUdfv0=;
  b=IRt8On15SATQleuTbhpQeQcFvQXQMcvqk6PNS+RHxEdpUP1fO8AbvcDb
   fGtbJoQ0EcyOP+CbJKhgjQLUbeLLNcjFwIYym7ivkJMuWlW1/+oqxH0sA
   gIszab4oV3CY8o4n9HrNG0fzrBVKaCJZnRGX4s8jcfCTlFtN4ly2iAK/h
   HBbWE2Hwkt+ZSc2Fy4ogJfxTi1TtT356QXgJ5ylXHRaYUg/2p2FHw8n2v
   I9w1v9zitdIvSxhJQkfdCebf0XQThNE2PNCzx3ZC/8lvzDqyTQyLzVhHC
   NWa9niYVT9cnxGD/a/dXe4WMvorzhy12azo29i9Ragx/dT0VMR65w3KMv
   g==;
X-CSE-ConnectionGUID: uM71Cg/lRe+hnQDW9rpEMg==
X-CSE-MsgGUID: 02rzWbRFR1yvy0E6kwRnAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="28116759"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="28116759"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 01:55:29 -0700
X-CSE-ConnectionGUID: pQB3oT5CSEWP9QMkY3gezw==
X-CSE-MsgGUID: fDzXH5aPR2SyGoqb70uwVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="70163379"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 01:55:26 -0700
Date: Thu, 5 Sep 2024 11:55:23 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com, tursulin@ursulin.net, linux@roeck-us.net,
	andi.shyti@linux.intel.com, andriy.shevchenko@linux.intel.com,
	intel-gfx@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	anshuman.gupta@intel.com, riana.tauro@intel.com,
	ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v1] drm/i915/hwmon: expose package temperature
Message-ID: <Ztlx-xAd2JSpolZA@black.fi.intel.com>
References: <20240828044512.2710381-1-raag.jadav@intel.com>
 <07c01d49-aa9c-429e-bd4d-65cf2648329e@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07c01d49-aa9c-429e-bd4d-65cf2648329e@intel.com>

On Thu, Sep 05, 2024 at 11:56:15AM +0530, Nilawar, Badal wrote:
> 
> 
> On 28-08-2024 10:15, Raag Jadav wrote:
> > Add hwmon support for temp1_input attribute, which will expose package
> > temperature in millidegree Celsius. With this in place we can monitor
> > package temperature using lm-sensors tool.
> > 
> > $ sensors
> > i915-pci-0300
> > Adapter: PCI adapter
> > in0:         990.00 mV
> > fan1:        1260 RPM
> > temp1:        +45.0°C
> > power1:           N/A  (max =  35.00 W)
> > energy1:      12.62 kJ
> > 
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11276
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  8 ++++
> >   drivers/gpu/drm/i915/i915_hwmon.c             | 39 +++++++++++++++++++
> >   drivers/gpu/drm/i915/intel_mchbar_regs.h      |  4 ++
> >   3 files changed, 51 insertions(+)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > index be4141a7522f..a885e5316d02 100644
> > --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > @@ -83,3 +83,11 @@ Contact:	intel-gfx@lists.freedesktop.org
> >   Description:	RO. Fan speed of device in RPM.
> >   		Only supported for particular Intel i915 graphics platforms.
> > +
> > +What:		/sys/bus/pci/drivers/i915/.../hwmon/hwmon<i>/temp1_input
> > +Date:		November 2024
> > +KernelVersion:	6.12
> > +Contact:	intel-gfx@lists.freedesktop.org
> > +Description:	RO. GPU package temperature in millidegree Celsius.
> > +
> > +		Only supported for particular Intel i915 graphics platforms.
> > diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> > index 17d30f6b84b0..9f1a2300510b 100644
> > --- a/drivers/gpu/drm/i915/i915_hwmon.c
> > +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> > @@ -7,6 +7,7 @@
> >   #include <linux/hwmon-sysfs.h>
> >   #include <linux/jiffies.h>
> >   #include <linux/types.h>
> > +#include <linux/units.h>
> >   #include "i915_drv.h"
> >   #include "i915_hwmon.h"
> > @@ -32,6 +33,7 @@
> >   struct hwm_reg {
> >   	i915_reg_t gt_perf_status;
> > +	i915_reg_t pkg_temp;
> >   	i915_reg_t pkg_power_sku_unit;
> >   	i915_reg_t pkg_power_sku;
> >   	i915_reg_t pkg_rapl_limit;
> > @@ -280,6 +282,7 @@ static const struct attribute_group *hwm_groups[] = {
> >   };
> >   static const struct hwmon_channel_info * const hwm_info[] = {
> > +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> >   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
> >   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
> >   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
> > @@ -310,6 +313,36 @@ static int hwm_pcode_write_i1(struct drm_i915_private *i915, u32 uval)
> >   				  POWER_SETUP_SUBCOMMAND_WRITE_I1, 0, uval);
> >   }
> > +static umode_t
> > +hwm_temp_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> > +{
> > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > +
> > +	if (attr == hwmon_temp_input && i915_mmio_reg_valid(hwmon->rg.pkg_temp))
> > +		return 0444;
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +hwm_temp_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> > +{
> > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > +	intel_wakeref_t wakeref;
> > +	u32 reg_val;
> > +
> > +	if (attr == hwmon_temp_input) {
> > +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> > +			reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_temp);
> > +
> > +		/* HW register value is in degrees, convert to millidegrees. */
> > +		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> > +		return 0;
> > +	}
> > +
> > +	return -EOPNOTSUPP;
> > +}
> Let's try to have synergy between previous attribute, such as hwm_fan_input,
> and this one.

This one's simple enough to be inline IMHO.
Besides, it's already in synergy with hwm_in_read() which has similar
implementation.

Raag
