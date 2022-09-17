Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4CCC54EE9
	for <linux-hwmon@archiver.kernel.org>; Sat, 17 Sep 2022 11:43:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbiIQLn1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 17 Sep 2022 07:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiIQLn0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 17 Sep 2022 07:43:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A93F430F47
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Sep 2022 04:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663415004;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZClsg0wMJayywjY+jS2FKrO6NoFX+1c9h8wWmFk1p1I=;
        b=isrx3V2wlka88IgwAWOpEzjtHutzEPeNQmXclU6s/xCoJgTfTcJ4zah0N6+/Pyrl7jYTcb
        JYWS8XAOOMMBuCwzmn8Feozjb6F8R1v37vVnKqCmb4qGs6H9RP4SmjRx7kcSMN+Ty1Ng86
        sInD0PbWm1KhWCGC0sQQ/mb8PH7daSg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-270-Z9cTAElkM2Gw4NzHCAPbKA-1; Sat, 17 Sep 2022 07:43:05 -0400
X-MC-Unique: Z9cTAElkM2Gw4NzHCAPbKA-1
Received: by mail-ed1-f70.google.com with SMTP id w17-20020a056402269100b0045249bc17a9so10273518edd.9
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Sep 2022 04:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ZClsg0wMJayywjY+jS2FKrO6NoFX+1c9h8wWmFk1p1I=;
        b=KJf/wg0rGW5hlK9kf3Au0h7lCVrvPG0kFE/arUbKF9bOYtwvrHdFBukdpNVyOZOu56
         zFDWOdV6leGV8gn5oRn7QnwmVlRygtIO7Q//8fV4nZmYHrQC2QMHkTvLUd0I29pTOBds
         9spSnUPh+d8ir/Q9y2iQKdO10gBhQ9vVpixZHiZQtGuJsSwUcIQphvfc69lA7h3pae7i
         ir+IxOA9B5jC2E1nQKGMK1H4eq8HM8LxkqVJsJluynF3pOsz+f3+dxnAjRvuCtJIAkU4
         8Bhc6sdmKISGGiGR7lKTKSf5LKULnVT3kP+a0+X+94IGjjezamsQBaLZX3SIueSbaTHA
         +ipg==
X-Gm-Message-State: ACrzQf0iyb3+ThfcR11CIu7z+z/Ft7ZM7znOkPoVuwb/VBpO3I6Mq+gt
        8c61hh4zTvdmpo7R4055XhTa/8C5zoVxDPnlmVIpQ7m8ENl+tv72d18D/w4yf28Va/rlPoA9POz
        fRjoJaGWgDRwLku8QBPN2fzc=
X-Received: by 2002:a17:907:9718:b0:77b:45b6:b047 with SMTP id jg24-20020a170907971800b0077b45b6b047mr6481569ejc.479.1663414984229;
        Sat, 17 Sep 2022 04:43:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM72Ol6Ko3NC08OalVMBCwe6L9M1lDumgdoWTvATp99ArdqMANaaS8EgvLNR+7OPGzjfcuXfdA==
X-Received: by 2002:a17:907:9718:b0:77b:45b6:b047 with SMTP id jg24-20020a170907971800b0077b45b6b047mr6481562ejc.479.1663414984057;
        Sat, 17 Sep 2022 04:43:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id g21-20020aa7c855000000b0044e983132c3sm15406697edt.60.2022.09.17.04.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Sep 2022 04:43:03 -0700 (PDT)
Message-ID: <10bf6462-64e1-6130-fe06-9d1f17f72288@redhat.com>
Date:   Sat, 17 Sep 2022 13:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH -next] platform/x86: asus-wmi: change kbd_rgb_mode_groups
 to static
Content-Language: en-US
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        acpi4asus-user@lists.sourceforge.net
Cc:     corentin.chary@gmail.com
References: <20220913135401.1973721-1-yangyingliang@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220913135401.1973721-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 9/13/22 15:54, Yang Yingliang wrote:
> kbd_rgb_mode_groups is only used in asus-wmi.c now, change it
> to static.
> 
> Fixes: e305a71cea37 ("platform/x86: asus-wmi: Implement TUF laptop keyboard LED modes")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Thank you for your patch. This has already been fixed in my review-hans
branchm, so I am going to drop this patch.

Regards,

Hans


> ---
>  drivers/platform/x86/asus-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index d95170b7dba0..ae46af731de9 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -835,7 +835,7 @@ static const struct attribute_group kbd_rgb_state_group = {
>  	.attrs = kbd_rgb_state_attrs,
>  };
>  
> -const struct attribute_group *kbd_rgb_mode_groups[] = {
> +static const struct attribute_group *kbd_rgb_mode_groups[] = {
>  	NULL,
>  	NULL,
>  	NULL,

