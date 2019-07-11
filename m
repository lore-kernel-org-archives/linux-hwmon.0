Return-Path: <SRS0=3Vjf=VI=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0504AC74A46
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Jul 2019 06:29:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8345208E4
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Jul 2019 06:29:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2d00jxs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbfGKG3V (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Jul 2019 02:29:21 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41441 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbfGKG3V (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Jul 2019 02:29:21 -0400
Received: by mail-pl1-f195.google.com with SMTP id m9so2459813pls.8
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jul 2019 23:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gdnA0ZiThGm+U+yME01J5343DY2QC2yjwZB9j1iOYJY=;
        b=j2d00jxs43WGGI5dolPbtQACVUdMUR3DS7Cbe9m5EPe8nObR9QiorvNcahMpdChBUk
         fWXIke6EDPQjS0B/G7tkc5hsGCM6nCELlC0g2CBE487MW1x34p0yHh6/F+y+pVgrzuo0
         LqFbsS0dFw5Mc0XFMTHSq18f3LJnU3LCOdYoiH4mac5Tai856YOU5Sz34a9zzIlcZsbS
         Wkzb1mtN743+FbmR79pm9S4D/B4VX8vbJkt7GBdZDTRfkE3wpcgwgf1zKU3eGyqggXbS
         eIa+KJInH073Cio0ajGfZTYl/+xxY4jUCcABJ52WFT15Kj+eona74SVQ4KywHKe4TQdu
         J3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gdnA0ZiThGm+U+yME01J5343DY2QC2yjwZB9j1iOYJY=;
        b=UuY1QRFdcCOsAgFBXZmHvgrZYikmjpXvWr1kQx59eqw63+vp0oMef2Ms0nRV9pSo3v
         CttnRKG+smfQgp/e2gHDjyZ7wkDd7wFCxLcGMVFPB6/3tIgCGQ+L0qKHZ8EWp3ybUa4t
         s1RUdazNEFAG115dJtXsAazIC+4MPMbDr8A8QaRiKs8epWjZewEC07RzTYgN2B9zWZLw
         OyHCwGEOJwyS5cMR2/XrTlnzZ5oMqTrQd0fkE3cUZUFDhgG5mRLxmwpLisanARmr03Lk
         qmHFvOoaprsNsZI5PnUaOSFZw/XzI1SE2YrQPVytbRW+xYkHowXV/V0IGt6ECCdNgDZc
         hdYw==
X-Gm-Message-State: APjAAAUslaf3nnKe0ilBKLX/qoiQ4JxAcKW0S/FHmqXRReqZI1JRyrov
        zMjU7q46EdcZ02C8NDqIMoNZP/IB
X-Google-Smtp-Source: APXvYqzrWotrE+jowUROMBuemkqL+W2NnZkd3AEzcCYwySnFhk5g/7ZBZ4VsyeA6YN4kMPqN52iJwQ==
X-Received: by 2002:a17:902:b944:: with SMTP id h4mr2674288pls.179.1562826560359;
        Wed, 10 Jul 2019 23:29:20 -0700 (PDT)
Received: from [10.0.2.15] ([110.227.64.207])
        by smtp.gmail.com with ESMTPSA id l189sm4379942pfl.7.2019.07.10.23.29.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 23:29:19 -0700 (PDT)
Subject: Re: [PATCH] hwmon: ina3221.c: Add of_node_put() before return
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20190706132130.3129-1-nishkadg.linux@gmail.com>
 <20190708181633.GA15102@roeck-us.net>
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
Message-ID: <61a5ea30-9b9d-77c4-58b8-acb0c553e9e5@gmail.com>
Date:   Thu, 11 Jul 2019 11:59:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190708181633.GA15102@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 08/07/19 11:46 PM, Guenter Roeck wrote:
> On Sat, Jul 06, 2019 at 06:51:30PM +0530, Nishka Dasgupta wrote:
>> Each iteration of for_each_child_of_node puts the previous
>> node, but in the case of a return from the middle of the loop, there is
>> no put, thus causing a memory leak. Hence add an of_node_put before the
>> return.
>> Issue found with Coccinelle.
>>
>> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> 
> Applied. For future patches, please don't put source file extensions
> into the subject line.

I will keep that in mind, thank you.

Thanking you,
Nishka

> Thanks,
> Guenter
> 
>> ---
>>   drivers/hwmon/ina3221.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
>> index 55943b4dcc7b..0037e2bdacd6 100644
>> --- a/drivers/hwmon/ina3221.c
>> +++ b/drivers/hwmon/ina3221.c
>> @@ -713,8 +713,10 @@ static int ina3221_probe_from_dt(struct device *dev, struct ina3221_data *ina)
>>   
>>   	for_each_child_of_node(np, child) {
>>   		ret = ina3221_probe_child_from_dt(dev, child, ina);
>> -		if (ret)
>> +		if (ret) {
>> +			of_node_put(child);
>>   			return ret;
>> +		}
>>   	}
>>   
>>   	return 0;

