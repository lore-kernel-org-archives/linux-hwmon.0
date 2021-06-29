Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8866FC11F65
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Jun 2021 02:49:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60ADB61CEF
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Jun 2021 02:49:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbhF2Cvj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 28 Jun 2021 22:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbhF2Cvj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 28 Jun 2021 22:51:39 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31989C061574;
        Mon, 28 Jun 2021 19:49:12 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id k11so24867976ioa.5;
        Mon, 28 Jun 2021 19:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4pGYnfbKQETEAKdXNWRGKa4i4FYZw839aiP9K57DQKI=;
        b=OVFmIZPDk6KlNwyhu7E63CFwZOYklW0CSM0oYNCKgqOmt/AC3edk0PtdHL8gr0PITS
         h/hOSOXcLTy2SDbwEXKwjMQByVuhdmwqxSamQy4s1MXhl/12IMQkfLIuCzFGjHiEwdYH
         rSv+DzBmKMPkFAoIZKyP1pDBIHlejYErQZ7GrhRjhhtQJcVDfLGKWVVBfQVOlXkmxbb6
         GOHUHwPZzcxpWpLGqxuzcfj5hPnv6F+4jY1GRxyy7fLKV6fISTY+EWBNxMj87CWl6aTW
         1+Zttz490ua2bcKI/2h2pjPB1J97thXdmlh6W89hIhRfH7Qb4M0d6a4hspMkOsAHA0e2
         G8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4pGYnfbKQETEAKdXNWRGKa4i4FYZw839aiP9K57DQKI=;
        b=VylcDNBC4cKmMEcCHa/2TyggK76fzRtnIe5y7y56G2RO29cbta3iz/0ON+2lzWMn7V
         hTcmHqZWMDPslKlYwOnR1QXA4G0jMebU9O6dzKNZiairFFGEMoDCVRmlmi1vOaXsL6rP
         0X4V6OpuprIcLPZg/EnnRuDPTIpZhDWkgivv6aUYyGxocEWelLWvomPscf15YONqXVkV
         0ML98M8vTU0pn8eSHS9DKVE0JaRsmvb1g/VkMJgAcW/nUdEKTimmLFXsCpP1uwzKGai+
         NUhEMagrbEtcKOAarzM1vEUeTKxYLSLzMsju02dwxIe8DkZ8u/gm/8I/5ZU/34sbierr
         UEKA==
X-Gm-Message-State: AOAM5322fiotrZTsjY9hbbANFDoOfd+yqgdSU/oTCkjuauCQZBsJp8Lw
        mQkCJ9isPD8e8KToP9Pfz3rTTCj/THnmS64+HTc=
X-Google-Smtp-Source: ABdhPJx9811AFz4O4szBF1T/od4Nhnh3j/LT+KAqZzs/XIJR6AFBugpc7N1jDz/UbqN7XF5NhymXfeIc8TC/PC/tB70=
X-Received: by 2002:a6b:490d:: with SMTP id u13mr2063866iob.176.1624934951615;
 Mon, 28 Jun 2021 19:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210623005426.15731-1-ainux.wang@gmail.com> <20210624131752.GA2788536@roeck-us.net>
 <CAPWE4_xsY0ZAwm5g=Ujm_63WiS-sYMV42cpMD=cr65QNWLZaGQ@mail.gmail.com> <a55cde2b-ce51-fc7c-6b73-e4394d584ee4@roeck-us.net>
