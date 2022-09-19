Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA3AC6FA8B
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Sep 2022 12:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiISMSs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Sep 2022 08:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiISMSp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Sep 2022 08:18:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81D9E007
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Sep 2022 05:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663589923;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G0DSvgpZ4h6uehJTMxHzzvXh1HsmXnvIzwbdbIVtcjw=;
        b=YgTmPC/MRpFf/C2sF/W8IVT97kUt4lwMpWq9Fule9LPbv6QeCb1c0b1N41j4dnxm5shpo3
        Tu35oR+w7pa8KFUx/HtQWnUIh/d2LvASpxoU4AFe99fM4Oles9hu1VcXAJIBt0H2sS2Sef
        wPPZm4KHauQCOTgQoMJGL91eMDoj20Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-85-2P_fwfZjO0y_tzurjoeMEA-1; Mon, 19 Sep 2022 08:18:40 -0400
X-MC-Unique: 2P_fwfZjO0y_tzurjoeMEA-1
Received: by mail-ed1-f70.google.com with SMTP id f10-20020a0564021e8a00b00451be6582d5so16257384edf.15
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Sep 2022 05:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=G0DSvgpZ4h6uehJTMxHzzvXh1HsmXnvIzwbdbIVtcjw=;
        b=Sydo57V2J8AEL916e4mUdeOUf6Mb7ZO5oCN2y28Lw2kDfvvd0rxbk6dgYfaNkg62zj
         mAQvzzB3Nsm9i7+G57evTp+urhruml8JMoVWbRRv3FTrzD83sOG2mah4bQpItk9wAHzu
         ypVsOVhwmWxSjF5mh4qQa9o1DnpZYmuqFFL66BkYXrr9wZlLLuUAV0v48Uh10H2oaE1u
         lGVNQ9nJSSbBgr/Jnv6Ld/obZHzn/LJzWApRQeg8yURHSdyNAwO1XY9wd8Uw0ChDLOA5
         Lki15kiiTCoFCrb29WbYZCyaSCX+luyjNZIAL92z1IhgRiqAVbwawM8gtKP00yxzHLnj
         71OQ==
X-Gm-Message-State: ACrzQf3QGgGHnotvEF/kmOtAriB8GXhLX0TUu6dDE/LEhKQWMplk1puJ
        qhLrrXWKA55hkvQI6kcuRMRZMtfXV/oSuMB3mkNBLyr9S8PzxInx1JzYAOlnIiAecJfIqT5TH+G
        jhov2A0qMD77sfziKmANFeHg=
X-Received: by 2002:a17:906:ef90:b0:77f:8f0d:e925 with SMTP id ze16-20020a170906ef9000b0077f8f0de925mr12304837ejb.622.1663589918974;
        Mon, 19 Sep 2022 05:18:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Vah5wh+rQnfBOmtQuW378vREh4+2MDpEX/5SEMBLmSfhDdy44YDwGEz5SJhjSkq8AL/3OJA==
X-Received: by 2002:a17:906:ef90:b0:77f:8f0d:e925 with SMTP id ze16-20020a170906ef9000b0077f8f0de925mr12304825ejb.622.1663589918787;
        Mon, 19 Sep 2022 05:18:38 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ee52-20020a056402293400b00453995b4c20sm6447617edb.73.2022.09.19.05.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 05:18:38 -0700 (PDT)
Message-ID: <4d55be61-e797-9eec-bf7e-ed675947b04d@redhat.com>
Date:   Mon, 19 Sep 2022 13:18:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] asus-wmi: Expand support of GPU fan to read RPM and label
Content-Language: en-US
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     markgross@kernel.org, corentin.chary@gmail.com, linux@roeck-us.net,
        jdelvare@suse.com, acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org
References: <20220916004623.10992-1-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220916004623.10992-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Luke,

On 9/16/22 01:46, Luke D. Jones wrote:
> The previously added patch to add support for pwm change for TUF laptops
> also is usuable for more than TUF. The same method `0x00110014` is
> used to read the fan RPM.
> 
> Add two extra attributes for reading fan2 plus fan2 label.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/platform/x86/asus-wmi.c | 36 +++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index ae46af731de9..7fe6ce25da0a 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -72,6 +72,7 @@ module_param(fnlock_default, bool, 0444);
>  
>  #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
>  
> +#define ASUS_GPU_FAN_DESC		"gpu_fan"
>  #define ASUS_FAN_DESC			"cpu_fan"
>  #define ASUS_FAN_MFUN			0x13
>  #define ASUS_FAN_SFUN_READ		0x06
> @@ -2078,6 +2079,30 @@ static ssize_t asus_hwmon_temp1(struct device *dev,
>  }
>  
>  /* GPU fan on modern ROG laptops */
> +static ssize_t fan2_input_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buf)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +	int value;
> +	int ret;
> +
> +	ret = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_GPU_FAN_CTRL, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	value &= 0xffff;
> +
> +	return sysfs_emit(buf, "%d\n", value < 0 ? -1 : value * 100);

As already mentioned since you & with 0xffff above the sign bit can never be
set, so the value is never less then < 0, so I have simplified this to:

	return sysfs_emit(buf, "%d\n", value * 100);

while merging.

> +}
> +
> +static ssize_t fan2_label_show(struct device *dev,
> +					  struct device_attribute *attr,
> +					  char *buf)
> +{
> +	return sprintf(buf, "%s\n", ASUS_GPU_FAN_DESC);
> +}

And here I have done s/sprintf/sysfs_emit/ with those changes
I've applied this patch to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> +
>  static ssize_t pwm2_enable_show(struct device *dev,
>  				struct device_attribute *attr,
>  				char *buf)
> @@ -2127,9 +2152,12 @@ static ssize_t pwm2_enable_store(struct device *dev,
>  /* Fan1 */
>  static DEVICE_ATTR_RW(pwm1);
>  static DEVICE_ATTR_RW(pwm1_enable);
> -static DEVICE_ATTR_RW(pwm2_enable);
>  static DEVICE_ATTR_RO(fan1_input);
>  static DEVICE_ATTR_RO(fan1_label);
> +/* Fan2 - GPU fan */
> +static DEVICE_ATTR_RW(pwm2_enable);
> +static DEVICE_ATTR_RO(fan2_input);
> +static DEVICE_ATTR_RO(fan2_label);
>  
>  /* Temperature */
>  static DEVICE_ATTR(temp1_input, S_IRUGO, asus_hwmon_temp1, NULL);
> @@ -2140,6 +2168,8 @@ static struct attribute *hwmon_attributes[] = {
>  	&dev_attr_pwm2_enable.attr,
>  	&dev_attr_fan1_input.attr,
>  	&dev_attr_fan1_label.attr,
> +	&dev_attr_fan2_input.attr,
> +	&dev_attr_fan2_label.attr,
>  
>  	&dev_attr_temp1_input.attr,
>  	NULL
> @@ -2160,7 +2190,9 @@ static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
>  	    || attr == &dev_attr_pwm1_enable.attr) {
>  		if (asus->fan_type == FAN_TYPE_NONE)
>  			return 0;
> -	} else if (attr == &dev_attr_pwm2_enable.attr) {
> +	} else if (attr == &dev_attr_fan2_input.attr
> +	    || attr == &dev_attr_fan2_label.attr
> +	    || attr == &dev_attr_pwm2_enable.attr) {
>  		if (asus->gpu_fan_type == FAN_TYPE_NONE)
>  			return 0;
>  	} else if (attr == &dev_attr_temp1_input.attr) {

