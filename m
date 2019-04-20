Return-Path: <SRS0=/An6=SW=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD19C282E1
	for <linux-hwmon@archiver.kernel.org>; Sat, 20 Apr 2019 02:56:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 896F721736
	for <linux-hwmon@archiver.kernel.org>; Sat, 20 Apr 2019 02:56:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVMgpORq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfDTC44 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 19 Apr 2019 22:56:56 -0400
Received: from mail-it1-f178.google.com ([209.85.166.178]:51294 "EHLO
        mail-it1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfDTC4z (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 19 Apr 2019 22:56:55 -0400
Received: by mail-it1-f178.google.com with SMTP id s3so10907214itk.1
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Apr 2019 19:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=9JuYx02nbceVovv2zRQczHs79flygZIpDI9YZZCWyuY=;
        b=nVMgpORqyLN0ky1a0xv/XnIBi67i2xhHAdmjyLqe5li/L0xkWxoJy1yBkr+WmkbNqc
         O2+6twNRg9x+GaNaFHn+Kxpfy2zY9qkzcrU4ArKs2Ohn03B3Ex5PT1XDEhIvfxBIN+sQ
         aH6vf7wuEqHa+Rm2Jx2nQQU1et44TCFwPg41h3r8971jc93o7wpCi2U8IhoZO35SssZE
         a7d6yPTPwmy9KuIejGR3sZ2jr3GfHu4BxqrpWZHJksW7G802jEU0gyycnCBdym/sTeAq
         m8MTVqgDCKnHtD61D0QfH5GKeEPc8QB1iWdc4lrOWVcv1YYar95JYjOEUgldNS5e8uON
         i12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=9JuYx02nbceVovv2zRQczHs79flygZIpDI9YZZCWyuY=;
        b=B0MMl/SUYk2bpM+iJDxS/yf5GyIe7Qj0lENUeozelDpvaObhEMj9hFmBBGW1bZs8l9
         lE9KquZTzWJV96fZT3K3JQ2ajQhyxb1naoNuYxppJrYAzu9ggtpW2UmUtwlJsYdTsGEi
         40cFAA6NdowglMjmZb3sdsTB8RB/q1NjtczodARt1TJ1a5qHy5isYRYLSI0/IxKeoDBh
         GrrYEjR3Qn3tNyUX+AgLPky97U/xerR3Qoe2E3LWropy1x1qqddEWKUNx8ZVQur5kJU/
         z5BrFa+uqsvyNyH8AfR6s2FIC8vgpEGog24zfCs74GCCgSUYM3f9czjw38WspqdR72vQ
         wLTw==
X-Gm-Message-State: APjAAAUXdXCQSGzCNk7NyC9p/ceK3SqxCEt1CR/A2OsFcH6uzvs0ymrB
        QO5FUyP3+9oWr8H2Wk93d3oYeb1gANg=
X-Google-Smtp-Source: APXvYqwyrBYNgIQG4FZxuxJ1Z5ZT5rrQzLEHLyU1NW6H1LUmM1LVtsdlAaZWJ3tZgoikR+cjMqCQ5Q==
X-Received: by 2002:a02:9f19:: with SMTP id z25mr5021752jal.2.1555729014979;
        Fri, 19 Apr 2019 19:56:54 -0700 (PDT)
Received: from [10.0.0.19] ([135.0.225.35])
        by smtp.gmail.com with ESMTPSA id t22sm1450443iob.16.2019.04.19.19.56.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Apr 2019 19:56:54 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [hwmon:hwmon-next 119/119] drivers/hwmon/max6650.c:798:10:
 warning: passing argument 2 of 'thermal_of_cooling_device_register' discards
 'const' qualifier from pointer target type
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <201904192317.2UiQUP23%lkp@intel.com>
Date:   Fri, 19 Apr 2019 22:56:52 -0400
Cc:     linux-hwmon@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <466A267B-CF4E-4CE4-AFF3-5844C9F1F83A@gmail.com>
References: <201904192317.2UiQUP23%lkp@intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3445.102.3)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



> On Apr 19, 2019, at 11:36, kbuild test robot <lkp@intel.com> wrote:
>=20
>>> drivers/hwmon/max6650.c:798:10: warning: passing argument 2 of =
'thermal_of_cooling_device_register' discards 'const' qualifier from =
pointer target type [-Wdiscarded-qualifiers]
>             id->name, data,
>             ^~
>   In file included from drivers/hwmon/max6650.c:43:0:
>   include/linux/thermal.h:448:1: note: expected 'char *' but argument =
is of type 'const char *'
>    thermal_of_cooling_device_register(struct device_node *np, char *, =
void *,
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Hmmm... I forgot I was indeed using a patched version of =
thermal_of_cooling_device_register (submitted already: =
https://marc.info/?l=3Dlinux-pm&m=3D155560541430929&w=3D2)

I will v5 using client->name instead, which is non-const char[].

>   In file included from include/linux/i2c.h:30:0,
>                    from drivers/hwmon/max6650.c:38:
>>> drivers/hwmon/max6650.c:802:5: warning: format '%d' expects argument =
of type 'int', but argument 3 has type 'long int' [-Wformat=3D]
>        "thermal cooling device register failed: %d\n",
>        ^
>   include/linux/device.h:1400:22: note: in definition of macro =
'dev_fmt'
>    #define dev_fmt(fmt) fmt
>                         ^~~
>>> drivers/hwmon/max6650.c:801:3: note: in expansion of macro =
'dev_warn'
>      dev_warn(&client->dev,

Been' compiling through yocto, which puts compiler outputs in log files. =
Warnings don't fail compilation so bitbake doesn't print them. Excuses, =
excuses... shame.

V5!

