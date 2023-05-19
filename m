Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F65C77B7F
	for <linux-hwmon@archiver.kernel.org>; Fri, 19 May 2023 13:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjESNtL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 May 2023 09:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbjESNtK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 May 2023 09:49:10 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 021FABB
        for <linux-hwmon@vger.kernel.org>; Fri, 19 May 2023 06:49:09 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-64d2c865e4eso924373b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 19 May 2023 06:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684504148; x=1687096148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/uXqkbgg682geqq2iW+Dm3tS9R5qE+4ylmNW+VI328s=;
        b=gXi2WAYNjRpzLNFE+lmcMfXmJlY7x98veM7pe7xk7J2dFFGTRwE8gJa7fmFSx2A3oc
         w1Cuf1116iEy3n3FXXf/QFM6VsnJdxQ+ka1+HfHwQZJPtExqXugLTGNdCkv0DWGUslT2
         R461USdtn12xUHz7T5dZJgUASuo7/FSIR+1QDz635WDbXXtFl9ZdtPHhGl4R2DnmFlik
         EXnjYw8GuXpdSCCiAGoqhcVrsh8OY7JKutWvNoEPq59a1JUEalICq+/qc22raR6sPpOk
         +0Blv9lwCjzlaEiQFdynUlD8GJSEE3K+SAeG7/PZ+Ps6La3YHrOCzf4f6bNjmgaLUpsy
         YDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684504148; x=1687096148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/uXqkbgg682geqq2iW+Dm3tS9R5qE+4ylmNW+VI328s=;
        b=G+eabiDbRQ6RlmNaU4hhvBDi2DugR5I0Mn1VM68VOtI20E0ESSzY0AqMu3+YkMhrGE
         vUTNl48SUzkpTPpjM2qBHStVCDPVXynG0EhrD6QluddhbVc7kQkZS7sChrnHpUSfRYBz
         EHd+aJFPxvKXXSuKxcdUzyFznnEvlgv5DLSZt9qrvWfVGhyqoQ653RNWinyJ9R4+e0xf
         r020Jd+FLFXHf+NKDLhT+ZAk60KeJRGMWb/ZUaoZMlK2mfXTjMQd6At7bm4ul/f4Jeya
         SGNbYMArnH/EpUXXCfdNtlv0xwUItGiKr9pjuyLRYL08dcC3dIEck4wjw+bjPQ/ZNk7v
         73BA==
X-Gm-Message-State: AC+VfDzj5Q1gqEBrT5+VfvYo0X7F7QHB5uO4KcNnL1FVfKkfojvRmw51
        YC1n4eapM3W6/1yX8TlbwTW3fBxKEiE=
X-Google-Smtp-Source: ACHHUZ4DljzsYD1GpamCeztdtJlYIIlLOkd3H7tsLiA3uOUtgMQdUK57ypvBPiqzJMYpUw0VByjRQQ==
X-Received: by 2002:a05:6a00:138a:b0:646:663a:9d60 with SMTP id t10-20020a056a00138a00b00646663a9d60mr3922893pfg.10.1684504148433;
        Fri, 19 May 2023 06:49:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j27-20020a634a5b000000b0051b460fd90fsm3109751pgl.8.2023.05.19.06.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 06:49:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 19 May 2023 06:49:07 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     jurgenacc@tutanota.com
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: ASRock B650E Taichi support
Message-ID: <94fd7588-dd3a-4530-bfe8-a213b68dfc33@roeck-us.net>
References: <NUjvz8u--3-9@tutanota.com>
 <5704a3ac-3097-74d5-e5a7-993fcd78a1e7@roeck-us.net>
 <NVUpwQa--3-9@tutanota.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <NVUpwQa--3-9@tutanota.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, May 15, 2023 at 04:36:55PM +0200, jurgenacc@tutanota.com wrote:
> Hi,
> 
> Here is the output for sensors-detect:
> 
> # sensors-detect version 3.6.0+git
> # System: ASRock B650E Taichi [Default string]
> # Kernel: 6.3.1-arch1-1 x86_64
> # Processor: AMD Ryzen 9 7900X 12-Core Processor (25/97/2)
> 
> This program will help you determine which kernel modules you need
> to load to use lm_sensors most effectively. It is generally safe
> and recommended to accept the default answers to all questions,
> unless you know what you're doing.
> 
> Some south bridges, CPUs or memory controllers contain embedded sensors.
> Do you want to scan for them? This is totally safe. (YES/no):  
> Silicon Integrated Systems SIS5595...                       No
> VIA VT82C686 Integrated Sensors...                          No
> VIA VT8231 Integrated Sensors...                            No
> AMD K8 thermal sensors...                                   No
> AMD Family 10h thermal sensors...                           No
> AMD Family 11h thermal sensors...                           No
> AMD Family 12h and 14h thermal sensors...                   No
> AMD Family 15h thermal sensors...                           No
> AMD Family 16h thermal sensors...                           No
> AMD Family 17h thermal sensors...                           No
> AMD Family 15h power sensors...                             No
> AMD Family 16h power sensors...                             No
> Hygon Family 18h thermal sensors...                         No
> AMD Family 19h thermal sensors...                           No
> Intel digital thermal sensor...                             No
> Intel AMB FB-DIMM thermal sensor...                         No
> Intel 5500/5520/X58 thermal sensor...                       No
> VIA C7 thermal sensor...                                    No
> VIA Nano thermal sensor...                                  No
> 
> Some Super I/O chips contain embedded sensors. We have to write to
> standard I/O ports to probe them. This is usually safe.
> Do you want to scan for Super I/O sensors? (YES/no):  
> Probing for Super-I/O at 0x2e/0x2f
> Trying family `National Semiconductor/ITE'...               No
> Trying family `SMSC'...                                     No
> Trying family `VIA/Winbond/Nuvoton/Fintek'...               Yes
> Found unknown chip with ID 0xd802
>    (logical device B has address 0x290, could be sensors)

This is a NCT6799D. Support for it is pending.

> Probing for Super-I/O at 0x4e/0x4f
> Trying family `National Semiconductor/ITE'...               No
> Trying family `SMSC'...                                     No
> Trying family `VIA/Winbond/Nuvoton/Fintek'...               Yes
> Found unknown chip with ID 0xd441

This is a NCT6686D. It _should_ be supported by the nct6683 driver, though
the vendor may use an unknown vendor ID. WHat happens if you try loading
the nct6683 driver ?

Guenter
