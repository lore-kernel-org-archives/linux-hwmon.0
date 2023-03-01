Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F312BC64ED6
	for <linux-hwmon@archiver.kernel.org>; Wed,  1 Mar 2023 12:15:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjCAMPz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 1 Mar 2023 07:15:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjCAMPy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Mar 2023 07:15:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9F931516A
        for <linux-hwmon@vger.kernel.org>; Wed,  1 Mar 2023 04:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677672908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bu+EPKiqWaJlFT+E8yHfU9ZpiuzC1YRS6XYz2PiEsE8=;
        b=CMqg3jyxv4+H6W7Hx2W0wct85SEQoqPF4elGoWScBkd2b2zqBYPjkHBV4UJn0wbuQ9VTLc
        oxMLWjWc9lj36kQdwkUx9YHF5R4eazG8f4nA0QB0nCU9Tti//hch0AunSr7W87RxSn8VsI
        yEXQHA578g6bHqF0HUg6SV80fTU8Brk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-178-Fo8ins9FPbyAGoRT0cNZgw-1; Wed, 01 Mar 2023 07:15:07 -0500
X-MC-Unique: Fo8ins9FPbyAGoRT0cNZgw-1
Received: by mail-ed1-f71.google.com with SMTP id b1-20020aa7dc01000000b004ad062fee5eso18714928edu.17
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Mar 2023 04:15:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bu+EPKiqWaJlFT+E8yHfU9ZpiuzC1YRS6XYz2PiEsE8=;
        b=I1ENF52rAVKOUwuOvMGZUULbDOyzOlyrLL6+lUes4r3aaRoHKKZWZQFreMuNZcAulK
         Wc0q+XPFFdD10bCEWlKzyGGsVSJ0F8LF3j/KmUWfKbXyxJEEzZgMThpipPMUL+sjVrTX
         HXYGkxVQdjc5EyrtiTkkx3aDGkd1J91mBujvLBXw2POwQnomR/nHGn5+uUq7JGZFPOsb
         4UwSssug5/EDhIvVRLwduHU0UIyVuMcljUv7Y+/6qmp7JNsaTZlgYaLUSHL3Xtk0uNSL
         mbaV946CkdLZbQeGvZ3S5MlR7FepgqIoLjmcWOhUXTNdSop8PxUV40JMbctcWGKRt6sb
         wAeQ==
X-Gm-Message-State: AO0yUKVEv/OVdmkxLU2/DxfKFyo46/6e3aKoe9KQeBhZKKHq4eSgJRf2
        59QYKhMv5tif/h7ezWZcA+HHEnfFj0ZLiq+8PvN+aWg4WBvuItD61/DEGWc/NWRuGJ/vUluXwDB
        iSQIspKOf+Vlwn2K8PmZYC50=
X-Received: by 2002:a17:907:38e:b0:88d:3c85:4ccf with SMTP id ss14-20020a170907038e00b0088d3c854ccfmr5340026ejb.25.1677672906130;
        Wed, 01 Mar 2023 04:15:06 -0800 (PST)
X-Google-Smtp-Source: AK7set9OTmWktppMquATQgyqnsl8b3YgTg0F/aRqE8fQ+5iI4ZqkI5gqr4VvdiSzTD1tE+BDH+TxbA==
X-Received: by 2002:a17:907:38e:b0:88d:3c85:4ccf with SMTP id ss14-20020a170907038e00b0088d3c854ccfmr5340018ejb.25.1677672905806;
        Wed, 01 Mar 2023 04:15:05 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id m15-20020a1709061ecf00b00882f9130eafsm5717500ejj.26.2023.03.01.04.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 04:15:05 -0800 (PST)
Message-ID: <15d7b77d-c66e-6e31-e930-7595cdabcd11@redhat.com>
Date:   Wed, 1 Mar 2023 13:15:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] platform/x86: dell-ddv: Fix cache invalidation on
 resume
Content-Language: en-US, nl
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230218115318.20662-1-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230218115318.20662-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 2/18/23 12:53, Armin Wolf wrote:
> If one or both sensor buffers could not be initialized, either
> due to missing hardware support or due to some error during probing,
> the resume handler will encounter undefined behaviour when
> attempting to lock buffers then protected by an uninitialized or
> destroyed mutex.
> Fix this by introducing a "active" flag which is set during probe,
> and only invalidate buffers which where flaged as "active".
> 
> Tested on a Dell Inspiron 3505.
> 
> Fixes: 3b7eeff93d29 ("platform/x86: dell-ddv: Add hwmon support")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
> Changes in v2:
> - move checking of the "active" flag inside
>   dell_wmi_ddv_hwmon_cache_invalidate()

Thanks, I've applied this patch to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I'll rebase that branch once 6.3-rc1 is out and then push the rebased
patch to the fixes branch and include it in my next 6.3 fixes pull-req
to Linus.

Regards,

Hans




> ---
>  drivers/platform/x86/dell/dell-wmi-ddv.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x86/dell/dell-wmi-ddv.c
> index d547c9d09725..eff4e9649faf 100644
> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
> @@ -96,6 +96,7 @@ struct combined_chip_info {
>  };
> 
>  struct dell_wmi_ddv_sensors {
> +	bool active;
>  	struct mutex lock;	/* protect caching */
>  	unsigned long timestamp;
>  	union acpi_object *obj;
> @@ -520,6 +521,9 @@ static struct hwmon_channel_info *dell_wmi_ddv_channel_create(struct device *dev
> 
>  static void dell_wmi_ddv_hwmon_cache_invalidate(struct dell_wmi_ddv_sensors *sensors)
>  {
> +	if (!sensors->active)
> +		return;
> +
>  	mutex_lock(&sensors->lock);
>  	kfree(sensors->obj);
>  	sensors->obj = NULL;
> @@ -530,6 +534,7 @@ static void dell_wmi_ddv_hwmon_cache_destroy(void *data)
>  {
>  	struct dell_wmi_ddv_sensors *sensors = data;
> 
> +	sensors->active = false;
>  	mutex_destroy(&sensors->lock);
>  	kfree(sensors->obj);
>  }
> @@ -549,6 +554,7 @@ static struct hwmon_channel_info *dell_wmi_ddv_channel_init(struct wmi_device *w
>  		return ERR_PTR(ret);
> 
>  	mutex_init(&sensors->lock);
> +	sensors->active = true;
> 
>  	ret = devm_add_action_or_reset(&wdev->dev, dell_wmi_ddv_hwmon_cache_destroy, sensors);
>  	if (ret < 0)
> @@ -852,7 +858,7 @@ static int dell_wmi_ddv_resume(struct device *dev)
>  {
>  	struct dell_wmi_ddv_data *data = dev_get_drvdata(dev);
> 
> -	/* Force re-reading of all sensors */
> +	/* Force re-reading of all active sensors */
>  	dell_wmi_ddv_hwmon_cache_invalidate(&data->fans);
>  	dell_wmi_ddv_hwmon_cache_invalidate(&data->temps);
> 
> --
> 2.30.2
> 

