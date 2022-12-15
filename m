Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD683C001B2
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Dec 2022 00:19:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbiLOATf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Dec 2022 19:19:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiLOATE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Dec 2022 19:19:04 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4B7316;
        Wed, 14 Dec 2022 16:19:00 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id l8-20020a056830054800b006705fd35eceso2735634otb.12;
        Wed, 14 Dec 2022 16:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gdmHglzdWNf/DUwjqm59a2A1zMO/VnLL8Ae1GW4halg=;
        b=cNMJuQ3GHcPni+psrYouPcOeYlibvBUryANLwnSj1GepFGyV/hpuoX1bqGSooVOyaX
         kshiJtEW5stdMYib8vS0Iqnjc7Nngrz6wwatwZzWNPHH1oxMVtkHMimv18hXkMg2ZZ+Q
         LkQQiLHRqh2dsNXVEoPBk8NljYsUaP4hZQ9E43b5CZBru3U1vC0E1LbOgVagrL1qtoWp
         LOYQXN9meK4fg8c0PPms1h+YsShqRN+oyjrYMldktkiweUpxNqfvyyznTtylnkbl+WC4
         o8BegIOv4WyWSWz9S/WyC122PXVHaJfq6mnRXIPBFXmcOA93K6poWOgnjY5lLHzS1itl
         TGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdmHglzdWNf/DUwjqm59a2A1zMO/VnLL8Ae1GW4halg=;
        b=A7QGS7PIdXRuwBUnJLcgaAu9CuRLlwUc24zmW6gzJFBESWQ1XvjiEZKV2VfkH86beK
         193Xp1MkKleF6X42yan3zadwGtW3YYOj2pGMjxZJYzpz5zO2ZbhGccRHVUl0RROvyLwv
         9F6ACAzfmUn/AvqeSRpeCXR4CDwLUTN0UtqhuFD6xGkXtrmNY6lho1UNIq4E5Tz+AkPK
         H8YP7KkzN2hDwhi0Q58jxS10JXpLcstsLQZDs03NXzS5d7me0DsTSfgx6Dji5fG5kOyY
         rYzWGUnLPdl/9sk01FEE2vtRMAztcys0O+Y/SIN4g46CzWHoSpDRuF6p13ciGkNcBbsK
         /gbA==
X-Gm-Message-State: ANoB5pkbcronbXP1jhkzWgScyC8Ms2BfV5cICj7rtldBlGz5Arha/V02
        23qysfeoWDHQz2+fK3oTenxzJWy1IXc=
X-Google-Smtp-Source: AA0mqf6ficMbbQGzbCauoQOMriZxh9SnxdqjhyGgX8lZJ8HIuOF2RhGRrQfBu+fDaouj6wUMsE8kcA==
X-Received: by 2002:a05:6830:2015:b0:670:7757:173a with SMTP id e21-20020a056830201500b006707757173amr12772084otp.10.1671063539841;
        Wed, 14 Dec 2022 16:18:59 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 96-20020a9d0869000000b00661b46cc26bsm2937444oty.9.2022.12.14.16.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 16:18:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <93732ff5-aa9d-3a90-efa5-ceaecdac82dd@roeck-us.net>
Date:   Wed, 14 Dec 2022 16:18:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] hwmon: (oxp-sensors) Add AYANEO AIR and AIR Pro
Content-Language: en-US
To:     Joaquin Aramendia <samsagax@gmail.com>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221214153908.99926-1-derekjohn.clark@gmail.com>
 <CABgtM3ibh0k8LcEnSNUx7DwJBQfMK6K3G_Rhk4GR5oSsx+Rmaw@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CABgtM3ibh0k8LcEnSNUx7DwJBQfMK6K3G_Rhk4GR5oSsx+Rmaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/14/22 14:05, Joaquin Aramendia wrote:
>>   Currently the driver supports the following handhelds:
>>
>>    - AOK ZOE A1
>> + - Aya Neo AIR
>> + - Aya Neo AIR Pro
>>    - OneXPlayer AMD
>>    - OneXPlayer mini AMD
>>    - OneXPlayer mini AMD PRO
> 
> Since there is more support now for this type of device and not only
> from one brand (even though it seems they all come from the same
> manufacturer) I might be sending a patch to change the name of the
> driver after this gets merged.

No, please don't do that.

Guenter

