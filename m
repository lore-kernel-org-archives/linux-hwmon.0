Return-Path: <SRS0=hA7Y=ST=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29E6C10F14
	for <linux-hwmon@archiver.kernel.org>; Wed, 17 Apr 2019 02:05:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8440B20872
	for <linux-hwmon@archiver.kernel.org>; Wed, 17 Apr 2019 02:05:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=babayev.com header.i=@babayev.com header.b="BToFSUdG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbfDQCFC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 16 Apr 2019 22:05:02 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46266 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728032AbfDQCFC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Apr 2019 22:05:02 -0400
Received: by mail-pg1-f195.google.com with SMTP id q1so11212194pgv.13
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Apr 2019 19:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=babayev.com; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=DHgWX8BenTTHLAIhsHOcfwer3VhUji97XDm74Dz1U3I=;
        b=BToFSUdGYTU24GWhSNQ8aJwRmvHHUTDWahfHxafKU+iea7ZU/xbw1yALrSu0IeEWbZ
         Fcl12lCOOwxRvbaucutb/QXyEgFkUokX8yPUfm80rvFV3NvckORsC9Bj5yH59/IHLPM9
         sfIK59cbauE+Q6M0VtEG/7UolhfbDs3wAffQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=DHgWX8BenTTHLAIhsHOcfwer3VhUji97XDm74Dz1U3I=;
        b=fpxwByaP5F26i21gwk1R5HuXqeqajHkFBCkwL0Jv1dtnVrfI0fXnidD8+OFZ8MmHGd
         v7+sXr8oMa++Ngt6LeAonIJ0v34A3STXb5uXtlZ5kwYLCBoeNXlpsCU9pAuliUPNY1yh
         Sj8GubFF+wV8aYqn7crjYBNlolC5OWa7da6pN5dMcU6Xv6DkR1lu8a/hLchWIyHox8Sf
         m4V/Z6CTILIsSNDuBtzg7z0H387cV5DlDhmbEXR0cw2nI56ss4taLGFyvrchUJMT5FDX
         nFOJt0/JWpwLEjmVNrfiyXuBURn2/syNRCAOMJAZUwTPKPVhKXdj/4XXABszsWbR0nI/
         Ph4w==
X-Gm-Message-State: APjAAAXbUlQPaZEG2ID0f3rRUiV18HpfzfyIdceICQXLPWJZ0h8Sy2YR
        ZMwrf/NMVSDr/ME1JZZOzx9ayA==
X-Google-Smtp-Source: APXvYqx95duLpezI8vQsZevG2MTXhFBesevf2aH+BVMCN5Uzq4QaQNc9/K4q0o5UaHkzxOSPK8jLng==
X-Received: by 2002:aa7:9294:: with SMTP id j20mr22851905pfa.64.1555466701410;
        Tue, 16 Apr 2019 19:05:01 -0700 (PDT)
Received: from localhost (50-46-216-15.evrt.wa.frontiernet.net. [50.46.216.15])
        by smtp.gmail.com with ESMTPSA id p128sm123265808pfp.30.2019.04.16.19.05.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2019 19:05:00 -0700 (PDT)
References: <20190416183620.39950-3-ruslan@babayev.com> <20190416201603.GA25257@roeck-us.net>
User-agent: mu4e 1.0; emacs 26.1
From:   Ruslan Babayev <ruslan@babayev.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Ruslan Babayev <ruslan@babayev.com>,
        Jean Delvare <jdelvare@suse.com>, xe-linux-external@cisco.com,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] hwmon: (pmbus) add support for IR35215
In-reply-to: <20190416201603.GA25257@roeck-us.net>
Date:   Tue, 16 Apr 2019 19:04:59 -0700
Message-ID: <87zhopcrp0.fsf@babayev.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


Guenter Roeck writes:

>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/init.h>
>> +#include <linux/err.h>
>> +#include <linux/i2c.h>
>
> Alphabetic include file order please.

Sure

>> +
>> +static struct pmbus_driver_info ir3570b_info = {
>> +	.pages = 1,
>
> Either this ...
>
>> +	.format[PSC_VOLTAGE_IN] = linear,
>> +	.format[PSC_VOLTAGE_OUT] = linear,
>> +	.format[PSC_CURRENT_IN] = linear,
>> +	.format[PSC_CURRENT_OUT] = linear,
>> +	.format[PSC_POWER] = linear,
>> +	.format[PSC_TEMPERATURE] = linear,
>> +	.func[0] = IR3570B_FUNCS,
>> +	.func[1] = IR3570B_FUNCS,
>
> ... or this is wrong.

The latter is wrong. Thanks for catching it.
