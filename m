Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD09C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Dec 2021 05:43:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232698AbhLVFnu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 22 Dec 2021 00:43:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232036AbhLVFnt (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Dec 2021 00:43:49 -0500
X-Greylist: delayed 13317 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 21 Dec 2021 21:43:48 PST
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 054BFC061574
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Dec 2021 21:43:48 -0800 (PST)
Subject: Re: [PATCH 5/5] hwmon: (drivetemp) Use devres function
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1640151826;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=64Df55kqVly/CHvvMT3evMYtuJpmteEXrO4/6lo/nVI=;
        b=LrHZdUjqXQ2npdvqsqrCscs1ZP5xJ+AyHdVoPBw5fE2FGUB75bEeZq94qtagNxMnmiYEnB
        Qr0sNTre4X7ZsFloGCWesbPDTKAXZNhUYxMPuvPZhcTUjMD+TuAPzg/6HZhA1klmfNUF8I
        hnsrjZqKvP6H4oHtP7NODCFVRsu7ukU=
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20211222020114.3524736-1-liu.yun@linux.dev>
 <20211222020114.3524736-5-liu.yun@linux.dev>
 <2b3dc236-ef80-6e89-11e0-e70141d6ff24@roeck-us.net>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Jackie Liu <liu.yun@linux.dev>
Message-ID: <7d56c395-1d8a-1f39-0507-e23b43d05e9a@linux.dev>
Date:   Wed, 22 Dec 2021 13:43:37 +0800
MIME-Version: 1.0
In-Reply-To: <2b3dc236-ef80-6e89-11e0-e70141d6ff24@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Thanks for pointing out, I think you are right.

--
Jackie Liu

在 2021/12/22 上午11:03, Guenter Roeck 写道:
> On 12/21/21 6:01 PM, Jackie Liu wrote:
>> From: Jackie Liu <liuyun01@kylinos.cn>
>>
>> Use devm_hwmon_device_register_with_info() and remove hwmon_dev
>> from drivetemp_data struct as it is not needed anymore.
>>
>> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
>> ---
>>   drivers/hwmon/drivetemp.c | 15 +++++++--------
>>   1 file changed, 7 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/hwmon/drivetemp.c b/drivers/hwmon/drivetemp.c
>> index 1eb37106a220..1a5a62288c0a 100644
>> --- a/drivers/hwmon/drivetemp.c
>> +++ b/drivers/hwmon/drivetemp.c
>> @@ -113,7 +113,6 @@ struct drivetemp_data {
>>       struct mutex lock;        /* protect data buffer accesses */
>>       struct scsi_device *sdev;    /* SCSI device */
>>       struct device *dev;        /* instantiating device */
>> -    struct device *hwdev;        /* hardware monitoring device */
>>       u8 smartdata[ATA_SECT_SIZE];    /* local buffer */
>>       int (*get_temp)(struct drivetemp_data *st, u32 attr, long *val);
>>       bool have_temp_lowest;        /* lowest temp in SCT status */
>> @@ -555,6 +554,7 @@ static int drivetemp_add(struct device *dev, 
>> struct class_interface *intf)
>>   {
>>       struct scsi_device *sdev = to_scsi_device(dev->parent);
>>       struct drivetemp_data *st;
>> +    struct device *hwmon_dev;
>>       int err;
>>       st = kzalloc(sizeof(*st), GFP_KERNEL);
>> @@ -570,13 +570,13 @@ static int drivetemp_add(struct device *dev, 
>> struct class_interface *intf)
>>           goto abort;
>>       }
>> -    st->hwdev = hwmon_device_register_with_info(dev->parent, 
>> "drivetemp",
>> -                            st, &drivetemp_chip_info,
>> -                            NULL);
>> -    if (IS_ERR(st->hwdev)) {
>> -        err = PTR_ERR(st->hwdev);
>> +    hwmon_dev =
>> +        devm_hwmon_device_register_with_info(dev->parent, "drivetemp",
>> +                             st, &drivetemp_chip_info,
>> +                             NULL);
>> +    err = PTR_ERR_OR_ZERO(hwmon_dev);
>> +    if (err)
>>           goto abort;
>> -    }
>>       list_add(&st->list, &drivetemp_devlist);
>>       return 0;
>> @@ -593,7 +593,6 @@ static void drivetemp_remove(struct device *dev, 
>> struct class_interface *intf)
>>       list_for_each_entry_safe(st, tmp, &drivetemp_devlist, list) {
>>           if (st->dev == dev) {
>>               list_del(&st->list);
>> -            hwmon_device_unregister(st->hwdev);
>>               kfree(st);
>>               break;
>>           }
>>
> 
> With this change in place, hwmon devices are removed _after_ struct 
> drivetemp_data
> is released, which means that there is a race condition where hwmon 
> access is still
> possible and uses a released data structure. Besides, it is not well 
> defined if
> the lifetime of the hwmon device matches the lifetime of the parent 
> device. I don't
> think you know what you are doing, sorry, and I am not even going to 
> look into the
> other patches of this series.
> 
> Guenter
