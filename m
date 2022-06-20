Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D5CCCA480
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Jun 2022 21:05:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbiFTVE7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Jun 2022 17:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiFTVE6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Jun 2022 17:04:58 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 351C018B28
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jun 2022 14:04:57 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id f65so11267276pgc.7
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jun 2022 14:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TnojofvwizmYy+r8Mj9dGjZvrFt4i4Up3dpPEaS7MvM=;
        b=pceY/B9iA/7wKSMv3rvqWXj1M8WJ2AqAdDD8QWrm8g2zEqiowqlOuOhcOzUvE6OEiK
         /qPpvjwQIK3s+RDnztZj/vJu7PXQf3SDe37/SpUQ9arRhoHQFQO9MMPb6YZRsWK1HP1k
         PPlsSQ5AKXEcOjx0gcUTxXzrl/DbnlDQF5RfOlona8cfBIV3dze3Ax8kbg5FKo3glrYX
         Spw7da3wxG+MRYTNUT4cBVnEzfGasjzEnB2dPj7QmZjyWtbP66BenX0c74XEPWRmFwjd
         0CmXZLBo36k+Ufs2Ep0/Jtz4YRFPcf1ZwwkgtgS2rHujz4w8sNv0NYYWs5/jbhr/Ukb9
         sjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TnojofvwizmYy+r8Mj9dGjZvrFt4i4Up3dpPEaS7MvM=;
        b=TUAvd04Jh+G323tuWT/qrtpHkxMeypGIw8QVByJYRKlc0tGnrSEZh6LwaWS3bay2FF
         8VsqCkcqzedplf3oNjgirfIt+EeHC1fCCKM1PWd/DV2GZpdscR14IniReW4LYHsg/VCu
         3v9lpAuMACmm3bkCngtiUZI7GzlTmygt+hkOHJ/fkQqGVwBiGGtixb/VpibGNhDuLfKZ
         XJFelGp6PdePrrdDT0NBfrTUuDdA8JZm8wVMIoUEE8BvfB6z8C2HH97uosYZtZcX8WL+
         MvPQL5ozgu8HF/su1x1/lWJ9ALnmdONuhXiFzMpPQZieAl9eq6IEqgfXnwIkE1nylG/s
         TPhA==
X-Gm-Message-State: AJIora85SLRoUxfWYj61OOPXQ8juOwzrhPOhW6q/uxt0TuA2ElxjGw7F
        9dk/0ckLcDhUR9TMy1KPrGZnnF+qbTM=
X-Google-Smtp-Source: AGRyM1u0+LjziI1czXxW2iXVT9OyJeZjbIiXNws1/Bj+ZtuBvHJEX04GlbGXtg8D0ymZxv4R+LRjmQ==
X-Received: by 2002:aa7:9f9b:0:b0:525:1e0a:a6b4 with SMTP id z27-20020aa79f9b000000b005251e0aa6b4mr9205650pfr.5.1655759096596;
        Mon, 20 Jun 2022 14:04:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id be5-20020a056a001f0500b00524f29903dasm2832351pfb.55.2022.06.20.14.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 14:04:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e05838e5-979a-8561-174d-e06a50afafb9@roeck-us.net>
Date:   Mon, 20 Jun 2022 14:04:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/4] drm/i915/hwmon: Add HWMON energy support
Content-Language: en-US
To:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-gfx@lists.freedesktop.org
Cc:     anshuman.gupta@intel.com, jon.ewins@intel.com,
        ashutosh.dixit@intel.com, riana.tauro@intel.com,
        linux-hwmon@vger.kernel.org
References: <20220620204649.894703-1-badal.nilawar@intel.com>
 <20220620204649.894703-5-badal.nilawar@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220620204649.894703-5-badal.nilawar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/20/22 13:46, Badal Nilawar wrote:
