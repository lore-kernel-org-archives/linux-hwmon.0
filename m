Return-Path: <SRS0=Is7H=SN=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47549C10F13
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 13:07:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0CDDF2133D
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Apr 2019 13:07:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqFRfa9w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbfDKNHv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Apr 2019 09:07:51 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41938 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbfDKNHv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Apr 2019 09:07:51 -0400
Received: by mail-pf1-f196.google.com with SMTP id 188so3432778pfd.8
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Apr 2019 06:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/vhTkH548bQcs7zwSJRRIDVXHVT9K3mp72++V30y85w=;
        b=gqFRfa9wiJmo069LGo77UKsM90AXNTczoHCY0iPc6v8QSQ+x95Bj0Ojgoeu5h5ExRR
         X2QjqpJalYGgWYnkzrzZrubKy6S+InLQ5CEinqsRhpr9dIv+wFAzKtUTqo/EbyIDZI4C
         4+Df3AACKM5+aevgaVYdslnWxG6IMRjAOY7RPslQ58K6DrJ4JYntxQ8eHksPCafOqxTY
         OBfXcsVKfE3wdQwR6154AwErRVoIb86hNAfcO3MsP0XeukzugLfVhvaHUbS3OHkE5WSo
         R7fyncbwLB2lJl2i1iUIF7EWruFMnKbtdu1xDwJiJv1rh+KwpW15wbCthpCbHkwwLNmL
         8e9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/vhTkH548bQcs7zwSJRRIDVXHVT9K3mp72++V30y85w=;
        b=KE9WGikxWhMnEdV/OC9oTa1PKmkgQG++To37IKkPZAdCkcza1GYLFmIxyRpUAl4qp6
         yTRsf8OoBjdJZ+kxaGKpnIYHW/uw/rWtQn+tSmIbx9L9xKbJhVqmTgDBhZAqav6IqF9y
         KT+/YHw/A1wkzN/oBQe/c8+3MhPLpvWbwe8T22cHdM/YscNil9E7g9YkbYX6EaOlDi6P
         fyavdVZiHzt6JCihRR0mmJn4SNcVZJUVIJXC4cvLZjWb52A1y/yr8a0zAYJ3e4OoFRvw
         QCDzKKsMb9F926u5zV3sNZJM15N1xc45XiLXDZnwf83d2+TZawDUHvQX4477bXeWqn88
         jotg==
X-Gm-Message-State: APjAAAVm8dulkRmT3yqONgneVXoUddHcIfzRaa+G/hUH9Cz99ziOZh58
        czHFBqnV7A86blmyYb1M3cM=
X-Google-Smtp-Source: APXvYqxjwZERqxnquuE9tj00rDbibEeotGmag9mKEbTtpbJcIdH3PWWHdW4AFwkOyVfn0Gv9cR+Vtw==
X-Received: by 2002:a62:52c3:: with SMTP id g186mr49884392pfb.173.1554988070062;
        Thu, 11 Apr 2019 06:07:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d25sm52121987pfn.154.2019.04.11.06.07.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Apr 2019 06:07:49 -0700 (PDT)
Subject: Re: [PATCH 2/3] lm25066: export sysfs attribute for SAMPLES_FOR_AVG
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
References: <cover.1554934898.git.krzysztof.adamski@nokia.com>
 <e231af1feac9cbe8b72923a13587035220b76ad8.1554934898.git.krzysztof.adamski@nokia.com>
 <13669c15-3373-da20-6d68-50842d91be18@roeck-us.net>
 <20190411042429.GA19533@Asurada-Nvidia.nvidia.com>
 <20190411080849.GC28466@localhost.localdomain>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <8bba4e42-b799-d0b0-0c58-61efce68a396@roeck-us.net>
