Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D25C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 May 2022 07:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238903AbiEKH0b (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 May 2022 03:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242918AbiEKHZ6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 May 2022 03:25:58 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4182C13C;
        Wed, 11 May 2022 00:25:55 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Kymd52qMlzfbZr;
        Wed, 11 May 2022 15:24:41 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 11 May 2022 15:25:53 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 11 May 2022 15:25:53 +0800
Subject: Re: [PATCH -next] drivers: w1: use kfree_sensitive()
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <zbr@ioremap.net>, <jdelvare@suse.com>, <linux@roeck-us.net>
References: <20220511064954.3401381-1-yangyingliang@huawei.com>
 <YntbdfHLjeHzAb9/@kroah.com>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <2cf24169-ea56-9c72-fa95-a1e6625c8545@huawei.com>
Date:   Wed, 11 May 2022 15:25:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <YntbdfHLjeHzAb9/@kroah.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 2022/5/11 14:45, Greg KH wrote:
> On Wed, May 11, 2022 at 02:49:54PM +0800, Yang Yingliang wrote:
>> Use kfree_sensitive() instead of open-coding it.
>>
>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>> ---
>>   drivers/w1/w1.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
>> index f2ae2e563dc5..a0a6c3c739d9 100644
>> --- a/drivers/w1/w1.c
>> +++ b/drivers/w1/w1.c
>> @@ -73,8 +73,7 @@ static void w1_master_release(struct device *dev)
>>   	struct w1_master *md = dev_to_w1_master(dev);
>>   
>>   	dev_dbg(dev, "%s: Releasing %s.\n", __func__, md->name);
>> -	memset(md, 0, sizeof(struct w1_master) + sizeof(struct w1_bus_master));
>> -	kfree(md);
>> +	kfree_sensitive(md);
> Does this actually change anything?  Why is the memset being called here
> at all?
It's no functional change and I got this by 
scripts/coccinelle/api/kfree_sensitive.cocci.
I'm not sure why using memset() here.

Thanks,
Yang
>
> thanks,
>
> greg k-h
> .
