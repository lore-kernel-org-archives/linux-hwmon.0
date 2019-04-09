Return-Path: <SRS0=FEvN=SL=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550A9C10F0E
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 13:21:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 248AA2084C
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Apr 2019 13:21:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fod4DOWY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfDINVp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Apr 2019 09:21:45 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35096 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbfDINVp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Apr 2019 09:21:45 -0400
Received: by mail-pf1-f193.google.com with SMTP id t21so7395590pfh.2
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Apr 2019 06:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Dv7/OQRFxVUE3h7R11e1M6anr+UogBLyE8rGucpjppo=;
        b=fod4DOWYuZjktyPhywfCqgwd1qTyT5DAv9q9pNmyYCQ0geWx1rr7XLyAqWKL3Wz+wX
         y61n2WBXyNZpMvVnjxNfahMs81/qhj0w360BMqjQetA7Rp9qVYSM46IIO+F0pQ03IUMT
         WAfvlT3akMgNFFP6C33N3zlfb4CWV/StK9d8R7HMztyEqS5KGSxFE39DqYU0mS6VN9a6
         N1tFMBWgzbIPqDAVU8CLI3PRfqVfwUG3kU/QboGS+VtaL4DSpNUVBF+7jsvNzXk46npC
         8hRtKiAoiSBSszUJ8iaJppLIgIM+AZDatoTAmFerSr9YrgpaGUGv5YyHxeRDrizsEff4
         Heyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dv7/OQRFxVUE3h7R11e1M6anr+UogBLyE8rGucpjppo=;
        b=ZLIFtps73NUt61mgiDNMQmmy3HWVoHmGlRPPhLEwgfGdpQdx8AZrbLRAP7QcqGzc/4
         e62DiPA+yEPqRliifPNy2tQy3JPR+u2a/bvrlmcO/h/6w57R2tLVz68jGlA5gVnelm1T
         082hqmYhTCCG3zqxtVKECKCB1/Y1qSfvsKtNX7DwWTl+d+1F83TkegzaAACIXpk6XOxD
         3v9mOA1b1UFKaHE9e5yJE8fL0SyrRVYlbQ4zuRzXS02JH3mjH8Ll4vwVPsZXOB0GUL0b
         4/DNUtc8ovWBcg70Vs60+Bq0dbwFMl2VPRZTzRAdojhHA6mGgg8urWxbVEROlrD5KOF3
         q0iw==
X-Gm-Message-State: APjAAAUureKPtp0zKE6Rx7K1qe0qdOVz3Q+M+XPY2zUGoKA+LCOK2Wy8
        59+myxdTJw9jV2kqvwLwW17P8pB0
X-Google-Smtp-Source: APXvYqwtJBQEmcng3LxgqHZsfV3Qn21nAY4/fq4dKlM+X8837lJfIDZl40aQ5xNp6UHyKsWkP3xFKA==
X-Received: by 2002:a65:5343:: with SMTP id w3mr34499669pgr.232.1554816104463;
        Tue, 09 Apr 2019 06:21:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 17sm77776519pfw.65.2019.04.09.06.21.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Apr 2019 06:21:43 -0700 (PDT)
Subject: Re: pmbus based power regulator
To:     Michal Simek <michal.simek@xilinx.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
References: <b1a69448-66bd-6760-21c6-239ef2afecdf@xilinx.com>
 <4d186966-887b-74d8-a00d-e1e4ec10ecd6@roeck-us.net>
 <b0914632-7b18-5aee-22bf-edbe1c7a6a18@xilinx.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <848934f6-e3b7-a263-8f2b-a3f5add28ebd@roeck-us.net>
Date:   Tue, 9 Apr 2019 06:21:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <b0914632-7b18-5aee-22bf-edbe1c7a6a18@xilinx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/9/19 6:07 AM, Michal Simek wrote:
> On 09. 04. 19 15:05, Guenter Roeck wrote:
>> On 4/9/19 5:56 AM, Michal Simek wrote:
>>> Hi,
>>>
>>> I have one question about hwmon/pmbus. I have tps544b25 on the board. I
>>> have enabled this chip via DT to get probed. Patch below.
>>>
>>> I can't see any issue with monitoring but I am curious how to enable
>>> setting up voltage. I expect this should be moved to regulator folder or
>>> better split done as MFD device.
>>>
>>> I see there wm831x-hwmon and also wm8350-hwmon but nothing with pmbus
>>> wiring.
>>> Can you please suggest a way how this should be done?
>>>
>>> Thanks,
>>> Michal
>>>
>>> commit 0aeba3b5a67eee06d3afe67c71e45a47e8e00f8d
>>> Author:     Michal Simek <michal.simek@xilinx.com>
>>> AuthorDate: Mon Mar 4 13:51:05 2019 +0100
>>> Commit:     Michal Simek <michal.simek@xilinx.com>
>>> CommitDate: Thu Mar 28 15:32:03 2019 +0100
>>>
>>>       hwmon: pmbus: Add DT wiring for ti,tps544b25
>>>
>>>       This should be enough for DT wiring to get generic functionality.
>>>
>>>       Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>>
>>> diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
>>> index 7718e58dbda5..be00cd144a2b 100644
>>> --- a/drivers/hwmon/pmbus/pmbus.c
>>> +++ b/drivers/hwmon/pmbus/pmbus.c
>>> @@ -220,10 +220,17 @@ static int pmbus_probe(struct i2c_client *client,
>>>
>>>    MODULE_DEVICE_TABLE(i2c, pmbus_id);
>>>
>>> +static const struct of_device_id pmbus_of_match[] = {
>>> +        {.compatible = "ti,tps544b25"},
>>> +        {}
>>> +};
>>> +MODULE_DEVICE_TABLE(of, pmbus_of_match);
>>> +
>>>    /* This is the driver that will be inserted */
>>>    static struct i2c_driver pmbus_driver = {
>>>           .driver = {
>>>                      .name = "pmbus",
>>> +                  .of_match_table = of_match_ptr(pmbus_of_match),
>>>                      },
>>>           .probe = pmbus_probe,
>>>           .remove = pmbus_do_remove,
>>>
>>
> 
> no response?
> 

fat finger. Sorry.

Guenter

