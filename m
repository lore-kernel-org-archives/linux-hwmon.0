Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7A0EB64DA
	for <linux-hwmon@archiver.kernel.org>; Tue,  4 Jul 2023 11:35:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbjGDLfJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 4 Jul 2023 07:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbjGDLfI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Jul 2023 07:35:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5686101
        for <linux-hwmon@vger.kernel.org>; Tue,  4 Jul 2023 04:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688470462;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vxLYuCdnQA3Ah4/ruIpzmAEqdEfVDtkjGli+yH05U8A=;
        b=CFw8S0wNjIfPQZZXx5eKQwN5QZgxAALn83gqSx9R9UFm1oRft2upNIRt0SL5J0LTCM8si9
        Br2GZKXJOpjTUXlvvFbK5ypDYjdXIY/ZILfx6t3/X6aL0U8ZbyftnAP+JeFu3Nq0JZnxG8
        sDa+MIwahpfka9D/+oY6/vNQxUN8/gU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-EmPfS2ZXNJqFsv50q74DYA-1; Tue, 04 Jul 2023 07:34:21 -0400
X-MC-Unique: EmPfS2ZXNJqFsv50q74DYA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-98933d4d4c1so380627066b.0
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Jul 2023 04:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688470460; x=1691062460;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vxLYuCdnQA3Ah4/ruIpzmAEqdEfVDtkjGli+yH05U8A=;
        b=XvxLG3VVE7CI5SHAp8Ex6AzA6m1nQbmqkXHJmwe1Iy/lNcJJbR3Ft7gqZj9hyN2dig
         MO3bXArE0J73obDyNzIoLdSROxm04XVtEC4zXJ4TZeMbMjke5VPJs1k9l5NJpE0n3d7Z
         SjxBvJf+gQeFOuzZVR9Y8quDYi5N9ten2IXAMihCqBffssngF05IutUxB26d1nYIYD7Q
         kTNzslyrpzrtE5L3hn37WmogD+jTvHEbvH87tWXUlwiHXY5/GjeBOrntgWeLh4M31ceQ
         fNbuDRKTsIn/wYBUALUw1qOYBAXLBKOAa2Dt0pfQonVRieJWGWFIUPu//N4o1qwC2ZX9
         GGLg==
X-Gm-Message-State: ABy/qLb+So2gGsLBMXOFJ/U3msWS1XJCoqvGoEuxPLPep9Y+oE5Mjn6B
        ydHutOqFW1VOUqNfxCOvg2fLP7v6jxl6LcBVZJLJdvCdR279vLLWrBX6e2UzJpUU9Jf3YBXyaXE
        obI3DNqPDApMyj3OBdTyMD44=
X-Received: by 2002:a17:907:2ce6:b0:965:6075:d0e1 with SMTP id hz6-20020a1709072ce600b009656075d0e1mr11648668ejc.72.1688470460584;
        Tue, 04 Jul 2023 04:34:20 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFbP0dfy7qSoADSddL4PV6jg5euYx6hJBwxet3YxNjoi+xzmLFfiqDFHNc0ZAbcmmbjWjsMeg==
X-Received: by 2002:a17:907:2ce6:b0:965:6075:d0e1 with SMTP id hz6-20020a1709072ce600b009656075d0e1mr11648653ejc.72.1688470460304;
        Tue, 04 Jul 2023 04:34:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gx23-20020a170906f1d700b00992dcae806bsm6038392ejb.5.2023.07.04.04.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 04:34:19 -0700 (PDT)
Message-ID: <6f4f2959-155b-68ba-d5e1-ea16c4fb2980@redhat.com>
Date:   Tue, 4 Jul 2023 13:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/8] platform/x86: asus-wmi: support middle fan custom
 curves
Content-Language: en-US, nl
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        jdelvare@suse.com, linux@roeck-us.net
References: <20230630053552.976579-1-luke@ljones.dev>
 <20230630053552.976579-4-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230630053552.976579-4-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 6/30/23 07:35, Luke D. Jones wrote:
> Adds support for fan curves defined for the middle fan which
> is available on some ASUS ROG laptops.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

p.s.

I've ran out of time to spend on reviews today, to be
continued later (for the rest of the series) ...







