Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EF3C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Dec 2021 06:14:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239263AbhLVGOH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 22 Dec 2021 01:14:07 -0500
Received: from out1.migadu.com ([91.121.223.63]:36310 "EHLO out1.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239241AbhLVGOG (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Dec 2021 01:14:06 -0500
Subject: Re: [PATCH 1/5] hwmon: (corsair-cpro) Use devres function
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1640153645;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=onT/D9t8fWQePQSwMqVBaTMnqS5PItTpnPuANW2w+Gk=;
        b=eBhK31wIqKP4DsaZuL1jgk6/RYWcmj85YGP6FgmY3qd8YvACXiZWAmmW9XOMwp1jFoFxgb
        O45phsAPCYTBuURh633FpBuplLcwJFhMC73WBPiwLlu8f8IFwbQJmcUNVQ9cRC1nXly6qV
        zfwDdemv9dPByB4hXuHNymHP/mSB0B0=
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20211222020114.3524736-1-liu.yun@linux.dev>
 <b2797eb5-e87a-918a-2232-8be943bcac69@roeck-us.net>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Jackie Liu <liu.yun@linux.dev>
Message-ID: <6ad836b9-519c-0095-879f-20393e8d2e17@linux.dev>
Date:   Wed, 22 Dec 2021 14:13:56 +0800
MIME-Version: 1.0
In-Reply-To: <b2797eb5-e87a-918a-2232-8be943bcac69@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



在 2021/12/22 上午10:58, Guenter Roeck 写道:
> On 12/21/21 6:01 PM, Jackie Liu wrote:
>> From: Jackie Liu <liuyun01@kylinos.cn>
>>
>> Use devm_hwmon_device_register_with_info() and remove hwmon_dev
>> from ccp_device struct as it is not needed anymore.
>>
>> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
>> ---
>>   drivers/hwmon/corsair-cpro.c | 15 ++++++---------
>>   1 file changed, 6 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
>> index fa6aa4fc8b52..f476367ba6cf 100644
>> --- a/drivers/hwmon/corsair-cpro.c
>> +++ b/drivers/hwmon/corsair-cpro.c
>> @@ -76,7 +76,6 @@
>>   struct ccp_device {
>>       struct hid_device *hdev;
>> -    struct device *hwmon_dev;
>>       struct completion wait_input_report;
>>       struct mutex mutex; /* whenever buffer is used, lock before 
>> send_usb_cmd */
>>       u8 *buffer;
>> @@ -486,6 +485,7 @@ static int get_temp_cnct(struct ccp_device *ccp)
>>   static int ccp_probe(struct hid_device *hdev, const struct 
>> hid_device_id *id)
>>   {
>>       struct ccp_device *ccp;
>> +    struct device *hwmon_dev;
>>       int ret;
>>       ccp = devm_kzalloc(&hdev->dev, sizeof(*ccp), GFP_KERNEL);
>> @@ -523,12 +523,12 @@ static int ccp_probe(struct hid_device *hdev, 
>> const struct hid_device_id *id)
>>       ret = get_fan_cnct(ccp);
>>       if (ret)
>>           goto out_hw_close;
>> -    ccp->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, 
>> "corsaircpro",
>> -                             ccp, &ccp_chip_info, 0);
>> -    if (IS_ERR(ccp->hwmon_dev)) {
>> -        ret = PTR_ERR(ccp->hwmon_dev);
>> +    hwmon_dev =
>> +        devm_hwmon_device_register_with_info(&hdev->dev, "corsaircpro",
>> +                             ccp, &ccp_chip_info, 0);
>> +    ret = PTR_ERR_OR_ZERO(hwmon_dev);
>> +    if (ret)
>>           goto out_hw_close;
>> -    }
>>       return 0;
>> @@ -541,9 +541,6 @@ static int ccp_probe(struct hid_device *hdev, 
>> const struct hid_device_id *id)
>>   static void ccp_remove(struct hid_device *hdev)
>>   {
>> -    struct ccp_device *ccp = hid_get_drvdata(hdev);
>> -
>> -    hwmon_device_unregister(ccp->hwmon_dev);
>>       hid_hw_close(hdev);
>>       hid_hw_stop(hdev);
> 
> The point is that the above two functions need to be called _after_ the 
> hwmon device
> was removed. This patch changes the order and removes the hwmon device 
> after the hid
> functions have been removed.
> 
> If you think this is valid you'll need to explain in detail why removal 
> order
> does not matter. Otherwise this patch deserves a NACK.
> 
> Guenter
> 
> 

Hi Guenter

After adjusting the order here, there will be a small window for sysfs 
to continue to provide services. However, because hid has been
disconnected, the read and write interfaces will not get the actual data 
and returned by timeout. IMO this is not a big issue, but it's okay to 
not change it.

--
BR, Jackie Liu
