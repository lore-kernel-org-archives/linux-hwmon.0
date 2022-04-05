Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121D5C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 Apr 2022 14:45:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238231AbiDEOrJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 5 Apr 2022 10:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352597AbiDENHD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 5 Apr 2022 09:07:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7EE091207D5
        for <linux-hwmon@vger.kernel.org>; Tue,  5 Apr 2022 05:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649160497;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0zqRlYSF/srXUIsESCDUgFTwIIiATXDVky1x44pb9Xk=;
        b=P0exrI1pUGsm5SaRos2gQifDkhighQamhNHGKOFBuUVPQQ7AKWoTh3Ad8siwgJJds8h97+
        uNwXoH71t8uL9uu4OpJ5vAm+S/w8Hu5b2C2CovER8xBQvact765MA4qkdNsc1ZIrvmiMAu
        RzbI/LFpbAHAEnObAv9BplMsO7/zHN4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-507ue2W7NVuKgGZ309qMJA-1; Tue, 05 Apr 2022 08:08:14 -0400
X-MC-Unique: 507ue2W7NVuKgGZ309qMJA-1
Received: by mail-qv1-f70.google.com with SMTP id f9-20020a056214076900b00443e17f23b4so3187102qvz.7
        for <linux-hwmon@vger.kernel.org>; Tue, 05 Apr 2022 05:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=0zqRlYSF/srXUIsESCDUgFTwIIiATXDVky1x44pb9Xk=;
        b=FSD7b1hNCnV8t4uHqVTICW7xdohGnefIXfaky24xIYS+VODx8wqY20UBh19x9JFatk
         oB6I1jBEhoSpTe5RbWNd2/xThamYGgBh/ZcLsKWWCfW470b5W2G4/0iI5YGX5fTRXM4I
         0tgvgpw5ErbbiV74cUodN4kWaMIc3GOf4yZWS/nc0nfxn397Wh9w8Nfr7i0DB0YNt/uz
         NTYgDxxoNBgdM+Ll0KQxnDMgIGFt01IvMojbwA+uroWGMJ6M0i6vWcsax3t1K0cNYJ4w
         cTB7B+SZITPDxXcje4DmHj92RGpkjquYAke+YLK5PlEbMnqJjJgNFlJknDdX9aSixaoO
         et3g==
X-Gm-Message-State: AOAM532/PLesTes3oSZpqPbKg9Njhn4AeE956L206MFnqfmLu2fxoHrb
        kSL3FRTw5EEVyW0ip71JQuSlmuT6XctvFdlj8u89QREOKx2ATh28b2RxKJRTjJxs9G1aV5KplJn
        j412f5F12O/9cbpyxHe+HNTE=
X-Received: by 2002:ad4:5946:0:b0:441:bdc:66c9 with SMTP id eo6-20020ad45946000000b004410bdc66c9mr2453619qvb.127.1649160494141;
        Tue, 05 Apr 2022 05:08:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5TtZldrYQEHbAEt2L8N1+2NHnNYi/RcZ1pl8tugcUxs0ZtdD/2rNztflj0pCjThaSSwB/hg==
X-Received: by 2002:ad4:5946:0:b0:441:bdc:66c9 with SMTP id eo6-20020ad45946000000b004410bdc66c9mr2453600qvb.127.1649160493936;
        Tue, 05 Apr 2022 05:08:13 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id g5-20020ac87f45000000b002e125ef0ba3sm10804418qtk.82.2022.04.05.05.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 05:08:13 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] hwmon: introduce hwmon_sanitize_name()
To:     Michael Walle <michael@walle.cc>, Xu Yilun <yilun.xu@intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, David Laight <David.Laight@ACULAB.COM>
References: <20220405092452.4033674-1-michael@walle.cc>
 <20220405092452.4033674-2-michael@walle.cc>
