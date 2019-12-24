Return-Path: <SRS0=lH8M=2O=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593E0C2D0CF
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 15:59:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2298C206D3
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 15:59:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXMrhr96"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfLXP7j (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Dec 2019 10:59:39 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39985 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfLXP7j (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Dec 2019 10:59:39 -0500
Received: by mail-pj1-f67.google.com with SMTP id bg7so1371881pjb.5
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Dec 2019 07:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BfOEQYvXoLfrpgtv1PD8dPqBj6a369pnY1llXDmfH68=;
        b=FXMrhr96GpMGI8YV0dsawtkPPYJhLHWyo5CdafVKzU727qtCgGYQ7TndxO5p9H7Xqz
         h5xs0OBy+oqsRMImNtoRP9kcBv1KeuWCH/j2enKRhBAKvpm7U7uqNQ8/M6oJJe5ZDGy/
         EmEIhspqES26E28qys6hzZ/dTj5WCdgXzfKig1sQC0cOhXujZY7uvEoHOOpzlEiP6sPt
         6+NuY/nzUpIWpwshFJ9KuGBSTEOnRrxBik3inhrVFGtKogj4244nbe3nW4cYCEeQSEJ1
         CMa7C4tXZgBVGynhZZ9CbqC1N1pjRdcP31TlB6yl7HaeLyzZYiuQwRS6IbVnQlILVu3o
         LFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BfOEQYvXoLfrpgtv1PD8dPqBj6a369pnY1llXDmfH68=;
        b=WbsmKB1f4WoU7DX6a6pl5x1pw/h7JSXLvCPt2cZfZpwtKISpuqgeJOthH9duFnUUpJ
         ucy1hrJxGz+yBHAvSpadmMRER0w8wr6YLfe4ZbTQWeZM8cJsjvCcZLMNnvQRifibIBqy
         s3S7vIba8En4vTTSPc5hZRme5m6CLig+bENB77xIJyGFWW6dEEKh2IBVgCJSmOddKmwb
         jLJXpRWB4svnzi3yLf47kmZOa0KnSzZenoPTrft+hArj1XYWmhlkpAGzJc+N06+obxIZ
         jJoKs9An7vOtcSg6760ijail11UNsWnUQRjXOeqLKonrUhBtiircaVYGO+eqpecBtuOG
         JdIg==
X-Gm-Message-State: APjAAAUAocPrwdUz/oXU3rUxxT9D20sEvhnDtr3c0L9yJIqu8gVxbbwJ
        8Vo8F9M90Pbq45NQrj7BqDs=
X-Google-Smtp-Source: APXvYqwn3xuIVrm1yacKiJ2zoVcA9icL6nP4Lobq1eRT3OPS2a2csIGwpYngggqzTQpVZK92lXZXvw==
X-Received: by 2002:a17:90a:d081:: with SMTP id k1mr6845600pju.57.1577203178690;
        Tue, 24 Dec 2019 07:59:38 -0800 (PST)
Received: from mua.localhost (99-7-172-215.lightspeed.snmtca.sbcglobal.net. [99.7.172.215])
        by smtp.gmail.com with ESMTPSA id d65sm29397802pfa.159.2019.12.24.07.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2019 07:59:38 -0800 (PST)
Reply-To: pgnet.dev@gmail.com
Subject: Re: kernel 5.4.6 + Ryzen 3700X: "Can't display frequency and others
 of Ryzen7 3700X"
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     marcel.p.bocu@gmail.com
References: <bb629ef6-a669-8849-17f4-481c8c9f9347@gmail.com>
 <b2f72e65-4a80-0aaf-ce7e-0880fdcf60c7@roeck-us.net>
 <2c858787-1e5e-77e4-30ef-f17036b205c2@gmail.com>
 <121bee85-6369-4b32-2504-c1d104ea2bd6@roeck-us.net>
From:   PGNet Dev <pgnet.dev@gmail.com>
Message-ID: <4a1e2dc9-3303-8dd5-7bbd-3605a43bffe1@gmail.com>
Date:   Tue, 24 Dec 2019 07:59:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <121bee85-6369-4b32-2504-c1d104ea2bd6@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/24/19 6:25 AM, Guenter Roeck wrote:
> You'll probably see a note about an ACPI resource conflict. If the board
> with NCT6796D wasn't yours, that may not be the case.

this certainly looks like it might be the source of the problem,

...
[33002.934396] nct6775: Found NCT6793D or compatible chip at 0x2e:0x290
[33002.934401] ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts with OpRegion 0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20190816/utaddress-204)
[33002.934406] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[33017.944153] nct6775: Found NCT6795D or compatible chip at 0x2e:0x290
[33017.944158] ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts with OpRegion 0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20190816/utaddress-204)
[33017.944164] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[33033.152135] nct6775: Found NCT6793D or compatible chip at 0x2e:0x290
[33033.152140] ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts with OpRegion 0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20190816/utaddress-204)
[33033.152146] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[33085.807200] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
[33085.807205] ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts with OpRegion 0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20190816/utaddress-204)
[33085.807209] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[33519.421923] usb 4-1.4.3: reset SuperSpeed Gen 1 USB device number 4 using xhci_hcd
[34160.099747] it87: Found IT8728F chip at 0xfff8, revision 15
[34160.099769] it87: Beeping is supported
[34160.099844] it87: Found IT8728F chip at 0xfff8, revision 15
[34160.099865] it87: Beeping is supported
[34212.426003] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
[34212.426008] ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts with OpRegion 0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20190816/utaddress-204)
[34212.426014] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[35066.143893] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
[35066.143900] ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts with OpRegion 0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20190816/utaddress-204)
[35066.143907] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
...


if it is, iiuc your earlier comments, sounds like a BIOS issue.