Date:   Thu, 11 Apr 2019 06:07:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411080849.GC28466@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/11/19 1:09 AM, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> On Wed, Apr 10, 2019 at 09:24:29PM -0700, Nicolin Chen wrote:
>> On Wed, Apr 10, 2019 at 05:55:19PM -0700, Guenter Roeck wrote:
>>
>>>> +static ssize_t samples_for_avg_show(struct device *dev,
>>>> +				    struct device_attribute *attr, char *buf)
>>>> +{
>>>> +	struct i2c_client *client = to_i2c_client(dev->parent);
>>>> +	int ret;
>>>> +
>>>> +	ret = pmbus_read_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	return sprintf(buf, "%d\n", 1 << ret);
>>>> +}
>>>> +
>>>> +static ssize_t samples_for_avg_store(struct device *dev,
>>>> +				     struct device_attribute *attr,
>>>> +				     const char *buf, size_t count)
>>>> +{
>>>> +	struct i2c_client *client = to_i2c_client(dev->parent);
>>>> +	int ret, val;
>>>> +
>>>> +	ret = kstrtoint(buf, 0, &val);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	ret = pmbus_write_byte_data(client, 0, LM25066_SAMPLES_FOR_AVG,
>>>> +				    ilog2(val));
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	return count;
>>>> +}
>>>> +
>>>> +static DEVICE_ATTR_RW(samples_for_avg);
>>>> +
>>>> +static struct attribute *lm25056_attrs[] = {
>>>> +	&dev_attr_samples_for_avg.attr,
>>>> +	NULL,
>>>> +};
>>>> +ATTRIBUTE_GROUPS(lm25056); // should we set a name of this group to put all
>>>> +			   // those attributes in subdirectory? Like "custom" ?
>>>> +
>>> We don't add subdirectories for other chips, and we won't start it here.
>>>
>>> I don't mind the attribute itself, but I do mind its name. We'll have
>>> to find something more generic, such as 'num_samples' or just 'samples'.
>>> I am open to suggestions. We'll also have to decide if the attribute(s)
>>> should be limited to one per chip, or if there can be multiple attributes.
>>> For example, MAX34462 has separate values for iout_samples and adc_average.
>>> Do we want samples, {curr,in,power,...}_samples, or both ? Or even
>>> currX_samples ?
>>
>> For my use case -- TI's INA chips, there is only one "samples"
>> configuration being used for all currX_inputs and inX_inputs.
>> So having a "samples" node would certainly fit better than an
>> in0_samples. So I vote for having both.
> 
> The name is family specific. The data sheet calls this register exactly
> like that so I used this name. But I agree that we could standardise on

Well, yes, but the whole point of an ABI is to make it chip independent.

> some common name, even if the actual implementation will be
> device-specific.
> 
> The LM5064 has one value for all readings, ADM1293 would have one
> setting for PIN and separate one for VIN/VAUX/IOUT.
> 
> So maybe it makes sense to allow for some device specific naming (with
> prefixes) where it makes sense but default to "samples" in simple case
> of shared value? In this case, if there is specific value like
> "curr_samples", user knows exactly which readings are influenced but
> when using "samples" it needs to have device specific knowledge to
> understand this.
> 
Let's go for "samples" and {in,curr,power,temp,...}_samples. "samples"
should be used if the attribute applies to all sensors.

> I'm just not sure what would be the best way to express situation for
> adm1293 for example - the PIN case is simple but what to do with
> "shared" settings - expose both curr_samples/in_samples and writing to
> one would change the other as well? Or just default to "samples" for
> this case and have separate "power_samples" just for PIN?
> 
Both "samples" and "power_samples" at the same time would be confusing.
Common implementation in situations like this is to have both curr_samples
and in_samples, and changing one would also change the other (or only one
would be writable, but that is just an implementation detail).

So what we need is virtual registers (PMBUS_VIRT_SAMPLES, PMBUS_VIRT_IN_SAMPLES,
and so on), plus the necessary code in pmbus_core.c and the implementation
in the chip driver. We'll also need to document new ABI attributes (samples,
in_samples, temp_samples, ...).

Any takers ?

Nicolin, I think with that you can move forward with the TI INA chip
implementation. I agree that 'samples' would be most appropriate for
this chip.

Thanks,
Guenter