In-Reply-To: <a55cde2b-ce51-fc7c-6b73-e4394d584ee4@roeck-us.net>
From:   Ainux Wang <ainux.wang@gmail.com>
Date:   Tue, 29 Jun 2021 10:48:36 +0800
Message-ID: <CAPWE4_y4wsY596RK_U2r1ZaGtfAAxxs=wR0OkvBP_PSgsgXcPA@mail.gmail.com>
Subject: Re: [PATCH v5] hwmon: (pmbus) Add support for MPS MP2949A
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     jdelvare@suse.com, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        teng sterling <sterlingteng@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 29 Jun 2021 at 10:20, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 6/28/21 6:26 PM, Ainux Wang wrote:
> > On Thu, 24 Jun 2021 at 21:17, Guenter Roeck <linux@roeck-us.net> wrote:
> >>
> >> On Wed, Jun 23, 2021 at 08:54:26AM +0800, ainux.wang@gmail.com wrote:
> >>> From: "Ainux.Wang" <ainux.wang@gmail.com>
> >>>
> >>> Add support for MP2949A device from Monolithic Power Systems, Inc. (MPS).
> >>> This is a triple-loop, digital, multi-phase controller.
> >>> This device:
> >>> - Supports up to three power rail.
> >>> - Provides 6 pulse-width modulations (PWMs), and can be configured up
> >>>    to 6-phase operation for Rail A , up to 2-phase operation for Rail B
> >>>    and up to 1-phase operation for Rail C.
> >>> - The PMBus registers are distributed into three pages: Page 0, Page 1,
> >>>    Page 2. Page 0 contains the registers for Rail A and most of the common
> >>>    settings for all of the rails. Page 1 contains register information for
> >>>    Rail B. Page 2 contains register information for Rail C.
> >>> - The MP2949A supports both 5mV VID step and 10mv VID step for IMVP8 and
> >>>    IMVP9.
> >>>
> >>> Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
> >>> ---
> >>> v5:
> >>> - Moved change log to right here.
> >>> v4:
> >>> - Removed mp2949a_read_byte_data().
> >>
> >> Your other question left me confused. I had previously asked to provide
> >> a rationale for filtering out the PMBUS_VOUT_MODE command, and I had
> >> stated that "the chip does not support it" is not a valid reason. However,
> >> "the chip does not support it but does not report an error when reading
> >> it" _is_ a valid reason. So what happens when the PMBus core reads
> >> PMBUS_VOUT_MODE ? Does the chip return an error, or some random data ?
> >>
> >> Thanks,
> >> Guenter
> >>
> > Hi, Guenter
> >
> > I have not been clear about the cause of this problem that
> > "the chip does not support it is not a valid reason".
> >
> > However, i have added some "printk", i found the chip will return some
> > random data,
> > when the PMbus core reads PMBUS_STATUS and PMBUS_VOUT_MODE.
> >
> > So, I do not known what should i do, when the PMbus core reads PMBUS_STATUS.
> > and i have knwon that use "This chip do not support the VOUT_MODE command,
> > the chip does not support it but return some random data when reading
> > " instead of
> > "
> >                 /*
> >                  * This chip do not support the VOUT_MODE command.
> >                  * There is not VOUT_MODE command in MP2949A datasheet P29~P31.
> >                  * So this is EINVAL in here.
> >                 */
> > "
> > Now, there is only one question left, what should the PMbus do, the
> > chip return random data,
> > when it reads PMBUS_STATUS by i2c_smbus_read_word_data() or
> > i2c_smbus_read_byte_data()?
> > Can the PMbus core use  pmbus_read_status_byte() and
> > pmbus_read_status_word() instead of
> > i2c_smbus_read_byte_data() and i2c_smbus_read_word_data() ?
> >
>
> The driver should implement a read_byte_data() function and either
> simulate PMBUS_VOUT_MODE and let it return whatever makes sense for
> the driver, or have it return -EINVAL.
>
> For the status register, handling is a bit more difficult. For this, we will
> need an introductory patch. That patch needs to change pmbus_init_common()
> to call pmbus_read_status_word() and pmbus_read_status_byte() instead
> of i2c_smbus_read_word_data() and i2c_smbus_read_byte_data() (with page set
> to -1).
> The driver patch then needs to implement a read_word_data() function and
> have it simulate the PMBUS_STATUS_WORD command. Or, alternatively,
> have the read_word_data() function return -EINVAL for PMBUS_STATUS_WORD,
> and simulate PMBUS_STATUS_BYTE in the read_byte_data callback.
>
> Thanks,
> Guenter
Hi, Guenter

Very nice, that is what i mean, we have the same idea, I am going to
revise pmbus_init_common(),
pmbus_check_register and so on.

Best regards,
Ainux Wang.
