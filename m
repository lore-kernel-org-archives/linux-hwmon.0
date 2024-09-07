Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1851A55
	for <linux-hwmon@vger.kernel.org>; Sat,  7 Sep 2024 11:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725708333; cv=none; b=u+A1yK7riQRpJiIyCrbG7jKs/WLRYc8j/SqXNsvZzXs6+zlcz5E0yAiJdub0xvESZnSHwGTGwsd0vsdys6XSgdSH2HIoONUk4ezU9/T3DcF+NPa0V7IzjlD46qfKbJo7eghv+KCDTNVhoT33QCOqjcVy+ogXssX/qCgBXqxJKj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725708333; c=relaxed/simple;
	bh=oLDWCLi85go0t0qWaPThxnG7vTz8xaufmQ+5UCpO/3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7wpx3b+QxsTcqBCgdO9nU161XqYbzogdcwpV+B0MI3O3pDNuINpyZmiZhE9SS6liMtDGZmSw+jD+gH72URMmDRuE0UjjoGbwfhUcxlGXXZ+qGO0D6QDIpwz0qKVYRE4nY+pWzRL7m9na1XjAIit4QZOpuISyb3F4tuIT493mIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ar0bVaIx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ar0bVaIx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725708332; x=1757244332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oLDWCLi85go0t0qWaPThxnG7vTz8xaufmQ+5UCpO/3I=;
  b=ar0bVaIxBa2mNHGH7WTr5fQUqzZJov6oYFJW3lEDy91KSyvtuaLiX7cf
   FEnPHL4QRSQyZGzkRFGVxGMb+Hh/+ERdWLOEt2pjB3v93mvnF0sGYC7o2
   o3QIpxIUcXiue9Y/dNXKshSm04Vj8iC5Clbhgon52wofrJd6uK1SHv1w4
   P4RJmPwG88ef23/1AxFAz01YPrADAmR4/96uKqjnSU5RlyieoFIs0UW7u
   MltHz/jHILT6N18xZ8gM3tNPkZCvkR5zP49S9t9THhDf5Atr2B0tVmtNu
   i0EWUw1Z9/BW12IhspxHeAAPWKrUvGGkKEq0zpk/BfaxLCDmzBSff9GOJ
   Q==;
X-CSE-ConnectionGUID: 0KqAgLJfSGe8vEhJjZYwJQ==
X-CSE-MsgGUID: kvmvq7bnQ/SobqSGKPY3zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35602832"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="35602832"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 04:25:31 -0700
X-CSE-ConnectionGUID: CGHw8ydzQ2a20Tzalfbn+A==
X-CSE-MsgGUID: 3D53xFoXSdC9rdbylNgqtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="70317223"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 04:25:27 -0700
Date: Sat, 7 Sep 2024 14:25:24 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com, tursulin@ursulin.net, linux@roeck-us.net,
	andi.shyti@linux.intel.com, andriy.shevchenko@linux.intel.com,
	intel-gfx@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	anshuman.gupta@intel.com, badal.nilawar@intel.com,
	ashutosh.dixit@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v2] drm/i915/hwmon: expose package temperature
Message-ID: <Ztw4JIWCpsDpMHN0@black.fi.intel.com>
References: <20240906093118.3068732-1-raag.jadav@intel.com>
 <ec2f4b09-03f7-4866-ae50-2f3b5d093a0d@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec2f4b09-03f7-4866-ae50-2f3b5d093a0d@intel.com>

On Fri, Sep 06, 2024 at 03:15:01PM +0530, Riana Tauro wrote:
> Hi Raag
> 
> On 9/6/2024 3:01 PM, Raag Jadav wrote:
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
> > v2: Use switch case (Anshuman)
> > 
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11276
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  8 ++++
> >   drivers/gpu/drm/i915/i915_hwmon.c             | 40 +++++++++++++++++++
> >   drivers/gpu/drm/i915/intel_mchbar_regs.h      |  4 ++
> >   3 files changed, 52 insertions(+)
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
> > index 17d30f6b84b0..0a9f483b4105 100644
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
> place it alphabetically after rapl_limit

This follows the ordering of enum hwmon_sensor_types (as the rest of the patch).

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
> > @@ -310,6 +313,37 @@ static int hwm_pcode_write_i1(struct drm_i915_private *i915, u32 uval)
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
> > +	switch (attr) {
> > +	case hwmon_temp_input:
> > +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> > +			reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_temp);
> > +
> > +		/* HW register value is in degrees, convert to millidegrees. */
> use millidegree Celsius here

The intent here is to signify the conversion rather than the unit.
But okay, will add if we have another version.

Raag
