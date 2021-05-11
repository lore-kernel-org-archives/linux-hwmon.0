Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0604CC43460
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 May 2021 13:32:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE2B861621
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 May 2021 13:32:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbhEKNdu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 May 2021 09:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbhEKNdX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 May 2021 09:33:23 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CBC8C06175F;
        Tue, 11 May 2021 06:32:11 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id c8-20020a9d78480000b0290289e9d1b7bcso17496162otm.4;
        Tue, 11 May 2021 06:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rC3x2tgr6/3bFrd/LDeIJkJzkjl5FV+xNQagEngjkoE=;
        b=mRJls6PklyC952Vad6l9Vtou+NkcN70T3SWJmwhwi5vp5nMRjZ2lZ8CqPWOZemmaoZ
         O+yabIGHjTNSNho+vmowR/BWeP4tVmB06RO6Suqn3lgyGdB/qYyZ8CKkPM/JoASDJJg3
         vFAbhqRRhGeqhHpGtZQlMdamUQ+Qvu8mMZFAVO8f0mBc6N0n/zbLfL+tHwSWbfDak+T9
         sabFpWoduXWv2SY72FFCaOKeBPVDbY0brvFgWr3g5ZpNDHSLdueHKxHKs+SzzqEz9d4t
         OuQGnN3V44d62KjhWSQOBU9EFtFBsPZvvOJZnANe3wBtszLKagxdE8i5Nr6H7i7MBsxo
         w2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rC3x2tgr6/3bFrd/LDeIJkJzkjl5FV+xNQagEngjkoE=;
        b=Av15/UCND29rXT11OFsEKhs7RJkkVUi3zrgBmWWmcU2hHRYlE3MeaCun+FNU9VJgkd
         hCPYsKkffAp6OvBaEZ/yRHdTfQMqvsKDoNqo0hMcLD73WvNDhLR2Qm78vSkRyYn31JQN
         Ko4MWWfXg4n8M5h0oFzTpJBqmZiQn/NdJ21C8V3z2lTXV1fle6ReboT9u9aBu/vMKNf7
         28yHPyfcOw6iYPuV7a9ihGChrFXKtmtavvAR9wPspwm93b3khnkNRE/GR/BUE0iGNp1X
         uxu3kreX0EX8PZ7Pb1qnPl9rh5mSBmT1raQMF0F/W2b0dMeo/sCLTL29nK6x3CQAsZUz
         2vqQ==
X-Gm-Message-State: AOAM532dLjnefrojIR8nTLDVabbJsiRHB76b8fagzligz89t6wUj/Yhh
        lidtRghrjEKIL+eEJdC47mdF5JfHli8=
X-Google-Smtp-Source: ABdhPJzCxQVVWSPASrWS8zZs4afyMsf8xAZfDsQZG35Y4DKPNn/46gpsBph4LquvB4t5h/jE5ufxqQ==
X-Received: by 2002:a9d:da7:: with SMTP id 36mr12496698ots.266.1620739930231;
        Tue, 11 May 2021 06:32:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x24sm3825931otk.16.2021.05.11.06.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 06:32:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH hwmon-next v7 0/3] Add support for MPS Multi-phase mp2888
 controller
To:     Vadim Pasternak <vadimp@nvidia.com>, robh+dt@kernel.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
References: <20210511055619.118104-1-vadimp@nvidia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <b967ca2a-acb6-6b76-7aee-788126f910e7@roeck-us.net>
Date:   Tue, 11 May 2021 06:32:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210511055619.118104-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/10/21 10:56 PM, Vadim Pasternak wrote:
> Add driver and documentation for mp2888 device from Monolithic Power
> Systems, Inc. (MPS) vendor. This is a digital, multi-phase, pulse-width
> modulation controller.
> 
> Patch set includes:
> Patch #1 - increases maximum number of phases.
> Patch #2 - provides mp2888 driver and documentation.
> Patch #3 - providesy binding documentation.
> 

Series applied.

Thanks,
Guenter

