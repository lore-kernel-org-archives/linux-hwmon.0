Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3AEBCCA480
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Jun 2022 21:06:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbiFTVGo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Jun 2022 17:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiFTVGn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Jun 2022 17:06:43 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF2F1BE8C
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jun 2022 14:06:42 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id f16so9848642pjj.1
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jun 2022 14:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ePusArhi45ZTYQTZIIzh3/PrIEpmrJfgGJ+K7VsTClc=;
        b=ATRm08hkoFmASdDndo+WfAvPZkwrcqgwalRODa/4gMSgPWPMcUM0kTxlou/R0pOxka
         Y3YbzlBnwyUtNcpFuVK6Zi2QKSaTI4vTWOVwzoQVYG+A/Gid7aSmWk0g8CY6sIQbKsVu
         zXD5AueLd8l68qeiOHQbDGK0jpd5QvGmC98ZLBUOEUtG+ztk68Ti2lW+/rx52vP3mcr/
         DPEySsGDg6kT7kPuwelywu63NZrQk6yfRdof3Ne3dg/i4NaPufUWkeibQ2NK8J0cxayN
         4XPPsmP9xLHlrPmvOuluJ7Bcg4AN6wyrFyMIqC/j/fUWf9j2gmIPL+xnGv39/iB2WP6A
         lgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ePusArhi45ZTYQTZIIzh3/PrIEpmrJfgGJ+K7VsTClc=;
        b=2f25iuT3plM13oc6EmoTVQMWfVC6HbgZqJ0flrgmzIbEYL1UPtIbC2KjY9licgFgtc
         ZyJJpQoPLq43iUOvZvpn/pTBbS+68qVzg6t5M7Gl7wmvd8MdbOraoJ537fAL8UyYRuA8
         3O0qod7zUSH/smUSjbAMdAF0Xst7uuusR4fwiepXwZzCjAnjI5WB3EaH/bCq0xaMkAgN
         0tXuP2t4om1MREOFH4CQNRdWpRw51byV3SWRvseTL/eYUgqUAPmQSLbpKATS0NbwvVZl
         eDurD9TYMjTSI5ToKhZHSabm56WiEroUAkXABu3vMYD8ZWZRBEAw5FW5+WtUjQuTzZSG
         xFCg==
X-Gm-Message-State: AJIora8HiiYIxBaQ4p0eIrm7iRNUJ+eN4NMp+zqBuaVS8F0sVj7W07eG
        P8spOOz6glqfiLBhQ32ee9k=
X-Google-Smtp-Source: AGRyM1vz+Mla2mCeFFoKoWvm9gjLH5V6gPeOf+pZPzm0mkCK7ZZ1+Z9ISY6uIe0Hksdnw3mVoLHQXg==
X-Received: by 2002:a17:902:b690:b0:169:157:1148 with SMTP id c16-20020a170902b69000b0016901571148mr24933277pls.174.1655759202081;
        Mon, 20 Jun 2022 14:06:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k23-20020a17090aaa1700b001ecb5602944sm1758297pjq.28.2022.06.20.14.06.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 14:06:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5b1ec66d-b0bf-664a-0e3d-a124267ef00d@roeck-us.net>
Date:   Mon, 20 Jun 2022 14:06:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/4] drm/i915/hwmon: Add HWMON current voltage support
Content-Language: en-US
To:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-gfx@lists.freedesktop.org
Cc:     anshuman.gupta@intel.com, jon.ewins@intel.com,
        ashutosh.dixit@intel.com, riana.tauro@intel.com,
        linux-hwmon@vger.kernel.org
References: <20220620204649.894703-1-badal.nilawar@intel.com>
 <20220620204649.894703-3-badal.nilawar@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220620204649.894703-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/20/22 13:46, Badal Nilawar wrote:
