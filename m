Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868F1ECAAD4
	for <linux-hwmon@archiver.kernel.org>; Sat,  3 Sep 2022 15:13:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbiICPNl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 3 Sep 2022 11:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbiICPNk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 3 Sep 2022 11:13:40 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B64041D34
        for <linux-hwmon@vger.kernel.org>; Sat,  3 Sep 2022 08:13:40 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id q81so3850111iod.9
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Sep 2022 08:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=SsgrpeTLa20B/fYTb4j8NXUplBDhdJdZijNFiaoxNOU=;
        b=C5MCOoK4Uq7sjKLsczND8qdEdB1cLM9E0P7h/JZxkiSycCLBsT6GnX6FDokn2/3Cn+
         qG8zF6IYsTY9FVeJB1X1yVRHM1yJa0Vy6OtwM1fb6YT2gHXgmUL+J33vID404+GxZUVO
         O7V2MdUQLs7lNq6X3q3OdAazDO1oe9eUTaS9VxsuyFgPoq7G17JCLEsVF9X1rW5n848T
         7HoYdhN5fi13/XrSFzbKE6m9V95vnA+ChP9Wc5NMj+bJm58Y9tvDiEQLp+80YDtosVlP
         n9ljWlxKwplYhpwLDnXLOMbj3/TvxKJfwUkmp6czGT1R5z1g03nevnvZAIy3RD2bpxX8
         ruMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SsgrpeTLa20B/fYTb4j8NXUplBDhdJdZijNFiaoxNOU=;
        b=HYsHvM2QhSx55FYD6bHKdBn/QgNaAAkcT0/1IB9MYbpr60LNyNEM0GaMbym7IpySfa
         DIF9pqpCQETHBTf/xbjTkBfF9LKkgL0h1o8Y3KPjUQjDU1RK2pt2mLl4S4mB0O2i0OJX
         egTFc0gTp14WkvipEQi+bBBeGYAWhQzi1kp6DeaTOAJ3V44bg+hazfB9uopLm8BmEivh
         gG6w8PSq5pB2TISrPzWBT8f7J6pnKPKiv6+6+MIcC0QBKObr7NN2esmezg+peQFciaVy
         EXQsNvE1uAw9TUXE0lWreiaOFj/ZRr98A6uz5t0JS/KE6xUt0pZhs/zlrQQAXHXUY/3c
         LlDQ==
X-Gm-Message-State: ACgBeo3wvK14n/Pg4oAc2jhUlzddnADSUf1l+9srrh0Ba8s1vTTDnLb1
        oPoAwkaFOcvECikiKf52vYqoGec+eb1JnnNJiTdEEqlirNNHBQ==
X-Google-Smtp-Source: AA6agR6/6VG+ThLC/u+8Sx3MwVU84dICkhsDMBT1EnTrT5nz8IHtZMz3lMKQSrIWubZNVSeyOblK7rVEXUXb3FtokNA=
X-Received: by 2002:a05:6638:160b:b0:346:ab00:9c7c with SMTP id
 x11-20020a056638160b00b00346ab009c7cmr21670772jas.241.1662218019547; Sat, 03
 Sep 2022 08:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de> <62fb8a16-bebd-5de7-0b4f-eed4d2593587@roeck-us.net>
In-Reply-To: <62fb8a16-bebd-5de7-0b4f-eed4d2593587@roeck-us.net>
From:   Eugene Shalygin <eugene.shalygin@gmail.com>
Date:   Sat, 3 Sep 2022 17:13:28 +0200
Message-ID: <CAB95QATHd1sJwbYOPeb28j9vZAfZAu-Xa+pXWUhbMTVifKz93A@mail.gmail.com>
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other distributions
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Christopher Klooz <py0xc3@my.mail.de>, linux-hwmon@vger.kernel.org,
        regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Guenter,

yes, there is a patch that I don't really understand, but it fixes a
very similar problem:
https://bugzilla.kernel.org/show_bug.cgi?id=3D216412 I will test today
that change with a hardware where it needs to autoload and submit the
patch if it works.

Best regards,
Eugene

On Sat, 3 Sept 2022 at 17:09, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 9/3/22 04:00, Christopher Klooz wrote:
> > Hi Eugene,
> >
> > Currently, we have user reports of at least 4 Fedora installations that=
 have issues with asus_ec_sensors since 5.19.4. They remain in 5.19.6.
> >
> > All issues can be solved by blacklisting asus_ec_sensors.
> >
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D2121844
> >
> > The bugzilla report contains kernel logs of two machines, one with nvid=
ia-driver and one without a tainted kernel.
> >
> > The report and the contained ask.fedora link contain some elaborations =
of how the issue manifests at the users' machines. The major issue is a wro=
ng output of battery power percentage (in one case it gets stuck, in the ot=
her cases is becomes erratic). Also, in one case it has effects on suspendi=
ng (see the report).
> >
> > On the Internet, there are already reports from other Linux distributio=
ns noting the issue and the same solution (blacklisting).
> >
>
> Eugene,
>
> do you have an immediate idea other than reverting the patch pointed to i=
n the bug report ?
>
> Thanks,
> Guenter
>
