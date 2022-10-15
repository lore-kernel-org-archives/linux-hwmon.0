Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4C9C433FE
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Oct 2022 12:28:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiJOM2d (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Oct 2022 08:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiJOM2b (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Oct 2022 08:28:31 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F544E40C
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Oct 2022 05:28:31 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1322fa1cf6fso8790761fac.6
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Oct 2022 05:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MPJX26elTampWO8bRd9verNNDHfysJO+v+J062zebrs=;
        b=BxBJVEkAkjRhVrJfqVJdTja8sf83XwFCUpG+KFVamEeO7RjwAMkYkJKLmXjH5M09oc
         +bhDZwEWBNhJ7fuHXRiIVXa5zni+n1x3dZkJTkbk96qPNLhcw+HsmPKfuV4kzXo76hPI
         fYfRNlCLHzUyQfHYIL94UR4vrNNOvRVhsiCFYLerWKhjdM4VqQgyBSf1+4sX5qlCZ3Wq
         8Ci+w5FRyj8AdD+RpX48SOIV9quNLbcv5H4VUPode/G8nW9qzI8ZWTEpNhKRiwzv/YqV
         Z9ddOZugFji0KI5bKu/UPaSCK/WwOIjo4HYgwmT6qY+ZSuIsPg1dXv6cZObBErcElTG4
         SWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPJX26elTampWO8bRd9verNNDHfysJO+v+J062zebrs=;
        b=ntZnLkL4FK1q4b8sAwG8KF99hwsO1jcE4cWlvjBIW1ptA1Bx++94BFWXZde3maoUXs
         9mbMZKOSZvIxl1aZW170PB7d7ae7TG28XECJ6wdK8KrTXFWy62a2DgojpzqkivpnFxOy
         cMx/caQYq+HM/IV1ilJ/syseKNDtQOYzOuyv1CeQONsdq9Vwjsls1A5Nqt4QyezPiRaQ
         kmxNEvqGD05w0P25Ra4/wh0IkNiuqRzm8K/fP6bOQt3QHF8Odnf8qVFFpWJaVbJ9sRWI
         o8t6BKsNiSSO6yTIbkairvhsVb7e6q0GMan4Vu8bOvdnwDRFJv0uakclyUs2ysgATHRi
         lhNQ==
X-Gm-Message-State: ACrzQf1ixuoePUvnebCTgKqHd3pBYt2GO+TzSmkTi5aQfQOyFRa5WEI4
        iQTIgpGo/RfjNXKDAjHoBvk=
X-Google-Smtp-Source: AMsMyM5imi8LXn6mhdPV4BiFc1Dq13B7k8BjsOzRo+yQDmTgPdsWUSxEdhJYslKrn5sAs/vOEu+T6A==
X-Received: by 2002:a05:6870:60a7:b0:12b:8d8d:1116 with SMTP id t39-20020a05687060a700b0012b8d8d1116mr10916451oae.165.1665836910568;
        Sat, 15 Oct 2022 05:28:30 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id er33-20020a056870c8a100b0011e37fb5493sm2603400oab.30.2022.10.15.05.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 05:28:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e77c59a9-4f5f-7177-af6d-32afd06ee6f2@roeck-us.net>
Date:   Sat, 15 Oct 2022 05:28:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 0/1] hwmon: (it87) Add DMI table
Content-Language: en-US
To:     Frank Crawford <frank@crawford.emu.id.au>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20221015120110.1472074-1-frank@crawford.emu.id.au>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20221015120110.1472074-1-frank@crawford.emu.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/15/22 05:01, Frank Crawford wrote:
> Add in DMI matching table to match various board quirks and settings.
> This will be useful for future extentions, but will start with the
> existing definition of the Shuttle SN68PT.
> 
> Frank Crawford (1):
>    Create DMI matching table for various board quirks, starting with the
>      existing definition for the Shuttle SN68PT.
> 
>   drivers/hwmon/it87.c | 57 ++++++++++++++++++++++++++++----------------
>   1 file changed, 37 insertions(+), 20 deletions(-)
> 

You don't need to send an intro message if there is only one patch
in the series.

Thanks,
Guenter

