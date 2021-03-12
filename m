Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C23C433E0
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Mar 2021 14:49:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92B4264FC3
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Mar 2021 14:49:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbhCLOs4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 12 Mar 2021 09:48:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230302AbhCLOsq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Mar 2021 09:48:46 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133D3C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Mar 2021 06:48:46 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id 101-20020a9d04ee0000b02901b506659320so1501569otm.7
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Mar 2021 06:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ofgxhw6pf8zvF2e24J1ANsllhNszqGFzgYJjrFWfSM8=;
        b=qtWVDFvY1d3uEu3jrUO24+LpUTMh4Yf/hMm6DknejUAAoO3JLcTavVBnCKnpj/efI5
         ELf5wNqoQ5+5nrHe2qadrtx5tm6OJB2kr+xZycS4n8JpFpMdHSs0YnSaCmxbeTTP+Xd1
         FJH7xchIoLMk70v/9OLgUf8lZ0eT+mbI6Fp6+DllPCdd1tt3KIFIloMBQzzGeqMQj2wk
         RdLPsbUxHlQPGxCTa9GoMI7Y6q3QBr7MhKVNY88ZpZc+gFZonFn808U8bwD6gJx7qzfu
         Dbv9qbVNMe9F4vbAhVK2t+ccf/DnNGv0pHLYlmKSboH7ZggrUvJQjY33TxAziWroNiTI
         4Pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Ofgxhw6pf8zvF2e24J1ANsllhNszqGFzgYJjrFWfSM8=;
        b=Hcc2dfbrpdxYyvwOfiCo7Qhk6FsVeqCPOXdVejYafBRIeKuU0akU1nalV/mdL+Wfzs
         PaC6D5+tYARSyIStrejGZ5sgxkxkOPAHYwXjIg9/bGFNApTGcJpXlmUZqwRbZax3TSBt
         DxtED7mK8TbSFAzLrGTtBcL+irwoWl4KlS0PwEKgpfgNa0EL5sOfwsKzFur0AUrroKqw
         Ut4PjgEIWrEf0q2tW2EI0w4UAWizc4Y1VTkqdubsSN6CHZl9DVGzZbEtk219SCu/mUfs
         BBIYaCqrCKA9L34C9Gwa6aFVaH7wokRLT7anH9w5GQ8u274d08CalSIS0AtA3y0JSWZB
         5GNA==
X-Gm-Message-State: AOAM530vVAaWelxlPGQL3Su+zzG1ajDfP/VZuHsEpB2124sTvInYeLMz
        JHlO3ABgVfk3c222MXTyEUo=
X-Google-Smtp-Source: ABdhPJxVDGmMe1Igc622TvOIBaFb/t8UMlg6aRwW2gwaWVdpYEQcOBKdBjWbw3VroQI83XZarVhZWA==
X-Received: by 2002:a9d:5191:: with SMTP id y17mr3632411otg.332.1615560525510;
        Fri, 12 Mar 2021 06:48:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f22sm1369843otl.10.2021.03.12.06.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 06:48:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: (lm90) Fix false alarm when writing convrate on
 max6658
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Guohan Lu <lguohan@gmail.com>, Boyang Yu <byu@arista.com>
References: <20210304153832.19275-1-pmenzel@molgen.mpg.de>
 <20210311221556.GA38026@roeck-us.net>
 <9243482c-0a34-d6d1-1955-bee00a75554f@molgen.mpg.de>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <d4756f39-3a4b-7348-c49b-25701e31f99b@roeck-us.net>
Date:   Fri, 12 Mar 2021 06:48:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9243482c-0a34-d6d1-1955-bee00a75554f@molgen.mpg.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/11/21 11:48 PM, Paul Menzel wrote:
> Dear Guenter,
> 
> 
> Thank you for your reply.
> 
> Am 11.03.21 um 23:15 schrieb Guenter Roeck:
>> On Thu, Mar 04, 2021 at 04:38:32PM +0100, Paul Menzel wrote:
>>> From: Boyang Yu <byu@arista.com>
>>>
>>> We found that the max6658 sometimes issues a false alarm when its
>>> convrate is changed, with the current hwmon driver. This workaround
>>> will fix it by stopping the conversion before setting the convrate.
>>>
>>> Upstream the patch added added to the SONiC Linux kernel in merge/pull
>>> request #82 [1][2].
>>>
>>> [1]: https://github.com/Azure/sonic-linux-kernel/pull/82
>>> [2]: https://github.com/Azure/sonic-linux-kernel/commit/d03f6167f64b2bfa1330ff7b33fe217f68ab7028
>>>
>>> [pmenzel: Forward port patch from 4.19 to 5.12-rc1+]
>>> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
>>> ---
>>>   drivers/hwmon/lm90.c | 15 ++++++++++++---
>>>   1 file changed, 12 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>>> index ebbfd5f352c0..0c1a91b715e8 100644
>>> --- a/drivers/hwmon/lm90.c
>>> +++ b/drivers/hwmon/lm90.c
>>> @@ -639,7 +639,11 @@ static int lm90_set_convrate(struct i2c_client *client, struct lm90_data *data,
>>>           if (interval >= update_interval * 3 / 4)
>>>               break;
>>>   -    err = lm90_write_convrate(data, i);
>>> +    if (data->kind == max6657)
>>> +        err = max6657_write_convrate(client, i);
>>
>> There is no such function in the upstream kernel.
> 
> Hmm, why did that hunk get lost when preparing the patch? I am sorry for this oversight.
> 
No worries.

>> Anyway, this problem has already been already fixed
>> in the upstream kernel with commit 62456189f3292 ("hwmon:
>> (lm90) Fix max6658 sporadic wrong temperature reading").
> 
> Ah, indeed. Thank you for pointing that out. It’d be great to have that included in the 4.19 LTS series. Would it be alright, if I contacted the stable series maintainers?
> 

Sure.

Guenter
