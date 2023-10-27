Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA67C25B48
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Oct 2023 17:14:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235185AbjJ0ROq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 27 Oct 2023 13:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235186AbjJ0ROg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Oct 2023 13:14:36 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE197DB1
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Oct 2023 10:08:02 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5a7c08b7744so17320987b3.3
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Oct 2023 10:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698426481; x=1699031281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QyAk16GY3NuSSoM99wPhlrTes7ebYNpYCLb+1K3Sl8E=;
        b=ithSaTc6qvDYHE5aZ0euhnik/AVP3KTigweaPaFRHF0O1V3N1NdjvpsKUFv8yIFCha
         Yk8Ujj2xoL6MAg2q4GQgOKG40An2nndxJppm2pFglEY0VXMHlGsBpWrW2ugcZCzD6/3B
         LxquC0L1zQmkMBhuHNwlGc6nzM6RY0bsdGMuNqXGJVk0MnbTadsZp/g0UoBNLamjUB2q
         sdkYObq+XOzoPh1IheZ8RMfTNdpzC8TnPUYzzcjm26VudcOTB72d0zjbyI1OFcimVYH9
         2WvmqFLllzo+GTbq1pbww7+57PrYBsyYp0J/2o9pPnLEA46pFcJ64t1d17u9EecdaFSG
         CYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698426481; x=1699031281;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QyAk16GY3NuSSoM99wPhlrTes7ebYNpYCLb+1K3Sl8E=;
        b=JRhfPH7bFiGe1AZF1ELhfzh3f8eTMnACQEG3PIGlwalHpIbhRdZcXu0bMtDHBUOfMu
         djItRUpXHKkA3J/KYSJaD98Dpy8GusvHREgJwxl0iAh8vxHQ+trq259UVv0md2632NOo
         LA21DGs0uvo+llV45iZb6p0P/MkrwKzBAYhPb28UGipQsysho8k/l0GQehcOda33tNTo
         8DAxk6gxRyy5lKplsDBsk7iamGjKw7F4wjWtYVYbwQwFkb/bSryeao9nDFA0jRyPS0O0
         KyI++aAtV/XQ0eSFTijXEI2F+wUBFuhZ0X52iTTDJzI/14z7uWNfTdtKk29NDkQpgHQw
         Kqxw==
X-Gm-Message-State: AOJu0YxhGJxRSMc+s8NnbL3psezc6WORhn80/O4LSIiHi/rrojEyaena
        mvuxB/dZ0ys/QaPHgpcmUQoxfpm/fBQ=
X-Google-Smtp-Source: AGHT+IEwtXzqnN18RONULLaUfWu2d/YzN4WZFda4ItudwwNHlpTmyAvhOseTBJFJnvAn148fYrvj+Q==
X-Received: by 2002:a81:ad06:0:b0:5a7:b515:ae47 with SMTP id l6-20020a81ad06000000b005a7b515ae47mr3499256ywh.9.1698426481102;
        Fri, 27 Oct 2023 10:08:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n197-20020a0dcbce000000b0059bdac3fd08sm845988ywd.48.2023.10.27.10.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 10:08:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7850a0bd-60e7-88f8-1d6c-0bb0e3234fdc@roeck-us.net>
Date:   Fri, 27 Oct 2023 10:07:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To:     Lukasz Stelmach <l.stelmach@samsung.com>,
        James Seo <james@equiv.tech>
Cc:     linux-hwmon@vger.kernel.org
References: <CGME20231027150755eucas1p205057d22989db5c031ea5db27b8d9836@eucas1p2.samsung.com>
 <oypijdmsw4f6jm.fsf%l.stelmach@samsung.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [BUG] hp-wmi-sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
In-Reply-To: <oypijdmsw4f6jm.fsf%l.stelmach@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/27/23 08:07, Lukasz Stelmach wrote:
> Hi,
> 
> I've got HP EliteDesk 800 G6 Tower PC running Linux 6.1 from Debian 12.
> I managed to build the hp-wmi-sensors out of tree. When I loaded it I
> got EINVAL.
> 
>      hp-wmi-sensors: probe of 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
> 
> I managed to track it down. And it happens in check_wobj() called from
> check_platform_events_wobj() because in the for loop when prop==0 the
> type is ACPI_TYPE_BUFFER instead of ACPI_TYPE_STRING. When I bypass this
> particular check like this
> 
>      if (prop == 0 && type == ACPI_TYPE_BUFFER)
>              continue;
> 
> everything else works like charm and I can read senosrs via sysfs. I'd
> like to perpare a proper patch, but I've got no idea how to do properly
> work this quirk around. What are your suggestions?
> 
> Kind regards,


I really don't know if that is a bug in the driver or a bug in the WMI
description on that system. Given that, I have no idea how to handle this.
I also don't know the impact of ACPI_TYPE_BUFFER vs. ACPI_TYPE_STRING;
from the code in the kernel it seems that those values have a distinctly
different meaning. Is the returned value, when extracted, a string ?
Is it ok to accept ACPI_TYPE_BUFFER instead of ACPI_TYPE_STRING for
property names ? I simply don't know.

Are the type checks really needed ? What do other drivers do when interpreting
WMI data ? Could extract_acpi_value() be more flexible and also accept
ACPI_TYPE_BUFFER, or would that potentially create other problems ?
Lots of questions that at least for my part can not answer.

Guenter

