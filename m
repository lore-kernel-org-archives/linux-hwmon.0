Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F396C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 25 Jan 2022 03:44:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385245AbiAYDm1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Jan 2022 22:42:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S3414403AbiAYApS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Jan 2022 19:45:18 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA21C04189B
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Jan 2022 14:32:30 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id q186so27881794oih.8
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Jan 2022 14:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0jcZUxgC0J3ye5JDlxRDfCeFU7yASXzYRy4mAJUcvQ8=;
        b=qykQvTMoBeCXkJP99fw4dE986Ak0oI5NaTD9oZkgBUCwbYjw+yAL02Kxk/fn/v4Upd
         sJIPdnNSzPF3bXEvv7TAS4mwaimA6ssa4TH4W8M3Fj99XZGuY2M52HFhprSq+/MroWjg
         7TLrK6G7qZerdmIdObx6jwOqCDARwN8M/NC35avBmsx4WkBSvLlsl6Uq2TBvWjNaPsmb
         FkCwuENt5mMJewBzYlVWVUArzGvV3wTfj6W78eYqHtkMRIiME6N9IYQuyukEkXdL2Y2V
         XJQ4M9NoS/hEDEf1pDz5C3uvAMCK9tzCdzYWzMt5kwsRK8Ss3jr4K8rpFgX0wcwAQByR
         niHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0jcZUxgC0J3ye5JDlxRDfCeFU7yASXzYRy4mAJUcvQ8=;
        b=POUydD+RQ7UhxakXgYI9BUyLOKzHeA7Ijk47gaF+OYl53S3Us4LOesG5uD2KrvnhKK
         W+PiQMpbcwDPIBLvLVfvBNxEpiF84P0bxtnuR77iRJkAIOk6GRNzbG2WDvLGX1uLtpoE
         diIVPn++u58Kn95EvP4HWTYiPp4IxAwS1JND1wwIvUxPBhl8GFSrTe+zqL/3RbaZw+rT
         E0emydSKHrFM18P08Re1uccMzTEy5nr8lrNNZoFthc0FTXOT65PUzCP4yqHkH1X9iojp
         3axRiLN8hHy3SQuNOHVTr7JFGCc4mKmjFL+LD3G8By03gem6uBAGyX45seZIgaaylcVL
         9KUw==
X-Gm-Message-State: AOAM532rK1E2OYjrACXY1rBVb8H5/ydawRSiNyBqeXbpvS/1O0CehS+u
        PkAxwPnxQFpbOFxS4A/8mTc=
X-Google-Smtp-Source: ABdhPJzBYyEWp1AT9z1mV6fHb08iRHxG+yEQRmwTbwriN+TyYUNd80gq56lAGogCHH4vpZZPoaaQig==
X-Received: by 2002:a05:6808:1148:: with SMTP id u8mr3351325oiu.19.1643063549586;
        Mon, 24 Jan 2022 14:32:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p18sm5944604otk.51.2022.01.24.14.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 14:32:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <605b9a61-50b1-df01-1907-f0fa14a38773@roeck-us.net>
Date:   Mon, 24 Jan 2022 14:32:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hwmon: (nct6775) Fix crash in clear_caseopen
Content-Language: en-US
To:     Denis Pauk <pauk.denis@gmail.com>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Bernhard Seibold <mail@bernhard-seibold.de>,
        =?UTF-8?Q?Pawe=c5=82_Marciniak?= <pmarciniak@lodz.home.pl>
References: <20220124023248.475734-1-linux@roeck-us.net>
 <20220125002157.0d6823d1@netbook-debian>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220125002157.0d6823d1@netbook-debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/24/22 14:21, Denis Pauk wrote:
