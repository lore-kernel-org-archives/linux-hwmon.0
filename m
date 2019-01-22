Return-Path: <SRS0=IsVg=P6=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FB1C37124
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Jan 2019 00:45:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0CE82085A
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Jan 2019 00:45:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFi6ispJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbfAVApl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Jan 2019 19:45:41 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44924 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbfAVApl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Jan 2019 19:45:41 -0500
Received: by mail-pf1-f193.google.com with SMTP id u6so10859962pfh.11
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Jan 2019 16:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p4eQ8ZXtyZplWnGlCvYocu3M12kZgKNwTRfostABVJs=;
        b=cFi6ispJu49pX9YvuZ1pgctuV105zkXeH7BOyp2fxv3+XA0EWGBW0aaKbDo7kXRD/o
         utKccfH6qojW0vxnEG8naPOimxb/uVAeQXTzlqh5CB5ImKDvMOjC0KQ4O64CLULG+6hm
         zHOr/65a1EjEBA4fLEnNion5+ZLvZMej7EoRC8ICVGWPbrtsSwbs0Wej4wbcf/XIL+xj
         ZVkwfsOBzy1PaBG/UPIWYSO78ttK6PnIGmvy5ICkxqG/QOH8MJ9cCOcxL3/kVxRg3cYp
         OyJUVCONDmuSw8Uj4sUTXJmRSr148c+L4QdMz6cohthFqZgfxA7hKAvDQL+dyXJQuQi4
         JvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p4eQ8ZXtyZplWnGlCvYocu3M12kZgKNwTRfostABVJs=;
        b=ClhAzBPzdzyh8DGvRJnuvqcE5k1lXnGhf1huxd89jVciLMloYiPyQBby2kICKWYsbJ
         +bjnXuDsTWHy6tbgy2KIWPmYLzdRdkDU5PtxOqP893D35csaamgg+GFNPgJJd+kVFF12
         cAnU8cq1FYTjkHqBRp2PwiXon22ZpGm17o93CPb7enyP3jZBLhf3veqVoOmBH7zdZr9B
         a9Im3nxmJB3gGrBY9qpsyN6uqWeG1UF4tkSyngVmpurSy0dqLjNVghrllhAdj1D9uaVD
         qxZS/cM4PLUkyougrbb7e8ZomRn0dlUgLk4fmz457QMaHcIZHGQsnTj1FAIzDCBH0VLD
         NdzQ==
X-Gm-Message-State: AJcUukff52rf6WNsgc6K9thG988GejNSlCQ0+VVJHb2xZdpJK3jSiVfx
        g9ww++E79xqJRxIIeijsdNr5PsX9
X-Google-Smtp-Source: ALg8bN4t8X3kRWZK4olBtt22DwR4ZUMiaVJKzAdtGY4gHYg1zETLRTSq97CoENbI2gMqia4t6mZE6w==
X-Received: by 2002:a65:4946:: with SMTP id q6mr29195004pgs.201.1548117940063;
        Mon, 21 Jan 2019 16:45:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g190sm23824199pgc.28.2019.01.21.16.45.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Jan 2019 16:45:39 -0800 (PST)
Subject: Re: [PATCH 29/30] hwmon: (vexpress-hwmon) Use permission specific
 SENSOR[_DEVICE]_ATTR variants
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
 <1547831700-15865-30-git-send-email-linux@roeck-us.net>
 <20190118182157.GA13374@e107155-lin> <20190118185844.GB5284@roeck-us.net>
 <20190121093854.GC13374@e107155-lin>
 <7ab7492f-7820-8abc-c695-a11df89ce5e6@roeck-us.net>
 <20190121152825.GB27784@e107155-lin>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <d920b47d-157e-7bf6-7055-4caf75a58968@roeck-us.net>
Date:   Mon, 21 Jan 2019 16:45:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190121152825.GB27784@e107155-lin>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/21/19 7:28 AM, Sudeep Holla wrote:
> On Mon, Jan 21, 2019 at 07:22:44AM -0800, Guenter Roeck wrote:
>> On 1/21/19 1:38 AM, Sudeep Holla wrote:
> 
> [...]
> 
>>> Sorry for not being clear, I was referring to these:
>>> $ git grep "return S_.*" drivers/hwmon/ | sort | uniq
>>>
> 
> [...]
> 
>>> drivers/hwmon/tmp102.c:		return S_IRUGO;
>>> drivers/hwmon/tmp102.c:		return S_IRUGO | S_IWUSR;
>>> drivers/hwmon/tmp421.c:		return S_IRUGO;
>>>
>>
>> The series only includes auto-converted drivers, and the conversion
>> focused on auto-converting SENSOR_ attributes. While it tried to convert
>> various instances of the above, that was not the primary focus. I will
>> likely submit one or more follow-up series to address remaining
>> SENSOR_... attributes as well as any leftover S_<perms> definitions.
>>
> 
> OK sounds good, just wanted to make sure I understood the intention
> for this right.
> 

After having another look ... did you check the entire series
of patches ? Because for me, in hwmon-next:

$ git grep "return S_.*" drivers/hwmon/ | sort | uniq
$

Guenter
