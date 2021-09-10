Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863E0C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Sep 2021 15:36:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 685956101A
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Sep 2021 15:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234418AbhIJPhh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Sep 2021 11:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbhIJPhh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Sep 2021 11:37:37 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203DFC061574
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Sep 2021 08:36:26 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id 6so3427189oiy.8
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Sep 2021 08:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hqxAZMcbgidMuAvNziK4OgxzmrhWfZoNDxRSkz1OjJM=;
        b=BybZAgDIMCvOiSH4Z2tVDMlFUhaPgbOl461hILfcDdTpSO4OMkS/AKwxgSY6r66TKc
         mFfxOvKPIZiPXY+sB1TpF1uPP05j6uENtP5/weTOa3YXYbQMG9CJ4BZRyuTqsa9MXXKX
         3eB7+aVSSK+Z00c3Elp/cwWphm5gglz4KelHQzO1wbSBMXOm7zdZxO6bimyixN6vpGiV
         qfJGnMQ5sQCV4Tp2pRQ+o01Zv3BLK4mxQFNMA5e3GM/OD4QLBS5B3MAOBbtOqlNgikrp
         UUNjLDKbG3CwO8qbnhTGihBydjRL1PKxkB6NnTfokHG5fABOUcX19wu116TDVnCF4x1P
         iiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hqxAZMcbgidMuAvNziK4OgxzmrhWfZoNDxRSkz1OjJM=;
        b=MfC+2EnYqUrJeLhln6NaoO0EZEioOCzyfijmAxx6b/hrTz0A3kTat8fPQ2b1nthqTJ
         +y3DGxDS0dVb3M8enbyX1YVULk8EgE3cnygp9qdnbeLQ6gLziTvCJY9PBsdCmGE9tV42
         oRj6VZOisTMfgS/zBeFxes0qC47saH9TewsijJO4Z87hRIL8RmXHMVSx+zpI5RMJrvvQ
         38/jtBlcwJ7kvTWKXl0q55A0RyMDKGYkrYXYgYnNEHwf1QSvXkFiMZ789ms2NbqXesVw
         kzoDdYzklgAx1uTtMwALR6BlDyruo8Fg13g4Nwuoo58f8Z7pfRCtb37N8l584UdAlrOD
         Af/A==
X-Gm-Message-State: AOAM53359vHtKaWNXRhfJ7XueXqXBI6n0ez1Dn3QmGHGXl8l2UpmkNRq
        VgXB55nTF3M9AAQf6q3ub/Q=
X-Google-Smtp-Source: ABdhPJx4MEF7Lx3iweSjkQfVmeyuJ3ZWE9ohUJbMgN2GD69fRgTQjQ7n2jrHI8pYOIqAF/Sn/Hq1Bw==
X-Received: by 2002:aca:afcd:: with SMTP id y196mr4636794oie.71.1631288185249;
        Fri, 10 Sep 2021 08:36:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 4sm1233048ooa.11.2021.09.10.08.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Sep 2021 08:36:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: nct7802 mode selection for RTD1,2,3 via device tree?
To:     Oskar Senft <osk@google.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
References: <CABoTLcTEjKYwnFS1dB+-rGCM9BYvFBY1T1_M0OpdjqAy+M8SCQ@mail.gmail.com>
 <20210909170230.GD3973437@roeck-us.net>
 <CABoTLcT_EMexwCFuRAFVqZmrdCe05ec4U7CD8-+BLzEAd5QkgQ@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <6d6ac8fd-f014-6196-a9c6-a5b066c98fc1@roeck-us.net>
Date:   Fri, 10 Sep 2021 08:36:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CABoTLcT_EMexwCFuRAFVqZmrdCe05ec4U7CD8-+BLzEAd5QkgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/10/21 6:09 AM, Oskar Senft wrote:
> Hi Guenter
> 
>> Sure, all you need to do is to define the bindings and get them approved.
>>  From there I'll be happy to accept the necessary patch(es).
> I just sent two separate patches, one to add the device tree bindings
> and an independent patch to add the RTD modes configuration.
> 
> I hope that was right?
> 
Kind of. In the future please send such patch series as series.

Thanks,
Guenter

