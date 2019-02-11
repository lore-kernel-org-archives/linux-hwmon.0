Return-Path: <SRS0=q7Hd=QS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8818CC169C4
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Feb 2019 14:13:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 58C68222B7
	for <linux-hwmon@archiver.kernel.org>; Mon, 11 Feb 2019 14:13:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqdhaoT+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfBKONL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 11 Feb 2019 09:13:11 -0500
Received: from mail-pl1-f169.google.com ([209.85.214.169]:37952 "EHLO
        mail-pl1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbfBKONK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Feb 2019 09:13:10 -0500
Received: by mail-pl1-f169.google.com with SMTP id e5so5365041plb.5
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Feb 2019 06:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=spiO16hRbNdzSRnb1MIC14pTshl+Vq2fiNT4wKQ/Ia0=;
        b=UqdhaoT+iCWk59xqsGDR/ktIwWFMUf4CP0BXo13oZtIVaYB6aYe28/Yuy9BNnYXP8l
         oHUGOPPy9UAJvJBtdRlDlNBVNG5WyotKNIg3Hwq9O2fxJJKQZiziYD5Yz5Os5SghJA1/
         bhY+qQqBfJ0V8fu/Hguy9x9WvkfJE332KXxbk/PjMlRRi5+BMZGvHk82wO2YPDYbGY2y
         ANK8q9xuarWZN73XGaRyeq1c+EKo9PUrNZKC6WKmL+D94+ZTSNvdJJdo1VTBmYcRmgXa
         OATZ0ekG6/ejOESm3/zNgealUf+PcDn01OlhmiuKFadkpinsWDJfk22fu5+m4j2G7Luu
         YczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=spiO16hRbNdzSRnb1MIC14pTshl+Vq2fiNT4wKQ/Ia0=;
        b=ENcBrhpUBe9wGmJczQQL80bmvWjOPLi+PIpUk18fnGBDr9tVsumGDfRghymdU3NMrk
         u/8qjUw16CunvvNG0pUxxOH28H+TZs7xzaBMcfryKZPwcKBS9FFrxYVGO0S8KXMkXL66
         GAGoVRcbNbWdLnTqG+EAQSWxtbMUZSJyClrxCThfRWipCm56TNO5llNorvfRQF/jx6si
         HbliZ8P4Vd/3jgvRJfYw5w9fzOaHh6rfam29IpwZSmPxeAOiSCjra2na3Kop1LyEsSDn
         gCyFG3d5xP7JGYiYp9WwTL99nV7PeDWxcXryOj4VYEThF+0NXEu8rftQN769AjGF5gL+
         +SVw==
X-Gm-Message-State: AHQUAuaHeTA0Sl0FE/yDaOeomEKiGYl4WutpCw5gm6C9KV5lUUSIya3U
        9sNWG8M7aJp6OEHiH/6Kkc27Ud7b
X-Google-Smtp-Source: AHgI3IbgRDsitc1k5r/34ch913jqV2osJpYfInCiZdB+ue4pcNwOHdP0QlASzeDzBGEhgQhxa3LdPw==
X-Received: by 2002:a17:902:9a07:: with SMTP id v7mr36900431plp.247.1549894389794;
        Mon, 11 Feb 2019 06:13:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p29sm12586419pgm.78.2019.02.11.06.13.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Feb 2019 06:13:09 -0800 (PST)
Subject: Re: coretemp driver change on dual-die/package systems
To:     Zhang Rui <rui.zhang@intel.com>, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org
References: <1549878372.2099.36.camel@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <4ecc367e-5020-ed68-e7bc-839b2dc5bb12@roeck-us.net>
Date:   Mon, 11 Feb 2019 06:13:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1549878372.2099.36.camel@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 2/11/19 1:46 AM, Zhang Rui wrote:
> Hi, Jean and Guenter,
> 
> Per the Intel Software Developer's Manual, which you can found at www.i
> ntel.com/sdm, when CPUID.1F is present, it is preferred over CPUID.B.
> 
> New dual-die/package systems will see this difference:
>     CPUID.0B enumerates the CPUs on each die as if they were in
> different packages.
>     CPUID.1F enumerates the CPUs on each die within the same package.
> 
> This will manifest in the sysfs physical_package_id attribute. ie. In
> the example above, CPUID.B would cause lscpu to show 2 packages, and
> CPUID.1F will cause lscpu to show 1 package.
> 
> Also, with CPUID.B the concept of a package-scope MSR and a die-scope
> MSR are synonymous.  With CPUID.1F, it is possible for some MSRs to
> have die-scope, and other MSRs to have package-scope.
> 
> MSR_IA32_PACKAGE_THERM_STATUS is a die-scope MSR, thus we need to
> update the coretemp driver to become multi-die-aware when we support
> CPUID.1F.
> 
> Previously, we create one hwmon device for each package, now we need to
> create one hwmon device for each die.
> But there is one problem left. For each coretemp hwmon device, the
> "temp1_input" attribute represents the temperature got from
> MSR_IA32_PACKAGE_THERM_STATUS, and "temp1_label" is "Package id X",
> where X is the logical package id.
> Now we create one hwmon device for each die, thus temp1_label can not
> use logical package id any more, because there are two dies in the same
> package.
> To me, there are two choices,
> 1. changing "temp1_label" from "Package id X" to "Package id Y", where
> Y is just a unique number instead of logical package id, say, using
> ida.
> 2. changing "temp1_label" from "Package id X" to "Package id X Die id
> Y", where Y is the die id.
> 
> Question is I'm not sure how temp1_label is used and if this change
> will break any userspace, like lm-sensors?
> 

Please feel free to change the label as it makes sense. I would suggest option
2 to avoid confusion. The string it reports is not part of the ABI and
can be changed. It can be overwritten with sensors3.conf anyway, so nothing
should depend on it.

Guenter