> From: Riana Tauro <riana.tauro@intel.com>
> 
> As part of the System Managemenent Interface (SMI), use the HWMON
> subsystem to display current voltage
> 
> v2:
>    - Updated date and kernel version in feature description
>    - Fixed review comments (Ashutosh)
> 
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  7 +++
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  3 +
>   drivers/gpu/drm/i915/i915_hwmon.c             | 63 +++++++++++++++++++
>   3 files changed, 73 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> new file mode 100644
> index 000000000000..24c4b7477d51
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -0,0 +1,7 @@
> +What:		/sys/devices/.../hwmon/hwmon<i>/in0_input
> +Date:		June 2022
> +KernelVersion:	5.19
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:	RO. Current Voltage in millivolt.
> +
> +		Only supported for particular Intel i915 graphics platforms.
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 07ef111947b8..63a39e1e00e2 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -1487,6 +1487,9 @@
>   #define VLV_RENDER_C0_COUNT			_MMIO(0x138118)
>   #define VLV_MEDIA_C0_COUNT			_MMIO(0x13811c)
>   
> +#define GEN12_RPSTAT1				_MMIO(0x1381b4)
> +#define   GEN12_VOLTAGE_MASK			REG_GENMASK(10, 0)
> +
>   #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
>   #define   GEN11_CSME				(31)
>   #define   GEN11_GUNIT				(28)
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 2ef40b0c1e70..fc06db790243 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -14,9 +14,11 @@
>   #include "i915_hwmon.h"
>   #include "i915_drv.h"
>   #include "intel_mchbar_regs.h"
> +#include "gt/intel_gt_regs.h"
>   
>   
>   struct i915_hwmon_reg {
> +	i915_reg_t gt_perf_status;
>   };
>   
>   struct i915_hwmon_drvdata {
> @@ -53,15 +55,65 @@ static const struct attribute_group *hwmon_groups[] = {
>   };
>   
>   
> +/*
> + * HWMON SENSOR TYPE = hwmon_in
> + *  - Voltage Input value (in0_input)
> + */
> +static const u32 i915_config_in[] = {
> +	HWMON_I_INPUT,
> +	0
> +};
> +
> +static const struct hwmon_channel_info i915_in = {
> +	.type = hwmon_in,
> +	.config = i915_config_in,
> +};
> +
>   static const struct hwmon_channel_info *i915_info[] = {
> +	&i915_in,
>   	NULL
>   };

Please use the HWMON_CHANNEL_INFO macro.

Thanks,
Guenter

>   
> +static umode_t
> +i915_in_is_visible(const struct i915_hwmon_drvdata *ddat, u32 attr)
> +{
> +	struct drm_i915_private *i915 = ddat->uncore->i915;
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		return (IS_DG1(i915) || IS_DG2(i915)) ? 0444 : 0;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +i915_in_read(struct i915_hwmon_drvdata *ddat, u32 attr, long *val)
> +{
> +	struct i915_hwmon *hwmon = ddat->hwmon;
> +	intel_wakeref_t wakeref;
> +	u32 reg_value;
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> +			reg_value = intel_uncore_read(ddat->uncore, hwmon->rg.gt_perf_status);
> +		*val = DIV_ROUND_CLOSEST(REG_FIELD_GET(GEN12_VOLTAGE_MASK, reg_value) * 25, 10);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
>   static umode_t
>   i915_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		u32 attr, int channel)
>   {
> +	struct i915_hwmon_drvdata *ddat = (struct i915_hwmon_drvdata *)drvdata;
> +
>   	switch (type) {
> +	case hwmon_in:
> +		return i915_in_is_visible(ddat, attr);
>   	default:
>   		return 0;
>   	}
> @@ -71,7 +123,11 @@ static int
>   i915_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	  int channel, long *val)
>   {
> +	struct i915_hwmon_drvdata *ddat = dev_get_drvdata(dev);
> +
>   	switch (type) {
> +	case hwmon_in:
> +		return i915_in_read(ddat, attr, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -101,6 +157,13 @@ static const struct hwmon_chip_info i915_chip_info = {
>   static void
>   i915_hwmon_get_preregistration_info(struct drm_i915_private *i915)
>   {
> +	struct i915_hwmon *hwmon = i915->hwmon;
> +
> +	if (IS_DG1(i915) || IS_DG2(i915)) {
> +		hwmon->rg.gt_perf_status = GEN12_RPSTAT1;
> +	} else {
> +		hwmon->rg.gt_perf_status = INVALID_MMIO_REG;
> +	}
>   
>   }
>   

