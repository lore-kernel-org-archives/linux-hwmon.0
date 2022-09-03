Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC08ECAAD4
	for <linux-hwmon@archiver.kernel.org>; Sat,  3 Sep 2022 19:40:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbiICTkx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 3 Sep 2022 15:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233014AbiICTku (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 3 Sep 2022 15:40:50 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693274F182
        for <linux-hwmon@vger.kernel.org>; Sat,  3 Sep 2022 12:40:20 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id d16so2872406ils.8
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Sep 2022 12:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=zR2ZxXnfIX1QMaH02rghoHmD8W0++l3H7dB1jdUZbn8=;
        b=FrCTGMDXXNos2iUNX6VLr/V4zNE5+wgG9lRpxM7Ex0J5hsqVxcZEKd5eGULvTAPzvi
         Xs1SOu31UYGvFAKPIl8Q0iFy50+h/V8+v/63Rv1Nj9lk4PI4df/PEh7AZmPzId0Z49i8
         aeSCobNvXZZRnLzs8J9TFVS8K4PdMb9517edWjZEAeeG6S20aw2IEBO34MECW1OmAFg9
         v9e4xzNwFSutY1J6kkkyWo+ndBnoNg/hUTzk8sh1F7h/QZwef3CdSeGFU54tYTDMCklW
         C5I9TPS5laMyNk5scq/ba6qzDWHSnrP1Y5sgm9oTbPzaAhBh/bnCe6yrXjRW3RAW/hdw
         p02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=zR2ZxXnfIX1QMaH02rghoHmD8W0++l3H7dB1jdUZbn8=;
        b=K7aObCDrs4c1p6d30ovQ+w6OVCyNFcOiVihQ608zQtwyKTKJK5C4cgqA7GvSvLfEgD
         DHH1ZZXxuHE4Qf+nhoLeSl/AYBwHnhmgfX/Z7gcCyoyEkKjRNvBa17IoDiOIEpogYm86
         5R0TEgOV01z9DrGtLsHfIuppgWHjM0NURyftgRhBziZLTtiSpKXog0jYTGCAJNF1TMHn
         ibbo1s+7SfE7yZI6djjBo9u32EOrxYEWt102e37VZj4El+0L68qtNMlQG658tGi/hnsD
         ibS1xFFsothWvsX0RIZVcfGnKHHXGXfJPS2oZry7uTr/DYFIuJeEykXUk6VpyvMpfI5G
         CwVw==
X-Gm-Message-State: ACgBeo2y1XuYadYHHpBsII4/i1y2JOppIU3hW+Trr3HvXATOFEkMxGUe
        sICVPHehs8PiJ7ULtoUd3KyvXCeeBwtZ+7XJEbovrPih3vw=
X-Google-Smtp-Source: AA6agR4JrnT/lwtHe/bK1hNmyByPBEoaYMxdVczJH+n1do3+h0PWbO0t/80tOmmv6Vf/EGN5PRudQ0Hcp8+R2Bf6/6Q=
X-Received: by 2002:a05:6e02:1a09:b0:2f1:47f0:d351 with SMTP id
 s9-20020a056e021a0900b002f147f0d351mr640045ild.125.1662234019807; Sat, 03 Sep
 2022 12:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de> <62fb8a16-bebd-5de7-0b4f-eed4d2593587@roeck-us.net>
 <CAB95QATHd1sJwbYOPeb28j9vZAfZAu-Xa+pXWUhbMTVifKz93A@mail.gmail.com> <5e42685d-ae82-d74d-4883-d8a9e9fcb243@roeck-us.net>
In-Reply-To: <5e42685d-ae82-d74d-4883-d8a9e9fcb243@roeck-us.net>
From:   Eugene Shalygin <eugene.shalygin@gmail.com>
Date:   Sat, 3 Sep 2022 21:40:09 +0200
Message-ID: <CAB95QAQ9EXX3uZhiZyxr=aAwiSR6j6i1GstFg9iX4eF06b5GUQ@mail.gmail.com>
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other distributions
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Christopher Klooz <py0xc3@my.mail.de>, linux-hwmon@vger.kernel.org,
        regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> I don't understand why that works either. Maybe it interferes with other
> PNP0C09 devices and/or the code in drivers/acpi/ec.c.

Turns out the patch breaks sensors on a system where it should provide
output. The module gets loaded but provides no output (which should
mean the probe code is not executed). I will try to investigate
tomorrow.

> Couple of comments:
>
> - You'll need to drop __init.
> - No need or reason to rename asus_ec_sensors_platform_driver
>    to asus_ec_sensors_platform_driver_probe.
That's in order to not drop __init.

Best regards,
Eugene
