Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C0EC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Apr 2022 17:00:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378923AbiD2REM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Apr 2022 13:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358853AbiD2REL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Apr 2022 13:04:11 -0400
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D41F43EE8
        for <linux-hwmon@vger.kernel.org>; Fri, 29 Apr 2022 10:00:53 -0700 (PDT)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-e2fa360f6dso8733525fac.2
        for <linux-hwmon@vger.kernel.org>; Fri, 29 Apr 2022 10:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:from:to:cc
         :references:content-language:subject:in-reply-to
         :content-transfer-encoding;
        bh=JWlPgDpUbbR2Nw1QAkoP+nphc6ofVpm0Qob+ONObH14=;
        b=ToNJ/EZHWOwUZ+Zw7nugTv6VFfyJzXVc1XJfiA2n0mTHy/2x8xrqmmsvQ3NS5NI5gN
         WgwdLP1NtemwHJrxk0+HgQIa7oLcTm+VlD/0U2AAjhr07QSP9ai0SWmsK0tbK7WZQmvg
         A7R40cgl9LXsejUe6NbtCG+8isiKY7GKWzW6ZXUIuuj3pilC0YYxEeyBOs40KI/NVUn6
         l3DiPtzpT60oEHvRtTM2msbCQt1B3bdDgwvnNFny2Ujs10LgVfhdChFwEJGmPvoxA5Gf
         +jJsk2X2ogZqEky5yVWMc39/coMzp7YaOUZSktHqjBp0E0wPX0KFzw5wIqTl1Hn/Ke48
         t3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :from:to:cc:references:content-language:subject:in-reply-to
         :content-transfer-encoding;
        bh=JWlPgDpUbbR2Nw1QAkoP+nphc6ofVpm0Qob+ONObH14=;
        b=gwbWapKi4WGgx23adHujlUP333qt47xB7/PsCTt07+URy0ULV6tbKuQS0A2WOb/A9F
         PY6MXw9iQhS0M0GaP6z7gukcxCJ+MYEKEyaqgD6twqGwVOMQ/zMLUkvCoY4qqBqTtzbT
         P++jIjE/97fgJ53fnXk5gGPgiQT6vOA8uLcu02l1darUePNnVYMLqjkRjFlEnd0o96Bk
         JOFMKyfoCvGQfLpbFei9yCbiEIh+SwarMVFAwFfZR3O/aacwEzz0bzNnIBH8leo2WsLn
         9/eu1FeCeIwFFsJ6MDJ4M9RonHdfRmLnrCI7MwzxQYfK3H/zyu7N3AX8F4lM6D8v6RAk
         Gw6g==
X-Gm-Message-State: AOAM533Z1PcjroQry4VhQyPp7JhW+qQPkDZ/x67HQ9TG/fnl5cITGD46
        SFsJlHqXJ/B6gjiSPBsqNaM=
X-Google-Smtp-Source: ABdhPJzztwAzcxWCZOOcG/FcpM83T2ocr98MQevySXUX2ORsXi1cvGETq3e/oqpxwMAxBtbmk9HFAQ==
X-Received: by 2002:a05:6870:24a1:b0:e9:2282:614d with SMTP id s33-20020a05687024a100b000e92282614dmr138769oaq.250.1651251652427;
        Fri, 29 Apr 2022 10:00:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g53-20020a9d12b8000000b00605d87e141asm1273032otg.42.2022.04.29.10.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 10:00:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3ee1acad-2139-2a56-9844-1d562435a6e7@roeck-us.net>
Date:   Fri, 29 Apr 2022 10:00:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marten Lindahl <martenli@axis.com>
Cc:     =?UTF-8?Q?M=c3=a5rten_Lindahl?= <Marten.Lindahl@axis.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        kernel <kernel@axis.com>
References: <20220428144039.2464667-1-marten.lindahl@axis.com>
 <20220428144039.2464667-5-marten.lindahl@axis.com>
 <6cc1561c-c4dc-076d-d9bf-1cc1cc60eac4@roeck-us.net>
 <Ymu1T/kykl0FwL3j@axis.com>
