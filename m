Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F39C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jun 2022 14:15:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239474AbiFFOPi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jun 2022 10:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239452AbiFFOPg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jun 2022 10:15:36 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA4D2D1C1;
        Mon,  6 Jun 2022 07:15:29 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 61-20020a9d0bc3000000b0060b9bfcfe76so10831812oth.9;
        Mon, 06 Jun 2022 07:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :cc:references:from:subject:in-reply-to:content-transfer-encoding;
        bh=YE5fd2PXzgrRrp6QmDickm+mZx4l8rN3v8iuptY0YE8=;
        b=Uf5uAcfO43BI37XVfWxFs27iKBoPVFRkbqDVTrO8B/Kc7NaQCqRUBEajc26O3UFmlp
         d3lyZyCgCCt2wbIRc6YdNsMKxEUvQDHs1rveWTET3ZYuHUYXPP3h0VQ+FaIGH7cX4Nv6
         Ciy2PFqn6FisnWLmuiodQNLoK8C/pRtSXZHTeUfI/kQGPWvhMdCcIwVdU8keGXmQIvZM
         5a1/lEZ19QUYg4XOygy2kj/9Dxn93XZc0VmBzvzF0Vc0J97uZDWjMFZXs+UhyCl5IPL7
         nMyCc+KG18R9yE4uAPzx5bequv+930NDrXWe4ToT/ATVdAj66i0/e+2pf0Wmwa0DGBy6
         rseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=YE5fd2PXzgrRrp6QmDickm+mZx4l8rN3v8iuptY0YE8=;
        b=D5NsdrKrecgJpM3ocPf03fQBdliHVgP0reKy2qgxMaP+qHIX/u8SkHPu6yY+/kvitc
         94RxG4LzZWQrgesyxlB3R6OYKTTodmvdPTWGWNhgdqODqIolsDLxBhL9iOZwt+xqBhl6
         KFFMb03hmOyksAbfi/wO7NPFrnZulciuo3qPLPWBvsjlRubIUFid+UGufsfwxy0FPRhe
         rsZ+AgH4PICzp4NnkwyNDENlZModnpY42JP1Sqm0YxMezdT77dimTyb7ZL/orzel0q2z
         GHApt1FHYyraVyxZcL5YWYG5hi+FerHDFG2kRGq4Bw09zmPbpUhjtYAvC+Bgbwl7Fy3K
         fTJg==
X-Gm-Message-State: AOAM533YIvW8K9VL/HM4gtCxuim/Mp4f+1uHGrsoiy5Ep9I8viGM76qs
        IudxUaaiLJHWOj+3ac2ta50=
X-Google-Smtp-Source: ABdhPJyBJnTwOW+Pzla8e7Pjter9px3qElskKW4RQsLdwiuMW3/i5JPjGrPCN/IAY9NT258XscnfRg==
X-Received: by 2002:a9d:76c3:0:b0:60b:9c19:2248 with SMTP id p3-20020a9d76c3000000b0060b9c192248mr10302414otl.62.1654524928871;
        Mon, 06 Jun 2022 07:15:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j6-20020a056830270600b0060603221264sm7683251otu.52.2022.06.06.07.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 07:15:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ec333cc5-1e49-dfe8-d5d4-8b3f3982e316@roeck-us.net>
Date:   Mon, 6 Jun 2022 07:15:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     Slawomir Stepien <sst@poczta.fm>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        slawomir.stepien@nokia.com
References: <20220525073657.573327-1-sst@poczta.fm>
 <20220525073657.573327-5-sst@poczta.fm>
 <20220605180310.GA3151289@roeck-us.net> <Yp2fCO84VrrSQHbL@t480s.localdomain>
 <5f471f82-83b1-aea4-ea25-e51c0672c8ff@roeck-us.net>
 <Yp3vpgR8jbyzWmiq@t480s.localdomain>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 4/7] hwmon: (lm90) Add support for 2nd remote channel's
 offset register
