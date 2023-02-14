Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB07C6379F
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Feb 2023 06:16:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjBNGQu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Feb 2023 01:16:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjBNGQt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Feb 2023 01:16:49 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C945811E9A
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Feb 2023 22:16:47 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id c15so12225748oic.8
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Feb 2023 22:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=q12bYRYnF3ptbUNEUFIilVrWFjl5XwWdwvx/crvn9Fk=;
        b=KoMegSwK9efOd6BfDGeHhYHJCsbxiEoJib0KaKT0UKZTy2iUtKoJUEbGbHRubFB17D
         DbpQ5pTqwTNsSEsVTCh/eA9pdQYqieOyNchq7z/Eh/deVRUG6hpBw0F0FodnHSMF0LXy
         MlUQ4hDILD8du6o0x/8nwnkO4w2FqXTOjD4DRLM933PbOEU69W70MIlXZegzW9fqTlrd
         rOAfVXRctLWFv2VazXDtXkSruYn0oGFWtiZ6KjgtTQMoNonyLVGrHaRPX0wOr67czleH
         f1OCbFC4xXyx5cx7+hPilMRHMuJTWyBS5+a1SMLWgwN8b/d1T+kfYE/v44RtALaqg3dF
         T0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q12bYRYnF3ptbUNEUFIilVrWFjl5XwWdwvx/crvn9Fk=;
        b=GXVPlEp7UFwcqIMkUiBS+1/ZrvXOng4lqoLky32SHslzpGnRA8W2+HfnCXjXAOxVI3
         LQR8Sta6F8XFva+gJL2VBlt4hzGs/NBaagPNztm6Ri2P8Vu3o40J9OedhPvq1FYTxex5
         4VCosDL02fZg2Taxh8WV6jQgsCGr/wQbEU04JSa32dWSuai5gUMZlyn45IGMpl2uITw2
         f1+xe86FNwjmE+txr+CUb0OeUl8nIZxA6aAqAPaAoLblr0BC3vCzdBJ56xBK+mGoq7vI
         2/lrfF68VKQOH++xn4fQGFoKSIQiXP+aISkwtjAduRMIrieYQd8v8PDIeXhrj7566hpI
         zPyQ==
X-Gm-Message-State: AO0yUKVtwawajmjd/nzpJTaTDYR4546UQeOaflnu2a17QizvpVtKWOr9
        WbSENZIok0ljWnY2imDyOOQ=
X-Google-Smtp-Source: AK7set/21VT/OsqSqUqSou/fezM8MV2RQ2vj+mGL0gX2rkhAFPf0BNLA2ARdfCQ5At9geNjqdxADfg==
X-Received: by 2002:a05:6808:288e:b0:37a:ba9b:8df6 with SMTP id eu14-20020a056808288e00b0037aba9b8df6mr9367634oib.14.1676355407022;
        Mon, 13 Feb 2023 22:16:47 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f6-20020a9d5f06000000b0068bd6cf405dsm6067066oti.1.2023.02.13.22.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 22:16:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f7a7e280-804f-b397-a8c5-c4dae0451111@roeck-us.net>
Date:   Mon, 13 Feb 2023 22:16:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/3] drm/i915/hwmon: Expose power1_max_enable
Content-Language: en-US
To:     Ashutosh Dixit <ashutosh.dixit@intel.com>,
        intel-gfx@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org,
        Anshuman Gupta <anshuman.gupta@intel.com>,
        Riana Tauro <riana.tauro@intel.com>,
        Badal Nilawar <badal.nilawar@intel.com>,
        gwan-gyeong.mun@intel.com, linux-hwmon@vger.kernel.org
References: <20230214053342.1952226-1-ashutosh.dixit@intel.com>
 <20230214053342.1952226-4-ashutosh.dixit@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230214053342.1952226-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/13/23 21:33, Ashutosh Dixit wrote:
