Return-Path: <SRS0=uXUr=SR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1C7C10F0E
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 13:38:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 09DED20825
	for <linux-hwmon@archiver.kernel.org>; Mon, 15 Apr 2019 13:38:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axOXiodD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbfDONiX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 15 Apr 2019 09:38:23 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38173 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbfDONiX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Apr 2019 09:38:23 -0400
Received: by mail-pg1-f194.google.com with SMTP id j26so8591331pgl.5
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Apr 2019 06:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Yg2395IEKQEaj8delVO1/x2vrs7iUjb7Imfv8GQjfXY=;
        b=axOXiodDLAeRA0cpaHWRn7pSWIKKHOYb6sJ9+12ow//jBCI7axKla3XPlxQScOrRik
         svcSG1UZK+XNP25dxknOhQ61/CfB5UySqyKLWaYonkwkU9K6X4WTJsFjhJIhLLpAx62K
         +e+kOIcpYdXqx/EpDwbotoMmTcZ0kc8y7tGCc9YVaglkgwgNKh9OdGSGBudNznvki5BN
         ecGsiaGy1ekgPpymZdUEkBzxpSKrcvMvII92BWHhLZrLUWmZ3mweyLDrxrQUaL2BfZ/E
         xEHJ4SH47s0gUu+XxOYhxm92A9XQFN3YCrbr6M1yyzDOkIvSwz6IA/GSQunzwflhkuPL
         z9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yg2395IEKQEaj8delVO1/x2vrs7iUjb7Imfv8GQjfXY=;
        b=DVE1KJ9+iMngs+iWJXIKrEcSgWSxv7HIHHat/binjF+D0fcgt+2kGcBqlZ5BH/zdwL
         j6U1zb0ZeSafFEEe9NTOGR8S7pbDBBy34jb6Bn1KReKXHIiBRfr5iKFhhBvdgd9LEH9t
         8w01NkUyfzDbfYaksD3ZYOUzn1XI5E4KfDizdcPpkl1PX/OflUqHWjb1uCfz4bdNW5kG
         iCeYQ4gDt+NHMxrf/UvdY8akUdGG6rDDtfbgkCJ2+rM8yUg72lBCvoeZoj29naNdoKi+
         wQmCUiFZPglUWiulaBCCjk+l7p9do+aoij4Hyo0FsNZIngfWu+f8U5IASMayKtBnrD6H
         /LoA==
X-Gm-Message-State: APjAAAVUSXpp5jTRxXXMmDOdkrkdK6HKKQssXCHFXhL+mexGWfso67zf
        H37mGeMo4QnJdTi79iQ5rmUM9Gnt
X-Google-Smtp-Source: APXvYqzToe/5O0ArZSSI2dXuZ4i3G1VsCxD5lOcqkNVTvC0a/ic0fa1rNO2TsyyXMVMx0OS6N8FGbw==
X-Received: by 2002:a63:4b21:: with SMTP id y33mr71113867pga.37.1555335502901;
        Mon, 15 Apr 2019 06:38:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d68sm75735951pfg.16.2019.04.15.06.38.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Apr 2019 06:38:22 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (pmbus_core) Replace S_<PERMS> with octal values
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
References: <1555279044-25139-1-git-send-email-linux@roeck-us.net>
 <20190414222253.GA18461@localhost.localdomain>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <ce5736c1-62f5-3819-967e-f971b27ba91d@roeck-us.net>
Date:   Mon, 15 Apr 2019 06:38:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190414222253.GA18461@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/14/19 3:22 PM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> On Sun, Apr 14, 2019 at 02:57:24PM -0700, Guenter Roeck wrote:
>> Replace S_<PERMS> with octal values.
>>
>> The conversion was done automatically with coccinelle. The semantic patches
>> and the scripts used to generate this commit log are available at
>> https://github.com/groeck/coccinelle-patches/hwmon/.
> 
> The URL is 404. blob/master/hwmon instead of just hwmon at the end would
> work.
> 
Thanks for noticing. Looks like github changed references since I wrote
the automated scripts. Oh well. I'll drop the hwmon part from all similar
patches.

>> This patch does not introduce functional changes. It was verified by
>> compiling the old and new files and comparing text and data sizes.
> 
> I don't think that the sizes would change even if there was some error
> introuced if it still compiles. But of course both the conccinele script
> is ok and I manually verified the patch. Also, git grep "\bS_" pmbus*
> does not return anything meaning all the places were converted.
> 

It may not catch all cases, that is correct, but it does help.

Guenter

>> Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> drivers/hwmon/pmbus/pmbus_core.c | 6 +++---
>> 1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index 2e2b5851139c..e2366428a9a9 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>> @@ -1073,7 +1073,7 @@ static int pmbus_add_boolean(struct pmbus_data *data,
>> 		 name, seq, type);
>> 	boolean->s1 = s1;
>> 	boolean->s2 = s2;
>> -	pmbus_attr_init(a, boolean->name, S_IRUGO, pmbus_show_boolean, NULL,
>> +	pmbus_attr_init(a, boolean->name, 0444, pmbus_show_boolean, NULL,
>> 			(reg << 16) | mask);
>>
>> 	return pmbus_add_attribute(data, &a->dev_attr.attr);
>> @@ -1107,7 +1107,7 @@ static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
>> 	sensor->update = update;
>> 	sensor->convert = convert;
>> 	pmbus_dev_attr_init(a, sensor->name,
>> -			    readonly ? S_IRUGO : S_IRUGO | S_IWUSR,
>> +			    readonly ? 0444 : 0644,
>> 			    pmbus_show_sensor, pmbus_set_sensor);
>>
>> 	if (pmbus_add_attribute(data, &a->attr))
>> @@ -1139,7 +1139,7 @@ static int pmbus_add_label(struct pmbus_data *data,
>> 		snprintf(label->label, sizeof(label->label), "%s%d", lstring,
>> 			 index);
>>
>> -	pmbus_dev_attr_init(a, label->name, S_IRUGO, pmbus_show_label, NULL);
>> +	pmbus_dev_attr_init(a, label->name, 0444, pmbus_show_label, NULL);
>> 	return pmbus_add_attribute(data, &a->attr);
>> }
>>
>> -- 
>> 2.7.4
>>
> 
> Krzysztof
> 

