Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A53C636CD
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Feb 2023 17:55:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbjBJRzH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Feb 2023 12:55:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232462AbjBJRzE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Feb 2023 12:55:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5967CCB6
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Feb 2023 09:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676051638;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ByLTaBrR33/58eblN5M5BJ+SAtE6mecuJJ1gYpLRkfw=;
        b=She6fYYoehTQ8TI6+0KU3zi7xoGK7f+G2gNe0LOyl665dj6K1eu+v4yZWAB2GkpN2x47AB
        7whgCupznLYC0YDFqSHcYoJqawarhk+K0/dLbTUBwx/lNotC1Gfw4/qQDADR6naLY82OcQ
        qSMH5C5HTgSYI0TXSqiWBbVuTq6h6iM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-237-n1ko_LPMPh6mHfBQ3SpSxA-1; Fri, 10 Feb 2023 12:53:57 -0500
X-MC-Unique: n1ko_LPMPh6mHfBQ3SpSxA-1
Received: by mail-ej1-f70.google.com with SMTP id i11-20020a1709061ccb00b008aadd9cb12fso4003330ejh.5
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Feb 2023 09:53:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ByLTaBrR33/58eblN5M5BJ+SAtE6mecuJJ1gYpLRkfw=;
        b=hkyJ1KqkkLkBT4JeUSaaRbxoAvVDCGbkbkxrlNQP7ChfnAyXjs6nlxJWiGMHjeUkdy
         Ud4eCJpSGB4rsIODTBsKrfstIibGH11z/ABCI1WfWuU6uAjKJMFfTOFu8kkGHxVF7qgM
         g89rE+hZziB/dAmP1m90ZlwL0WbNyD0HSqz3MXacolFdAgs/asGOPEeBeeXWhZezvm4e
         Jfg3eFZbt3gIbWAZCOT3VqaRG/2CIbRTGB0QV0q2o+oKBeZgQCYprpL+hb1gcjQ7umke
         b7fv9PD2AQluCuyJfoW4jgviMLEmdZ9IWaK7RCtd6mo5oT0ni/TzhTLm1IHq7lllzrvr
         cgug==
X-Gm-Message-State: AO0yUKWohwaPRgs1PqNVBbPoQ6PNkA5V+BNP/5d3XtKpP2srPODbZE/J
        gbQxnBmulkI9PJ0uzoALfhShnVri2VLuTmgLvscYrFqyRxpdQigoMaMwPEXLRE1bQCLByQkfDO3
        Ie6MDXDxNrIBYg06N2AKDShk=
X-Received: by 2002:a17:906:70c7:b0:885:6a2e:f941 with SMTP id g7-20020a17090670c700b008856a2ef941mr14790108ejk.54.1676051635932;
        Fri, 10 Feb 2023 09:53:55 -0800 (PST)
X-Google-Smtp-Source: AK7set+DNv4GVF0SPagUZnh8wWR3eAig9uI70x2zyVfDjEpeHUGM61viPpw9njwVFtd2k8xIDYbnhg==
X-Received: by 2002:a17:906:70c7:b0:885:6a2e:f941 with SMTP id g7-20020a17090670c700b008856a2ef941mr14790102ejk.54.1676051635725;
        Fri, 10 Feb 2023 09:53:55 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dt19-20020a170906b79300b0088ed7de4821sm2656892ejb.158.2023.02.10.09.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 09:53:55 -0800 (PST)
Message-ID: <fd4150cf-1800-51c4-e4f8-4b6aff5ddc5d@redhat.com>
Date:   Fri, 10 Feb 2023 18:53:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 0/2] platform/x86: dell-ddv: Various driver updates
Content-Language: en-US, nl
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230209211503.2739-1-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230209211503.2739-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Armin,

On 2/9/23 22:15, Armin Wolf wrote:
> Thanks to bugreport 216655 on bugzilla, the contents of the
> fan/thermal sensor buffers could be almost completely decoded.
> 
> The first patch adds support for exposing the sensor values
> over a standard hwmon interface, and the second patch enables
> asynchronous probing for the driver since the sensor interface
> can be quiet slow.
> 
> The patch series was tested on a Dell Inspiron 3505, with the hwmon
> patch being tested by multiple people over bugzilla and email. Those
> who tested the final version of the hwmon patch are credited with
> Tested-by tags.

Thanks this looks nice and clean, much appreciate
the attention to detail.

I've applied the series to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans






> ---
> Changes in v3:
> - remove empty lines before break/return
> - invalidate buffer cache on resume
> Changes in v2:
> - remove already merged patches
> - add patch enabling asynchronous probing
> - cache sensor buffers
> - fix compilation on 32 bit
> - add missing break statements
> - remove C++ style comments
> - rework battery hook and hwmon probing
> - rework Kconfig dependencies
> 
> Armin Wolf (2):
>   platform/x86: dell-ddv: Add hwmon support
>   platform/x86: dell-ddv: Prefer asynchronous probing
> 
>  drivers/platform/x86/dell/Kconfig        |   8 +-
>  drivers/platform/x86/dell/dell-wmi-ddv.c | 492 ++++++++++++++++++++++-
>  2 files changed, 495 insertions(+), 5 deletions(-)
> 
> --
> 2.30.2
> 

