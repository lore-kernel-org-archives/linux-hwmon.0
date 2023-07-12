Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70E1EB64DA
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Jul 2023 14:48:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbjGLOsS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Jul 2023 10:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231856AbjGLOsR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Jul 2023 10:48:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CBA10B
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 07:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689173255;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EIuzB3x3+itiPANCeMD8GY8b1oc0WBnANtFmR+T6S8U=;
        b=ToL0uHOc2Z16qCT6Ykb7uBR7fdLMo25JXJ3D6i4YsEqPoBi75nyETOEfwt9kLGU+qhpZld
        cJmDKYHgcu/5XjjqHhhN2qhMBcuOcjOby9HYraR7FrREV7qRC5XlHgA9CKN/Pm/cpV9v2h
        1HiQBOhhl++3y/yTQbkSb1CU1x8BfhA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-9E8JF1LQN6Wfc1ufnnvhzQ-1; Wed, 12 Jul 2023 10:47:31 -0400
X-MC-Unique: 9E8JF1LQN6Wfc1ufnnvhzQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-98843cc8980so455273666b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2023 07:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689173250; x=1691765250;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIuzB3x3+itiPANCeMD8GY8b1oc0WBnANtFmR+T6S8U=;
        b=DxdhMb5QmPsGxlSRWJ4Zvryu1qOVea0ed2q5ZO+5ry7IW9RBQKsV2kPY/wZaeLkR9O
         CQAMQpVyB4QdjJkgd0b8houT5SMHouz8Dm2pnXy/kR+WE3TyrvZx2Rh1skmfQYOU6JrP
         8DKCA00Azj5w+0zGex3/lgJoJn1tzGrJCmULvxav4yaC1QgW/JErDAQvOTqfrBVqNs7a
         CEtVor+BswBay2KKgh2hhLZoM4DD4oMzi3Lmd3a0NwkEN9Ib1Neca/qKi6VDprgvVSN3
         S9/reep9LdD1WzFRRcniJJBAkPAMMZ4onqqj6gxb6tk6WnhWsNYnQpk314e6sUjXSa1i
         CSrQ==
X-Gm-Message-State: ABy/qLYyk9jGgFsgYaoyP3VJqC0x95xYZ0ou+xQfWzKc1H4holVEZd/M
        RgvZK+aDl6zwa6tFoTdyA+bD/+Bb1DlgviJsrfrlXZjP1fAvo3BQFraWwGjzc8uAwuDi51gXKOb
        HmX/D9iYRvJG36ewxONwQUkoVfsp5Yrk=
X-Received: by 2002:a17:906:af65:b0:994:34a2:8724 with SMTP id os5-20020a170906af6500b0099434a28724mr242708ejb.52.1689173250192;
        Wed, 12 Jul 2023 07:47:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGaWvX/O8w27SGpuJdmu612qxbMowaKIYLZTLJgaTMD9S3lDFGlByoIHJEs+K1fptL66r0HIQ==
X-Received: by 2002:a17:906:af65:b0:994:34a2:8724 with SMTP id os5-20020a170906af6500b0099434a28724mr242695ejb.52.1689173249925;
        Wed, 12 Jul 2023 07:47:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id m27-20020a1709060d9b00b009932337747esm2643633eji.86.2023.07.12.07.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 07:47:29 -0700 (PDT)
Message-ID: <7ad305d4-3acb-1447-bdbe-077c83972978@redhat.com>
Date:   Wed, 12 Jul 2023 16:47:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 6/8] platform/x86: asus-wmi: add safety checks to gpu
 switching
Content-Language: en-US, nl
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        jdelvare@suse.com, linux@roeck-us.net
References: <20230630053552.976579-1-luke@ljones.dev>
 <20230630053552.976579-7-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230630053552.976579-7-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 6/30/23 07:35, Luke D. Jones wrote:
> Add safety checking to dgpu_disable, egpu_enable, gpu_mux_mode.
> 
> These checks prevent users from doing such things as:
> - disabling the dGPU while is muxed to drive the internal screen
> - enabling the eGPU which also disables the dGPU, while muxed to
>   the internal screen
> - switching the MUX to dGPU while the dGPU is disabled
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/platform/x86/asus-wmi.c | 50 ++++++++++++++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 821addb284d7..602426a7fb41 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -645,6 +645,18 @@ static ssize_t dgpu_disable_store(struct device *dev,
>  	if (disable > 1)
>  		return -EINVAL;
>  
> +	if (asus->gpu_mux_mode_available) {
> +		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_GPU_MUX);
> +		if (result < 0)
> +			/* An error here may signal greater failure of GPU handling */
> +			return result;
> +		if (!result && disable) {
> +			err = -ENODEV;
> +			pr_warn("Can not disable dGPU when the MUX is in dGPU mode: %d\n", err);
> +			return err;
> +		}
> +	}
> +
>  	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_DGPU, disable, &result);
>  	if (err) {
>  		pr_warn("Failed to set dgpu disable: %d\n", err);
> @@ -693,7 +705,7 @@ static ssize_t egpu_enable_store(struct device *dev,
>  	if (enable > 1)
>  		return -EINVAL;
>  
> -	err = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_EGPU_CONNECTED);
> +	result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_EGPU_CONNECTED);
>  	if (err < 0)
>  		return err;
>  	if (err < 1) {

This seems like a stray and undesired change. I'll drop this err -> result change
when merging this.

Otherwise looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





> @@ -702,6 +714,18 @@ static ssize_t egpu_enable_store(struct device *dev,
>  		return err;
>  	}
>  
> +	if (asus->gpu_mux_mode_available) {
> +		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_GPU_MUX);
> +		if (result < 0)
> +			/* An error here may signal greater failure of GPU handling */
> +			return result;
> +		if (!result && enable) {
> +			err = -ENODEV;
> +			pr_warn("Can not enable eGPU when the MUX is in dGPU mode: %d\n", err);
> +			return err;
> +		}
> +	}
> +
>  	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_EGPU, enable, &result);
>  	if (err) {
>  		pr_warn("Failed to set egpu disable: %d\n", err);
> @@ -764,6 +788,30 @@ static ssize_t gpu_mux_mode_store(struct device *dev,
>  	if (optimus > 1)
>  		return -EINVAL;
>  
> +	if (asus->dgpu_disable_available) {
> +		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_DGPU);
> +		if (result < 0)
> +			/* An error here may signal greater failure of GPU handling */
> +			return result;
> +		if (result && !optimus) {
> +			err = -ENODEV;
> +			pr_warn("Can not switch MUX to dGPU mode when dGPU is disabled: %d\n", err);
> +			return err;
> +		}
> +	}
> +
> +	if (asus->egpu_enable_available) {
> +		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_EGPU);
> +		if (result < 0)
> +			/* An error here may signal greater failure of GPU handling */
> +			return result;
> +		if (result && !optimus) {
> +			err = -ENODEV;
> +			pr_warn("Can not switch MUX to dGPU mode when eGPU is enabled: %d\n", err);
> +			return err;
> +		}
> +	}
> +
>  	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_GPU_MUX, optimus, &result);
>  	if (err) {
>  		dev_err(dev, "Failed to set GPU MUX mode: %d\n", err);

