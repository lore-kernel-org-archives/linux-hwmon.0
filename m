Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653B4EB64D9
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Jul 2023 14:58:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbjGLO6n (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Jul 2023 10:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232124AbjGLO6l (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Jul 2023 10:58:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8201C1BC5
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 07:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689173871;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xwIK8Xp+ZlyZ3fE/narngnVGQrICZUH+p26lYA0NZYY=;
        b=WuTVEo3rMq24b455RdcppSKQ5MZQbtzuny5Y6pl3h+gRwwdjAflWsOPLfL6rGecuH6S3pT
        0U3zkaH059Z1RdPTo81AwdCy9ou0AfWeN/iGab0QdhDwIrcF0R5CPgDdHPjJ7+Oh3zMarv
        zBwnAGIE1ReJoqN//GEArG96U5FAnz0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-1-MVLQ1kOU25CC4fDFQIxw-1; Wed, 12 Jul 2023 10:57:50 -0400
X-MC-Unique: 1-MVLQ1kOU25CC4fDFQIxw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-98e40d91fdfso439698366b.3
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 07:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689173866; x=1691765866;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwIK8Xp+ZlyZ3fE/narngnVGQrICZUH+p26lYA0NZYY=;
        b=Bd6oVeekgaYUUNu8C/QqvulK+5NGCKIZ2bjmib7OjrijjAH6Jsogcmu98TPzNQeC6B
         jwEcIcl0N2LGu5QiHtkpwYGf7qIkGNFWnPFzylzzlx16bfA+RAkqBTpBqabLqc0Yv7W7
         K6hZpiwOtq2jKMg/xvWMUI8i/LK8nGiwnkduNqwwRf0FBPGaL58ZsjvstGKN/5RvJZv+
         mDYBesy0U1Kk9ELxIgzJO05LQvlTudrcTXVDGeQi5psgXvU+QIamce7JvyWfia1SKXMe
         fgV7G7JOC8PkTnEIp+iVwwhMPdfSh6FCR+s8KesXns9vyfaRmvnYyvFeZDIormhR7Jmc
         UKPQ==
X-Gm-Message-State: ABy/qLbXWIXbKpMu4gYjm8+YwQynNBrFekuQahBHL+e2rYxCKrZmsq5C
        gDLrttwiXZfoy7u48gatEoSsUo1UHIOFllm+mrL/Tpjm/3YtaKLKmaLirZ6S/3V4GteOYIX7KGb
        ZV6BIuivap3KRAIGbnoQMLx4=
X-Received: by 2002:a17:906:9bf3:b0:992:91ce:4508 with SMTP id de51-20020a1709069bf300b0099291ce4508mr18643508ejc.53.1689173866313;
        Wed, 12 Jul 2023 07:57:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF46Z4lBys7UoyTuTRq8wOOgQVr5c2mQuMSId88KcOkCBJtud5ivYnpMmatJwO5DEVkOVAW7w==
X-Received: by 2002:a17:906:9bf3:b0:992:91ce:4508 with SMTP id de51-20020a1709069bf300b0099291ce4508mr18643500ejc.53.1689173865983;
        Wed, 12 Jul 2023 07:57:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gz19-20020a170906f2d300b00992e94bcfabsm2618996ejb.167.2023.07.12.07.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 07:57:45 -0700 (PDT)
Message-ID: <f9d34a4c-6c1e-0632-3fdc-2ec7171561e7@redhat.com>
Date:   Wed, 12 Jul 2023 16:57:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 8/8] platform/x86: asus-wmi: expose dGPU and CPU
 tunables for ROG
Content-Language: en-US, nl
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        jdelvare@suse.com, linux@roeck-us.net
References: <20230630053552.976579-1-luke@ljones.dev>
 <20230630053552.976579-9-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230630053552.976579-9-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 6/30/23 07:35, Luke D. Jones wrote:
> Expose various CPU and dGPU tunables that are available on many ASUS
> ROG laptops. The tunables shown in sysfs will vary depending on the CPU
> and dGPU vendor.
> 
> All of these variables are write only and there is no easy way to find
> what the defaults are. In general they seem to default to the max value
> the vendor sets for the CPU and dGPU package - this is not the same as
> the min/max writable value. Values written to these variables that are
> beyond the capabilities of the CPU are ignored by the laptop.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

(I'll fix the make htmldocs warning lkp spotted while merging this).

Regards,

Hans

> ---
>  .../ABI/testing/sysfs-platform-asus-wmi       |  58 ++++
>  drivers/platform/x86/asus-wmi.c               | 285 ++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h    |   9 +
>  3 files changed, 352 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> index 5624bdef49cb..caaccd28fabf 100644
> --- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
> +++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> @@ -126,3 +126,61 @@ Description:
>  		Change the mini-LED mode:
>  			* 0 - Single-zone,
>  			* 1 - Multi-zone
> +
> +What:		/sys/devices/platform/<platform>/ppt_pl1_spl
> +Date:		Jun 2023
> +KernelVersion:	6.5
> +Contact:	"Luke Jones" <luke@ljones.dev>
> +Description:
> +		Set the Package Power Target total of CPU: PL1 on Intel, SPL on AMD.
> +		Shown on Intel+Nvidia or AMD+Nvidia based systems.
> +			* min=5, max=250
> +
> +What:		/sys/devices/platform/<platform>/ppt_pl2_sppt
> +Date:		Jun 2023
> +KernelVersion:	6.5
> +Contact:	"Luke Jones" <luke@ljones.dev>
> +Description:
> +		Set the Slow Package Power Tracking Limit of CPU: PL2 on Intel, SPPT,
> +		on AMD. Shown on Intel+Nvidia or AMD+Nvidia based systems.
> +			* min=5, max=250
> +
> +What:		/sys/devices/platform/<platform>/ppt_fppt
> +Date:		Jun 2023
> +KernelVersion:	6.5
> +Contact:	"Luke Jones" <luke@ljones.dev>
> +Description:
> +		Set the Fast Package Power Tracking Limit of CPU. AMD+Nvidia only.
> +			* min=5, max=250
> +
> +What:		/sys/devices/platform/<platform>/ppt_apu_sppt
> +Date:		Jun 2023
> +KernelVersion:	6.5
> +Contact:	"Luke Jones" <luke@ljones.dev>
> +Description:
> +		Set the APU SPPT limit. Shown on full AMD systems only.
> +			* min=5, max=130
> +
> +What:		/sys/devices/platform/<platform>/ppt_platform_sppt
> +Date:		Jun 2023
> +KernelVersion:	6.5
> +Contact:	"Luke Jones" <luke@ljones.dev>
> +Description:
> +		Set the platform SPPT limit. Shown on full AMD systems only.
> +			* min=5, max=130
> +
> +What:		/sys/devices/platform/<platform>/nv_dynamic_boost
> +Date:		Jun 2023
> +KernelVersion:	6.5
> +Contact:	"Luke Jones" <luke@ljones.dev>
> +Description:
> +		Set the dynamic boost limit of the Nvidia dGPU:
> +			* min=5, max=25
> +
> +What:		/sys/devices/platform/<platform>/nv_temp_target
> +Date:		Jun 2023
> +KernelVersion:	6.5
> +Contact:	"Luke Jones" <luke@ljones.dev>
> +Description:
> +		Set the target temperature limit of the Nvidia dGPU:
> +			* min=75, max=87
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 1fc9e8afc2f3..d9a353081f91 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -117,6 +117,16 @@ module_param(fnlock_default, bool, 0444);
>  /* Mask to determine if setting temperature or percentage */
>  #define FAN_CURVE_PWM_MASK		0x04
>  
> +/* Limits for tunables available on ASUS ROG laptops */
> +#define PPT_TOTAL_MIN		5
> +#define PPT_TOTAL_MAX		250
> +#define PPT_CPU_MIN			5
> +#define PPT_CPU_MAX			130
> +#define NVIDIA_BOOST_MIN	5
> +#define NVIDIA_BOOST_MAX	25
> +#define NVIDIA_TEMP_MIN		75
> +#define NVIDIA_TEMP_MAX		87
> +
>  static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
>  
>  static int throttle_thermal_policy_write(struct asus_wmi *);
> @@ -247,6 +257,15 @@ struct asus_wmi {
>  	bool dgpu_disable_available;
>  	bool gpu_mux_mode_available;
>  
> +	/* Tunables provided by ASUS for gaming laptops */
> +	bool ppt_pl2_sppt_available;
> +	bool ppt_pl1_spl_available;
> +	bool ppt_apu_sppt_available;
> +	bool ppt_plat_sppt_available;
> +	bool ppt_fppt_available;
> +	bool nv_dyn_boost_available;
> +	bool nv_temp_tgt_available;
> +
>  	bool kbd_rgb_mode_available;
>  	bool kbd_rgb_state_available;
>  
> @@ -946,6 +965,244 @@ static const struct attribute_group *kbd_rgb_mode_groups[] = {
>  	NULL,
>  };
>  
> +/* Tunable: PPT: Intel=PL1, AMD=SPPT *****************************************/
> +static ssize_t ppt_pl2_sppt_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	int result, err;
> +	u32 value;
> +
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +
> +	result = kstrtou32(buf, 10, &value);
> +	if (result)
> +		return result;
> +
> +	if (value < PPT_TOTAL_MIN || value > PPT_TOTAL_MAX)
> +		return -EINVAL;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_PPT_PL2_SPPT, value, &result);
> +	if (err) {
> +		pr_warn("Failed to set ppt_pl2_sppt: %d\n", err);
> +		return err;
> +	}
> +
> +	if (result > 1) {
> +		pr_warn("Failed to set ppt_pl2_sppt (result): 0x%x\n", result);
> +		return -EIO;
> +	}
> +
> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL, "ppt_pl2_sppt");
> +
> +	return count;
> +}
> +static DEVICE_ATTR_WO(ppt_pl2_sppt);
> +
> +/* Tunable: PPT, Intel=PL1, AMD=SPL ******************************************/
> +static ssize_t ppt_pl1_spl_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	int result, err;
> +	u32 value;
> +
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +
> +	result = kstrtou32(buf, 10, &value);
> +	if (result)
> +		return result;
> +
> +	if (value < PPT_TOTAL_MIN || value > PPT_TOTAL_MAX)
> +		return -EINVAL;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_PPT_PL1_SPL, value, &result);
> +	if (err) {
> +		pr_warn("Failed to set ppt_pl1_spl: %d\n", err);
> +		return err;
> +	}
> +
> +	if (result > 1) {
> +		pr_warn("Failed to set ppt_pl1_spl (result): 0x%x\n", result);
> +		return -EIO;
> +	}
> +
> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL, "ppt_pl1_spl");
> +
> +	return count;
> +}
> +static DEVICE_ATTR_WO(ppt_pl1_spl);
> +
> +/* Tunable: PPT APU FPPT ******************************************************/
> +static ssize_t ppt_fppt_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	int result, err;
> +	u32 value;
> +
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +
> +	result = kstrtou32(buf, 10, &value);
> +	if (result)
> +		return result;
> +
> +	if (value < PPT_TOTAL_MIN || value > PPT_TOTAL_MAX)
> +		return -EINVAL;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_PPT_FPPT, value, &result);
> +	if (err) {
> +		pr_warn("Failed to set ppt_fppt: %d\n", err);
> +		return err;
> +	}
> +
> +	if (result > 1) {
> +		pr_warn("Failed to set ppt_fppt (result): 0x%x\n", result);
> +		return -EIO;
> +	}
> +
> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL, "ppt_fpu_sppt");
> +
> +	return count;
> +}
> +static DEVICE_ATTR_WO(ppt_fppt);
> +
> +/* Tunable: PPT APU SPPT *****************************************************/
> +static ssize_t ppt_apu_sppt_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	int result, err;
> +	u32 value;
> +
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +
> +	result = kstrtou32(buf, 10, &value);
> +	if (result)
> +		return result;
> +
> +	if (value < PPT_CPU_MIN || value > PPT_CPU_MAX)
> +		return -EINVAL;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_PPT_APU_SPPT, value, &result);
> +	if (err) {
> +		pr_warn("Failed to set ppt_apu_sppt: %d\n", err);
> +		return err;
> +	}
> +
> +	if (result > 1) {
> +		pr_warn("Failed to set ppt_apu_sppt (result): 0x%x\n", result);
> +		return -EIO;
> +	}
> +
> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL, "ppt_apu_sppt");
> +
> +	return count;
> +}
> +static DEVICE_ATTR_WO(ppt_apu_sppt);
> +
> +/* Tunable: PPT platform SPPT ************************************************/
> +static ssize_t ppt_platform_sppt_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	int result, err;
> +	u32 value;
> +
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +
> +	result = kstrtou32(buf, 10, &value);
> +	if (result)
> +		return result;
> +
> +	if (value < PPT_CPU_MIN || value > PPT_CPU_MAX)
> +		return -EINVAL;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_PPT_PLAT_SPPT, value, &result);
> +	if (err) {
> +		pr_warn("Failed to set ppt_platform_sppt: %d\n", err);
> +		return err;
> +	}
> +
> +	if (result > 1) {
> +		pr_warn("Failed to set ppt_platform_sppt (result): 0x%x\n", result);
> +		return -EIO;
> +	}
> +
> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL, "ppt_platform_sppt");
> +
> +	return count;
> +}
> +static DEVICE_ATTR_WO(ppt_platform_sppt);
> +
> +/* Tunable: NVIDIA dynamic boost *********************************************/
> +static ssize_t nv_dynamic_boost_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	int result, err;
> +	u32 value;
> +
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +
> +	result = kstrtou32(buf, 10, &value);
> +	if (result)
> +		return result;
> +
> +	if (value < NVIDIA_BOOST_MIN || value > NVIDIA_BOOST_MAX)
> +		return -EINVAL;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_NV_DYN_BOOST, value, &result);
> +	if (err) {
> +		pr_warn("Failed to set nv_dynamic_boost: %d\n", err);
> +		return err;
> +	}
> +
> +	if (result > 1) {
> +		pr_warn("Failed to set nv_dynamic_boost (result): 0x%x\n", result);
> +		return -EIO;
> +	}
> +
> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL, "nv_dynamic_boost");
> +
> +	return count;
> +}
> +static DEVICE_ATTR_WO(nv_dynamic_boost);
> +
> +/* Tunable: NVIDIA temperature target ****************************************/
> +static ssize_t nv_temp_target_store(struct device *dev,
> +				    struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	int result, err;
> +	u32 value;
> +
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +
> +	result = kstrtou32(buf, 10, &value);
> +	if (result)
> +		return result;
> +
> +	if (value < NVIDIA_TEMP_MIN || value > NVIDIA_TEMP_MAX)
> +		return -EINVAL;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_NV_THERM_TARGET, value, &result);
> +	if (err) {
> +		pr_warn("Failed to set nv_temp_target: %d\n", err);
> +		return err;
> +	}
> +
> +	if (result > 1) {
> +		pr_warn("Failed to set nv_temp_target (result): 0x%x\n", result);
> +		return -EIO;
> +	}
> +
> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL, "nv_temp_target");
> +
> +	return count;
> +}
> +static DEVICE_ATTR_WO(nv_temp_target);
> +
>  /* Battery ********************************************************************/
>  
>  /* The battery maximum charging percentage */
> @@ -3775,6 +4032,13 @@ static struct attribute *platform_attributes[] = {
>  	&dev_attr_als_enable.attr,
>  	&dev_attr_fan_boost_mode.attr,
>  	&dev_attr_throttle_thermal_policy.attr,
> +	&dev_attr_ppt_pl2_sppt.attr,
> +	&dev_attr_ppt_pl1_spl.attr,
> +	&dev_attr_ppt_fppt.attr,
> +	&dev_attr_ppt_apu_sppt.attr,
> +	&dev_attr_ppt_platform_sppt.attr,
> +	&dev_attr_nv_dynamic_boost.attr,
> +	&dev_attr_nv_temp_target.attr,
>  	&dev_attr_panel_od.attr,
>  	&dev_attr_mini_led_mode.attr,
>  	NULL
> @@ -3812,6 +4076,20 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
>  		ok = asus->fan_boost_mode_available;
>  	else if (attr == &dev_attr_throttle_thermal_policy.attr)
>  		ok = asus->throttle_thermal_policy_available;
> +	else if (attr == &dev_attr_ppt_pl2_sppt.attr)
> +		ok = asus->ppt_pl2_sppt_available;
> +	else if (attr == &dev_attr_ppt_pl1_spl.attr)
> +		ok = asus->ppt_pl1_spl_available;
> +	else if (attr == &dev_attr_ppt_fppt.attr)
> +		ok = asus->ppt_fppt_available;
> +	else if (attr == &dev_attr_ppt_apu_sppt.attr)
> +		ok = asus->ppt_apu_sppt_available;
> +	else if (attr == &dev_attr_ppt_platform_sppt.attr)
> +		ok = asus->ppt_plat_sppt_available;
> +	else if (attr == &dev_attr_nv_dynamic_boost.attr)
> +		ok = asus->nv_dyn_boost_available;
> +	else if (attr == &dev_attr_nv_temp_target.attr)
> +		ok = asus->nv_temp_tgt_available;
>  	else if (attr == &dev_attr_panel_od.attr)
>  		ok = asus->panel_overdrive_available;
>  	else if (attr == &dev_attr_mini_led_mode.attr)
> @@ -4077,6 +4355,13 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	asus->gpu_mux_mode_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_GPU_MUX);
>  	asus->kbd_rgb_mode_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_MODE);
>  	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
> +	asus->ppt_pl2_sppt_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_PPT_PL2_SPPT);
> +	asus->ppt_pl1_spl_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_PPT_PL1_SPL);
> +	asus->ppt_fppt_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_PPT_FPPT);
> +	asus->ppt_apu_sppt_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_PPT_APU_SPPT);
> +	asus->ppt_plat_sppt_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_PPT_PLAT_SPPT);
> +	asus->nv_dyn_boost_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_NV_DYN_BOOST);
> +	asus->nv_temp_tgt_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_NV_THERM_TARGET);
>  	asus->panel_overdrive_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_PANEL_OD);
>  	asus->mini_led_mode_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE);
>  
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index ea80361ac6c7..16e99a1c37fc 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -86,6 +86,15 @@
>  #define ASUS_WMI_DEVID_GPU_FAN_CURVE	0x00110025
>  #define ASUS_WMI_DEVID_MID_FAN_CURVE	0x00110032
>  
> +/* Tunables for AUS ROG laptops */
> +#define ASUS_WMI_DEVID_PPT_PL2_SPPT		0x001200A0
> +#define ASUS_WMI_DEVID_PPT_PL1_SPL		0x001200A3
> +#define ASUS_WMI_DEVID_PPT_APU_SPPT		0x001200B0
> +#define ASUS_WMI_DEVID_PPT_PLAT_SPPT	0x001200B1
> +#define ASUS_WMI_DEVID_PPT_FPPT			0x001200C1
> +#define ASUS_WMI_DEVID_NV_DYN_BOOST		0x001200C0
> +#define ASUS_WMI_DEVID_NV_THERM_TARGET	0x001200C2
> +
>  /* Power */
>  #define ASUS_WMI_DEVID_PROCESSOR_STATE	0x00120012
>  

