Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B12C433F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 17:59:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9D1C61252
	for <linux-hwmon@archiver.kernel.org>; Mon, 20 Sep 2021 17:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356718AbhITSBK convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 20 Sep 2021 14:01:10 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:60401 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349765AbhITR7J (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 20 Sep 2021 13:59:09 -0400
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MNKqC-1mDT3e1Rf8-00OnLa for <linux-hwmon@vger.kernel.org>; Mon, 20 Sep
 2021 19:57:40 +0200
Received: by mail-wr1-f49.google.com with SMTP id q11so32119684wrr.9
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Sep 2021 10:57:40 -0700 (PDT)
X-Gm-Message-State: AOAM5313IUwstCe7w7dFP68yV0zI9mKKZBhOOYes5QXNoxeom+ahkadb
        t0cgD6uFo/LsrU9onyOYsAFts9vIQ8W9ePIzpMA=
X-Google-Smtp-Source: ABdhPJzc+jdmOu307h9oYylcyqhGJvkKcOjVAyCg8sN0wYB7IEeLKAE2XeBmCKph4yP0sYHzsQxREy66fBeYmR5zWWE=
X-Received: by 2002:a05:6000:1561:: with SMTP id 1mr20180787wrz.369.1632160659999;
 Mon, 20 Sep 2021 10:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210910071921.16777-1-rdunlap@infradead.org>
In-Reply-To: <20210910071921.16777-1-rdunlap@infradead.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 20 Sep 2021 19:57:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1o5gQCofMfHJHBXPemhGskOpEgj7f5pXbPF=8U-nwQSA@mail.gmail.com>
Message-ID: <CAK8P3a1o5gQCofMfHJHBXPemhGskOpEgj7f5pXbPF=8U-nwQSA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: dell-smm-hwmon: fix unused variable error
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Armin Wolf <W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:UU8t2b+LCSjYNPQSLjny7VJ3cBiHNcqQpCrXA1rBQbcWLssX0cj
 bQSma2IsQVT12L5ip0E307BnykBd9PpSmX8vMkfG6lv4KsRCDA8jlssu3RcGBEUqoejDjQn
 OyyYqmgK7Ssqy3SkJP4Go5KrDzzJgvV54s7xbudDKuRvHjYbYLMeiYuCOIXvNKYKdjSHA5n
 Gz71cnGnCz1BO6QV3LwBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xj5b/hxNJE0=:HsBd70qMJkgk/ZreJRjKAY
 4zkZ5agUwZoQn+cEOCY4MOdB3yoopQkX8Rq5lUs0ISKOFFcgh/mteoWczYOQwETaDoCxV3aZf
 bCcX9255PKf4cZ43Mr2l+hRqj88mbHP2DqKkjfoSBUnkFKe954rxJEXt5uY3NKWK3wCyjQ5+8
 H7Zjg3RvItycvWPtzd1h3AY7RqAYFdKMpYGWcLXMsn3TErWNkj2yY/OVCqJVMrzQQP88aPI98
 V6NMHu5BYgEpzLPERTVrrn1UN+GZoz5Sp54tJKyJoCZtKp3Tb0Jj5olh+Bu+/2kALSN1C4vei
 gMVXbW3zHpWW7uS9pqjS2Ez2/0P7+ooBxqUeCRHxPbldWOwQmDqXslVblQqnCMZJvDbxrtu7l
 SDthre4aIBbLJg80TU9s3S05s+M+0pkQgS3d+OeUbsESb0oUhQeTS/jQsiVH3dQNK6H3Q5BTG
 TXUu9cY4aHgHJpk0yRPElZVozkR+/TOj2dGwovtfe6XR2hMq4wfjJsPJ7yf8anDxUrVjw31TJ
 oPzUPixTSrNOaRZ67/Mp+e4lIIG4WJhH3HLtS2ITJwLiAbbI4T8nPA0sDPagFF8JAXGLSE9Es
 OhaoS1/iKttDKNhnErgMU6c+69g6FLrpqMwhyy3kF+oNllnSpAfHw6UApuqdUlnUyfibSThiL
 y9DzmhmRRfLJHi5Qo3yHyzyhtiEHejLibEhAyG4uW+X+AeE3Sqm545tBEadFwjsmJ7rmSUYEu
 GALTGn0Jol7HXjADWz/zFtQ2E1b8GAUP+uY0pg==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Sep 10, 2021 at 9:19 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> When CONFIG_PROC_FS is not set, there is a build warning (turned
> into an error):
>
> ../drivers/hwmon/dell-smm-hwmon.c: In function 'i8k_init_procfs':
> ../drivers/hwmon/dell-smm-hwmon.c:624:24: error: unused variable 'data' [-Werror=unused-variable]
>   struct dell_smm_data *data = dev_get_drvdata(dev);
>
> Fix this by making I8K depend on PROC_FS and HWMON (instead of
> selecting HWMON -- we prefer and try hard not to select entire
> subsystems).
>
> Build tested in all possible combinations of SENSORS_DELL_SMM,
> I8K, and PROC_FS.
>
> Fixes: 039ae58503f3 ("hwmon: Allow to compile dell-smm-hwmon driver without /proc/i8k")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Pali Rohár <pali@kernel.org>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: x86@kernel.org
> Cc: Armin Wolf <W_Armin@gmx.de>

I submitted a different patch today after noticing the same issue but
your patch is better:

Reported-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>

      Arnd
