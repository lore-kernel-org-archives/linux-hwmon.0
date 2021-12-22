Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8077C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Dec 2021 16:10:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234070AbhLVQKR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 22 Dec 2021 11:10:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232944AbhLVQKQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Dec 2021 11:10:16 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77AE5C061574
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Dec 2021 08:10:15 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id c18-20020a4a3812000000b002da81004c1cso955912ooa.13
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Dec 2021 08:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IUUTeh2RSBiIFGixr1bPxwGb4HfWS17YoTPxIJfkvVw=;
        b=Kx4fcniLDeWRvk4t+U+/HWlxu0GvomBB7+g1EU9Z9fqprOcKTfX6fSSDthg/MCKqIy
         UucAV1Sy8x6PLfEi7g3aDJxtM1oyYE2FQRh8nV7NBB/rWcAeQGHS5nFUd4+JWMKoDImv
         JUTqVy4MRvgv+th0NFODR2EVPBsFKhAKSDCmmpesE7WcnNTb3s1mvcBPGsjfRpQt1hBB
         t4yDfvmkJjBU+oa51qMUXSQYo0WevVaxqwqAGM+DorhyBGTBQKmU3P+SFK5VJOSDC+TT
         R7RIetrAumpg0q0qq41lGx7oGYH4KDxoV5UK9fGRRzkXTtnvJjbXW31eFfjRTqyEJOUE
         ZauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IUUTeh2RSBiIFGixr1bPxwGb4HfWS17YoTPxIJfkvVw=;
        b=UgsjA7WC+kxa2OWxzHtU8v0/dEkoS+Tk+GvNDm1Gajt3lmgs88ytbUvTDoIino4B5r
         RCnKwJPd2CkfZ71aevszja2faa3+m56TqE1zvJ0iX+ZTRltTALOGdwNAzitShQJ37zds
         Mf7I4ZPWz4NKVnapSnZLssiNoo7Nyq02MkDm3xSGsHx4DjnQDRv4K7Dvh2S6ztOkdhyc
         C1lGsCEG2NfBZeZI4McphFEdfChfPV1Vodr/Z3Kv3SkyaKn7FE7lhGh8QEJyGxyvESua
         briVIKj+9wvTjYG5FW1l7SdtN4BMYd2gTBkACAmmT2DhWN8HS4QhR0RYOjmHuQJMRtFL
         UeVQ==
X-Gm-Message-State: AOAM533UNVvbHSpimJfNcr1sFSMSUKo7ecK2NSrUnlVYJj5srf2SrRYy
        lCY5Nq33D7MNRU4dJOcYXetCuFHRKgA=
X-Google-Smtp-Source: ABdhPJyfxJS2Yagj3QgCV+I7PeW0fOjf3Owg90D+ehoMcT54snRNFMPUICi0EONZD00/8zG+igPbpw==
X-Received: by 2002:a4a:d0af:: with SMTP id t15mr2252465oor.12.1640189414378;
        Wed, 22 Dec 2021 08:10:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b17sm419311ots.66.2021.12.22.08.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Dec 2021 08:10:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 1/5] hwmon: (corsair-cpro) Use devres function
To:     Jackie Liu <liu.yun@linux.dev>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
References: <20211222020114.3524736-1-liu.yun@linux.dev>
 <b2797eb5-e87a-918a-2232-8be943bcac69@roeck-us.net>
 <6ad836b9-519c-0095-879f-20393e8d2e17@linux.dev>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <d51754d4-4fdb-ac22-2e48-e68651de0a05@roeck-us.net>
Date:   Wed, 22 Dec 2021 08:10:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <6ad836b9-519c-0095-879f-20393e8d2e17@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/21/21 10:13 PM, Jackie Liu wrote:
> 
> 
> 在 2021/12/22 上午10:58, Guenter Roeck 写道:
>> On 12/21/21 6:01 PM, Jackie Liu wrote:
>>> From: Jackie Liu <liuyun01@kylinos.cn>
>>>
>>> Use devm_hwmon_device_register_with_info() and remove hwmon_dev
>>> from ccp_device struct as it is not needed anymore.
>>>
>>> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
>>> ---
>>>   drivers/hwmon/corsair-cpro.c | 15 ++++++---------
>>>   1 file changed, 6 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
>>> index fa6aa4fc8b52..f476367ba6cf 100644
>>> --- a/drivers/hwmon/corsair-cpro.c
>>> +++ b/drivers/hwmon/corsair-cpro.c
>>> @@ -76,7 +76,6 @@
>>>   struct ccp_device {
>>>       struct hid_device *hdev;
>>> -    struct device *hwmon_dev;
>>>       struct completion wait_input_report;
>>>       struct mutex mutex; /* whenever buffer is used, lock before send_usb_cmd */
>>>       u8 *buffer;
>>> @@ -486,6 +485,7 @@ static int get_temp_cnct(struct ccp_device *ccp)
>>>   static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>>   {
>>>       struct ccp_device *ccp;
>>> +    struct device *hwmon_dev;
>>>       int ret;
>>>       ccp = devm_kzalloc(&hdev->dev, sizeof(*ccp), GFP_KERNEL);
>>> @@ -523,12 +523,12 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>>       ret = get_fan_cnct(ccp);
>>>       if (ret)
>>>           goto out_hw_close;
>>> -    ccp->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "corsaircpro",
>>> -                             ccp, &ccp_chip_info, 0);
>>> -    if (IS_ERR(ccp->hwmon_dev)) {
>>> -        ret = PTR_ERR(ccp->hwmon_dev);
>>> +    hwmon_dev =
>>> +        devm_hwmon_device_register_with_info(&hdev->dev, "corsaircpro",
>>> +                             ccp, &ccp_chip_info, 0);
>>> +    ret = PTR_ERR_OR_ZERO(hwmon_dev);
>>> +    if (ret)
>>>           goto out_hw_close;
>>> -    }
>>>       return 0;
>>> @@ -541,9 +541,6 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>>>   static void ccp_remove(struct hid_device *hdev)
>>>   {
>>> -    struct ccp_device *ccp = hid_get_drvdata(hdev);
>>> -
>>> -    hwmon_device_unregister(ccp->hwmon_dev);
>>>       hid_hw_close(hdev);
>>>       hid_hw_stop(hdev);
>>
>> The point is that the above two functions need to be called _after_ the hwmon device
>> was removed. This patch changes the order and removes the hwmon device after the hid
>> functions have been removed.
>>
>> If you think this is valid you'll need to explain in detail why removal order
>> does not matter. Otherwise this patch deserves a NACK.
>>
>> Guenter
>>
>>
> 
> Hi Guenter
> 
> After adjusting the order here, there will be a small window for sysfs to continue to provide services. However, because hid has been
> disconnected, the read and write interfaces will not get the actual data and returned by timeout. IMO this is not a big issue, but it's okay to not change it.
> 

That is not how kernel development works. I just hope you don't introduce such "not a big issue"
problems in other areas of the kernel.

Guenter
