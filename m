Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F01CC11F64
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Jun 2021 02:20:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F139561416
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Jun 2021 02:20:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231559AbhF2CWd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Jun 2021 22:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231512AbhF2CWd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Jun 2021 22:22:33 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB625C061574;
        Mon, 28 Jun 2021 19:20:05 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id g13-20020a4ac4cd0000b029024c717ed8aeso2180350ooq.13;
        Mon, 28 Jun 2021 19:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HbYqrVFsYIhaVbSI+v3JJKYq2b1ECj8tkHaMf+xMlsI=;
        b=fQW30VJaja0f4VFAFJoqOa0gKbK64bhcq9f2wLLv+04Ka5MoENNggDHnk64uscoZCH
         NgRTU3yBCgZ62WtOyHo3Y6aueHxGzWeKpZPkYN0xfKPCSVFSRpo11XttO0w5aI/oOIB+
         TIuXU9gUhW0hr6BRmYLyh+NfwbfrifZu0s4p2Mo+eyDdnaSKkHAvNYqSlQ2e6YyY6IBU
         gKZEqQ0W71bn9tO7tpn+HTpJNswsIGR7AwFXXF7qcdq/rCZ7ioykaczY1MQYbhrT6GVQ
         X6PpzHP8o9pOMtI7nKbBecfIo3Jeqtc3NePYcJgRi+H5eUy02m+26KF7qw8w6O4s0gzh
         nttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HbYqrVFsYIhaVbSI+v3JJKYq2b1ECj8tkHaMf+xMlsI=;
        b=enI+o7OBo5+PhAx4XNtMzWlDCIDKsOjo73NpIOTFzSkc1cipWg8FqrYqSpRCR/ZC7v
         hq9jAufjdqxKvwKN/DavehI0CBbdkMwevHc6PJSwZTehF6Strz+D8aVxD9LvwilV8F6y
         4zdeLb7vgTLmhURWXh7nSOZma0C0YT5KYG5ac66DIj9GB978Ypo14G/X4Q6dHhIyeyQk
         ZvyhR35lTAg3OtGoJrMft+y696A/a4YO3VuPW8bqz6xZyGurCzcZSPj4zAY6ZC8BSXoG
         xrJfR+5/70RJjg/dtgfokIImLUCR5ODLfKHS4g6SDRevLuqtSomwWf6l1VJZr2NMMeT5
         Ea5A==
X-Gm-Message-State: AOAM530cUQvO0wbRy8w6yGX6fgV+GwBWmO10VLV21Z9SfQM7kLTobYFi
        fiDNCzWlDZZ1twc8KbtNj7Y=
X-Google-Smtp-Source: ABdhPJxKFcr+ipoa11/lgM798uRzRP6bW0Rd/Q5PhU3Y8mm1RWGziASul+F3S+vsChMQ8CpWm1BRGw==
X-Received: by 2002:a4a:970f:: with SMTP id u15mr448939ooi.83.1624933205343;
        Mon, 28 Jun 2021 19:20:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c64sm3609936oif.30.2021.06.28.19.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 19:20:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Ainux Wang <ainux.wang@gmail.com>
Cc:     jdelvare@suse.com, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        teng sterling <sterlingteng@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Huacai Chen <chenhuacai@loongson.cn>
References: <20210623005426.15731-1-ainux.wang@gmail.com>
 <20210624131752.GA2788536@roeck-us.net>
 <CAPWE4_xsY0ZAwm5g=Ujm_63WiS-sYMV42cpMD=cr65QNWLZaGQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5] hwmon: (pmbus) Add support for MPS MP2949A
Message-ID: <a55cde2b-ce51-fc7c-6b73-e4394d584ee4@roeck-us.net>
Date:   Mon, 28 Jun 2021 19:20:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAPWE4_xsY0ZAwm5g=Ujm_63WiS-sYMV42cpMD=cr65QNWLZaGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/28/21 6:26 PM, Ainux Wang wrote:
> On Thu, 24 Jun 2021 at 21:17, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Wed, Jun 23, 2021 at 08:54:26AM +0800, ainux.wang@gmail.com wrote:
>>> From: "Ainux.Wang" <ainux.wang@gmail.com>
>>>
>>> Add support for MP2949A device from Monolithic Power Systems, Inc. (MPS).
>>> This is a triple-loop, digital, multi-phase controller.
>>> This device:
>>> - Supports up to three power rail.
>>> - Provides 6 pulse-width modulations (PWMs), and can be configured up
>>>    to 6-phase operation for Rail A , up to 2-phase operation for Rail B
>>>    and up to 1-phase operation for Rail C.
>>> - The PMBus registers are distributed into three pages: Page 0, Page 1,
>>>    Page 2. Page 0 contains the registers for Rail A and most of the common
>>>    settings for all of the rails. Page 1 contains register information for
>>>    Rail B. Page 2 contains register information for Rail C.
>>> - The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 and
>>>    IMVP9.
>>>
>>> Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
>>> ---
>>> v5:
>>> - Moved change log to right here.
>>> v4:
>>> - Removed mp2949a_read_byte_data().
>>
>> Your other question left me confused. I had previously asked to provide
>> a rationale for filtering out the PMBUS_VOUT_MODE command, and I had
>> stated that "the chip does not support it" is not a valid reason. However,
>> "the chip does not support it but does not report an error when reading
>> it" _is_ a valid reason. So what happens when the PMBus core reads
>> PMBUS_VOUT_MODE ? Does the chip return an error, or some random data ?
>>
>> Thanks,
>> Guenter
>>
> Hi, Guenter
> 
> I have not been clear about the cause of this problem that
> "the chip does not support it is not a valid reason".
> 
> However, i have added some "printk", i found the chip will return some
> random data,
> when the PMbus core reads PMBUS_STATUS and PMBUS_VOUT_MODE.
> 
> So, I do not known what should i do, when the PMbus core reads PMBUS_STATUS.
> and i have knwon that use "This chip do not support the VOUT_MODE command,
> the chip does not support it but return some random data when reading
> " instead of
> "
>                 /*
>                  * This chip do not support the VOUT_MODE command.
>                  * There is not VOUT_MODE command in MP2949A datasheet P29~P31.
>                  * So this is EINVAL in here.
>                 */
> "
> Now, there is only one question left, what should the PMbus do, the
> chip return random data,
> when it reads PMBUS_STATUS by i2c_smbus_read_word_data() or
> i2c_smbus_read_byte_data()?
> Can the PMbus core use  pmbus_read_status_byte() and
> pmbus_read_status_word() instead of
> i2c_smbus_read_byte_data() and i2c_smbus_read_word_data() ?
> 

The driver should implement a read_byte_data() function and either
simulate PMBUS_VOUT_MODE and let it return whatever makes sense for
the driver, or have it return -EINVAL.

For the status register, handling is a bit more difficult. For this, we will
need an introductory patch. That patch needs to change pmbus_init_common()
to call pmbus_read_status_word() and pmbus_read_status_byte() instead
of i2c_smbus_read_word_data() and i2c_smbus_read_byte_data() (with page set
to -1).
The driver patch then needs to implement a read_word_data() function and
have it simulate the PMBUS_STATUS_WORD command. Or, alternatively,
have the read_word_data() function return -EINVAL for PMBUS_STATUS_WORD,
and simulate PMBUS_STATUS_BYTE in the read_byte_data callback.

Thanks,
Guenter
