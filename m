Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52422EB64D9
	for <linux-hwmon@archiver.kernel.org>; Tue,  4 Jul 2023 11:34:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbjGDLeW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 4 Jul 2023 07:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbjGDLeW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Jul 2023 07:34:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E4E5113
        for <linux-hwmon@vger.kernel.org>; Tue,  4 Jul 2023 04:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688470418;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cEMNAN1VW4G+/yTzgfqsNrZ5FGOPNiH5MyEs3oCQmQw=;
        b=IFfTlM27kSjyHtkeShFHD7lEz5VIlToYmhSuwCGtlWXGS9FQ49U6LaRb3hG/c4WXE+L407
        OyiUvf/zCHuEAF38Q4YWn+IGMnOHS7l5b12wIie2l2hyRCCyKeraVKdEI034CEa1B8DXzM
        HNB89wp3uVuPmDSSGDs8PTLh55vds/Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-tlnDB9NPPAK9zDdjGPCD1w-1; Tue, 04 Jul 2023 07:33:37 -0400
X-MC-Unique: tlnDB9NPPAK9zDdjGPCD1w-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-993831c639aso74438866b.2
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Jul 2023 04:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688470416; x=1691062416;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cEMNAN1VW4G+/yTzgfqsNrZ5FGOPNiH5MyEs3oCQmQw=;
        b=HSWWdb+FGFnV2BvO6jefBNfhSsHzDLsM4aoBF2pdSNE/hd1A7fQasl2X+/Gg6mK7ir
         BWLDDYStVg0wj+fiMnFl+UsshGpHyWoQ5P+rrnvAH5SZrOOyxoUgMNb6L9IPUB7ZuFX5
         XegbmDVqnb1KwJXKgZbDtq3mtPCf53A5IWtOAyto6IzbLKdh+B1bvmg/7Dc1ByxWZsEC
         8NqorA+a5EM+A1kv56PkEBHfmjcFTEBXEI+HEZXtThP+scaMgv66VG97I+vZGys1n/Lx
         6crDGqug4tmoy4IV4c51HhxmBKBEwF9TDL31k2uHCKTvQyPwY9xYL8XARvK7Bssu/+Fy
         x7mQ==
X-Gm-Message-State: ABy/qLYXErGMUJkKarKA9KLs7dLww/ivrBwPXtktBfTCMvF4YR5vmMXF
        iu1pV/8bMadW/qdgeCf37D55mLkLZqGs7cUSkHgms4NHl3L99MU9Njt+R27/QTZIVo9InpWUxpe
        H2J+9r/lHY0UbuZDAU4WN5qc=
X-Received: by 2002:a05:6402:619:b0:51e:1634:e5a9 with SMTP id n25-20020a056402061900b0051e1634e5a9mr3506015edv.28.1688470416331;
        Tue, 04 Jul 2023 04:33:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEXhQoLHTMnEQgCl2b7+LWgNUbG0w68arjmAdaHxl7eIs86U3yHhxSVSJIes9qAdwrUFVz0wg==
X-Received: by 2002:a05:6402:619:b0:51e:1634:e5a9 with SMTP id n25-20020a056402061900b0051e1634e5a9mr3506006edv.28.1688470416177;
        Tue, 04 Jul 2023 04:33:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l11-20020a056402028b00b0051e0272ad00sm4383003edv.75.2023.07.04.04.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 04:33:35 -0700 (PDT)
Message-ID: <3356d7b0-08fa-1b15-ef03-35781fc899c0@redhat.com>
Date:   Tue, 4 Jul 2023 13:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/8] platform/x86: asus-wmi: add support for showing
 charger mode
Content-Language: en-US, nl
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        jdelvare@suse.com, linux@roeck-us.net
References: <20230630053552.976579-1-luke@ljones.dev>
 <20230630053552.976579-2-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230630053552.976579-2-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 6/30/23 07:35, Luke D. Jones wrote:
