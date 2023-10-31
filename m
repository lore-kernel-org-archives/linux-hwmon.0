Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1230C4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 31 Oct 2023 14:47:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235747AbjJaOry (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 31 Oct 2023 10:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235660AbjJaOry (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 31 Oct 2023 10:47:54 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F9A9DB
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 07:47:52 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6bd0e1b1890so4791184b3a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Oct 2023 07:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698763671; x=1699368471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MZkOU0bTKneoo8rlVjNoUHq69uXwBx1Yq8iGhkGsjao=;
        b=eV0WN1b75xZmCw4Cq7eTMUIzHt3eLb9LcW78NxwCNV1EN/O2nmzTX09rQGEbM8hRWF
         mf6mhWVSUriJAGdGKcq4NMlnH0UBUMqsmqURkVGKpsbxhR0HqfDdViocicaY+ZLT7nsq
         /C4IA4d4OSr92FAlM81CVYHJqeLvpV9mYAMQOiIivtsK/vsMNbXkbWjeByh5XfPsgtPv
         AeeTb8W28q7o4BioKIv3dijwnQKgf0G3S4BW6VHB/Ue4/Fyd5s/JBJ13wR4mKG2Dfmr5
         1dMbFJ6P6Zdtyfs+bRqsdeOL9bq9icDbUT1E6ZXifgKhkWnQQSGHZjL5nkT6GdK/lK/B
         APOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698763671; x=1699368471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZkOU0bTKneoo8rlVjNoUHq69uXwBx1Yq8iGhkGsjao=;
        b=J4+i9W1huAIpYVzW8fotj5G5KHfExq/SWH+3lCPb3pnSMtCj6iwmNhFE/bvXbGroF3
         47pfI6tl2KomKz2GAHfISsRMuxnnXsGr+PjZXNyryZbloCl4wpjWaDfwFhaezVBTgLJV
         /gBURPxhOMWNQt+CPtOIjGcfThsqLPjdlz2e/0f6N7+jpeSnqC5lvNRwbaQjWDnb+Zsi
         wCdM4ktUBxqneSXH1z3SI1dhVUpdNzesTX3AQQ3VNPL8Qu4FVOm4EgEFEExJ/ORTeQnk
         3EdohGIBrWCdE8cZe+C3kUA2OBR8S3npy5EJ6ZSlfH5z9hf/aGEpQODQHU1uhphz8Jjc
         +ofQ==
X-Gm-Message-State: AOJu0YxIvrhA9csI6S80yfTUeBU169hvjt9pc143uHGmO1JL7Fsu2P2K
        sdE5jpmPTGv1HH1FDxuwgZg=
X-Google-Smtp-Source: AGHT+IH+YvWOLAVEKLT3/b9JlflIfkFtmGkuRr+jHKhZ6ZzNgLquqGWSvLqzfBsv3vXx5nLkjeZ0Fw==
X-Received: by 2002:a05:6a00:9a6:b0:6be:18a9:8f60 with SMTP id u38-20020a056a0009a600b006be18a98f60mr13633836pfg.16.1698763671565;
        Tue, 31 Oct 2023 07:47:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id gx2-20020a056a001e0200b006933822e7a6sm1340114pfb.66.2023.10.31.07.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 07:47:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3d1472e4-0575-451c-b84a-cc0b3f17b099@roeck-us.net>
Date:   Tue, 31 Oct 2023 07:47:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] hp-wmi-sensors: probe of
 8F1F6435-9F42-42C8-BADC-0E9424F20C9A failed with error -22
Content-Language: en-US
To:     James Seo <james@equiv.tech>,
        Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     Armin Wolf <W_Armin@gmx.de>, linux-hwmon@vger.kernel.org
References: <ZT1U/zE6cApQKC2h@equiv.tech>
 <CGME20231031102014eucas1p2f377b89cd0381231b5c7f321e2902fe8@eucas1p2.samsung.com>
 <oypijd5y2nf60f.fsf%l.stelmach@samsung.com> <ZUEIcOBpVzxC/+c1@equiv.tech>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZUEIcOBpVzxC/+c1@equiv.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/31/23 07:00, James Seo wrote:
> On Tue, Oct 31, 2023 at 11:20:00AM +0100, Lukasz Stelmach wrote:

[ ... ]

> 
> For what it's worth, I personally don't see much value in doing much more than
> a machine-limited workaround for now. To me it's clear that this UTF-16 corner
> case is a BIOS bug and its consequences are minimal once a workaround is in
> place.
> 

A machine limited workaround sounds about right to me. We may have to revise
it later, but better safe than sorry.

Guenter

