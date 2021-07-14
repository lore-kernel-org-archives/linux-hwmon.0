Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E954BC07E9A
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Jul 2021 14:28:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC12461260
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Jul 2021 14:28:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbhGNObv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Jul 2021 10:31:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231994AbhGNObu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Jul 2021 10:31:50 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09AB7C06175F
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jul 2021 07:28:59 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 141so3725842ljj.2
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jul 2021 07:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VLN/cs/7hiVBdTX4W1y4ZV28wBN4AZzQGWGe8sNmzWw=;
        b=akUF4QZ5J3kyOMprz4mSxgYANSc7WdVcZrdrkq2olgPphWQLA5c+4IHM3GqhFLSVOt
         aXIJ/h8VeQXxsRKgQ4eETEB8FMd50jgviUt+p34H1oIbDn54W2CY710Z8Lz2pWwLtm2+
         q6s/+dSr5R0qvLXCupFOKb7m3LTxrjt4ATA3lsfY3L31MFYH/yR9DYE5S85E1bVGtsAd
         RJbqanl3Gpc/f7W7MBk0eZ5r5a6uYTq1BFrAKwVBBflcvZ+NFCyiSWP4nwmZoxc5AcOB
         bLIGLWNY61OzL9P1iqouEeCkTfpAMJKrdFEFVggROumM9/YQ021gLULa8Fxz5+1A5VgP
         Fhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VLN/cs/7hiVBdTX4W1y4ZV28wBN4AZzQGWGe8sNmzWw=;
        b=hw4Q1Sx0ZfQQhZNIruPY/qsSZjEnu2nB7WoD2FczIipVLxxmz3rG4IMqxSoZYrCC9M
         qBOUYwo/ckipMS1pkvKmt6g+OJ+mCHy2oigzeeiUvqzw3LT4Bbkb570XZ2Kpk274YnvI
         EwbkpYHl2xAd140AzLJfzlog87kchSJH+tjGgrYvDgWrtfV+bUnyHav+WCNz7I0rZ+rp
         2xNH84w6zEWapgmI80b1XOxJ2YWYJAwNY2clj/awwE6/kSETrBBlidfuVmhmPqXHNyl/
         rPXNdlXJOHeHqfKXfwcdp8JETcLJsXiLO64nq1O9eaFXwcChXsuUnKq5Ev94IO/MVLVE
         /ThA==
X-Gm-Message-State: AOAM532G8mlBT80lYksZrKaqxrg+OeTyVMI/l6PRcmu+mC+g2xuT62Bz
        ll7Z6If42NQW6ETlhRs0UwlNvE18R6VzfnW0wr+eQsEy
X-Google-Smtp-Source: ABdhPJz59EU3zYcHPgw9q4j08LgxOOuadGr5VE+TikAO5hdF1fahFsTyZ+de40TIjwj8pSXO2mm0OufM3e5c5sqbeZU=
X-Received: by 2002:a2e:9c8e:: with SMTP id x14mr2977631lji.69.1626272937380;
 Wed, 14 Jul 2021 07:28:57 -0700 (PDT)
MIME-Version: 1.0
References: <202107080039.1680d7Eo018443@systol.god.lan> <CAMFK4TPNYJeEJdfu5Wti7G34m+-tcZvA2wv0N87aPsGq2eygvw@mail.gmail.com>
 <CAMFK4TM0MCEGWs=zCJZLsdnUJKqvM+-0fxZTDhJd864SAG8=ng@mail.gmail.com> <545ad722-d2de-21bb-21c5-7104097c76c4@roeck-us.net>
In-Reply-To: <545ad722-d2de-21bb-21c5-7104097c76c4@roeck-us.net>
From:   Henk <henk.vergonet@gmail.com>
Date:   Wed, 14 Jul 2021 16:28:46 +0200
Message-ID: <CAMFK4TMKt3myPKrLYU_vvC=PxxbdohyePZA9Qy0ygdtTmAZU6w@mail.gmail.com>
Subject: Re: [PATCH] hwmon: nct6775: Add missing voltage reading NCT6796D
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Can you be more specific?

Op wo 14 jul. 2021 om 13:00 schreef Guenter Roeck <linux@roeck-us.net>:
>
> On 7/14/21 2:48 AM, Henk wrote:
> > The nuvoton driver has quite some longstanding issues, as far as I can
> > tell the alarm bits and input registers are not properly configured
> > for a bunch of the chips.
> > And this patch only addresses a tiny proportion of the issues.
> >
> > It would be helpful to get some meaningful feedback.
> >
> > Is there at least any interest in solving this issue?
> >
>
> There is a lot of interest, but you'll have to do your part and send
> patches in an acceptable form. So far you have not done that.
>
> Guenter
