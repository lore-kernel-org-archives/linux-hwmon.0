Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2134154C0D
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Sep 2024 19:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725563908; cv=none; b=qNj2gbw2MF6+M09ZlFnowWUIez241hWyB/abYz/yQN/whICDZbwvEXZmpDNiA0+RrtP4RSxy80K9DVZyNUQ2SsL3F4jhAQcJK8Tulg2I8ovIP3v6bpBTNJvz5NkMgl0m5YOJ59CVctDk0J++BqP0Hrz94CfrRL7vxF1dPFB3YCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725563908; c=relaxed/simple;
	bh=LQaZH06YFRj7QqX6WVwdGYIwyJ3DaeVQyzvo53wNDeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSobuC9SG0SmzT2fmgMMD6K42PDemLHReYymfRozqjFb0pLc+hijYyqXqpSvs635yEVp383xzuHCMriSf4+lUEpKSyCLj6aVn65zsHObiOZHD9V9fKxQDm12tUdcPctmKoFcF8/+xRHtJAgP8nnSNhumD/7iCndjkqUs091OP+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYTE/AJZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYTE/AJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725563906; x=1757099906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LQaZH06YFRj7QqX6WVwdGYIwyJ3DaeVQyzvo53wNDeM=;
  b=QYTE/AJZ2SLwBatSGFXY57KWc9QwcLo1MbTy3vQU3OCLqQgloJcPA7pB
   juZv81x2q7izdQ99Nx0+vyKt5phs1/9dtVocE08idwa6xfpVsI5sGvc4M
   oo7xAPvDfcOXNbdcichqvquDVd2HeaW3PmpfKaLXE34V8tWR4bRkvWaMp
   0LiAw0+doNskKsAduX7iL21Sk7iHPLdtX628Mm1Mvhdtm9Fs3A9bdDHXx
   jOj+x1oAJ8SpLKQInCNBUyMq77GP+Fz+1dc1OBTWVHnxxDHhVcOpoG/8q
   UKK94Z61qYjrvlJsY0GIpzXidkxmS3v9m5J0JT4IWJrcxlZS6nY/q0ZAl
   w==;
X-CSE-ConnectionGUID: VmvNRS7LQRW9MpbGoYSc2A==
X-CSE-MsgGUID: JtOT2fQSToSyjsP1TBhMQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="28191052"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="28191052"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 12:18:24 -0700
X-CSE-ConnectionGUID: ofSA+h3nS9COrfWNQ7kVtw==
X-CSE-MsgGUID: Vz0Kf0CBSlGuJQQe6VHKEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="70528351"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 12:18:20 -0700
Date: Thu, 5 Sep 2024 22:18:17 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
	tursulin@ursulin.net, linux@roeck-us.net,
	andi.shyti@linux.intel.com, andriy.shevchenko@linux.intel.com,
	intel-gfx@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	riana.tauro@intel.com, ashutosh.dixit@intel.com,
	karthik.poosa@intel.com
Subject: Re: [PATCH v1] drm/i915/hwmon: expose package temperature
Message-ID: <ZtoD-SoxljuJQuj9@black.fi.intel.com>
References: <20240828044512.2710381-1-raag.jadav@intel.com>
 <07c01d49-aa9c-429e-bd4d-65cf2648329e@intel.com>
 <Ztlx-xAd2JSpolZA@black.fi.intel.com>
 <56zmt55kfwgeq3bsbci7ghooe4qv3nqxulbaipceng2jqb6dtl@hxvgnwznnzpy>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56zmt55kfwgeq3bsbci7ghooe4qv3nqxulbaipceng2jqb6dtl@hxvgnwznnzpy>

