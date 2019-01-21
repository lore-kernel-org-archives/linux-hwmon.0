Return-Path: <SRS0=brSS=P5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39554C2F42E
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Jan 2019 15:22:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02A1D2085A
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Jan 2019 15:22:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UN//qxqB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728613AbfAUPWs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Jan 2019 10:22:48 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43789 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728580AbfAUPWs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Jan 2019 10:22:48 -0500
Received: by mail-pl1-f196.google.com with SMTP id gn14so9978527plb.10
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Jan 2019 07:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RZSOD8O/759qorHhg1WAi+jjInoKXRewzDwUnhB7mfo=;
        b=UN//qxqBGdm41bYiI4cZt7PqoLFcalgXzc1Gs3mroYvMLuBGFQRytm2necG+A6n0w2
         dYX4RMxUuolHJ1HNNdxkjCKu2LO1e/E1sRLvy0Zl4EJJ2B/WijhD3L4aPK45yzXLip4/
         dSR8i60SGeC8z2biVdOQHnnMZKYzB6GeVVKTsDpve5CP84OVKlfo4uuY1lUqhl5TXy9Y
         OeS66CStJsa2/k1yzLRMXYqT8Uhy51V49ETekGDx8K4Ps9eAywoTTMgPeEJHu/8gDIDc
         JeRwn30wwGSP3EA9US1UxvXjha9q/DpIdKjbZ2J3QaDGWVnXBolqmXjFrmd7G1GymOGJ
         fCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RZSOD8O/759qorHhg1WAi+jjInoKXRewzDwUnhB7mfo=;
        b=m65hwJpSbbjP3bjiZ+KanO0w+hE/I9vmfz2oxwMfRbJNcl2nNzknHO/jzmyVHZGuuv
         1vc4ModXTABfDoMLNaadULTL2mVOqKklfu3CRT4aYPDW5H8ubceF49J6MQcddPuCb87u
         01mIKlnH1IZrSJswS1gYj4sO1jlrs9MEmafXF8MoT2CJ/unNm9SF/5hQTlXV1UV+1TrI
         R/6OcyI9SWtuBGnbhMTUOSRP/R18M04rEvrD67uFWjK/rBJ52f8AevzBFIA986G9dokK
         74eHkJGjWkAQw/ktp5DIcxjRbxDE2xIxXns66brDsDKRRA35s90lRhpA15FvYQA1lHj5
         2eyw==
X-Gm-Message-State: AJcUukdS6K5n2mPMPJPCg+GIAQV+V6AbLwJBHL1tiiGxNClgeh94yGDc
        lGYyQPOYUnd+R7H/UXRTwuQ=
X-Google-Smtp-Source: ALg8bN5l/yRnmxcSpDfBuSR+OmBDm38jiNIyrq8wdYXFHGvNDLmNxdRoFZTOz+xyWMr6AuLdCthrqA==
X-Received: by 2002:a17:902:2f03:: with SMTP id s3mr29940486plb.277.1548084167558;
        Mon, 21 Jan 2019 07:22:47 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j21sm17906466pfn.175.2019.01.21.07.22.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Jan 2019 07:22:46 -0800 (PST)
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
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <7ab7492f-7820-8abc-c695-a11df89ce5e6@roeck-us.net>
Date:   Mon, 21 Jan 2019 07:22:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190121093854.GC13374@e107155-lin>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/21/19 1:38 AM, Sudeep Holla wrote:
> On Fri, Jan 18, 2019 at 10:58:44AM -0800, Guenter Roeck wrote:
>> On Fri, Jan 18, 2019 at 06:21:57PM +0000, Sudeep Holla wrote:
>>> On Fri, Jan 18, 2019 at 09:14:59AM -0800, Guenter Roeck wrote:
>>>> Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
>>>> to improve readbility, and to reduce the chance of inconsistencies.
>>>>
>>>
>>> s/readbility/readability/
>>>
>> Nice catch ...
>>
>>>> Also replace any remaining S_<PERMS> in the driver with octal values.
>>>>
>>>> The conversion was done automatically with coccinelle. The semantic patches
>>>> and the scripts used to generate this commit log are available at
>>>> https://github.com/groeck/coccinelle-patches/hwmon/.
>>>>
>>>> This patch does not introduce functional changes. It was verified by
>>>> compiling the old and new files and comparing text and data sizes.
>>>>
>>>> Cc: Liviu Dudau <liviu.dudau@arm.com>
>>>> Cc: Sudeep Holla <sudeep.holla@arm.com>
>>>
>>> Not related to this patch, just thought of asking. If the intention is
>>> to avoid using S_<PERMS> macros and have direct values for readability,
>>> shouldn't you consider the ones as return values mainly in is_visible
>>> callbacks ?
>>>
>>
>> Not sure I understand. Can you clarify ?
>>
> 
> Sorry for not being clear, I was referring to these:
> $ git grep "return S_.*" drivers/hwmon/ | sort | uniq
> 
> drivers/hwmon/lm75.c:			return S_IRUGO;
> drivers/hwmon/lm75.c:			return S_IRUGO | S_IWUSR;
> drivers/hwmon/lm90.c:		return S_IRUGO;
> drivers/hwmon/lm90.c:			return S_IRUGO | S_IWUSR;
> drivers/hwmon/lm90.c:		return S_IRUGO | S_IWUSR;
> drivers/hwmon/lm95241.c:			return S_IRUGO;
> drivers/hwmon/lm95241.c:			return S_IRUGO | S_IWUSR;
> drivers/hwmon/lm95245.c:		return S_IRUGO;
> drivers/hwmon/lm95245.c:			return S_IRUGO | S_IWUSR;
> drivers/hwmon/lm95245.c:		return S_IRUGO | S_IWUSR;
> drivers/hwmon/ltc4245.c:			return S_IRUGO;
> drivers/hwmon/max31790.c:			return S_IRUGO;
> drivers/hwmon/max31790.c:			return S_IRUGO | S_IWUSR;
> drivers/hwmon/nct7904.c:				return S_IRUGO;
> drivers/hwmon/nct7904.c:		return S_IRUGO;
> drivers/hwmon/nct7904.c:		return S_IRUGO | S_IWUSR;
> drivers/hwmon/scmi-hwmon.c:		return S_IRUGO;
> drivers/hwmon/tmp102.c:		return S_IRUGO;
> drivers/hwmon/tmp102.c:		return S_IRUGO | S_IWUSR;
> drivers/hwmon/tmp421.c:		return S_IRUGO;
> 

The series only includes auto-converted drivers, and the conversion
focused on auto-converting SENSOR_ attributes. While it tried to convert
various instances of the above, that was not the primary focus. I will
likely submit one or more follow-up series to address remaining
SENSOR_... attributes as well as any leftover S_<perms> definitions.

Guenter
