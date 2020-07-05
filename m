Return-Path: <SRS0=nCRF=AQ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73531C433DF
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jul 2020 13:20:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CFA52073E
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Jul 2020 13:20:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="JcsLGNzK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgGENUk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Jul 2020 09:20:40 -0400
Received: from mout.gmx.net ([212.227.17.21]:51913 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726898AbgGENUj (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 5 Jul 2020 09:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1593955238;
        bh=QdKNbo7u0WvfgsF2qt4ROYmbR2AjRJwag1WXj9dfVMo=;
        h=X-UI-Sender-Class:Subject:From:To:Date:In-Reply-To:References;
        b=JcsLGNzK8KFpMJPwvqghgiYB0JUXyqGWe4Dpyp7f8f07VGFMokvUyWvaOHndra8Qr
         iN1A2LSu2X9D+i0XOIhvQGHNEPgM/bebCi+Krxd96JUyP6OsH4B72vl4UceSY8di0z
         jBzOB+EjvRhlZCNExJxqBru/A+VqFIDeDf2zkNGU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.2] ([84.190.131.209]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6DWi-1jyfDa1kl6-006c6s for
 <linux-hwmon@vger.kernel.org>; Sun, 05 Jul 2020 15:20:38 +0200
Message-ID: <2a4aff669c44ff56532ac721d687e2b38466b7c7.camel@gmx.de>
Subject: Re: hwmon (nct6775): Please fix Invalid temperature source error
 for NCT6798D
From:   Stefan Dietrich <roots@gmx.de>
To:     linux-hwmon@vger.kernel.org
Date:   Sun, 05 Jul 2020 15:20:38 +0200
In-Reply-To: <e4ad12d1-3dca-2ff5-a0a6-12dc6dc22c83@roeck-us.net>
References: <66053ce744dafbad6925df53b6ef2db1e2859740.camel@gmx.de>
         <e4ad12d1-3dca-2ff5-a0a6-12dc6dc22c83@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:V1aOQu4vJChPa9iOBSNNnvIiViXDIquWSSgKdRE/vhJQAqSj4fR
 lrS7xMslxqQOiDKEZm2jpzx8OCG7fuJ7clyN+GqEKpsRsAMp2nl+1RuhuhQ2uay5TH724p4
 mOr40/EJ9FcT7T2rSAbN7Z4E3zAdlVW5rH6mnknYdf8FfPtH8TweQwEbDubalebS5Z6bL95
 xsevO/QcJkjO+UnjAWLAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YpUaN0hlzLE=:bUFsXQaaGvpAfHWxrwBVAE
 GefcZcDGOEs1BXu5c0waSW3DTGoWIZnzaJEgfL+JxmR32ehtu9BwZCbDN4ilXVHrur0Vj6U5c
 yyQaH/GHZ8HR+W8/I00an1o+h56dhs7P+Zn+O4aIyYElqIp2kGuUc6W/NbElLbXOAIjYqFrw5
 YuoILqs17ElFvTehSyPIasvaNgTC2AWN5YHk+AWvovxPd0T5WbtD2dcximCZbhoyvvzpd5Yr0
 zIIGunlko977H+BOFMMiwcaJTdMQjEhvBWygS7+03EWxUVYG/6u8R9Q99SK4ziDEg1HGzXqIq
 soDqVs3kuAVGDfpXQZoV4UqMgsGNTT/2HY5p8Ditl60etIDuomaMoafcuxvmdzILlown9aMeb
 GyrORWszb7ZH7c9ic/un7YmB9QqRRtdFvOTj6v7JoML6awDuwZdOkymYocY+KwOAil9IGavym
 c8FC5xBzU8Wo0ashvhOf2OeWTs+NpWaa30TXKkEB6dKF3YyY0Y6IC4I9wNL7YxAHyqDRcb0Pg
 UTAE4nCrHEjIW+xLDe/2qv5+1GKGbdxjbIxPjbCe270V7gPflqbQgahS5csJjhnDtnwEm6kmR
 Oo9Kye2hOXahL94hAM9Hmx3rpLLTXDx5h0dGv43AQqUURfp68OxOTIL5bI6c+F5xihh2NuHdB
 niRZ1WUkEAJM8sDhSJcASfI45Hmrr6yLzTJmHON8IjQGdo/vhiNUMzXH+JYnndk8pwSSsScy1
 3/Mc24WijGCda6KIzccBSH6oFX9eB3+cXUN9Zl7frqsKYOIwZBvXHejK4nmUy4DyVDgQGxmkC
 tq2+Go8RFWV2N5BBgbLe0mRKWn3RiIM/9/dPQIuSedVGVZPE+locLtEdeR6O4WisUhxpvw/De
 UiTRG1lCjbOk2/3ueq1ncUPr9VhlpvEXDxU7KsAwLN+bxN5W40uBeC0/q+9zxyx9E0c82TVJ4
 c0HOvOfro9E0dPIU8Vtu03xWXzlh0g8PmOvyEjLoLQVbl9SE8uzOGdmV2jzLo8q5rVqL09hVX
 +PS9JpKT/drI1hH2I139SJcQ2NHYzrAQV3NafHm7dcFkpmOsDH2H86ZygcrEV++hyOZc8YZFp
 TyQly5eWxGgSFhSXF2xWmdW7WCb2hVC5TcAtSV75EtLNaaklDu8/1OU+nLwUO5DttjnKS6reu
 bkL8QIQBTURM4tjJRRfAPx6VSXakZNEZCItg6o9zBOA8ceuhNT3MRnTZybcQjPPpqyuVbzp3l
 Su80Y2Wa0MKSEtrTR
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 2020-07-03 at 10:10 -0700, Guenter Roeck wrote:
> On 7/3/20 9:03 AM, Stefan Dietrich wrote:
> > Hi all,
> >
> > with my Asus Formula XII Z490 and 5.7.0-7.1-liquorix-amd64 I'm
> > getting
> > the following error messages during boot:
> >
> > nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> > nct6775 nct6775.656: Invalid temperature source 28 at index 0,
> > source
> > register 0x100, temp register 0x73
> > nct6775 nct6775.656: Invalid temperature source 28 at index 1,
> > source
> > register 0x200, temp register 0x75
> > nct6775 nct6775.656: Invalid temperature source 28 at index 2,
> > source
> > register 0x300, temp register 0x77
> > nct6775 nct6775.656: Invalid temperature source 28 at index 3,
> > source
> > register 0x800, temp register 0x79
> > nct6775 nct6775.656: Invalid temperature source 28 at index 4,
> > source
> > register 0x900, temp register 0x7b
> > nct6775 nct6775.656: Invalid temperature source 28 at index 5,
> > source
> > register 0xa00, temp register 0x7d
> >
>
> There is nothing much if anything we can do about that. The NCT6798D
> datasheet reports temperature source 28 as reserved. You could ask
> Asus for support, but their usual response is that they don't support
> Linux.

Thanks for the quick reply. Would you briefly outline why this makes it
inaccessible for the NCT6776 driver? Is there a pool of registers that
I might probe for values that could be related to the desired
temperature values, even if they need to be scaled?


Thanks,
Stefan

> > During sensors-detect, most of the standard temperature, voltage
> > and
> > rpm sources are recognized, however, some of the values,
> > particularly
> > voltages, are off quite a bit. In addition, output of additional
>
> Voltages need to be scaled. Scaling factors are mainboard specific
> and
> would have to be determined by comparing BIOS reported voltages with
> raw voltages (board vendors usually don't provide the information).
> Scaling factors can then be entered into /etc/sensors3.conf.
>
> > temperature sensors (via headers on the mainboard) which are
> > reported
> > fine in BIOS, are missing.
> >
>
> Again, this is mainboard specific. We don't know how the hardware
> reports
> those values. Only ASUS could provide the necessary information.
> Unfortunately, as mentioned above, they are not exactly known to be
> Linux friendly.
>
> Guenter
>
> > Booting with acpi_enforce_resources=3Dlax doesn't solve this issue.
> >
> > I'd be happy if anyone would be able to fix this issue or give any
> > pointers on how to do so. Unfortunately I only have very basic
> > coding
> > skills, but I'll be happy to assist in debugging.
> >
> >
> > Cheers,
> > Stefan
> >