> From: Dale B Stimson <dale.b.stimson@intel.com>
> 
> As part of the System Managemenent Interface (SMI), use the HWMON
> subsystem to display energy utilization
> 
> v2:
>    - Updated the date and kernel version in feature description
> 
> Signed-off-by: Dale B Stimson <dale.b.stimson@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  16 ++
>   drivers/gpu/drm/i915/i915_hwmon.c             | 174 +++++++++++++++++-
>   drivers/gpu/drm/i915/i915_hwmon.h             |   1 +
>   drivers/gpu/drm/i915/intel_mchbar_regs.h      |   2 +
>   4 files changed, 185 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index 945f472dd4a2..2e87d7422b73 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -25,3 +25,19 @@ Contact:	dri-devel@lists.freedesktop.org
>   Description:	RO. Card default power limit (default TDP setting).
>   
>   		Only supported for particular Intel i915 graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/energy1_input
> +Date:		June 2022
> +KernelVersion:	5.19
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RO. Energy input of device in microjoules.
> +
> +		The returned textual representation is an unsigned integer
> +		number that can be stored in 64-bits.  Warning: The hardware
> +		register is 32-bits wide and can overflow by wrapping around.
> +		A single wrap-around between calls to read this value can
> +		be detected and will be accounted for in the returned value.
> +		At a power consumption of 1 watt, the 32-bit hardware register
> +		would wrap-around approximately every 3 days.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 75935a55f573..77d68f17316a 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -19,8 +19,10 @@
>   /*
>    * SF_* - scale factors for particular quantities according to hwmon spec.
>    * - power  - microwatts
> + * - energy - microjoules
>    */
>   #define SF_POWER	1000000
> +#define SF_ENERGY	1000000
>   
>   #define FIELD_SHIFT(__mask)				    \
>   	(BUILD_BUG_ON_ZERO(!__builtin_constant_p(__mask)) + \
> @@ -32,12 +34,20 @@ struct i915_hwmon_reg {
>   	i915_reg_t pkg_power_sku_unit;
>   	i915_reg_t pkg_power_sku;
>   	i915_reg_t pkg_rapl_limit;
> +	i915_reg_t energy_status_all;
> +	i915_reg_t energy_status_tile;
> +};
> +
> +struct i915_energy_info {
> +	u32 energy_counter_overflow;
> +	u32 energy_counter_prev;
>   };
>   
>   struct i915_hwmon_drvdata {
>   	struct i915_hwmon *hwmon;
>   	struct intel_uncore *uncore;
>   	struct device *hwmon_dev;
> +	struct i915_energy_info ei;	/*  Energy info for energy1_input */
>   	char name[12];
>   };
>   
> @@ -51,6 +61,7 @@ struct i915_hwmon {
>   	u32 power_max_initial_value;
>   
>   	int scl_shift_power;
> +	int scl_shift_energy;
>   };
>   
>   static void
> @@ -121,6 +132,136 @@ _field_scale_and_write(struct i915_hwmon_drvdata *ddat, i915_reg_t rgadr,
>   					 bits_to_clear, bits_to_set);
>   }
>   
> +/*
> + * _i915_energy1_input_sub - A custom function to obtain energy1_input.
> + * Use a custom function instead of the usual hwmon helpers in order to
> + * guarantee 64-bits of result to user-space.
> + * Units are microjoules.
> + *
> + * The underlying hardware register is 32-bits and is subject to overflow.
> + * This function compensates for overflow of the 32-bit register by detecting
> + * wrap-around and incrementing an overflow counter.
> + * This only works if the register is sampled often enough to avoid
> + * missing an instance of overflow - achieved either by repeated
> + * queries through the API, or via a possible timer (future - TBD) that
> + * ensures values are read often enough to catch all overflows.
> + *
> + * How long before overflow?  For example, with an example scaling bit
> + * shift of 14 bits (see register *PACKAGE_POWER_SKU_UNIT) and a power draw of
> + * 1000 watts, the 32-bit counter will overflow in approximately 4.36 minutes.
> + *
> + * Examples:
> + *    1 watt:  (2^32 >> 14) /    1 W / (60 * 60 * 24) secs/day -> 3 days
> + * 1000 watts: (2^32 >> 14) / 1000 W / 60             secs/min -> 4.36 minutes
> + */
> +static int
> +_i915_energy1_input_sub(struct i915_hwmon_drvdata *ddat, u64 *energy)
> +{
> +	struct intel_uncore *uncore = ddat->uncore;
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	struct i915_energy_info *pei = &ddat->ei;
> +	int nshift = hwmon->scl_shift_energy;
> +	intel_wakeref_t wakeref;
> +	u32 reg_value;
> +	u64 vlo;
> +	u64 vhi;
> +	i915_reg_t rgaddr;
> +
> +	rgaddr = hwmon->rg.energy_status_all;
> +
> +	if (!i915_mmio_reg_valid(rgaddr))
> +		return -EOPNOTSUPP;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	with_intel_runtime_pm(uncore->rpm, wakeref)
> +		reg_value = intel_uncore_read(uncore, rgaddr);
> +
> +	/*
> +	 * The u32 register concatenated with the u32 overflow counter
> +	 * gives an effective energy counter size of 64-bits.  However, the
> +	 * computations below are done modulo 2^96 to avoid overflow during
> +	 * scaling in the conversion to microjoules.
> +	 *
> +	 * The low-order 64-bits of the resulting quantity are returned to
> +	 * the caller in units of microjoules, encoded into a decimal string.
> +	 *
> +	 * For a power of 1000 watts, 64 bits in units of microjoules will
> +	 * overflow after 584 years.
> +	 */
> +
> +	if (pei->energy_counter_prev > reg_value)
> +		pei->energy_counter_overflow++;
> +
> +	pei->energy_counter_prev = reg_value;
> +
> +	/*
> +	 * 64-bit variables vlo and vhi are used for the scaling process.
> +	 * The 96-bit counter value is composed from the two 64-bit variables
> +	 * vhi and vlo thusly:  counter == vhi << 32 + vlo .
> +	 * The 32-bits of overlap between the two variables is convenient for
> +	 * handling overflows out of vlo.
> +	 */
> +
> +	vlo = reg_value;
> +	vhi = pei->energy_counter_overflow;
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	vlo = SF_ENERGY * vlo;
> +
> +	/* Prepare to round to nearest */
> +	if (nshift > 0)
> +		vlo += 1 << (nshift - 1);
> +
> +	/*
> +	 * Anything in the upper-32 bits of vlo gets added into vhi here,
> +	 * and then cleared from vlo.
> +	 */
> +	vhi = (SF_ENERGY * vhi) + (vlo >> 32);
> +	vlo &= 0xffffffffULL;
> +
> +	/*
> +	 * Apply the right shift.
> +	 * - vlo shifted by itself.
> +	 * - vlo receiving what's shifted out of vhi.
> +	 * - vhi shifted by itself
> +	 */
> +	vlo = vlo >> nshift;
> +	vlo |= (vhi << (32 - nshift)) & 0xffffffffULL;
> +	vhi = vhi >> nshift;
> +
> +	/* Combined to get a 64-bit result in vlo. */
> +	vlo |= (vhi << 32);
> +
> +	*energy = vlo;
> +
> +	return 0;
> +}
> +
> +static ssize_t
> +i915_energy1_input_show(struct device *dev, struct device_attribute *attr,
> +			char *buf)
> +{
> +	struct i915_hwmon_drvdata *ddat = dev_get_drvdata(dev);
> +	ssize_t ret = 0;
> +	u64 energy;
> +
> +	if (!_i915_energy1_input_sub(ddat, &energy))
> +		ret = sysfs_emit(buf, "%llu\n", energy);
> +
> +	return ret;
> +}
> +
> +int
> +i915_energy_status_get(struct drm_i915_private *i915, u64 *energy)
> +{
> +	struct i915_hwmon *hwmon = i915->hwmon;
> +	struct i915_hwmon_drvdata *ddat = &hwmon->ddat;
> +
> +	return _i915_energy1_input_sub(ddat, energy);
> +}
> +
>   static ssize_t
>   i915_power1_max_default_show(struct device *dev, struct device_attribute *attr,
>   			     char *buf)
> @@ -141,9 +282,12 @@ i915_power1_max_default_show(struct device *dev, struct device_attribute *attr,
>   
>   static SENSOR_DEVICE_ATTR(power1_max_default, 0444,
>   			  i915_power1_max_default_show, NULL, 0);
> +static SENSOR_DEVICE_ATTR(energy1_input, 0444,
> +			  i915_energy1_input_show, NULL, 0);
>   
>   static struct attribute *hwmon_attributes[] = {
>   	&sensor_dev_attr_power1_max_default.dev_attr.attr,
> +	&sensor_dev_attr_energy1_input.dev_attr.attr,

Why not use HWMON_E_INPUT ?

>   	NULL
>   };
>   
> @@ -153,17 +297,15 @@ static umode_t hwmon_attributes_visible(struct kobject *kobj,
>   	struct device *dev = kobj_to_dev(kobj);
>   	struct i915_hwmon_drvdata *ddat = dev_get_drvdata(dev);
>   	struct drm_i915_private *i915 = ddat->uncore->i915;
> -	i915_reg_t rgadr;
> +	struct i915_hwmon *hwmon = ddat->hwmon;
>   
> -	if (attr == &sensor_dev_attr_power1_max_default.dev_attr.attr)
> +	if (attr == &sensor_dev_attr_energy1_input.dev_attr.attr)
> +		return i915_mmio_reg_valid(hwmon->rg.energy_status_all) ?
> +						attr->mode : 0;
> +	else if (attr == &sensor_dev_attr_power1_max_default.dev_attr.attr)
>   		return IS_DGFX(i915) ? attr->mode : 0;
>   	else
>   		return 0;
> -
> -	if (!i915_mmio_reg_valid(rgadr))
> -		return 0;
> -
> -	return attr->mode;
>   }
>   
>   static const struct attribute_group hwmon_attrgroup = {
> @@ -356,6 +498,8 @@ i915_hwmon_get_preregistration_info(struct drm_i915_private *i915)
>   {
>   	struct i915_hwmon *hwmon = i915->hwmon;
>   	struct intel_uncore *uncore = &i915->uncore;
> +	struct i915_hwmon_drvdata *ddat = &hwmon->ddat;
> +	struct i915_energy_info *pei;
>   	intel_wakeref_t wakeref;
>   	u32 val_sku_unit;
>   
> @@ -364,11 +508,15 @@ i915_hwmon_get_preregistration_info(struct drm_i915_private *i915)
>   		hwmon->rg.pkg_power_sku_unit = PCU_PACKAGE_POWER_SKU_UNIT;
>   		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_rapl_limit = PCU_PACKAGE_RAPL_LIMIT;
> +		hwmon->rg.energy_status_all = PCU_PACKAGE_ENERGY_STATUS;
> +		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
>   	} else {
>   		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_power_sku_unit = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_power_sku = INVALID_MMIO_REG;
>   		hwmon->rg.pkg_rapl_limit = INVALID_MMIO_REG;
> +		hwmon->rg.energy_status_all = INVALID_MMIO_REG;
> +		hwmon->rg.energy_status_tile = INVALID_MMIO_REG;
>   	}
>   
>   
> @@ -387,8 +535,18 @@ i915_hwmon_get_preregistration_info(struct drm_i915_private *i915)
>   		} else
>   			val_sku_unit = 0;
>   
> -		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
> +		pei = &ddat->ei;
> +		pei->energy_counter_overflow = 0;
> +
> +		if (i915_mmio_reg_valid(hwmon->rg.energy_status_all))
> +			pei->energy_counter_prev =
> +				intel_uncore_read(uncore, hwmon->rg.energy_status_all);
> +		else
> +			pei->energy_counter_prev = 0;
>   	}
> +
> +	hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
> +	hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
>   }
>   
>   void i915_hwmon_register(struct drm_i915_private *i915)
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.h b/drivers/gpu/drm/i915/i915_hwmon.h
> index 1e7e2516a981..5a15c84e4721 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.h
> +++ b/drivers/gpu/drm/i915/i915_hwmon.h
> @@ -18,4 +18,5 @@ struct i915_hwmon;
>   void i915_hwmon_register(struct drm_i915_private *i915);
>   void i915_hwmon_unregister(struct drm_i915_private *i915);
>   
> +int i915_energy_status_get(struct drm_i915_private *i915, u64 *energy);
>   #endif /* __I915_HWMON_H__ */
> diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> index a3eccdee0ca4..3f2fc62ebb68 100644
> --- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
> +++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
> @@ -193,7 +193,9 @@
>   #define GEN6_RP_STATE_LIMITS			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5994)
>   #define PCU_PACKAGE_POWER_SKU_UNIT		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5938)
>   #define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
> +#define   PKG_ENERGY_UNIT                      REG_GENMASK(12, 8)
>   #define   PKG_TIME_UNIT				REG_GENMASK(19, 16)
> +#define PCU_PACKAGE_ENERGY_STATUS              _MMIO(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>   
>   #define GEN6_RP_STATE_CAP			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5998)
>   #define   RP0_CAP_MASK				REG_GENMASK(7, 0)

