Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFAAC433DB
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Mar 2021 07:49:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D9A764F80
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Mar 2021 07:49:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231423AbhCLHso (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 12 Mar 2021 02:48:44 -0500
Received: from mx3.molgen.mpg.de ([141.14.17.11]:58573 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231462AbhCLHsb (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Mar 2021 02:48:31 -0500
Received: from [192.168.0.2] (ip5f5aeac2.dynamic.kabel-deutschland.de [95.90.234.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 56E1020645D7E;
        Fri, 12 Mar 2021 08:48:24 +0100 (CET)
Subject: Re: [PATCH] hwmon: (lm90) Fix false alarm when writing convrate on
 max6658
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Guohan Lu <lguohan@gmail.com>, Boyang Yu <byu@arista.com>
References: <20210304153832.19275-1-pmenzel@molgen.mpg.de>
 <20210311221556.GA38026@roeck-us.net>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <9243482c-0a34-d6d1-1955-bee00a75554f@molgen.mpg.de>
Date:   Fri, 12 Mar 2021 08:48:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311221556.GA38026@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dear Guenter,


Thank you for your reply.

Am 11.03.21 um 23:15 schrieb Guenter Roeck:
> On Thu, Mar 04, 2021 at 04:38:32PM +0100, Paul Menzel wrote:
>> From: Boyang Yu <byu@arista.com>
>>
>> We found that the max6658 sometimes issues a false alarm when its
>> convrate is changed, with the current hwmon driver. This workaround
>> will fix it by stopping the conversion before setting the convrate.
>>
>> Upstream the patch added added to the SONiC Linux kernel in merge/pull
>> request #82 [1][2].
>>
>> [1]: https://github.com/Azure/sonic-linux-kernel/pull/82
>> [2]: https://github.com/Azure/sonic-linux-kernel/commit/d03f6167f64b2bfa1330ff7b33fe217f68ab7028
>>
>> [pmenzel: Forward port patch from 4.19 to 5.12-rc1+]
>> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
>> ---
>>   drivers/hwmon/lm90.c | 15 ++++++++++++---
>>   1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>> index ebbfd5f352c0..0c1a91b715e8 100644
>> --- a/drivers/hwmon/lm90.c
>> +++ b/drivers/hwmon/lm90.c
>> @@ -639,7 +639,11 @@ static int lm90_set_convrate(struct i2c_client *client, struct lm90_data *data,
>>   		if (interval >= update_interval * 3 / 4)
>>   			break;
>>   
>> -	err = lm90_write_convrate(data, i);
>> +	if (data->kind == max6657)
>> +		err = max6657_write_convrate(client, i);
> 
> There is no such function in the upstream kernel.

Hmm, why did that hunk get lost when preparing the patch? I am sorry for 
this oversight.

> Anyway, this problem has already been already fixed
> in the upstream kernel with commit 62456189f3292 ("hwmon:
> (lm90) Fix max6658 sporadic wrong temperature reading").

Ah, indeed. Thank you for pointing that out. It’d be great to have that 
included in the 4.19 LTS series. Would it be alright, if I contacted the 
stable series maintainers?


Kind regards,

Paul


>> +	else
>> +		err = lm90_write_convrate(data, i);
>> +
>>   	data->update_interval = DIV_ROUND_CLOSEST(update_interval, 64);
>>   	return err;
>>   }
>> @@ -1649,7 +1653,11 @@ static void lm90_restore_conf(void *_data)
>>   	struct i2c_client *client = data->client;
>>   
>>   	/* Restore initial configuration */
>> -	lm90_write_convrate(data, data->convrate_orig);
>> +	if (data->kind == max6657)
>> +		max6657_write_convrate(client, data->convrate_orig);
>> +	else
>> +		lm90_write_convrate(data, data->convrate_orig);
>> +
>>   	i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1,
>>   				  data->config_orig);
>>   }
>> @@ -1672,7 +1680,8 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
>>   	data->config_orig = config;
>>   	data->config = config;
>>   
>> -	lm90_set_convrate(client, data, 500); /* 500ms; 2Hz conversion rate */
>> +	if (data->kind != max6657)
>> +		lm90_set_convrate(client, data, 500); /* 500ms; 2Hz conversion rate */
>>   
>>   	/* Check Temperature Range Select */
>>   	if (data->kind == adt7461 || data->kind == tmp451) {
