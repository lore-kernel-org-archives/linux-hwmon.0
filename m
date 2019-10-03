Return-Path: <SRS0=ibG4=X4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8B0C10F14
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Oct 2019 05:03:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D48B121D81
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Oct 2019 05:03:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Em9mI2dW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbfJCFDQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Oct 2019 01:03:16 -0400
Received: from mail-pf1-f179.google.com ([209.85.210.179]:46534 "EHLO
        mail-pf1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726816AbfJCFDQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Oct 2019 01:03:16 -0400
Received: by mail-pf1-f179.google.com with SMTP id q5so882300pfg.13
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Oct 2019 22:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A8kIKCzF5V61SxVRMNO8emQlkiU+nqSddsQSj8CrItY=;
        b=Em9mI2dWCBh+kwLrq97UTsc0ukSXt/jw+/0gWXklaCD5amEJ3L1rEq8I9NrHQLGSJe
         MNrmfpeB2JWIgto/wx2X3fHofsxo1QnnlTWcExIVvbDkTafzGLPQOZRratKb2QnXZDCl
         m9/sUvSxuIDgBiVnirrb11i7n/gXHiPhiRRStk/BJ5qMTKDysgao+0sMobKWKperSw1X
         VwKqxoxz4KWzoQBHZLrrmqt3av2iKtDgaTGQElJyVQ5pZ98LwRNCsKPc8qu5TqSWrcXf
         dNO1/Ul3sIFWjcV3RobkQtNRG3xRybzR/HO9p8gAssyRBTUNktJIrKni7+DUMc5BhSmU
         QFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A8kIKCzF5V61SxVRMNO8emQlkiU+nqSddsQSj8CrItY=;
        b=CvRz4/2pDY7RQYtIK3iR04kZH6qWwwxeRZ7zKsEW80eg0oR5RWlTgWHiuVSWLO4EyJ
         Jx+QVYiLbcc9Q7cxhTOgxXj1CVVI7IHbAFl84oySnawCTYWNN+deCu76di19xFYsrP2H
         9eqGhJGtZdM7EJCH5ZMD6FOntAGO/oRsc1lFNRjMmqPiq26Z44rz4tkOJTkmvR+zTbp1
         qs4pUtwXO7s+dJYM8JNVbOgEv9WeDS9yaRujeUx35nZEOpXcIm5KdaSoD9o5up8buKnE
         1Lgi39hzuDtG1/ZAWoxwru8QTEQaqitrHVJF5a10o90slL6wXHnx+73AN5F8Fxi7+lwe
         oB7Q==
X-Gm-Message-State: APjAAAWXSYrX7TEX2wDC5QZlyRaSkCiDoRhkMc6zY2unZ6k/khEeISLr
        94h0Vdmy64lE+bPOr18A0NzJNuYg
X-Google-Smtp-Source: APXvYqzoavEgDPT0GjMsr0y/rGPknUzHcsvf5NBsTxB2rTTcGGivkRRQDLN7TtznCXOMAr0q7RIzeQ==
X-Received: by 2002:a63:6c81:: with SMTP id h123mr7656154pgc.132.1570078993668;
        Wed, 02 Oct 2019 22:03:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d5sm816949pjw.31.2019.10.02.22.03.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 22:03:12 -0700 (PDT)
Subject: Re: ABI for these two registers?
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20190912002813.GA12433@Asurada-Nvidia.nvidia.com>
 <20190912183218.GA5065@roeck-us.net>
 <20190912210957.GA21945@Asurada-Nvidia.nvidia.com>
 <20190912220947.GA8072@roeck-us.net>
 <20190912224528.GA24937@Asurada-Nvidia.nvidia.com>
 <20190913001237.GA31111@Asurada-Nvidia.nvidia.com>
 <20191001221735.GA27958@Asurada-Nvidia.nvidia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a863488c-29fa-394c-3e3a-2761d18a0052@roeck-us.net>
Date:   Wed, 2 Oct 2019 22:03:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001221735.GA27958@Asurada-Nvidia.nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/1/19 3:17 PM, Nicolin Chen wrote:
> Hello Guenter,
> 
> It's been nearly three weeks. Would it be possible for you to
> provide some advice on my latest questions? I'd like to write
> code and submit changes once ABI is confirmed...
> 

Non-standard attribute discussions always require a lot of time,
since I have to re-read the chip documentation and try to understand
the reasoning why the attributes are needed. On top of that,
asking me "what should I do" instead of suggesting possible
solutions for me to choose from takes even more time, which
unfortunately I don't have right now. I'll try to get to it,
but, sorry, I can not promise you a time right now.

Guenter

> Thank you!
> 
> On Thu, Sep 12, 2019 at 05:12:38PM -0700, Nicolin Chen wrote:
> 
>>>>>>> Datasheet: http://www.ti.com/lit/ds/symlink/ina3221.pdf
>>>>>>> (At page 32, chapter 8.6.2.14 and 8.6.2.15)
>>>>>>>
>>>>>>> I have two registers that I need to expose to user space:
>>>>>>> 	Shunt-Voltage-Sum and Shunt-Voltage-Limit registers
>>>>>>>
>>>>>>> Right now in[123]_input of INA3221 are for voltage channels
>>>>>>> while in[456]_input are for Shunt voltage channels.
>>>>>>>
>>>>>>> So can I just use in7_input and in7_crit for them?
>>>>>>>
>>>>>> Doesn't Shunt-Voltage-Limit apply to in[456]_input ?
>>>>>> If so, the limit should be attached to those.
>>>>>
>>>>> The initial patch of ina3221 driver applied Shunt-Voltage-Limits,
>>>>> being named as "Critical Alert Limit Registers" in the datasheet,
>>>>> to curr[123]_crit, corresponding to curr[123] and in[456]_input.
>>>>>
>>>>> And this Shunt-Voltage-Limit-Sum is more related to the reading
>>>>> from Shunt-Voltage-Sum, which we just agreed it to be in7_input.
>>>>>
>>>> You didn't say Shunt-Voltage-Limit-Sum earlier. You said
>>>
>>> Ah....right...it's my fault. Sorry.
>>>
>>>> Shunt-Voltage-Limit. I would agree that Shunt-Voltage-Limit-Sum is
>>>> associated with Shunt-Voltage-Sum, but, again, that is not what you
>>>> said earlier. Confused :-(
>>>
>>> So, those two should be in7_input and in7_crit?
>>
>> And a couple of more questions upon it:
>>
>> 1) There are 3 control bits for the summation of this
>>     shunt-voltage-sum register to enable corresponding
>>     input channels. But in7_enable only allows users to
>>     en/disable all three channels at the same time. So
>>     how should I attach three enable bits using ABI?
>>     Or should I create a device-specific sysfs node?
>>
>> 2) We have a requirement of providing current-sum and
>>     current-limit-sum nodes, for use cases where those
>>     enabled channels use same value shunt resistors.
>>     It's similar to provide curr[1-3]_crit by dividing
>>     shunt[123]_resistor from in[456]_input. So could I
>>     deploy curr4_input and curr4_crit nodes for this
>>     requirement?
> 

