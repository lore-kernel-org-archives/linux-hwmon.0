Return-Path: <SRS0=YRkG=ZF=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5D9C43331
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Nov 2019 14:11:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B8BD4222CA
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Nov 2019 14:11:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hp+AmBlc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbfKMOL6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 Nov 2019 09:11:58 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38969 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbfKMOL6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Nov 2019 09:11:58 -0500
Received: by mail-pf1-f194.google.com with SMTP id x28so1748601pfo.6
        for <linux-hwmon@vger.kernel.org>; Wed, 13 Nov 2019 06:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cllW061uLnQ3yGRXQ8vFaWpkjCm54Cf/kHX13p/6JP8=;
        b=Hp+AmBlcHjyM+cfBICrWPYck25TYpei7yLtSnzkWB+fPxyuU77P2F+8EUpHh1aqU7K
         eyDEoOrag5+tEY1aymFc5P4Npek4YKYGclHj8TkbQFXNsi40a4g3KhdIwUEd9QKE6lQ2
         qg0qoVJIcOfwYMzdU8itMbkYtjGWuLF6Jh7gGs+MQ9rbHFkUOgDc78Q3tM7Rm+dPtlBX
         gU4zTE78Yg6pipFsFc48mJGGnzMC1fU4rqNwZvc5E5QDLnwKjfFE+uzv+EyEs4Yjbtdg
         nw1kBet0gMxXOnGwhFW2nzIuHUvW1c+hBlhVy/CtkiqsMuxUItwKm9ww9TbXWxG86a9i
         4mcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cllW061uLnQ3yGRXQ8vFaWpkjCm54Cf/kHX13p/6JP8=;
        b=MUiWZiemW3M/ZEIMZ9eLf2HJLOhY1YXCE3FrHcr2+F7GvGBqOfcDkdXtqXUpz/aCD4
         b1/tdcyknP9ceTcIEPHDleGYZ4SmHIL2uJ5cPlMLIZOWQnrjPNCzsHd1Mhq+9cw9fEds
         zfriiZMlKx/WY3ZVAi9ggCQESGjMHFi5eEVFWY94F4MeWO1MhGTQO2UDvNM9bJo9StbQ
         QZE2AUeVqT5R6jFfE+JHep3KdlT1WU8zXwaya3RdDQ8HvI8S74vnulAB3kiKJXwZJag0
         cLBh0Xf4X0nCKU0nUbVJMrhr8gmM1onqIUJJnEB14D9xYxlRwV4dilWzSXKqoig1zS4e
         vZzg==
X-Gm-Message-State: APjAAAVggaynIi2FvmJrIAqMB6HjghupWomi2zgnk6YFonEVL6LbhEw8
        GTQrMlkEH21IqW6xKDxGjZY=
X-Google-Smtp-Source: APXvYqxAA9KymD8OZV2CDoPacXUjHZ0IHedbjy2IcFVhhdR+shBYM2klWoMucHeY8Klcmeabmtjg4w==
X-Received: by 2002:a63:e647:: with SMTP id p7mr4010461pgj.47.1573654317261;
        Wed, 13 Nov 2019 06:11:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r10sm2634179pgn.68.2019.11.13.06.11.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Nov 2019 06:11:56 -0800 (PST)
Subject: Re: [PATCH] nvme: hwmon: provide temperature min and max values for
 each sensor
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>, linux-nvme@lists.infradead.org,
        linux-hwmon@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
        Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
        Jean Delvare <jdelvare@suse.com>
References: <1573395466-19526-1-git-send-email-akinobu.mita@gmail.com>
 <20191111165306.GA19814@lst.de>
 <CAC5umyi97UJZzk+4soD+th0BZ71WfnOqnTWWuTYKyo6aWTdLXA@mail.gmail.com>
 <20191112142127.GA11580@lst.de>
 <CAC5umygX=uBQsWV8O=9NL3HeVNo_iMcq7BE-vA-wpQtyU5iV3Q@mail.gmail.com>
 <20191112163807.GB26911@roeck-us.net>
 <CAC5umyjVFRK+CfO=4FpzKUGyAaRVigj9NBoSazA6RV8AvhTbCw@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <234811dd-feb0-2bef-4240-d4d89d17b607@roeck-us.net>
Date:   Wed, 13 Nov 2019 06:11:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAC5umyjVFRK+CfO=4FpzKUGyAaRVigj9NBoSazA6RV8AvhTbCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/13/19 4:58 AM, Akinobu Mita wrote:
> 2019年11月13日(水) 1:38 Guenter Roeck <linux@roeck-us.net>:
>>
>> On Wed, Nov 13, 2019 at 12:00:22AM +0900, Akinobu Mita wrote:
>>> 2019年11月12日(火) 23:21 Christoph Hellwig <hch@lst.de>:
>>>>
>>>> On Tue, Nov 12, 2019 at 11:19:46PM +0900, Akinobu Mita wrote:
>>>>> OK. I'll add two macros.
>>>>>
>>>>> #define MILLICELSIUS_TO_KELVIN(t) ((t) / 1000 + 273)
>>
>> DIV_ROUND_CLOSEST() ?
> 
> How about these definitions?
> 
> #define MILLICELSIUS_TO_KELVIN(t) DIV_ROUND_CLOSEST((t) + 273150, 1000)
> #define KELVIN_TO_MILLICELSIUS(t) ((t) * 1000L - 273150)
> 
LGTM

Guenter