In-Reply-To: <Yp3vpgR8jbyzWmiq@t480s.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/6/22 05:14, Slawomir Stepien wrote:
> On cze 05, 2022 23:50, Guenter Roeck wrote:
>> On 6/5/22 23:30, Slawomir Stepien wrote:
>>> On cze 05, 2022 11:03, Guenter Roeck wrote:
>>>> On Wed, May 25, 2022 at 09:36:54AM +0200, Slawomir Stepien wrote:
>>>>> From: Slawomir Stepien <slawomir.stepien@nokia.com>
>>>>>
>>>>> The ADT7461 supports offset register for both remote channels it has.
>>>>
>>>> ADT7481
>>>
>>> Oops. I will fix that in new version.
>>>
>>>>> Both registers have the same bit width (resolution).
>>>>>
>>>>> In the code, this device has LM90_HAVE_TEMP3 and LM90_HAVE_OFFSET flags,
>>>>> but the support of second remote channel's offset is missing. Add that
>>>>> implementation.
>>>>>
>>>>> Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
>>>>> ---
>>>>>    drivers/hwmon/lm90.c | 37 ++++++++++++++++++++++++++++++++-----
>>>>>    1 file changed, 32 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>>>>> index 02b211a4e571..d226f1dea2ba 100644
>>>>> --- a/drivers/hwmon/lm90.c
>>>>> +++ b/drivers/hwmon/lm90.c
>>>>> @@ -153,6 +153,8 @@ enum chips { adm1023, adm1032, adt7461, adt7461a, adt7481,
>>>>>    #define LM90_REG_REMOTE_TEMPL		0x10
>>>>>    #define LM90_REG_REMOTE_OFFSH		0x11
>>>>>    #define LM90_REG_REMOTE_OFFSL		0x12
>>>>> +#define LM90_REG_REMOTE2_OFFSH		0x34
>>>>> +#define LM90_REG_REMOTE2_OFFSL		0x35
>>>>
>>>> I don't think those are needed.
>>>
>>> In lm90_temp_write() (unlike in lm90_update_limits()) the remote channel is *not* set. I find
>>
>> ... unless lm90_set_temp() is used to write the values. If I recall correctly
>> I didn't do that because selecting the remote channel seemed unnecessary.
> 
> I think that modifying lm90_set_temp() to support offsets is a bit messy:
> 
> 1. The offset on all supported devices is always on two bytes. Unlike the temperature, where
> sometimes it is just on one (but if more than one byte, then we set reg_remote_ext). With this also
> 'regs' in lm90_set_temp() will be back as 2 dimensional array OR additional high and low indexes for
> REMOTE_OFFSET and REMOTE2_OFFSET should be added (that will also caused bits glueing on write/read).
> 
> 2. For offset the calls lm90_temp_from/to_reg should have 0 as flags (1st argument) - that would be
> an additional if in lm90_set_temp() OR clear&restore of the flags before&after the call..
> 
> Maybe, Guenter you will be happy with something like this (new functions):
> 
> static int lm90_get_temp_offset(struct lm90_data *data, int index)
> {
> 	int res = lm90_temp_get_resolution(data, index);
> 
> 	return lm90_temp_from_reg(0, data->temp[index], res);
> }
> 
> static int lm90_set_temp_offset(struct lm90_data *data, int index, int channel, long val)
> {
> 	int err;
> 	static const u8 regs[][2] = {
> 		[REMOTE_OFFSET] = {LM90_REG_REMOTE_OFFSH, LM90_REG_REMOTE_OFFSL},
> 		[REMOTE2_OFFSET] = {LM90_REG_REMOTE_OFFSH, LM90_REG_REMOTE_OFFSL},
> 	};

That array is unnecessary.
> 	u8 regh = regs[index][0];
> 	u8 regl = regs[index][1];

	regh = regs[0];
	regl = regs[1];

has the same result, meaning you can just use LM90_REG_REMOTE_OFFSH
and LM90_REG_REMOTE_OFFSL directly.

... and then you can just use the direct registers and add a comment stating
that those only work for ADT7481 and not for chips which require channel select.

> 
> 	val = lm90_temp_to_reg(0, val, lm90_temp_get_resolution(data, index));
> 
> 	if (channel > 1)
> 		lm90_select_remote_channel(data, true);
> 
> 	err = lm90_write16(data->client, regh, regl, val);
> 
> 	if (channel > 1)
> 		lm90_select_remote_channel(data, false);
> 
> 	if (err)
> 		return err;
> 
> 	data->temp[index] = val;
> 
> 	return 0;
> }
> 
> And new channel->index translator:
> 
> static const s8 lm90_temp_offset_index[MAX_CHANNELS] = {
> 	-1, REMOTE_OFFSET, REMOTE2_OFFSET
> };
> 
> Having that, we can use that functions in hwmon's read/write attrs but also while paring the
> device-tree channel nodes.
> 
> Maybe I missed something and using lm90_set_temp() will not be messy?
> What do you think?
> 
Using a new (simplified) function to write the registers sounds good.
Go for it.

Thanks,
Guenter