From:   Tom Rix <trix@redhat.com>
Message-ID: <b4302bff-cee6-5ea7-aa99-c0110f374f00@redhat.com>
Date:   Tue, 5 Apr 2022 05:08:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220405092452.4033674-2-michael@walle.cc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 4/5/22 2:24 AM, Michael Walle wrote:
> More and more drivers will check for bad characters in the hwmon name
> and all are using the same code snippet. Consolidate that code by adding
> a new hwmon_sanitize_name() function.
>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>   Documentation/hwmon/hwmon-kernel-api.rst | 16 +++++++
>   drivers/hwmon/hwmon.c                    | 53 ++++++++++++++++++++++++
>   include/linux/hwmon.h                    |  3 ++
>   3 files changed, 72 insertions(+)
>
> diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
> index c41eb6108103..e2975d5caf34 100644
> --- a/Documentation/hwmon/hwmon-kernel-api.rst
> +++ b/Documentation/hwmon/hwmon-kernel-api.rst
> @@ -50,6 +50,10 @@ register/unregister functions::
>   
>     void devm_hwmon_device_unregister(struct device *dev);
>   
> +  char *hwmon_sanitize_name(const char *name);
> +
> +  char *devm_hwmon_sanitize_name(struct device *dev, const char *name);
> +
>   hwmon_device_register_with_groups registers a hardware monitoring device.
>   The first parameter of this function is a pointer to the parent device.
>   The name parameter is a pointer to the hwmon device name. The registration
> @@ -95,6 +99,18 @@ All supported hwmon device registration functions only accept valid device
>   names. Device names including invalid characters (whitespace, '*', or '-')
>   will be rejected. The 'name' parameter is mandatory.
>   
> +If the driver doesn't use a static device name (for example it uses
> +dev_name()), and therefore cannot make sure the name only contains valid
> +characters, hwmon_sanitize_name can be used. This convenience function
> +will duplicate the string and replace any invalid characters with an
> +underscore. It will allocate memory for the new string and it is the
> +responsibility of the caller to release the memory when the device is
> +removed.
> +
> +devm_hwmon_sanitize_name is the resource managed version of
> +hwmon_sanitize_name; the memory will be freed automatically on device
> +removal.
> +
>   Using devm_hwmon_device_register_with_info()
>   --------------------------------------------
>   
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 989e2c8496dd..5915ccfdb7d9 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -1057,6 +1057,59 @@ void devm_hwmon_device_unregister(struct device *dev)
>   }
>   EXPORT_SYMBOL_GPL(devm_hwmon_device_unregister);
>   
> +static char *__hwmon_sanitize_name(struct device *dev, const char *old_name)
> +{
> +	char *name, *p;
> +
> +	if (dev)
> +		name = devm_kstrdup(dev, old_name, GFP_KERNEL);
> +	else
> +		name = kstrdup(old_name, GFP_KERNEL);
> +	if (!name)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (p = name; *p; p++)
> +		if (hwmon_is_bad_char(*p))
> +			*p = '_';
> +
> +	return name;
> +}
> +
> +/**
> + * hwmon_sanitize_name - Replaces invalid characters in a hwmon name
> + * @name: NUL-terminated name
> + *
> + * Allocates a new string where any invalid characters will be replaced
> + * by an underscore. It is the responsibility of the caller to release
> + * the memory.
> + *
> + * Returns newly allocated name, or ERR_PTR on error.
> + */
> +char *hwmon_sanitize_name(const char *name)
> +{
> +	return __hwmon_sanitize_name(NULL, name);
> +}
> +EXPORT_SYMBOL_GPL(hwmon_sanitize_name);
> +
> +/**
> + * devm_hwmon_sanitize_name - resource managed hwmon_sanitize_name()
> + * @dev: device to allocate memory for
> + * @name: NUL-terminated name
> + *
> + * Allocates a new string where any invalid characters will be replaced
> + * by an underscore.
> + *
> + * Returns newly allocated name, or ERR_PTR on error.
> + */
> +char *devm_hwmon_sanitize_name(struct device *dev, const char *name)
> +{
> +	if (!dev)
> +		return ERR_PTR(-EINVAL);
> +
> +	return __hwmon_sanitize_name(dev, name);
> +}
> +EXPORT_SYMBOL_GPL(devm_hwmon_sanitize_name);
> +
>   static void __init hwmon_pci_quirks(void)
>   {
>   #if defined CONFIG_X86 && defined CONFIG_PCI
> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index eba380b76d15..4efaf06fd2b8 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
> @@ -461,6 +461,9 @@ void devm_hwmon_device_unregister(struct device *dev);
>   int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
>   		       u32 attr, int channel);
>   
> +char *hwmon_sanitize_name(const char *name);
> +char *devm_hwmon_sanitize_name(struct device *dev, const char *name);

Thanks for the changes.

Reviewed-by: Tom Rix <trix@redhat.com>

> +
>   /**
>    * hwmon_is_bad_char - Is the char invalid in a hwmon name
>    * @ch: the char to be considered