> On ATSM the PL1 power limit is disabled at power up. The previous uapi
> assumed that the PL1 limit is always enabled and therefore did not have a
> notion of a disabled PL1 limit. This results in erroneous PL1 limit values
> when PL1 limit is disabled. For example at power up, the disabled ATSM PL1
> limit is shown as 0 which means a low PL1 limit whereas the limit being
> disabled actually implies a high effective PL1 limit value.
> 
> To get round this problem, expose power1_max_enable as a custom hwmon
> attribute. power1_max_enable can be used in conjunction with power1_max to
> interpret power1_max (PL1 limit) values correctly. It can also be used to
> enable/disable the PL1 power limit.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-i915-hwmon |  7 +++
>   drivers/gpu/drm/i915/i915_hwmon.c             | 48 +++++++++++++++++--
>   2 files changed, 51 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> index 2d6a472eef885..edd94a44b4570 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> @@ -18,6 +18,13 @@ Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
>   
>   		Only supported for particular Intel i915 graphics platforms.
>   
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_enable

This is not a standard hwmon attribute. The standard attribute would be power1_enable.

So from hwmon perspective this is a NACK.

Guenter

> +Date:		May 2023
> +KernelVersion:	6.3
> +Contact:	intel-gfx@lists.freedesktop.org
> +Description:	RW. Enable/disable the PL1 power limit (power1_max).
> +
> +		Only supported for particular Intel i915 graphics platforms.
>   What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
>   Date:		February 2023
>   KernelVersion:	6.2
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 7c20a6f47b92e..5665869d8602b 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -230,13 +230,52 @@ hwm_power1_max_interval_store(struct device *dev,
>   					    PKG_PWR_LIM_1_TIME, rxy);
>   	return count;
>   }
> +static SENSOR_DEVICE_ATTR_RW(power1_max_interval, hwm_power1_max_interval, 0);
>   
> -static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
> -			  hwm_power1_max_interval_show,
> -			  hwm_power1_max_interval_store, 0);
> +static ssize_t
> +hwm_power1_max_enable_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +	intel_wakeref_t wakeref;
> +	u32 r;
> +
> +	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> +		r = intel_uncore_read(ddat->uncore, ddat->hwmon->rg.pkg_rapl_limit);
> +
> +	return sysfs_emit(buf, "%u\n", !!(r & PKG_PWR_LIM_1_EN));
> +}
> +
> +static ssize_t
> +hwm_power1_max_enable_store(struct device *dev, struct device_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +	intel_wakeref_t wakeref;
> +	u32 en, r;
> +	bool _en;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &_en);
> +	if (ret)
> +		return ret;
> +
> +	en = REG_FIELD_PREP(PKG_PWR_LIM_1_EN, _en);
> +	hwm_locked_with_pm_intel_uncore_rmw(ddat, ddat->hwmon->rg.pkg_rapl_limit,
> +					    PKG_PWR_LIM_1_EN, en);
> +
> +	/* Verify, because PL1 limit cannot be disabled on all platforms */
> +	with_intel_runtime_pm(ddat->uncore->rpm, wakeref)
> +		r = intel_uncore_read(ddat->uncore, ddat->hwmon->rg.pkg_rapl_limit);
> +	if ((r & PKG_PWR_LIM_1_EN) != en)
> +		return -EPERM;
> +
> +	return count;
> +}
> +static SENSOR_DEVICE_ATTR_RW(power1_max_enable, hwm_power1_max_enable, 0);
>   
>   static struct attribute *hwm_attributes[] = {
>   	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
> +	&sensor_dev_attr_power1_max_enable.dev_attr.attr,
>   	NULL
>   };
>   
> @@ -247,7 +286,8 @@ static umode_t hwm_attributes_visible(struct kobject *kobj,
>   	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
>   	struct i915_hwmon *hwmon = ddat->hwmon;
>   
> -	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
> +	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr ||
> +	    attr == &sensor_dev_attr_power1_max_enable.dev_attr.attr)
>   		return i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit) ? attr->mode : 0;
>   
>   	return 0;

