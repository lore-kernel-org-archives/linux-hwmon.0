Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD4FC001DF
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Aug 2023 23:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjHBXMu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Aug 2023 19:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjHBXMq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Aug 2023 19:12:46 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD33AFB
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Aug 2023 16:12:45 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-686c06b806cso241595b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Aug 2023 16:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691017965; x=1691622765;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mKJfqQgRJkxddAOTwTgjFxX69bQ3MIVmkhWBoK/wchU=;
        b=hrREnZvPM4ySZQzzJU6kkVHw4Z9vWYdcv9VBVCF+Ts39KXOssUgi+7IQ/Gynz0UqO5
         a5mUkyp87k9w/0r9aWo1BoLBvs7KQQZUvTn9N9kqD82S0mxI079HSi+EjtENkkdq7FIM
         jsT/VNzHdyBJkCoRoyH7Ql5TcrfFHm+mI03WRdwaxQh2fHYjRwaYTQwYAT6shNURtSCq
         GivZh2dUqfmmDHzZhXEWiY+foLPfEyC3gW7HAtYl35qYLvzizET4nBvJTrdb8JBZDuWp
         6nij69FC1yXqRrX2/f/LUD3Woxof6J22Kc6OVx4HahL0gfJfEjygB/4Ucqw1cFqhJ/OG
         iiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691017965; x=1691622765;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKJfqQgRJkxddAOTwTgjFxX69bQ3MIVmkhWBoK/wchU=;
        b=YZbq4Y6KG2FT4D2ff9un34oBvAcEiZW8NLXNPZ3524eGS+hCe7oDwczREcDapxfANG
         udjFZg3IdWcxeZjXJtrZVlEF+H1EJ2rP3d0Ygh0oa/9LfCF4zgNnbsi5RKoCgmhP+Ood
         MFRc4IGMkTTNHitEbF6kvw5ClLqDtpdO4Pz93CDAUydHex0zjTpsd0vjMAPubHOHZ25e
         +a/3+reeyq6lfcpIkkptxfxKwuXRYIBLckgMS1jgAxlv/fLErgUcXbvGrFvMI4O3gIj0
         ToONVA+SteBHcBsINbWMFJgSIdx0w9zh/o8DW9R1gZGBKczDENAukdMKE7Dc/RPQHk5n
         182w==
X-Gm-Message-State: ABy/qLYQJF8FKQOR2Dg0dbFfQBSSoIvVrPko2gpMhs8jqlnXUGPlPT/Y
        dilp57529syeFXmODg2E0Uk=
X-Google-Smtp-Source: APBJJlFwHTZI8tRK/ryK2H+mE9Jia7AotnNxSCegQCx1Vsx68nyIoTSPlUO+KmEFMfpFLrD9Z5hwtQ==
X-Received: by 2002:a05:6a00:2d07:b0:686:5e0d:bd4f with SMTP id fa7-20020a056a002d0700b006865e0dbd4fmr19449977pfb.0.1691017965072;
        Wed, 02 Aug 2023 16:12:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i1-20020aa787c1000000b0063d24fcc2b7sm11544239pfo.1.2023.08.02.16.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 16:12:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d8258e4d-4cc4-78e2-7858-78409f47774f@roeck-us.net>
Date:   Wed, 2 Aug 2023 16:12:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/6] drm/xe/hwmon: Add HWMON infrastructure
Content-Language: en-US
To:     Andi Shyti <andi.shyti@linux.intel.com>,
        Badal Nilawar <badal.nilawar@intel.com>
Cc:     intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, ashutosh.dixit@intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
References: <20230802135241.458855-1-badal.nilawar@intel.com>
 <20230802135241.458855-2-badal.nilawar@intel.com>
 <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <ZMrbZXOVsyT133D8@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/2/23 15:40, Andi Shyti wrote:
> Hi Badal,
> 
> [...]
> 
>> +struct xe_hwmon_data {
>> +	struct device *hwmon_dev;
>> +	struct xe_gt *gt;
>> +	char name[12];
>> +};
>> +
>> +struct xe_hwmon {
>> +	struct xe_hwmon_data ddat;
>> +	struct mutex hwmon_lock;
>> +};
> 
> why do we need two structures here? Can we merge them?
> 

A later patch adds multiple hwmon devices which makes use of it.
I think that is flawed, and I am not inclined to accept it.

Guenter

>> +static const struct hwmon_channel_info *hwmon_info[] = {
>> +	NULL
>> +};
> 
> just:
> 
>    static const struct hwmon_channel_info *hwmon_info[] = { };
> 
> would do.
> 
>> +static umode_t
>> +hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>> +		 u32 attr, int channel)
>> +{
>> +	struct xe_hwmon_data *ddat = (struct xe_hwmon_data *)drvdata;
>> +	int ret;
>> +
>> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
>> +
>> +	switch (type) {
>> +	default:
>> +		ret = 0;
>> +		break;
>> +	}
>> +
>> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
>> +
>> +	return ret;
> 
> OK... we are forced to go through the switch and initialize ret.
> Would be nicer to initialize ret to '0'... but it's not
> important, feel free to ignore this comment if the compiler
> doesn't complain.
> 
>> +}
> 
> [...]
> 
>> +	/*  hwmon_dev points to device hwmon<i> */
>> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
>> +							 ddat,
>> +							 &hwmon_chip_info,
>> +							 NULL);
>> +	if (IS_ERR(hwmon_dev)) {
>> +		drm_warn(&xe->drm, "Fail to register xe hwmon, Err:%ld\n", PTR_ERR(hwmon_dev));
> 
> I think this is better:
> 
>     drm_warn(&xe->drm, "Fail to register xe hwmon (%pe)\n", hwmon_dev);
> 
>> +		xe->hwmon = NULL;
>> +		return;
>> +	}
>> +
>> +	ddat->hwmon_dev = hwmon_dev;
>> +}
>> +
>> +void xe_hwmon_unregister(struct xe_device *xe)
>> +{
>> +	xe->hwmon = NULL;
> 
> I think this is not necessary. Will xe check for hwmon at some
> point?
> 
> Andi
> 
>> +}