> On Sun, 23 Jan 2022 18:32:48 -0800
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> Paweł Marciniak reports the following crash, observed when clearing
>> the chassis intrusion alarm.
>>
>> BUG: kernel NULL pointer dereference, address: 0000000000000028
>> PGD 0 P4D 0
>> Oops: 0000 [#1] PREEMPT SMP PTI
>> CPU: 3 PID: 4815 Comm: bash Tainted: G S
>> 5.16.2-200.fc35.x86_64 #1 Hardware name: To Be Filled By O.E.M. To Be
>> Filled By O.E.M./Z97 Extreme4, BIOS P2.60A 05/03/2018 RIP:
>> 0010:clear_caseopen+0x5a/0x120 [nct6775] Code: 68 70 e8 e9 32 b1 e3
>> 85 c0 0f 85 d2 00 00 00 48 83 7c 24 ... RSP: 0018:ffffabcb02803dd8
>> EFLAGS: 00010246 RAX: 0000000000000000 RBX: 0000000000000002 RCX:
>> 0000000000000000 RDX: ffff8e8808192880 RSI: 0000000000000000 RDI:
>> ffff8e87c7509a68 RBP: 0000000000000000 R08: 0000000000000001 R09:
>> 000000000000000a R10: 000000000000000a R11: f000000000000000 R12:
>> 000000000000001f R13: ffff8e87c7509828 R14: ffff8e87c7509a68 R15:
>> ffff8e88494527a0 FS:  00007f4db9151740(0000)
>> GS:ffff8e8ebfec0000(0000) knlGS:0000000000000000 CS:  0010 DS: 0000
>> ES: 0000 CR0: 0000000080050033 CR2: 0000000000000028 CR3:
>> 0000000166b66001 CR4: 00000000001706e0 Call Trace:
>>   <TASK>
>>   kernfs_fop_write_iter+0x11c/0x1b0
>>   new_sync_write+0x10b/0x180
>>   vfs_write+0x209/0x2a0
>>   ksys_write+0x4f/0xc0
>>   do_syscall_64+0x3b/0x90
>>   entry_SYSCALL_64_after_hwframe+0x44/0xae
>>
>> The problem is that the device passed to clear_caseopen() is the hwmon
>> device, not the platform device, and the platform data is not set in
>> the hwmon device. Store the pointer to sio_data in struct
>> nct6775_data and get if from there if needed.
>>
>> Fixes: 2e7b9886968b ("hwmon: (nct6775) Use superio_*() function
>> pointers in sio_data.") Cc: Denis Pauk <pauk.denis@gmail.com>
>> Cc: Bernhard Seibold <mail@bernhard-seibold.de>
>> Reported-by: Paweł Marciniak <pmarciniak@lodz.home.pl>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   drivers/hwmon/nct6775.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
>> index fd3f91cb01c6..098d12b9ecda 100644
>> --- a/drivers/hwmon/nct6775.c
>> +++ b/drivers/hwmon/nct6775.c
>> @@ -1175,7 +1175,7 @@ static inline u8 in_to_reg(u32 val, u8 nr)
>>   
>>   struct nct6775_data {
>>   	int addr;	/* IO base of hw monitor block */
>> -	int sioreg;	/* SIO register address */
>> +	struct nct6775_sio_data *sio_data;
>>   	enum kinds kind;
> What do you think about remove kind field also from struct
> nct6775_data? Code has copy of this field inside of the struct
> nct6775_sio_data.

I thought about it, but it would add a level of indirection to
each access, and it is used for each register access (through
is_word_sized). That would make the change pretty expensive
in terms of runtime cost.

Guenter

>>   	const char *name;
>>   
>> @@ -3559,7 +3559,7 @@ clear_caseopen(struct device *dev, struct
>> device_attribute *attr, const char *buf, size_t count)
>>   {
>>   	struct nct6775_data *data = dev_get_drvdata(dev);
>> -	struct nct6775_sio_data *sio_data = dev_get_platdata(dev);
>> +	struct nct6775_sio_data *sio_data = data->sio_data;
>>   	int nr = to_sensor_dev_attr(attr)->index -
>> INTRUSION_ALARM_BASE; unsigned long val;
>>   	u8 reg;
>> @@ -3967,7 +3967,7 @@ static int nct6775_probe(struct platform_device
>> *pdev) return -ENOMEM;
>>   
>>   	data->kind = sio_data->kind;
>> -	data->sioreg = sio_data->sioreg;
>> +	data->sio_data = sio_data;
>>   
>>   	if (sio_data->access == access_direct) {
>>   		data->addr = res->start;
> 
> Tested-by: Denis Pauk <pauk.denis@gmail.com>
> 
> Best regards,
>               Denis.

