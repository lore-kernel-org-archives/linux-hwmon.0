Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7C5CD37B4
	for <linux-hwmon@archiver.kernel.org>; Sun, 17 Sep 2023 21:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbjIQVSD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 17 Sep 2023 17:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233072AbjIQVRq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 17 Sep 2023 17:17:46 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED50612D
        for <linux-hwmon@vger.kernel.org>; Sun, 17 Sep 2023 14:17:40 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-577fff1cae6so2231604a12.1
        for <linux-hwmon@vger.kernel.org>; Sun, 17 Sep 2023 14:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=telus.net; s=google; t=1694985460; x=1695590260; darn=vger.kernel.org;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8n0+7AQY+a9ER9AXeF1FZFLGIrztWlAu2PTuhQoCBZg=;
        b=Hr4feSD1plxQM1HAvKZ8GaHhc8dsqUcnEJ09tehcFrIPxjhonb3WxDHgtyQliZy5aZ
         7LeujjP7pyxjCM984ux7oXA1NdDfak2ENMcImKsrGS12IiuPt6lqkbRmbqOsejUPzlMo
         71Uog13kf2DfNjRS1lsKZZ6GXuBvSYp83v7FpZ/p3hLusz1j17u8mZj7QSGUUy1mJKjr
         Spj/H0bfTeccWRvok0bQlDjMuAfwbnJ9ndEe+Mq2LA4L1mIYXL8hJxgGul8fed5PMMPj
         KQeWk64kyEvgh4hOtQ6/XRWrlCRjBeGTNAx2fsHiCNywmZb+NdeShKzRlg8Npybfj6YT
         bjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694985460; x=1695590260;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8n0+7AQY+a9ER9AXeF1FZFLGIrztWlAu2PTuhQoCBZg=;
        b=V2ilvXI6f94j8uLBJG4NicX3ID/A+cZKeQ1R385Jb0N1SY3GijErjjyF7dSXpaKvKC
         3uHPnYUmz5KMn2Xw1bqgMTZqIk2J/tSrNzR31VuE9V53vkfm9tZVrAy8w0K7EBtdqAbw
         3qM8e1eCSOocBSDbxJUU9UmIEjJHB9h/4I0/HyAWRjH58X+AkiHPAmD4zUug6UxcGMJq
         uRQu9NRBsGOYMgBX2BsCockef0qpM1Ti969zv2FZ4jMLMqLZU/pBEFQaGn2+AVp3IkO1
         VTSX99CITMAX8XaVyg8jVsfuKMnrTt3dsygP5vg8/rxl/vhp8mMvqXOOSANjQBWj48fB
         4RKA==
X-Gm-Message-State: AOJu0YxEOfNyuqWTgfDFNlq6+Ua8T5gFPBWegj5s+tHPOSpiaImil4vr
        hsUVP2JZtg9hHbqnTFJCo7jSaBKqM7bD4nUijGQ=
X-Google-Smtp-Source: AGHT+IHPrODoskOePG+WWrkoXF8IjKc3IyrVkN/Nbcg7+PzzIVbSAAShVnw+8RuDCj4YZ/p38j2b5Q==
X-Received: by 2002:a17:90b:1d10:b0:273:83ac:5eb9 with SMTP id on16-20020a17090b1d1000b0027383ac5eb9mr14098550pjb.4.1694985460397;
        Sun, 17 Sep 2023 14:17:40 -0700 (PDT)
Received: from DougS18 (s66-183-142-209.bc.hsia.telus.net. [66.183.142.209])
        by smtp.gmail.com with ESMTPSA id o3-20020a17090a4e8300b002765eee878dsm728702pjh.36.2023.09.17.14.17.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Sep 2023 14:17:39 -0700 (PDT)
From:   "Doug Smythies" <dsmythies@telus.net>
To:     "'Ahmad Khalifa'" <ahmad@khalifa.ws>
Cc:     "'Jean Delvare'" <jdelvare@suse.com>,
        <linux-hwmon@vger.kernel.org>,
        "'Guenter Roeck'" <linux@roeck-us.net>,
        "Doug Smythies" <dsmythies@telus.net>
References: <002101d9e7e0$f67c4490$e374cdb0$@telus.net> <1b747280-a1cc-d125-a40d-c3bcce39297e@roeck-us.net> <322119da-0de6-ffe4-d2cb-0d7cda1c4a53@khalifa.ws>
In-Reply-To: <322119da-0de6-ffe4-d2cb-0d7cda1c4a53@khalifa.ws>
Subject: RE: hwmon: (nct6775) Regression Bisected
Date:   Sun, 17 Sep 2023 14:17:42 -0700
Message-ID: <001501d9e9ac$656a1cc0$303e5640$@telus.net>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-ca
Thread-Index: AQIVV+zLPPY/GAerH63YAbr+MKT6uQG7juHtAZ8RBiqvjdCwcA==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Ahmad,

On 2023.09.16 009:43 Ahmad wrote:

> Thanks for the detailed report, Doug.
> Would you be able to test out a fix please?
>

That request was superseded by a subsequent email,
already replied to.

> It's a basic guard line as _alarm attributes are assumed to be there 
> when a sensor exists, but the device doesn't have an alarm for in5 (VIN8
> on the device)
>
> If you could also confirm that your /sys/class/hwmon/hwmon?/in5_alarm
> file is there and showing 0, that would be great.

But I forgot to reply to that part:

The file is there, and the content is 0.

$ ls -l /sys/class/hwmon/hwmon?/in5_alarm
-r--r--r-- 1 root root 4096 Sep 17 14:14 /sys/class/hwmon/hwmon3/in5_alarm
doug@s19:~$ ls -l /sys/devices/platform/eeepc-wmi/hwmon/hwmon4^C
doug@s19:~$ cat /sys/class/hwmon/hwmon?/in5_alarm
0

I had to go back to an unpatched kernel 6.6-rc1 for the above.
With the kernel I compiled yesterday for the test patch, the file was not there.

... Doug