> ---
>  drivers/platform/x86/asus-wmi.c            | 77 +++++++++++++++++++++-
>  include/linux/platform_data/x86/asus-wmi.h |  1 +
>  2 files changed, 76 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 375d25ae0aca..fb27218e51cf 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -113,6 +113,7 @@ module_param(fnlock_default, bool, 0444);
>  #define FAN_CURVE_BUF_LEN		32
>  #define FAN_CURVE_DEV_CPU		0x00
>  #define FAN_CURVE_DEV_GPU		0x01
> +#define FAN_CURVE_DEV_MID		0x02
>  /* Mask to determine if setting temperature or percentage */
>  #define FAN_CURVE_PWM_MASK		0x04
>  
> @@ -253,7 +254,8 @@ struct asus_wmi {
>  
>  	bool cpu_fan_curve_available;
>  	bool gpu_fan_curve_available;
> -	struct fan_curve_data custom_fan_curves[2];
> +	bool mid_fan_curve_available;
> +	struct fan_curve_data custom_fan_curves[3];
>  
>  	struct platform_profile_handler platform_profile_handler;
>  	bool platform_profile_support;
> @@ -2080,6 +2082,8 @@ static ssize_t pwm1_enable_store(struct device *dev,
>  		asus->custom_fan_curves[FAN_CURVE_DEV_CPU].enabled = false;
>  	if (asus->gpu_fan_curve_available)
>  		asus->custom_fan_curves[FAN_CURVE_DEV_GPU].enabled = false;
> +	if (asus->mid_fan_curve_available)
> +		asus->custom_fan_curves[FAN_CURVE_DEV_MID].enabled = false;
>  
>  	return count;
>  }
> @@ -2531,6 +2535,9 @@ static int fan_curve_get_factory_default(struct asus_wmi *asus, u32 fan_dev)
>  	if (fan_dev == ASUS_WMI_DEVID_GPU_FAN_CURVE)
>  		fan_idx = FAN_CURVE_DEV_GPU;
>  
> +	if (fan_dev == ASUS_WMI_DEVID_MID_FAN_CURVE)
> +		fan_idx = FAN_CURVE_DEV_MID;
> +
>  	curves = &asus->custom_fan_curves[fan_idx];
>  	err = asus_wmi_evaluate_method_buf(asus->dsts_id, fan_dev, mode, buf,
>  					   FAN_CURVE_BUF_LEN);
> @@ -2819,6 +2826,42 @@ static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point7_pwm, fan_curve,
>  static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point8_pwm, fan_curve,
>  			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 7);
>  
> +/* MID */
> +static SENSOR_DEVICE_ATTR_RW(pwm3_enable, fan_curve_enable, FAN_CURVE_DEV_GPU);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point1_temp, fan_curve,
> +			       FAN_CURVE_DEV_GPU, 0);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point2_temp, fan_curve,
> +			       FAN_CURVE_DEV_GPU, 1);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point3_temp, fan_curve,
> +			       FAN_CURVE_DEV_GPU, 2);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point4_temp, fan_curve,
> +			       FAN_CURVE_DEV_GPU, 3);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point5_temp, fan_curve,
> +			       FAN_CURVE_DEV_GPU, 4);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point6_temp, fan_curve,
> +			       FAN_CURVE_DEV_GPU, 5);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point7_temp, fan_curve,
> +			       FAN_CURVE_DEV_GPU, 6);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point8_temp, fan_curve,
> +			       FAN_CURVE_DEV_GPU, 7);
> +
> +static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point1_pwm, fan_curve,
> +			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 0);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point2_pwm, fan_curve,
> +			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 1);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point3_pwm, fan_curve,
> +			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 2);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point4_pwm, fan_curve,
> +			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 3);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point5_pwm, fan_curve,
> +			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 4);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point6_pwm, fan_curve,
> +			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 5);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point7_pwm, fan_curve,
> +			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 6);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm3_auto_point8_pwm, fan_curve,
> +			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 7);
> +
>  static struct attribute *asus_fan_curve_attr[] = {
>  	/* CPU */
>  	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
> @@ -2856,6 +2899,24 @@ static struct attribute *asus_fan_curve_attr[] = {
>  	&sensor_dev_attr_pwm2_auto_point6_pwm.dev_attr.attr,
>  	&sensor_dev_attr_pwm2_auto_point7_pwm.dev_attr.attr,
>  	&sensor_dev_attr_pwm2_auto_point8_pwm.dev_attr.attr,
> +	/* MID */
> +	&sensor_dev_attr_pwm3_enable.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point4_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point5_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point6_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point7_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point8_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point1_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point3_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point4_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point5_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point6_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point7_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point8_pwm.dev_attr.attr,
>  	NULL
>  };
>  
> @@ -2875,6 +2936,9 @@ static umode_t asus_fan_curve_is_visible(struct kobject *kobj,
>  	if (asus->gpu_fan_curve_available && attr->name[3] == '2')
>  		return 0644;
>  
> +	if (asus->mid_fan_curve_available && attr->name[3] == '3')
> +		return 0644;
> +
>  	return 0;
>  }
>  
> @@ -2904,7 +2968,14 @@ static int asus_wmi_custom_fan_curve_init(struct asus_wmi *asus)
>  	if (err)
>  		return err;
>  
> -	if (!asus->cpu_fan_curve_available && !asus->gpu_fan_curve_available)
> +	err = fan_curve_check_present(asus, &asus->mid_fan_curve_available,
> +				      ASUS_WMI_DEVID_MID_FAN_CURVE);
> +	if (err)
> +		return err;
> +
> +	if (!asus->cpu_fan_curve_available
> +		&& !asus->gpu_fan_curve_available
> +		&& !asus->mid_fan_curve_available)
>  		return 0;
>  
>  	hwmon = devm_hwmon_device_register_with_groups(
> @@ -2973,6 +3044,8 @@ static int throttle_thermal_policy_write(struct asus_wmi *asus)
>  		asus->custom_fan_curves[FAN_CURVE_DEV_CPU].enabled = false;
>  	if (asus->gpu_fan_curve_available)
>  		asus->custom_fan_curves[FAN_CURVE_DEV_GPU].enabled = false;
> +	if (asus->mid_fan_curve_available)
> +		asus->custom_fan_curves[FAN_CURVE_DEV_MID].enabled = false;
>  
>  	return 0;
>  }
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 2c03bda7703f..329efc086993 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -83,6 +83,7 @@
>  #define ASUS_WMI_DEVID_MID_FAN_CTRL 0x00110031
>  #define ASUS_WMI_DEVID_CPU_FAN_CURVE	0x00110024
>  #define ASUS_WMI_DEVID_GPU_FAN_CURVE	0x00110025
> +#define ASUS_WMI_DEVID_MID_FAN_CURVE	0x00110032
>  
>  /* Power */
>  #define ASUS_WMI_DEVID_PROCESSOR_STATE	0x00120012

