Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67124C433FE
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Nov 2022 11:38:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbiKULir (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Nov 2022 06:38:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231368AbiKULi1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Nov 2022 06:38:27 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5427BB4F1E
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Nov 2022 03:35:56 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id q71so10887817pgq.8
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Nov 2022 03:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xj4ShWl/W6XVIrTFJyttrtRVjDkB/tCBxscsEA35xfM=;
        b=gvWoNr1fwq/GUbik/QuidrVz4liXQjaKTzSjbFKmyCwMSFIYCRoBZUUz0jp6z9yzPU
         Y1W7ZFYULSZFlakApy0IW3u9W28KWwyk35CpgnmJ9nD1ZYVJK8XXawNvuPSG1Dw0D5r7
         UT5V+3rUB1zB2sa4qIYMgoq6MpYR/sSAIwZtA/WBfkvc0/yJaob6TPrK9tet0Fh1qOlp
         VtQEcbS/e6YgeHVNLgbdWQbc0K2xi9DS0LdUVSC1Cy9CFx34AWJkcoQjfVe8op5oFQPF
         EcXKDdkIGPXIGwZP1vlCAxsl1wfysYkfrhKceQrnPxTzNUsQw4ZxRxKxhhOQOU8HLs+/
         370A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xj4ShWl/W6XVIrTFJyttrtRVjDkB/tCBxscsEA35xfM=;
        b=NGPs/As8FaJbW0/1imf2Zvx0QxQhWk3F26y0VgvFTdMnBH2+h4nNjFUNypo3rEKoZm
         5j774hKuHeSNMAUSgAqUM+S94/0GJbDN/CDm5Tf5kK7HlKF6pypDD3Cjp8j1U7bBBwq1
         mWgqGC8gUh/z+NyAe0eWrwviHXPfaJH2TUR/e6myDl3G1uva+eQ8Tl0brv16bBMpBhhF
         Gb5+feP+BsVlE3tiu/QMVoHE/fqF5XaXRyf4oZDjLgeXZt80s6WNzkhEqmw5Diuygoz4
         l5FpBfY1ndAtfNTxnMHAmD8pyPrZQD2OA80BSBuUR6Aup4FyPnniWjlLWIK/EYoinO4D
         4e+Q==
X-Gm-Message-State: ANoB5pnP08P5ubr1w3Fd+Cj1EffQg6rMnJ8smvuRgDokswRfNHbPvUtn
        NvzHRJfX725yBOh5uFyyrcaanqK5SbA2gA==
X-Google-Smtp-Source: AA0mqf4ONuYy9VuHFONHH5wUXiH+6i3Vv0pKNb3mo2qL0th24zSzflLF4iBl57omeNZlzULBBub5Yw==
X-Received: by 2002:a05:6a00:1a88:b0:562:bcf8:7b35 with SMTP id e8-20020a056a001a8800b00562bcf87b35mr1584725pfv.52.1669030555753;
        Mon, 21 Nov 2022 03:35:55 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id f9-20020a17090a120900b00218722ecac2sm7979598pja.18.2022.11.21.03.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 03:35:55 -0800 (PST)
Message-ID: <71571dd9-65a8-4ccd-3fe5-88c22dd5b492@9elements.com>
Date:   Mon, 21 Nov 2022 17:05:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3] hwmon: (pmbus/core): Implement regulator get_status
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        broonie@kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-kernel@vger.kernel.org
References: <20221119182517.2334156-1-Naresh.Solanki@9elements.com>
 <20221120141432.GA1790249@roeck-us.net>
Content-Language: en-US
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <20221120141432.GA1790249@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On 20-11-2022 07:44 pm, Guenter Roeck wrote:
> On Sat, Nov 19, 2022 at 07:25:16PM +0100, Naresh Solanki wrote:
>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>>
>> Add get_status for pmbus_regulator_ops.
>>
>> Changes:
>> - use lock throughout the function
>> - Avoid line continuation upto 100 column
>> - Optimize use of & and | operator
>> - Check for VOUT, IOUT, TEMPERATURE bit in status word before checking
>>    respective status register for fault.
>> - Report regulator current status.
>>
> Change log should be after '---'
Sure
> 
> Also, when looking into this, I realized that we already have
> pmbus_regulator_get_error_flags() which has somewhat overlapping
> functionality. Would it be possible to utilize that function to get
> the error status instead of more or less hand-coding it ?
Sure. But looking at get_status scope, I feel that we are already 
checking the following:
1. Check if regulator is off & yes then return off
2. If not off then it should be on & has power good then return on
3. If no power good then this itself is error condition so return error. 
Decoding status register for fault just double confirms that & may not 
be needed in get_status unless we are going to print or utilize the 
error bit information in some other way but that is out of scope of 
get_status call unless I missed something.

Does this approach makes sense ?
> 
> Thanks,
> Guenter
