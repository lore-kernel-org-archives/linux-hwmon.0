Return-Path: <SRS0=YpYn=ZR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBEDBC43215
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Nov 2019 14:31:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B5C05207FD
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Nov 2019 14:31:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qusZwGrs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728145AbfKYObS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Nov 2019 09:31:18 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:42910 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfKYObS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Nov 2019 09:31:18 -0500
Received: by mail-ot1-f46.google.com with SMTP id 66so6608975otd.9
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Nov 2019 06:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W+3mZWARTBctKj9tFxM+Ge3X5ycUdMgGyRNL9+gh5D8=;
        b=qusZwGrspJwPU24MrSdxK5H0xOuZ6izBklFYhnCvdJlQlrGZGhbDzFfMLxMra4svgl
         hRWQvlghllRNIeEo5edsb5Wd8Q1JaCzO0oYUjBMgse7+hnyXqNr1zn+fiaCZOVAsUHoO
         8FX/vFwMv6BvDHgaHFZNxo9hdZ7i/t4L7bX/41Ul2kADQdvwrwnmtkRKnBhgG/lbB6fb
         Opj+EttSt6kBanGVfq7+ujwHWO6PBJ4+xPzhFWSOHxUQUex0nwrLKJjjtUilsu2jqY+H
         sKNOGIUwTS1xiUxWnFeRIKRGrcJVSMmH8RlGwwDia9UUg4aTAj/LWIcZcYb3fe8Wg9sz
         /lAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W+3mZWARTBctKj9tFxM+Ge3X5ycUdMgGyRNL9+gh5D8=;
        b=U/geasfqZ0WSUL9G3+T2dHFpd4zTs/l+IVW9ZZTO3YdCy/lmSVBWWQsd42rig4Y9zh
         aIheQWybuue7f2iPviJEY2bFo8shFQMpiF5glvauMiCp34ZcvWuKD01Arlp/XCvmHM7C
         f8d4utIUnzJBeI35RZfdSAJ3L7SP3qw/rSil1VZ/Sww4cmQkNNk3aeRDOvdUUNtRXzIK
         bHvHmBr89pk9HFGPHI/Wt/X9eZryZBoKCGT1YDSInQwtiB4C88x4pcXzfXuMnPHokeTs
         +kSu6iX3mOsTU/W9gZ72fFnTH6T8zpoNUBHY/NNy4uuXX50IJveyZsJPScDcpXC4tNDC
         49JA==
X-Gm-Message-State: APjAAAUtx+NsNnVOax2OtqCp+6RJZX/JLt9EeHFi8ydAj5ADku8STNrI
        DwdNk/CfTM7st6Wk60sLx+6Azjxl
X-Google-Smtp-Source: APXvYqzSk7wJLT1ffiAmYD/04REhbrus9qxi0scyjCG4U8rRI8raveHkei749zwLtb68gFqp1UMMqQ==
X-Received: by 2002:a9d:66d9:: with SMTP id t25mr21647000otm.30.1574692276899;
        Mon, 25 Nov 2019 06:31:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y23sm2567799oih.17.2019.11.25.06.31.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Nov 2019 06:31:16 -0800 (PST)
Subject: Re: hwmon: (nct7802) buggy VSEN1/2/3 alarm
To:     Gilles Buloz <Gilles.Buloz@kontron.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <5DDBD386.4070408@kontron.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <6cde95e5-0ab3-016f-b67d-73db8c16ff71@roeck-us.net>
Date:   Mon, 25 Nov 2019 06:31:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5DDBD386.4070408@kontron.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/25/19 5:13 AM, Gilles Buloz wrote:
> Hi Guenter,
> 
> According to the NCT7802Y datasheet, the REG_VOLTAGE_LIMIT_LSB definition is wrong and leads to wrong threshold registers used. It
> should be :
> static const u8 REG_VOLTAGE_LIMIT_LSB[2][5] = {
>           { 0x46, 0x00, 0x40, 0x42, 0x44 },
>           { 0x45, 0x00, 0x3f, 0x41, 0x43 },
> };
> With this definition, the right bit is set in "Voltage SMI Status Register @0x1e" for each threshold reached (using i2cget to check)
> 

Good catch. Care to send a patch ?

> But I'm unable to get any "ALARM" reported by the command "sensors" for VSEN1/2/3 = in2,in3,in4 because status for in0 is read
> before (unless I set "ignore in0" in sensors file). The problem is that status bits in "Voltage SMI Status Register @0x1e" are
> cleared when reading, and a read is done for each inX processed, so only the first inX has a chance to get its alarm bit set.
> For this problem I don't see how to fix this easily; just to let you know ...
> 
One possible fix would be to cache each alarm register and to clear the cache
either after reading it (bitwise) or after a timeout. The latter is probably
better to avoid stale information.

Guenter
