Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CF0C49EA3
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jun 2021 13:38:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EF6461C76
	for <linux-hwmon@archiver.kernel.org>; Mon, 28 Jun 2021 13:38:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232020AbhF1Nkd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Jun 2021 09:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhF1Nkb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Jun 2021 09:40:31 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79BABC061760;
        Mon, 28 Jun 2021 06:38:05 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id m6-20020a9d1d060000b029044e2d8e855eso16818683otm.8;
        Mon, 28 Jun 2021 06:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=F30OYgj4+7iLgE99N29gEH1Jv/S/6a8BaZUKqUSALnI=;
        b=r40PAfHYALp0nwUfk8aAp58hHepkPrHFBMJe0DxnkAEB5XQEfCA1327gh8CRcHabQv
         Jg7c7OAmbEQEyiUKwacKiDPL8mg3XIhJD//d9yHzdEuVLXkEa3ilr+Xclg1ny15QwRMg
         3wlKTfWza0Iwj6762/I8WS84vpCPl9At79qop0UXgnuC45S8S6Z5WbTbZhv+5DObQaMF
         CSpw5BGy41WD6GLKgUqQuTQKLdgDfTtN8n1glE8czUx1wQ3jqkmc18Pl5cj6MnGjcgoT
         5zO5S+MG/QD8mEtSUWd8OKoI1pmuYmY/Lcf6QKbJ+hYZHZK2nsIsmt5WND5H4Q8xgUqU
         kJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F30OYgj4+7iLgE99N29gEH1Jv/S/6a8BaZUKqUSALnI=;
        b=rJB1gVCayDn6IvSgUcJw+ZSQ1zTjEIHC9MAtk3zpXoAjDg3cFp0Uytnaf7WYJRpxOZ
         JpHa/6VjBqRUsdvvEUDj+AOD/fShaTWcIWky8MwCWu8VXg0co7bG4Pzl7GV8RJNuzJe4
         Hndv03ByN8IshRDFqyt9sksHumCABnklkDsfJn/sBc+d2yffFTCq8rnlyUM9/PoHExQ7
         1RlPYb5oTUuUzuEnDJJp57AjQPO9aZueH/Hj+qjRGqO2HIUKCc3oxIt8bLdUQ17u3QfU
         L0AQVrG1e+uZ+5FRtwmqsKAlfIynUORHPg2vnFrlEwqgxRZSNGCusdC+WlD/kwvVb9Ne
         0zbA==
X-Gm-Message-State: AOAM533nYSCc6hM0+LiLYsQzcngSHzUmcAsAuIJ15t3/U5/jmTPBmDPJ
        WLPzFkbnkjuxXZEkSsoJ3hlbCRj15Cc=
X-Google-Smtp-Source: ABdhPJyXkYegyDC3cV8IirzPMSKGmD6w6CysQu36wb5uVoj7c9C8NxSaXbpjh3P9W2de3c9lUd/TtA==
X-Received: by 2002:a05:6830:244c:: with SMTP id x12mr16421143otr.24.1624887484884;
        Mon, 28 Jun 2021 06:38:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s12sm3091507otd.73.2021.06.28.06.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 06:38:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v5] hwmon: (pmbus) Add support for MPS MP2949A
From:   Guenter Roeck <linux@roeck-us.net>
To:     ainux.wang@gmail.com
Cc:     jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, sterlingteng@gmail.com,
        chenhuacai@kernel.org, chenhuacai@loongson.cn
References: <20210623005426.15731-1-ainux.wang@gmail.com>
 <20210624131752.GA2788536@roeck-us.net>
Message-ID: <08c6376e-2825-52db-9033-6e590fcb9b1a@roeck-us.net>
Date:   Mon, 28 Jun 2021 06:38:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210624131752.GA2788536@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/24/21 6:17 AM, Guenter Roeck wrote:
> On Wed, Jun 23, 2021 at 08:54:26AM +0800, ainux.wang@gmail.com wrote:
>> From: "Ainux.Wang" <ainux.wang@gmail.com>
>>
>> Add support for MP2949A device from Monolithic Power Systems, Inc. (MPS).
>> This is a triple-loop, digital, multi-phase controller.
>> This device:
>> - Supports up to three power rail.
>> - Provides 6 pulse-width modulations (PWMs), and can be configured up
>>    to 6-phase operation for Rail A , up to 2-phase operation for Rail B
>>    and up to 1-phase operation for Rail C.
>> - The PMBus registers are distributed into three pages: Page 0, Page 1,
>>    Page 2. Page 0 contains the registers for Rail A and most of the common
>>    settings for all of the rails. Page 1 contains register information for
>>    Rail B. Page 2 contains register information for Rail C.
>> - The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 and
>>    IMVP9.
>>
>> Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
>> ---
>> v5:
>> - Moved change log to right here.
>> v4:
>> - Removed mp2949a_read_byte_data().
> 
> Your other question left me confused. I had previously asked to provide
> a rationale for filtering out the PMBUS_VOUT_MODE command, and I had
> stated that "the chip does not support it" is not a valid reason. However,
> "the chip does not support it but does not report an error when reading
> it" _is_ a valid reason. So what happens when the PMBus core reads
> PMBUS_VOUT_MODE ? Does the chip return an error, or some random data ?
> 

Still waiting for a reply.

Guenter

