Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0121DC433ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Apr 2021 14:47:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CBD4B61353
	for <linux-hwmon@archiver.kernel.org>; Mon, 12 Apr 2021 14:47:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239341AbhDLOrn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 12 Apr 2021 10:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238723AbhDLOrn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Apr 2021 10:47:43 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A918C061574
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Apr 2021 07:47:24 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so13005280otb.7
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Apr 2021 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2fEF6RJI9oPfewxemU24BvatkkgzqPX3YISCWNBhYVg=;
        b=NQ74/y8tPmVLgiaG+1aOBJTAstm3pnv+BoZpZqrprhbhMHfz+04w8UTIgm8LTp1QeM
         71zD5t2q0YNB755Kp7niBSDNqNs6avwzvCMMwbVqqeDPRpWbfUEnOJGbBegDUV6ylj4j
         M0Al2ltDzoX2Mvu1tLR9ZgFt3TMuqGtYZ0Abi+dKx70V6ee3Mro4ejRFks3hHK0zV2/a
         Bln9FZS9Q9t0i162kwjtBpvhrppPZIoabWuie6oxkBUwfKzlD1sfvBrG561H9TssDMgS
         shUoZXe1yaZHa4x5rGgsf0RIF/caGTyTzeQRu6IApW9Ccs95IJyENsnqkGMQiz6mWC6P
         2I2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=2fEF6RJI9oPfewxemU24BvatkkgzqPX3YISCWNBhYVg=;
        b=Z6xgXKxJv9x+UAWwcYGeaxsiN+WMH27PehSihNMNVnGWG/jE6lmbu1vUcSJD1D/waS
         fylIggnhbrNIlSSoRu9/Tp8G2C5coEFKpd83w1Dv0aYpSMaHD/bqTbKqS7nDNIZ/RAEg
         7eLM/4RQVhfxu/7hzMRH63/kzKVvA39U5OVyKGwuwDUQ4+CBWy0YM6veK5ZbiKQgNJt+
         eFZaa9kpkGcFYi7ENAX/xM/t4anm0S5xYtYoKtqtriBsnvHdXKTr5TY4Fc+RPbMRe9Dw
         FDPa4urci9IuZmIKrSeWNnNIOFdpBzzccQxBrFGVBYR/3uTNsOgzT8Ph4WPS5QAC0DLz
         4GOQ==
X-Gm-Message-State: AOAM531hapwY3vgRDx6y9w6Ro8wd/424CUkYpRzOvcKvknHK9R8lIkuT
        beEtcFfdsV/OxsUkibD9whSNgcVeV9k=
X-Google-Smtp-Source: ABdhPJxoztbWRCnVqvnzsiisdto13yesejV6sIs+RCXbZMDo1NERNJqyUjJMsayULoiFObJQUTv4qw==
X-Received: by 2002:a9d:6e11:: with SMTP id e17mr23888259otr.222.1618238843438;
        Mon, 12 Apr 2021 07:47:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z30sm117769ota.77.2021.04.12.07.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 07:47:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add keyword pattern for hwmon registration
 functions
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20210410063625.139687-1-linux@roeck-us.net>
 <20210412164115.0ff0a63a@endymion>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <dd09d9dc-7c0a-a8d9-4cb1-c484b64330b3@roeck-us.net>
Date:   Mon, 12 Apr 2021 07:47:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210412164115.0ff0a63a@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/12/21 7:41 AM, Jean Delvare wrote:
> On Fri,  9 Apr 2021 23:36:25 -0700, Guenter Roeck wrote:
>> A pattern match for hardware monitoring registration functions ensures
>> that hardware monitoring maintainers are copied whenever hardware
>> monitoring drivers are added to the tree.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>  MAINTAINERS | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index b8f9fc5eaf08..f7513d8be996 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7851,6 +7851,7 @@ F:	Documentation/hwmon/
>>  F:	drivers/hwmon/
>>  F:	include/linux/hwmon*.h
>>  F:	include/trace/events/hwmon*.h
>> +K:	(devm_)?hwmon_device_(un)?register(|_with_groups|_with_info)
>>  
>>  HARDWARE RANDOM NUMBER GENERATOR CORE
>>  M:	Matt Mackall <mpm@selenic.com>
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 
Thanks, appreciate it!

Guenter

