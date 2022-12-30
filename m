Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B79C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Dec 2022 22:46:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235656AbiL3WqI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 30 Dec 2022 17:46:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235652AbiL3WqG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 30 Dec 2022 17:46:06 -0500
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A824A1BB
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Dec 2022 14:46:04 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1441d7d40c6so26115785fac.8
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Dec 2022 14:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YeSU5ercWcLVeEWr4l6/Z46+hsPU0FSpZ5I6zH0vmw8=;
        b=MRLdTvPrF80zbRHlXJP8sXv+fqxxvPnz6mnAlHKO7+SdoDnNhkyYvNWo00q75oaPje
         ZteARByaQASPUaqnLF+26gNtAzTzZbbJmDFQyN0SiZlgC8gO0O51r/NVJC61QxVrqL4B
         Fqv1QpBowaZGRLpH0gk+4TnAVNmygS8TLx19RpmVGT6SUC4nCOhRFbrEaMaN5m1qA/Hh
         kRijqw6WsnYUQRpsC7wWK/X0zn99tX52ufK9OBJ/3PVoMI+3QenZmeuazUC/vs7cOc5f
         FnOQaAShcbjojpXEEYV9DCStO/F2OYdrPmMER2Wv8l/cbfK7iGQxvi17X+ily/+6wcwm
         PESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YeSU5ercWcLVeEWr4l6/Z46+hsPU0FSpZ5I6zH0vmw8=;
        b=A4ncUpW++PmxgUVM9q32puO4Yc2wry8fvrCjJ1mY9Cu7uMELFO1BzdmIX7xHfcaEKO
         WCJKuBHKYg3tVux/TA3ik1NybPn/rZ17/VXRFxoaleqarnsQm8tFTkGGadnWVtaJl8ou
         bjOh7jkUySsbRAFP+cDAZzRjks7whprUiXw494AEPXQENBhqNIhPUaExZboqAEKNEnEp
         qi4YH1VqrvctqbnkmkClIM4L1HrtlVu4uR3QLMX6TXIB8h9Z37xZXg3pm/MxnztbjCWF
         F1KdN0G0yix9Eye6uAjQmfCoCPrxa5sDZ97yxJu45Yr1C27QomA5qj56jJxhFRcn1LlK
         BVnw==
X-Gm-Message-State: AFqh2kq2slggFZC9De7wPJ7B8oMiT9+UyGDw2BNkObDddfdplKH3+cfi
        pLRkrlk7WF3PuffHS47Gm7U=
X-Google-Smtp-Source: AMrXdXu1FRZsXYrNsqR5ggzXfIZuuLgsEIChC9yjpKN56fjDLfVue8TQMzj8qEpp5EcUEQ9S1Klkrw==
X-Received: by 2002:a05:6870:d87:b0:14b:9402:8d50 with SMTP id mj7-20020a0568700d8700b0014b94028d50mr15129303oab.9.1672440363633;
        Fri, 30 Dec 2022 14:46:03 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ej18-20020a056870f71200b0014f9cc82421sm9469483oab.33.2022.12.30.14.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 14:46:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 30 Dec 2022 14:46:01 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Sebastian Arnhold <sebastian.arnhold@posteo.de>
Cc:     Christian Lamparter <chunkeey@gmail.com>,
        linux-hwmon@vger.kernel.org, Ahmad Khalifa <ahmad@khalifa.ws>
Subject: Re: [PATCH RFT] hwmon: (nct6755) Add support for NCT6799D
Message-ID: <20221230224601.GA1220968@roeck-us.net>
References: <184c3523-fb00-b0df-cf29-cc1b171c4ab4@gmail.com>
 <20221230175021.GA1136102@roeck-us.net>
 <c8d68feb-d44f-02c6-0a08-d199cef00b46@gmail.com>
 <20221230214855.GA3881237@roeck-us.net>
 <b31ed9ec-3bd5-e032-ea03-b116ece4dac3@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b31ed9ec-3bd5-e032-ea03-b116ece4dac3@posteo.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Dec 30, 2022 at 10:13:48PM +0000, Sebastian Arnhold wrote:
> Thank you very much for the patch, Guenter Roeck!
> 
> I just compiled it using the mainline Kernel as a basis, but
> "sensors-detect" still claims there are no sensors detected on my ASUS TUF
> GAMING X670E-PLUS WIFI.
> 
> Trying family `VIA/Winbond/Nuvoton/Fintek'...               Yes
> Found unknown chip with ID 0xd802
>     (logical device B has address 0x290, could be sensors)
> 
> dmesg yields the following output:
> 
> [  465.372161] nct6775: Found NCT6799D or compatible chip at 0x2e:0x290
> [  465.372166] ACPI Warning: SystemIO range
> 0x0000000000000295-0x0000000000000296 conflicts with OpRegion
> 0x0000000000000290-0x0000000000000299 (\RMTW.SHWM) (20221020/utaddress-204)
> [  465.372170] ACPI: OSL: Resource conflict; ACPI support missing from
> driver?
> 
> So the driver definitely works and recognizes the chip. Any idea why
> lm-sensors can't access it?
> 

You need ll to add "acpi_acpi_enforce_resources=lax" to the kernel command
line to be able to access/test it. Of course that is less than perfect and
may affect other devices.

Ultimately it will be necessary to add WMI support for this board to the
driver, but I can not do that since I have no means to test it, and there
is some indication that WMI may no longer be supported in the X670 boards
from ASUS.

Guenter
