Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318D1C11F66
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Jul 2021 14:22:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EB8861183
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Jul 2021 14:22:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbhGNOZS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Jul 2021 10:25:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25936 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231765AbhGNOZS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Jul 2021 10:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626272546;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M+PCijAFK+zc4yebc2+Chhr3mPpRnKROJHkGBmiJexA=;
        b=daMsUFLrPw7y5v7SOmSJ/yNBp9uNJOuZzJfs/x7GH342EBBbnsHomUxI3TDiDMmmQOx5Ev
        tu6GNipa3f8ybti3oRlQAsUqzF/qsKsL92L/ptw5na9VHyguamITyIW2OrILfY0xFAc7ma
        8cQwSL9tVhCEETNMnEJv1NWajGEXHEE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-vauoBimCPJ-Lgb9YwPzx6A-1; Wed, 14 Jul 2021 10:22:25 -0400
X-MC-Unique: vauoBimCPJ-Lgb9YwPzx6A-1
Received: by mail-qt1-f197.google.com with SMTP id 100-20020aed206d0000b029024ea3acef5bso2013855qta.12
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jul 2021 07:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=M+PCijAFK+zc4yebc2+Chhr3mPpRnKROJHkGBmiJexA=;
        b=bwdfxAXtZlBOkdkwltJsBXEp1lqFm448G8hxfLhy3MKrmfBNr4fsjygd1zA5bBgcWP
         N8Dw7zErm0Xq/oRT90cezc4EaSaSw9Z4BOfpWoNiknrMDysuN+L++LnHLs6FjHj4UrYV
         6FZxw+1O0Y0IBa+oCSLAt4Afb0PbuBFlgJig/Tar4FxMvx23SWKmlLyRRtjAsxSegnQl
         oToUeBIRzTh3RcXyhhNV/ZHJBMXklOO24lVL0JP4eXVeo+x8gZ+ix8IHJy4mDEny8PEE
         XyODPYBqnID81Y0JjU7YPbssuH194IjldgN7k6cQWqtDgKwWGjthqaeqA6rxA2dANCNV
         mpNw==
X-Gm-Message-State: AOAM531+LMFPme+XuCWwHCS80cdTxAEm9BEujvvArdOnp89jWcxm54c5
        1L7bNQU/YaIWdxVPgwr7HnHr3hhta34A2Cm29065N6xON/CwjnhzwB9LhBvWKdd0oxX3V2WXER7
        YKVFChbTGZCGoa0YgMORGIT0=
X-Received: by 2002:a37:cd0:: with SMTP id 199mr10167154qkm.69.1626272545192;
        Wed, 14 Jul 2021 07:22:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIl4qQxdtL1RBVqFykTv9nwuH3HGdWbTZY5hynMAyEJAyRrYZKgBknquu9Xi3Ou9JMvCGkcA==
X-Received: by 2002:a37:cd0:: with SMTP id 199mr10167145qkm.69.1626272545038;
        Wed, 14 Jul 2021 07:22:25 -0700 (PDT)
Received: from localhost.localdomain (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id f12sm1102779qke.37.2021.07.14.07.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 07:22:24 -0700 (PDT)
Subject: Re: [PATCH v4 2/4] spi: spi-altera-dfl: support n5010 feature
 revision
To:     =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mhu@silicom.dk>,
        =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>,
        Wu Hao <hao.wu@intel.com>, Moritz Fischer <mdf@kernel.org>,
        Xu Yilun <yilun.xu@intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-spi@vger.kernel.org
References: <20210705101645.2040106-1-martin@geanix.com>
 <20210705101645.2040106-3-martin@geanix.com>
 <d6250f86-db93-bcc2-d46e-6dba30976cc4@redhat.com>
 <f3bbe112-b105-07ac-9d2e-8ffc89c0a89c@silicom.dk>
From:   Tom Rix <trix@redhat.com>
Message-ID: <99abfd17-4307-0b88-32a3-c80f61da587b@redhat.com>
Date:   Wed, 14 Jul 2021 07:22:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f3bbe112-b105-07ac-9d2e-8ffc89c0a89c@silicom.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


On 7/14/21 4:33 AM, Martin Hundebøll wrote:
>
>
> On 06/07/2021 16.56, Tom Rix wrote:
>>> diff --git a/drivers/spi/spi-altera-dfl.c 
>>> b/drivers/spi/spi-altera-dfl.c
>>> index 3e32e4fe5895..f6cf7c8d9dac 100644
>>> --- a/drivers/spi/spi-altera-dfl.c
>>> +++ b/drivers/spi/spi-altera-dfl.c
>>> @@ -111,6 +111,13 @@ static struct spi_board_info m10_bmc_info = {
>>>       .chip_select = 0,
>>>   };
>>> +static struct spi_board_info m10_n5010_bmc_info = {
>>> +    .modalias = "m10-n5010",
>>> +    .max_speed_hz = 12500000,
>>> +    .bus_num = 0,
>>> +    .chip_select = 0,
>>> +};
>>
>> Other then the modalias, this is exactly the same as m10_bmc_info.
>>
>> Why not set platform_data?
>
> So like this?
>
> +static struct spi_board_info m10_n5010_bmc_info = {
> +    .platform_data = "m10-n5010",
> +    .max_speed_hz = 12500000,
> +    .bus_num = 0,
> +    .chip_select = 0,
> +};
>
> I don't see how that should improve the situation, but we might allocate
> the board info on the stack and set modalias dynamically instead?

No, I mean that instead of have two *bmc_info's generalize the existing one.

This could be done by using the as yet unused platform_data field to 
hold the identity as a bit/enum in an int.

Tom

>
> // Martin
>

