Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2EDC10F14
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 12:45:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 38C55206A3
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 12:45:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDxDI8ZV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbfDWMpU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 08:45:20 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:46024 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbfDWMpT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 08:45:19 -0400
Received: by mail-qt1-f193.google.com with SMTP id b3so955993qtc.12
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 05:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=WfzmG/4/tvueYPviltdgP8WHgqY/qWP0mrHEiVbd2ic=;
        b=RDxDI8ZV8F/HkfFhEUVfw3gw4ObIJRWBp1f4imkjrAiZ04MskRIX/ccs/VUVO/Y38M
         xo1mu8uyRWXiWsQahbIf/vklt/7ryFsNMXMPJwpr4pKXs4VIzMjjA8nJa5Y7b6AtYm1a
         HWP3u33lON9bGPb3HP8ib7zBwsj6ZRet/yT4f3eIQJTkklV53Zv+5Ol79mxcI9GscAJl
         TVMUqTHwcSgPHz98qJJcrOAA/VmyMAH6umNq8ZqAAg5hQn8KyBE02tQHaBMmOw91q+KV
         InuCB36pTBekLXJVdeIK1TYYjasxRnt9zwp3R4qiONEOikOOBqUywaaUNM7torFMJx+P
         RPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=WfzmG/4/tvueYPviltdgP8WHgqY/qWP0mrHEiVbd2ic=;
        b=ukVNMip2tr+RjcpDVwHg5M0j6yP2itMXqQ9rVd/fNNBmqMXQy7ZhQmTC23x/GUeN5P
         SX3XUzCn4YjGWh9/yyY26osfANem3RHTnAIhqxfrswtkV+krbQrww8poKdrOqbq5wtFn
         7o725o/bjN2ht1mIK+i/ylfODVVvz0Jyi3/rap9JfH8MgkxT3t0Zf+Lo++1QQqkBVgtC
         YynU3h8VUGl57kEZlPXjzSy6xVcx5p16smQNVqe4wCqDlAMK3+Uujdyrl1DrCd4v9SBy
         XrSHEhlylyA2pwk3PjbbgliUmgNT0B2g8n11/Az2jLXoQ4f3GXdqJPK9Z/qjwA/itE5N
         RAIw==
X-Gm-Message-State: APjAAAXHQG+fdZk04Nz0AaHAwmv70M6YZAXph+Cml/yJMdGUt9Gm9j0y
        LBJpO9ru8EpAPajsbBRXQwhgMkrwx2E=
X-Google-Smtp-Source: APXvYqwi0X94CwK/ye5SytU2qXDAoaHlIIbrPmxiI40/FZvpAotkcxHV40VWKnE58sgolnmjn/LP0Q==
X-Received: by 2002:ac8:7008:: with SMTP id x8mr17535089qtm.269.1556023518967;
        Tue, 23 Apr 2019 05:45:18 -0700 (PDT)
Received: from jfdmac.sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id i33sm8886880qtb.64.2019.04.23.05.45.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 05:45:18 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: [PATCH v5] hwmon: max6650: add thermal cooling device capability
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <20190422134002.GA18419@roeck-us.net>
Date:   Tue, 23 Apr 2019 08:45:12 -0400
Cc:     linux-hwmon@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <45CE0549-CDB8-4655-8309-CEF449FA0730@gmail.com>
References: <201904192317.2UiQUP23%lkp@intel.com>
 <20190420030233.4651-1-jeff.dagenais@gmail.com>
 <20190422134002.GA18419@roeck-us.net>
To:     Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3445.104.8)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


> On Apr 22, 2019, at 09:40, Guenter Roeck <linux@roeck-us.net> wrote:
> 
> On a system which has CONFIG_THERMAL enabled but does not really utilize
> it, the call to thermal_cdev_update() will result in the fan being stopped
> immediately since max6650_set_cur_state() is called with state=0.
> 
> I see that this function called from pwm_fan.c. It is not called from
> gpio-fan.c or npcm750-pwm-fan.c. Other than from pwm-fan.c, it is only
> called from thermal governors, and not from any other thermal drivers
> registering a thermal cooling device. This leads me to believe that
> the calls from here and from pwm_fan.c may be wrong.
> 
> Are you sure that this call needed ? If so, can you explain ?
> What happens in your system if you remove this call ?

Yes, you are correct. It is a carry over from pwm-fan.c and so probably wrong
there too. I have tested without the thermal_cdev_update call in probe() and
basically, if the cooling device is not part of a TZ, then set_cur_state is
never called. If part of a TZ, it is called by the governor (step_wise in my
case) as required and all works as expected.

Cheers!



