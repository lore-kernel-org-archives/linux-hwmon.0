Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1CBC32772
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Aug 2022 12:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243961AbiHWMe5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Aug 2022 08:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352724AbiHWMcx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Aug 2022 08:32:53 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABAB01022AA
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Aug 2022 02:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661248002; x=1692784002;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=oSsmU/PF6SYlZFJsqIIN3yI9ywn2/2ohtN+19RBG1Xo=;
  b=lfZNNN3H5C4QOmvH3b6olbDu87KhFcj0kuGChNClUc4ZZI7w7fbcYwR7
   ATWgFOmq+iR8jlzpk2W9pNfWPQLSgULtn/dfld+0fBSoSaxAFRNV+sFgw
   SAkl7cAy3UOo/D4y0hxpDZ2ynz3/KMQf0Mn8Cxo1MAilQeAbpOE2zctbc
   U3XRELEqGOmDvAy/NpaQpTjxpbwKTgVJ4vqOoIt+YHvKyFjH7HUFx1oj2
   /Q4DvJThjTg3b48DhNGv71YNSD2BTY2b6tEnjtNq1Fl8BgcjcfWbwgpOE
   uS3bs1D6tou0eTgzZIoLo32rEby64l65Dhl5ndPNs/BWVEIkDpYUq2YQR
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="280615050"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="280615050"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 02:46:19 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; 
   d="scan'208";a="669956026"
Received: from obeltran-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.51.100])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 02:46:17 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     "Nilawar, Badal" <badal.nilawar@intel.com>,
        intel-gfx@lists.freedesktop.org
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net,
        "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/7] drm/i915/hwmon: Add HWMON infrastructure
In-Reply-To: <50a6d108-4518-c30e-5096-3ee921c75606@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220818193901.2974625-1-badal.nilawar@intel.com>
 <20220818193901.2974625-2-badal.nilawar@intel.com>
 <87ilmoo707.fsf@intel.com>
 <50a6d108-4518-c30e-5096-3ee921c75606@intel.com>
Date:   Tue, 23 Aug 2022 12:46:14 +0300
Message-ID: <8735dnmgwp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 23 Aug 2022, "Nilawar, Badal" <badal.nilawar@intel.com> wrote:
> On 19-08-2022 16:05, Jani Nikula wrote:
>> On Fri, 19 Aug 2022, Badal Nilawar <badal.nilawar@intel.com> wrote:
>>> From: Dale B Stimson <dale.b.stimson@intel.com>
>>>
>>> The i915 HWMON module will be used to expose voltage, power and energy
>>> values for dGfx. Here we set up i915 hwmon infrastructure including i915
>>> hwmon registration, basic data structures and functions.
>>>
>>> v2:
>>>    - Create HWMON infra patch (Ashutosh)
>>>    - Fixed review comments (Jani)
>>>    - Remove "select HWMON" from i915/Kconfig (Jani)
>>> v3: Use hwm_ prefix for static functions (Ashutosh)
>>> v4: s/#ifdef CONFIG_HWMON/#if IS_REACHABLE(CONFIG_HWMON)/ since the for=
mer
>>>      doesn't work if hwmon is compiled as a module (Guenter)
>>=20
>> Is this really what we want to do?
>>=20
>> In my books, it's a misconfiguration to have CONFIG_HWMON=3Dm with
>> CONFIG_DRM_I915=3Dy. That's really the problematic combo, not just
>> CONFIG_HWMON=3Dm, right? Why do we allow it at the kconfig level, and th=
en
>> have ugly hacks around it at the code level? Especially as
>> CONFIG_DRM_I915=3Dy should really be thought of as a corner case.
>>=20
>> So why not do this in i915 Kconfig:
>>=20
>> config DRM_I915
>> 	...
>> 	depends on HWMON || HWMON=3Dn
> With this change I am getting recursive dependancy error when I run make=
=20
> oldconfig
>
> badal@bnilawar-desk1:~/workspace/wp3/drm-tip$ make oldconfig
>    HOSTCC  scripts/basic/fixdep
>    HOSTCC  scripts/kconfig/conf.o
>    HOSTCC  scripts/kconfig/confdata.o
>    HOSTCC  scripts/kconfig/expr.o
>    LEX     scripts/kconfig/lexer.lex.c
>    YACC    scripts/kconfig/parser.tab.[ch]
>    HOSTCC  scripts/kconfig/lexer.lex.o
>    HOSTCC  scripts/kconfig/menu.o
>    HOSTCC  scripts/kconfig/parser.tab.o
>    HOSTCC  scripts/kconfig/preprocess.o
>    HOSTCC  scripts/kconfig/symbol.o
>    HOSTCC  scripts/kconfig/util.o
>    HOSTLD  scripts/kconfig/conf
> drivers/gpu/drm/i915/Kconfig:2:error: recursive dependency detected!
> drivers/gpu/drm/i915/Kconfig:2: symbol DRM_I915 depends on HWMON
> drivers/hwmon/Kconfig:6:        symbol HWMON is selected by EEEPC_LAPTOP
> drivers/platform/x86/Kconfig:332:       symbol EEEPC_LAPTOP depends on IN=
PUT
> drivers/input/Kconfig:8:        symbol INPUT is selected by DRM_I915
> For a resolution refer to Documentation/kbuild/kconfig-language.rst
> subsection "Kconfig recursive dependency limitations"