Content-Language: en-US
Subject: Re: [PATCH v4 4/4] hwmon: (pmbus) Add get_voltage/set_voltage ops
In-Reply-To: <Ymu1T/kykl0FwL3j@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/29/22 02:52, Marten Lindahl wrote:
> On Thu, Apr 28, 2022 at 06:49:21PM +0200, Guenter Roeck wrote:
>> On 4/28/22 07:40, Mårten Lindahl wrote:
>>> The pmbus core does not have operations for getting or setting voltage.
>>> Add functions get/set voltage for the dynamic regulator framework.
>>>
>>> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
>>> ---
>>>    drivers/hwmon/pmbus/pmbus_core.c | 63 ++++++++++++++++++++++++++++++++
>>>    1 file changed, 63 insertions(+)
>>>
>>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>>> index bd143ca0c320..fe7dbb496e3b 100644
>>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
>>> @@ -1531,6 +1531,11 @@ static const struct pmbus_sensor_attr voltage_attributes[] = {
>>>    		.gbit = PB_STATUS_VOUT_OV,
>>>    		.limit = vout_limit_attrs,
>>>    		.nlimit = ARRAY_SIZE(vout_limit_attrs),
>>> +	}, {
>>> +		.reg = PMBUS_VOUT_COMMAND,
>>> +		.class = PSC_VOLTAGE_OUT,
>>> +		.paged = true,
>>> +		.func = PMBUS_HAVE_VOUT,
>>>    	}
>>
>> Ok, you lost me here. This adds an inX_input attribute. Why ? This is completely
>> unrelated to the intended scope of this patch. It also doesn't report a measured
>> voltage, but a configuration value. If anything, it would have to be a separate
>> patch, and you'd have to argue hard why it makes sense to report it as measured
>> voltage.
> 
> I see. The reason for adding this is as simple as I now understand it is wrong.
> Please remember, my first version of the set/get_voltage functions where hardcoded
> with L16 input/output. Then in order to use the already existing convertion functions
> pmbus_data2reg and pmbus_reg2data I added this only for the need of a sensor object,
> as those functions are tailored for a sensor object.
> 
> So now I have to ask you for advice. Should I use the existing convertion
> functions, or do you suggest new variants of them? If reusing them, I guess I have
> two options:
>   1: Modify them to take class, page, and data outside of a sensor object as input.
>   2: Use them as they are, but create a local 'dummy' sensor object with class, page,
>      and data to use when calling the convertion functions.
> 

I think 2) is the easier and less complex solution for now.

> I hope I made it more clear for you now how I was thinking. There is
> absolutely no intention of having sensor inX_input attributes for
> reading the setpoint values. This was just an unwanted sideeffect, and I
> will glady remove it again.

No problem. Thanks for the explanation.

>>
>>>    };
>>>    
>>> @@ -2563,11 +2568,69 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
>>>    	return 0;
>>>    }
>>>    
>>> +static int pmbus_regulator_get_voltage(struct regulator_dev *rdev)
>>> +{
>>> +	struct device *dev = rdev_get_dev(rdev);
>>> +	struct i2c_client *client = to_i2c_client(dev->parent);
>>> +	struct pmbus_data *data = i2c_get_clientdata(client);
>>> +	struct pmbus_sensor *sensor;
>>> +	u8 page = rdev_get_id(rdev);
>>> +	int ret;
>>> +
>>> +	sensor = pmbus_find_sensor(data, page, PMBUS_READ_VOUT);
>>> +	if (IS_ERR(sensor))
>>> +		return -ENODATA;
>>> +
>>> +	mutex_lock(&data->update_lock);
>>> +	pmbus_update_sensor_data(client, sensor);
>>> +	if (sensor->data < 0)
>>> +		ret = sensor->data;
>>> +	else
>>> +		ret = (int)pmbus_reg2data(data, sensor) * 1000; /* unit is uV */
>>> +	mutex_unlock(&data->update_lock);
>>> +
>>
>> Same question. Why ?
> 
> Same reason as above. Only to get the sensor object for pmbus_reg2data.
> 
>>
>>> +	return ret;
>>> +}
>>> +
>>> +static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uV,
>>> +					 int max_uV, unsigned int *selector)
>>> +{
>>> +	struct device *dev = rdev_get_dev(rdev);
>>> +	struct i2c_client *client = to_i2c_client(dev->parent);
>>> +	struct pmbus_data *data = i2c_get_clientdata(client);
>>> +	struct pmbus_sensor *sensor;
>>> +	u8 page = rdev_get_id(rdev);
>>> +	s64 tmp = DIV_ROUND_CLOSEST_ULL(min_uV, 1000); /* convert to mV */
>>> +	u16 val;
>>> +	int ret;
>>> +	*selector = 0;
>>> +
>>> +	sensor = pmbus_find_sensor(data, page, PMBUS_VOUT_COMMAND);
>>> +	if (IS_ERR(sensor))
>>> +		return -ENODATA;
>>> +
>>> +	ret = _pmbus_read_word_data(client, page, 0xff, PMBUS_VOUT_MARGIN_LOW);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>> That actually makes me wonder: What about VOUT_MARGIN_HIGH ?
> 
> Ok, I will add a check for VOUT_MARGIN_HIGH also.
> 
>> Also, there are optional MFR_VOUT_MIN and MFR_VOUT_MAX registers.
>> Would it possibly make sense to determine the valid range once
>> during probe and then compare against it ?
> 
> Maybe this could be a good thing, so that we don't need to read both
> margins every time. But I guess that would need a new kind of page list
> with margins added to the pmbus_driver_info struct?
> I would prefer to make that change in a separate patch if it's ok with
> you?
> 

I think you need to check for four values right now:

- Try to read MFR_VOUT_MIN. If that does not work, read VOUT_MARGIN_LOW.
- Same for high values.

Ultimately, yes, I think we should add a list of limits. I think it
would make more sense though to add the limits to a new regulator
specific data structure. Maybe we should create a separate data structure
for regulators. Right now we pass struct pmbus_data. Maybe we need
struct pmbus_regulator_data which would contain a pointer to
struct pmbus_data as well as additional information needed for
regulators.

Thanks,
Guenter
