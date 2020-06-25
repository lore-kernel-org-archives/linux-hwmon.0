Return-Path: <SRS0=Zrk+=AG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F68C433E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Jun 2020 16:22:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A24B20857
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Jun 2020 16:22:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dg/HIKbO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390588AbgFYQWO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 25 Jun 2020 12:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389693AbgFYQWN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 Jun 2020 12:22:13 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96C4FC08C5C1
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2020 09:22:13 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id ev7so2742961pjb.2
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2020 09:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E03tn1LByaT6bBmSHZ1E1Q5eArZ7NQ4XHRoMUZ+DD1A=;
        b=dg/HIKbO3SAevcrc0Gy7WKokTVcBVYEL7ELhaSQ1HsqhkqpJ+Xy5NBraQ/0XPRkwbS
         U2dhYKMqJ/9xFyelvsDXPrWcNIME8aE6n2wVVBVSCXX+a/Xh9N9IIMiB+pngNnADY0hz
         HD16zNeInsgnmPXPdgBG3RpMcNgjYts8U8RENBlWAfXH9jf0CTOCJvhZASA5jSnGAgBG
         QxDT9F5KLlvPgmPfU0MlkqAIn0tgc+lK5adC3m5NyzCvvLnZj5xKgH8SqqKvITNB2yqt
         mMytmaPrOco3Z9MqB4s2x8Bn/+4hEuamcAeoFYrXMDxA2CRGGSyrzNhzWe9m87reFXkv
         FuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=E03tn1LByaT6bBmSHZ1E1Q5eArZ7NQ4XHRoMUZ+DD1A=;
        b=s3rGo6ElO9gyy5IdkhXGlxlyu+CeY3u4NAWnNdU7ZL71L2pfKemMbY8YWOhvHAcO6f
         1C3+mgUO9w/gBcudO2Y5x+DfDW5djpiy6MZJFokWCRGBTf8xu/0pcQmyZMhAdMbDrAr3
         sv1WlP7WFtvXHjZ8ea1hH9JxaxBpnwAyd1lrFMcBd2kbblS6cbeBXyGAcaP54q5PTgx+
         AL/IQOwvpCAyNbL33E25JEVuqeErqVkxBq/jZl2eL31AoBybTzuEsOkRMQoAoSkHtfVZ
         yqtEwjSgh47negdk0HX7sfRpZ1kDMy22u4/2aIrT8WtVpCyotAwGpz0Eb/WOFavHgoj+
         kYkA==
X-Gm-Message-State: AOAM530hTgWjRS51lMdKCjze70nf9srgGWP6/Y56XwE5ESpzDwOszo0L
        IVLi/W8itZkP1k/+zth+6bpEO8L8
X-Google-Smtp-Source: ABdhPJz7U4U1V+ilbtvtHjSTAy+4TJUMYK1MunORq1nmeR1rIa91muYcCHSp6wJmmLF2cNCWGN9uAw==
X-Received: by 2002:a17:90a:304:: with SMTP id 4mr3980834pje.219.1593102132757;
        Thu, 25 Jun 2020 09:22:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v7sm22723816pfn.147.2020.06.25.09.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2020 09:22:12 -0700 (PDT)
Subject: Re: [PATCH] hwmon: nct6775: Add missing voltage input on NCT6796D
To:     Henk <henk.vergonet@gmail.com>, linux-hwmon@vger.kernel.org
References: <CAMFK4TOcpoLPxmbEJxhPHQOQ8B+mQ5EWge-jqKXBRhFcXMCR1w@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <382827a7-4b49-3323-d0e4-f7eabb3898e9@roeck-us.net>
Date:   Thu, 25 Jun 2020 09:22:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAMFK4TOcpoLPxmbEJxhPHQOQ8B+mQ5EWge-jqKXBRhFcXMCR1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/25/20 9:10 AM, Henk wrote:
> Add missing voltage input on NCT6796D
> 
>>From the datasheet: the NCT6796D has 16 voltage readings.
> Source: NCT6796D_Datasheet_V0_6.pdf page 59-60
> 
> This patch adds support for in15 on the NCT6796D.
> 
> Signed-off-by: Henk Vergonet <henk.vergont@gmail.com>
> 
> Patch:
> https://github.com/torvalds/linux/commit/8ebb8a5d1d02d60a098cdf0bb576f810f307d9df
> 

Please read and follow Documentation/process/submitting-patches.rst.

Thanks,
Guenter
