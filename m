Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57316C77B73
	for <linux-hwmon@archiver.kernel.org>; Sat,  6 May 2023 12:59:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbjEFM7j (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 6 May 2023 08:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbjEFM7i (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 6 May 2023 08:59:38 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B5A18DE1
        for <linux-hwmon@vger.kernel.org>; Sat,  6 May 2023 05:59:37 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64115eef620so25142055b3a.1
        for <linux-hwmon@vger.kernel.org>; Sat, 06 May 2023 05:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683377976; x=1685969976;
        h=content-transfer-encoding:in-reply-to:subject:from:cc:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=weWlpRdoRqGvHpQn30Fm6aST3s/L6xn20U1KwS4Mnw8=;
        b=sYXPSjUMMNIVAk9pOa3B8+Nkt8cKgybNVxKPlXBgBRLdY93ygBrXMSUj9RmLZRPB2g
         6Rx+71gEGGVn9s+1a4Ei3ay9VwCboOf7lfHeafq68fejVNstkpYeUfGxUr1BC59GnGuZ
         3w+FhL1Lyjk1bnA3UzIzXukFzScWyJthpFXW3O3D6Glhyt3bXxgExOJimyW8Ax714oV7
         /RwQtShSFJMheGnPs/fwDryzhSsuwtq4F2BQGLH6/0UbnIy4zlWRU4uV3SGFfsB4aeAz
         cz48a+kQBJhxgTCo/A1sAsi+mDqhLU2N4llB0kDNsiB81nQBn6p/kYQc/W23V/pWGCcU
         xvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683377976; x=1685969976;
        h=content-transfer-encoding:in-reply-to:subject:from:cc:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=weWlpRdoRqGvHpQn30Fm6aST3s/L6xn20U1KwS4Mnw8=;
        b=bOqXsNl+sK36EtvZYN9xq9RkTZZjL0oE6g4B3CFGThX+7O9Uj2IogTcZDTmsqP2VOe
         qmDQik5bbwXl9dfzcxEIRKt7qtCnAf0vatLUMefnt66phlaCsiyvnMOY1JNMX9jK7STs
         RCPpFqBjMlr3NCmF2+m49khqWaVncwEFAlB+dFMcK/Jtmqf/y4YWHm5N4E0FSDUWlhvj
         lkaYWcJIC+zXy7nn5ovbd57/JGWm8AA5PqG4j9kTDvo3Vi3dl6rJHQStuTVfNSXl6i25
         zjziDdm9Yt12ugPZ3+OI4AVCdKE8X8DSJZ4tWde7tdI+qyOg3H3gsP5HlYipF6aaw+R5
         pQZA==
X-Gm-Message-State: AC+VfDziLD+7nmJ4ebZfqukUm2j191h4L3qfFy18XU/lL2aj16wF/Mpd
        3lIdSyclE3zJa4H6/6sgF74y6gW4vdg=
X-Google-Smtp-Source: ACHHUZ59bglRmNVRUj1ccjYZj4IV9o5GDoc0Zb10jugXQJN4r70LacIQjJw5QeCa7Jp0Mw/SCJHyRQ==
X-Received: by 2002:a17:903:2451:b0:1a6:9762:6eed with SMTP id l17-20020a170903245100b001a697626eedmr5318659pls.22.1683377976490;
        Sat, 06 May 2023 05:59:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w10-20020a170902e88a00b001a682a195basm3619430plg.28.2023.05.06.05.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 May 2023 05:59:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5704a3ac-3097-74d5-e5a7-993fcd78a1e7@roeck-us.net>
Date:   Sat, 6 May 2023 05:59:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To:     jurgenacc@tutanota.com
References: <NUjvz8u--3-9@tutanota.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: ASRock B650E Taichi support
In-Reply-To: <NUjvz8u--3-9@tutanota.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/6/23 00:21, jurgenacc@tutanota.com wrote:
> Hi,
> 
> I found this repo (https://github.com/petersulyok/asrock_z390_taichi <https://github.com/petersulyok/asrock_z390_taichi>) mentioning that the ASRock z390 Taichi was able to see the sensors through lm-sensors if the nct6775 driver was loaded since it is using a Nuvoton NCT6791D. I have the ASRock B650E Taichi motherboard, but it has a different chip, I believe it is the Nuvoton NCT6796D-S. I tried enabling the ntc6775 driver to see if I was lucky, but I get an error: "modprobe: ERROR: could not insert 'nct6775': No such device".
> 
> The author of the repo suggested me asking you if support for the Nuvoton NCT6796D-S is there. If not, I can help test it. if there is, I would love to make it work in my PC.
> 

First of all, please copy linux-hwmon@vger.kernel.org on all inquiries regarding the
hwmon subsystem in the Linux kernel. If you do not want your query to be public,
please don't ask.

Yes, the kernel does support NCT6796D. I don't know about NCT6796D-S. Please provide
output of sensors-detect. It may be possible that the driver does not load because the
chip memory space is reserved by ACPI. If that is the case, you should see an error
message with dmesg. Also, of course, the kernel may not support the chip if you are
running an old kernel version.

Guenter