> Expose a WMI method in sysfs platform for showing which connected
> charger the laptop is currently using.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  .../ABI/testing/sysfs-platform-asus-wmi       | 10 +++++++++
>  drivers/platform/x86/asus-wmi.c               | 21 +++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h    |  3 +++
>  3 files changed, 34 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> index a77a004a1baa..eb29e3023c7b 100644
> --- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
> +++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> @@ -98,3 +98,13 @@ Description:
>  		Enable an LCD response-time boost to reduce or remove ghosting:
>  			* 0 - Disable,
>  			* 1 - Enable
> +
> +What:		/sys/devices/platform/<platform>/charge_mode
> +Date:		Jun 2023
> +KernelVersion:	6.5
> +Contact:	"Luke Jones" <luke@ljones.dev>
> +Description:
> +		Get the current charging mode being used:
> +			* 1 - Barrel connected charger,
> +			* 2 - USB-C charging
> +			* 3 - Both connected, barrel used for charging
> \ No newline at end of file
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 1038dfdcdd32..f23375d5fb82 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -237,6 +237,7 @@ struct asus_wmi {
>  	u8 fan_boost_mode_mask;
>  	u8 fan_boost_mode;
>  
> +	bool charge_mode_available;
>  	bool egpu_enable_available;
>  	bool dgpu_disable_available;
>  	bool gpu_mux_mode_available;
> @@ -586,6 +587,22 @@ static void asus_wmi_tablet_mode_get_state(struct asus_wmi *asus)
>  		asus_wmi_tablet_sw_report(asus, result);
>  }
>  
> +/* Charging mode, 1=Barrel, 2=USB ******************************************/
> +static ssize_t charge_mode_show(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +	int result, value;
> +
> +	result = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_CHARGE_MODE, &value);
> +	if (result < 0)
> +		return result;
> +
> +	return sysfs_emit(buf, "%d\n", value & 0xff);
> +}
> +
> +static DEVICE_ATTR_RO(charge_mode);
> +
>  /* dGPU ********************************************************************/
>  static ssize_t dgpu_disable_show(struct device *dev,
>  				   struct device_attribute *attr, char *buf)
> @@ -3462,6 +3479,7 @@ static struct attribute *platform_attributes[] = {
>  	&dev_attr_camera.attr,
>  	&dev_attr_cardr.attr,
>  	&dev_attr_touchpad.attr,
> +	&dev_attr_charge_mode.attr,
>  	&dev_attr_egpu_enable.attr,
>  	&dev_attr_dgpu_disable.attr,
>  	&dev_attr_gpu_mux_mode.attr,
> @@ -3491,6 +3509,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
>  		devid = ASUS_WMI_DEVID_LID_RESUME;
>  	else if (attr == &dev_attr_als_enable.attr)
>  		devid = ASUS_WMI_DEVID_ALS_ENABLE;
> +	else if (attr == &dev_attr_charge_mode.attr)
> +		ok = asus->charge_mode_available;
>  	else if (attr == &dev_attr_egpu_enable.attr)
>  		ok = asus->egpu_enable_available;
>  	else if (attr == &dev_attr_dgpu_disable.attr)
> @@ -3757,6 +3777,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	if (err)
>  		goto fail_platform;
>  
> +	asus->charge_mode_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_CHARGE_MODE);
>  	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
>  	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
>  	asus->gpu_mux_mode_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_GPU_MUX);
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 28234dc9fa6a..f90cafe26af1 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -95,6 +95,9 @@
>  /* Keyboard dock */
>  #define ASUS_WMI_DEVID_KBD_DOCK		0x00120063
>  
> +/* Charging mode - 1=Barrel, 2=USB */
> +#define ASUS_WMI_DEVID_CHARGE_MODE	0x0012006C
> +
>  /* dgpu on/off */
>  #define ASUS_WMI_DEVID_EGPU		0x00090019
>  