On Thu, Sep 05, 2024 at 07:39:31PM +0530, Anshuman Gupta wrote:
> On 2024-09-05 at 11:55:23 +0300, Raag Jadav wrote:
> > On Thu, Sep 05, 2024 at 11:56:15AM +0530, Nilawar, Badal wrote:
> > > 
> > > 
> > > On 28-08-2024 10:15, Raag Jadav wrote:
> > > > Add hwmon support for temp1_input attribute, which will expose package
> > > > temperature in millidegree Celsius. With this in place we can monitor
> > > > package temperature using lm-sensors tool.
> > > > 
> > > > $ sensors
> > > > i915-pci-0300
> > > > Adapter: PCI adapter
> > > > in0:         990.00 mV
> > > > fan1:        1260 RPM
> > > > temp1:        +45.0°C
> > > > power1:           N/A  (max =  35.00 W)
> > > > energy1:      12.62 kJ
> > > > 
> > > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11276
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > ---
> > > >   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  8 ++++
> > > >   drivers/gpu/drm/i915/i915_hwmon.c             | 39 +++++++++++++++++++
> > > >   drivers/gpu/drm/i915/intel_mchbar_regs.h      |  4 ++
> > > >   3 files changed, 51 insertions(+)
> > > > 
> > > > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > > index be4141a7522f..a885e5316d02 100644
> > > > --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > > +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > > @@ -83,3 +83,11 @@ Contact:	intel-gfx@lists.freedesktop.org
> > > >   Description:	RO. Fan speed of device in RPM.
> > > >   		Only supported for particular Intel i915 graphics platforms.
> > > > +
> > > > +What:		/sys/bus/pci/drivers/i915/.../hwmon/hwmon<i>/temp1_input
> > > > +Date:		November 2024
> > > > +KernelVersion:	6.12
> > > > +Contact:	intel-gfx@lists.freedesktop.org
> > > > +Description:	RO. GPU package temperature in millidegree Celsius.
> > > > +
> > > > +		Only supported for particular Intel i915 graphics platforms.
> > > > diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> > > > index 17d30f6b84b0..9f1a2300510b 100644
> > > > --- a/drivers/gpu/drm/i915/i915_hwmon.c
> > > > +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> > > > @@ -7,6 +7,7 @@
> > > >   #include <linux/hwmon-sysfs.h>
> > > >   #include <linux/jiffies.h>
> > > >   #include <linux/types.h>
> > > > +#include <linux/units.h>
> > > >   #include "i915_drv.h"
> > > >   #include "i915_hwmon.h"
> > > > @@ -32,6 +33,7 @@
> > > >   struct hwm_reg {
> > > >   	i915_reg_t gt_perf_status;
> > > > +	i915_reg_t pkg_temp;
> > > >   	i915_reg_t pkg_power_sku_unit;
> > > >   	i915_reg_t pkg_power_sku;
> > > >   	i915_reg_t pkg_rapl_limit;
> > > > @@ -280,6 +282,7 @@ static const struct attribute_group *hwm_groups[] = {
> > > >   };
> > > >   static const struct hwmon_channel_info * const hwm_info[] = {
> > > > +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> > > >   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT),
> > > >   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_CRIT),
> > > >   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT),
> > > > @@ -310,6 +313,36 @@ static int hwm_pcode_write_i1(struct drm_i915_private *i915, u32 uval)
> > > >   				  POWER_SETUP_SUBCOMMAND_WRITE_I1, 0, uval);
> > > >   }
> > > > +static umode_t
> > > > +hwm_temp_is_visible(const struct hwm_drvdata *ddat, u32 attr)
> > > > +{
> > > > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > > > +
> > > > +	if (attr == hwmon_temp_input && i915_mmio_reg_valid(hwmon->rg.pkg_temp))
> > > > +		return 0444;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int
> > > > +hwm_temp_read(struct hwm_drvdata *ddat, u32 attr, long *val)
> > > > +{
> > > > +	struct i915_hwmon *hwmon = ddat->hwmon;
> > > > +	intel_wakeref_t wakeref;
> > > > +	u32 reg_val;
> > > > +
> > > > +	if (attr == hwmon_temp_input) {
> > > > +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> > > > +			reg_val = intel_uncore_read(ddat->uncore, hwmon->rg.pkg_temp);
> > > > +
> > > > +		/* HW register value is in degrees, convert to millidegrees. */
> > > > +		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	return -EOPNOTSUPP;
> > > > +}
> > > Let's try to have synergy between previous attribute, such as hwm_fan_input,
> > > and this one.
> > 
> > This one's simple enough to be inline IMHO.
> > Besides, it's already in synergy with hwm_in_read() which has similar
> > implementation.
> Agree this is pretty simple to have an any helper but IMO it would have been cleaner to have a switch
> like hwm_in_read() to return -EOPNOTSUPP in default case. i think that was reason switch case was 
> used in entire file.

Extending on the simplicity argument above, if() makes more sense for a single case.

Raag
