Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D56CC77B7C
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 May 2023 23:43:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbjEZXnF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 26 May 2023 19:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjEZXnE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 May 2023 19:43:04 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE6539E;
        Fri, 26 May 2023 16:43:03 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-ba81f71dfefso2020997276.0;
        Fri, 26 May 2023 16:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685144583; x=1687736583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCbPcmVmsrCDTIeI8zinO3e36k8rZXX0VJej8DQyY5Q=;
        b=GSZwisWuHyJLDmljsXiwr3Rjq/yRQjZaeMUrFRNvJqAnQ8lORylBNO5hTdAFlhD8WC
         LgvSmiBoTZ73jbgiOKspmOsVLwyQ4VdW8JwIozmKWwO/qi0nsZ08xJQmb46C5zpML9P0
         FLwyGsUuq6h1yMk2FdJNLiJynNh+C6HwqviXfD5WfJHnO1HaqaksRH3oIvq2wwxTGgXn
         fTcPNvyS+vcl28ueEJ2xRSB/ajeirvd6CaHLS5fwAu55n/u2ypi+ArmqB68Zh68x2lDz
         Jth0fiOH9uJMkoFNjIEkVg+TyLQF+gXRM+MMzjM6Qiq9ED3dD4RDTtUfAKoQZijYzf3f
         x56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685144583; x=1687736583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCbPcmVmsrCDTIeI8zinO3e36k8rZXX0VJej8DQyY5Q=;
        b=Yoa5QH4WHNA1xzy6qaNSR8D3Kg0ksY/RHrkZER/MV3LnxzAZNosA+kXwFjCyjCw31h
         Y51XL16ymQ1hFhiLuGrr/iwuxYFCqyh4t77ntz95F6D7/Amp8TqTM/29MngbRMtMtcpV
         biSlo1i7gn3hTZqpQ9EfTi/MpKNEPuLgRhS7SE7JLYpd40VYHqXIa97+CAIeoXtXp+To
         8+9/oKYvGLpWrm5fyXhwCaYFWfmbVssYU0o9swvXXM849LbiYDZs8bIoQS2dwhzWTprt
         zfsNo6xR9vJGLKwbQVv2fjZOGvhRSOjhNde0P9UxJpwyrmyRqZc+YmaZ51IFVcCLKGA7
         DuOg==
X-Gm-Message-State: AC+VfDxBm+XQPZEGgJvmCKS9AoDr0Wf5fAS4Sk5hw9Ydhvg1qsImwvI/
        YPwDZpxF/DkuL2QmZcMT9O1NtqmoJ5mbm4KkRQc=
X-Google-Smtp-Source: ACHHUZ55ZP9c9alwwVCNjizN5DExeg5/yCU9ayw9qLsrkqxghp5K8XqXScqzDEDPMnoY3UY3UzDS63PQHrkxvN1tXp4=
X-Received: by 2002:a25:24cb:0:b0:bad:871:3fce with SMTP id
 k194-20020a2524cb000000b00bad08713fcemr3969391ybk.20.1685144582785; Fri, 26
 May 2023 16:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230526215621.16075-1-samsagax@gmail.com> <430e7be0-26a9-43b0-a61f-66cb8dfc805e@roeck-us.net>
In-Reply-To: <430e7be0-26a9-43b0-a61f-66cb8dfc805e@roeck-us.net>
From:   Joaquin Aramendia <samsagax@gmail.com>
Date:   Fri, 26 May 2023 20:42:51 -0300
Message-ID: <CABgtM3jNVp63XB5A8Cf0KhB4So2==HLGa9_meuTn0vHYy=gBzQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (oxp-sensors) Differentiate new BIOS for the Mini
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> On Fri, May 26, 2023 at 06:56:22PM -0300, Joaqu=C3=ADn Ignacio Aramend=C3=
=ADa wrote:
> > Newer BIOS got some other changes aside from string changes. Add a boar=
d
> > enum to differentiate it from the old OneXplayer Mini AMD BIOS.
> >
>
> I see no functional difference. What is the point of this change ?
>
> Thanks,
> Guenter

It is nothing right now, honestly. But is necessary for a later change
i have queued and a bit of OCD on my part. Should I add this to the
other change?

Joaqu=C3=ADn I. Aramend=C3=ADa