*sigh*

  Note:
	select should be used with care. select will force
	a symbol to a value without visiting the dependencies.
	By abusing select you are able to select a symbol FOO even
	if FOO depends on BAR that is not set.
	In general use select only for non-visible symbols
	(no prompts anywhere) and for symbols with no dependencies.
	That will limit the usefulness but on the other hand avoid
	the illegal configurations all over.

One day someone's going to need to fix menuconfig to first start
complaining about selecting stuff that shouldn't be selected, and then
eventually refusing to select stuff that shouldn't be selected. This is
an endless whack-a-mole, preventing people from adding reasonable
dependencies.

BR,
Jani.


>
> make[1]: *** [scripts/kconfig/Makefile:77: oldconfig] Error 1
> make: *** [Makefile:632: oldconfig] Error 2
>
>
>>=20
>> Which rejects the CONFIG_HWMON=3Dm && CONFIG_DRM_I915=3Dy combo.
>>=20
>>>
>>> Cc: Guenter Roeck <linux@roeck-us.net>
>>> Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
>>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/Makefile      |   3 +
>>>   drivers/gpu/drm/i915/i915_driver.c |   7 ++
>>>   drivers/gpu/drm/i915/i915_drv.h    |   2 +
>>>   drivers/gpu/drm/i915/i915_hwmon.c  | 135 +++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/i915/i915_hwmon.h  |  20 +++++
>>>   5 files changed, 167 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/i915/i915_hwmon.c
>>>   create mode 100644 drivers/gpu/drm/i915/i915_hwmon.h
>>>
>>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makef=
ile
>>> index 522ef9b4aff3..2b235f747490 100644
>>> --- a/drivers/gpu/drm/i915/Makefile
>>> +++ b/drivers/gpu/drm/i915/Makefile
>>> @@ -208,6 +208,9 @@ i915-y +=3D gt/uc/intel_uc.o \
>>>   # graphics system controller (GSC) support
>>>   i915-y +=3D gt/intel_gsc.o
>>>=20=20=20
>>> +# graphics hardware monitoring (HWMON) support
>>> +i915-$(CONFIG_HWMON) +=3D i915_hwmon.o
>>=20
>> Moreover, this builds i915_hwmon.o as part of i915.ko (or kernel as it's
>> builtin) even if we can't use it!
> For CONFIG_HWMON=3Dm && CONFIG_DRM_I915=3Dy combo i915_hwmon.o didn't get=
=20
> build. It is only getting build for below combos
> CONFIG_HWMON=3Dm && CONFIG_DRM_I915=3Dy
> CONFIG_HWMON=3Dm && CONFIG_DRM_I915=3Dm
> CONFIG_HWMON=3Dy && CONFIG_DRM_I915=3Dm
>
> Regards,
> Badal
>>=20
>>=20
>> BR,
>> Jani.
>>=20
>>=20
>>> +
>>>   # modesetting core code
>>>   i915-y +=3D \
>>>   	display/hsw_ips.o \
>>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/=
i915_driver.c
>>> index deb8a8b76965..62340cd01dde 100644
>>> --- a/drivers/gpu/drm/i915/i915_driver.c
>>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>>> @@ -80,6 +80,7 @@
>>>   #include "i915_drm_client.h"
>>>   #include "i915_drv.h"
>>>   #include "i915_getparam.h"
>>> +#include "i915_hwmon.h"
>>>   #include "i915_ioc32.h"
>>>   #include "i915_ioctl.h"
>>>   #include "i915_irq.h"
>>> @@ -736,6 +737,9 @@ static void i915_driver_register(struct drm_i915_pr=
ivate *dev_priv)
>>>=20=20=20
>>>   	intel_gt_driver_register(to_gt(dev_priv));
>>>=20=20=20
>>> +#if IS_REACHABLE(CONFIG_HWMON)
>>> +	i915_hwmon_register(dev_priv);
>>> +#endif
>>>   	intel_display_driver_register(dev_priv);
>>>=20=20=20
>>>   	intel_power_domains_enable(dev_priv);
>>> @@ -762,6 +766,9 @@ static void i915_driver_unregister(struct drm_i915_=
private *dev_priv)
>>>=20=20=20
>>>   	intel_display_driver_unregister(dev_priv);
>>>=20=20=20
>>> +#if IS_REACHABLE(CONFIG_HWMON)
>>> +	i915_hwmon_unregister(dev_priv);
>>> +#endif
>>>   	intel_gt_driver_unregister(to_gt(dev_priv));
>>>=20=20=20
>>>   	i915_perf_unregister(dev_priv);
>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i91=
5_drv.h
>>> index 086bbe8945d6..d437d588dec9 100644
>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>> @@ -705,6 +705,8 @@ struct drm_i915_private {
>>>=20=20=20
>>>   	struct i915_perf perf;
>>>=20=20=20
>>> +	struct i915_hwmon *hwmon;
>>> +
>>>   	/* Abstract the submission mechanism (legacy ringbuffer or execlists=
) away */
>>>   	struct intel_gt gt0;
>>>=20=20=20
>>> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i=
915_hwmon.c
>>> new file mode 100644
>>> index 000000000000..5b80a0f024f0
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
>>> @@ -0,0 +1,135 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright =C2=A9 2022 Intel Corporation
>>> + */
>>> +
>>> +#include <linux/hwmon.h>
>>> +#include <linux/hwmon-sysfs.h>
>>> +#include <linux/types.h>
>>> +
>>> +#include "i915_drv.h"
>>> +#include "i915_hwmon.h"
>>> +#include "intel_mchbar_regs.h"
>>> +
>>> +struct hwm_reg {
>>> +};
>>> +
>>> +struct hwm_drvdata {
>>> +	struct i915_hwmon *hwmon;
>>> +	struct intel_uncore *uncore;
>>> +	struct device *hwmon_dev;
>>> +	char name[12];
>>> +};
>>> +
>>> +struct i915_hwmon {
>>> +	struct hwm_drvdata ddat;
>>> +	struct mutex hwmon_lock;		/* counter overflow logic and rmw */
>>> +	struct hwm_reg rg;
>>> +};
>>> +
>>> +static const struct hwmon_channel_info *hwm_info[] =3D {
>>> +	NULL
>>> +};
>>> +
>>> +static umode_t
>>> +hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>>> +	       u32 attr, int channel)
>>> +{
>>> +	switch (type) {
>>> +	default:
>>> +		return 0;
>>> +	}
>>> +}
>>> +
>>> +static int
>>> +hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>>> +	 int channel, long *val)
>>> +{
>>> +	switch (type) {
>>> +	default:
>>> +		return -EOPNOTSUPP;
>>> +	}
>>> +}
>>> +
>>> +static int
>>> +hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>>> +	  int channel, long val)
>>> +{
>>> +	switch (type) {
>>> +	default:
>>> +		return -EOPNOTSUPP;
>>> +	}
>>> +}
>>> +
>>> +static const struct hwmon_ops hwm_ops =3D {
>>> +	.is_visible =3D hwm_is_visible,
>>> +	.read =3D hwm_read,
>>> +	.write =3D hwm_write,
>>> +};
>>> +
>>> +static const struct hwmon_chip_info hwm_chip_info =3D {
>>> +	.ops =3D &hwm_ops,
>>> +	.info =3D hwm_info,
>>> +};
>>> +
>>> +static void
>>> +hwm_get_preregistration_info(struct drm_i915_private *i915)
>>> +{
>>> +}
>>> +
>>> +void i915_hwmon_register(struct drm_i915_private *i915)
>>> +{
>>> +	struct device *dev =3D i915->drm.dev;
>>> +	struct i915_hwmon *hwmon;
>>> +	struct device *hwmon_dev;
>>> +	struct hwm_drvdata *ddat;
>>> +
>>> +	/* hwmon is available only for dGfx */
>>> +	if (!IS_DGFX(i915))
>>> +		return;
>>> +
>>> +	hwmon =3D kzalloc(sizeof(*hwmon), GFP_KERNEL);
>>> +	if (!hwmon)
>>> +		return;
>>> +
>>> +	i915->hwmon =3D hwmon;
>>> +	mutex_init(&hwmon->hwmon_lock);
>>> +	ddat =3D &hwmon->ddat;
>>> +
>>> +	ddat->hwmon =3D hwmon;
>>> +	ddat->uncore =3D &i915->uncore;
>>> +	snprintf(ddat->name, sizeof(ddat->name), "i915");
>>> +
>>> +	hwm_get_preregistration_info(i915);
>>> +
>>> +	/*  hwmon_dev points to device hwmon<i> */
>>> +	hwmon_dev =3D hwmon_device_register_with_info(dev, ddat->name,
>>> +						    ddat,
>>> +						    &hwm_chip_info,
>>> +						    NULL);
>>> +	if (IS_ERR(hwmon_dev)) {
>>> +		mutex_destroy(&hwmon->hwmon_lock);
>>> +		i915->hwmon =3D NULL;
>>> +		kfree(hwmon);
>>> +		return;
>>> +	}
>>> +
>>> +	ddat->hwmon_dev =3D hwmon_dev;
>>> +}
>>> +
>>> +void i915_hwmon_unregister(struct drm_i915_private *i915)
>>> +{
>>> +	struct i915_hwmon *hwmon;
>>> +	struct hwm_drvdata *ddat;
>>> +
>>> +	hwmon =3D fetch_and_zero(&i915->hwmon);
>>> +	if (!hwmon)
>>> +		return;
>>> +
>>> +	ddat =3D &hwmon->ddat;
>>> +	if (ddat->hwmon_dev)
>>> +		hwmon_device_unregister(ddat->hwmon_dev);
>>> +
>>> +	mutex_destroy(&hwmon->hwmon_lock);
>>> +	kfree(hwmon);
>>> +}
>>> diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i=
915_hwmon.h
>>> new file mode 100644
>>> index 000000000000..921ae76099d3
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/i915/i915_hwmon.h
>>> @@ -0,0 +1,20 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +
>>> +/*
>>> + * Copyright =C2=A9 2022 Intel Corporation
>>> + */
>>> +
>>> +#ifndef __I915_HWMON_H__
>>> +#define __I915_HWMON_H__
>>> +
>>> +#include <linux/device.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/types.h>
>>> +#include "i915_reg.h"
>>> +
>>> +struct drm_i915_private;
>>> +
>>> +void i915_hwmon_register(struct drm_i915_private *i915);
>>> +void i915_hwmon_unregister(struct drm_i915_private *i915);
>>> +
>>> +#endif /* __I915_HWMON_H__ */
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
