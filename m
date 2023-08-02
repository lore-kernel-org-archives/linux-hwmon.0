Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D22E1C001DF
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Aug 2023 23:11:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbjHBXLX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Aug 2023 19:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjHBXLW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Aug 2023 19:11:22 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 043541996
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Aug 2023 16:11:22 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-686f94328a4so254819b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Aug 2023 16:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691017881; x=1691622681;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ixCoHM/kHUMQsK9atYFVp2+uz2n1FyQ9wPd1YxeUCw0=;
        b=hnSpV5jju3weaUXgJMwDhnLOGPT4X8LIs89dW9IkanTZLNO/Y3CucBegCA6QV5fggk
         aeIoPP6Jo2a0xIQTDPbm71CzKwCKwjSAdlNsLTcOVIZtE83hlhlLAo7+o75zSFjmhNyo
         iusxdWyKOqU5fQ7covzpofM7IO3SBNegR8/mH1xr9pttlPdr9DxJMR+wDDskh+eJ+Xcy
         CDAns2Y6laBqqK3u/Dzo6fZS1ttM78rS1WRsdSo/qmW8pYovEmvUcZkfoQYeS2+3F4tX
         7jD2im+LKOr5Hn9exe1WKwbihePocTfLgGSkyKgMprpZ1u+DztmLPkzlOmxbd7ncBLUZ
         +O0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691017881; x=1691622681;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixCoHM/kHUMQsK9atYFVp2+uz2n1FyQ9wPd1YxeUCw0=;
        b=gOjFR6y0Ffwo+HKcP9uhuDnSswPB0nzFP9jKZowe+K0JUYL28k0kxM3/0DXJrMh3wP
         qZ31tS636Wem8ADELjaxtdST9i+PWF/ZzsYDpsfr4BycI7p1VW9RG9UcnwufpM+DCknB
         n+8GQkKkmsPtmOnDHOBsK9Olm23f0xfGLdovPZFb67Ogr5A7ErdVLFj2QSgELQAqvFQd
         B7ZaKQSKk/v6gl2vywIXm9f8hUOuc00lolVr3EbOEnBkyQr/oH7J6TbkY4NWhAZxST0w
         RO/+Ynkb6WqsQwLxgQK8uurtTiI9mD+5ywsczjotonCHKg2lNk8sRYHJetAUXOblGG4u
         WC1Q==
X-Gm-Message-State: ABy/qLZzn3k+kWF5rhqswJnjfdsUYIyzJsaeYi9I7/OLqW5LLZQYIhzC
        aLEqmqbZ5I3lJNPwmuCScIIjLi2Wxpg=
X-Google-Smtp-Source: APBJJlEsZ8xwkGv8rTMatun6f/vG184pKfj7jv8jNPRivzns8At9qZXim/oEpmJ5cULFExJbtUM+vQ==
X-Received: by 2002:a05:6a21:6315:b0:13c:3d64:de33 with SMTP id wu21-20020a056a21631500b0013c3d64de33mr14998977pzb.13.1691017881037;
        Wed, 02 Aug 2023 16:11:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n29-20020a638f1d000000b0055b61cd99a1sm12067516pgd.81.2023.08.02.16.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 16:11:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b863c26d-143b-9dd4-7f90-44a2b0ae94e2@roeck-us.net>
Date:   Wed, 2 Aug 2023 16:11:19 -0700
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

What would be the point ? This is just a placeholder, and we need
a NULL entry at the end.

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

