Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9408BCD6114
	for <linux-hwmon@archiver.kernel.org>; Mon,  9 Oct 2023 17:34:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377432AbjJIReX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 9 Oct 2023 13:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377937AbjJIReQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 Oct 2023 13:34:16 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3926FCC
        for <linux-hwmon@vger.kernel.org>; Mon,  9 Oct 2023 10:34:15 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2bff936e10fso69801901fa.1
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Oct 2023 10:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1696872853; x=1697477653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nq2GQ2H1vuKyNiZmrzLAFN/nNn6hx8PmFL/I895kOhs=;
        b=KJl6r+wNby3JGHDV3gKCM1tx0/iaAAvTFAlmbgNXxX1LJk6GDoknrkNA32wMkWLOMd
         +CZ6WyFSh7ft0P8UpGMgtDP5TwDidZtnevFFyyALx2V2py/FFQszR0xrgUwW5gAeEkJ+
         ucUsWTOOP78wRSogUhjBE3gvuk0xrPbsYIxG2lzAQiaV7MB43E559HFNDqSi3kuvjOrb
         +JnNgVAwPFlMBo0h61nmgqAkh29qayDVa7emtmxuISiJBDso7nUV2FFPdWmICMDKkFfd
         OEX5yf79Uz/TE+G/QTB09Hj5OdYXg2MZCicD2IQfLD5JzAGagM1S1jjPuRBE7xYqCL82
         3UyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696872853; x=1697477653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nq2GQ2H1vuKyNiZmrzLAFN/nNn6hx8PmFL/I895kOhs=;
        b=IFY+oQsH0MUI5S8Uv9DQkWBrhFP7fXLrunelDDgVUDH/aC5t7TKNESr9wNd50JpaOG
         92c+rc+ENdo35kdFyOqK7q4ZJJgDhs5DFrxkGIDbILjBfBCfm3ywLS15UEvPO0zGaA6n
         AxYwZtrAxSvxpikGQ5QLrP4lmCR4fbCEXEhblfgiAU3mQzdqRQC4c4NRGAEwQO8enCvN
         g6GR3GKv0P/h5WW4RH9+odnAzGsMSq/X/8uHQRaRGq4t2TKklNk7vl+C29w1Mp5lebpS
         BKCN+4L7JuND8b15yn974DhtLfYMtftmTnMcASpYWkWt2rQuxYGR/71drtyYktOLp9ru
         R/mQ==
X-Gm-Message-State: AOJu0YzSDs3BZ93vNfcMz+JTNCtFvDZ36Zb4M4zGIq8lF5dRnz8bb0Es
        3Hqdxq3iHogS2xYBDVSSzFQ8NzY2lnukXwGMCQKcAQ==
X-Google-Smtp-Source: AGHT+IEUfNwMkfCnl/XyTROOMWP8DgWZG5GKfUSxkquTClD6BL2TMDnYwX05Db3dT30tRnY5iL7b9D7W4IKm85ZfAGM=
X-Received: by 2002:a2e:870c:0:b0:2b6:cbdb:790c with SMTP id
 m12-20020a2e870c000000b002b6cbdb790cmr11318211lji.1.1696872853492; Mon, 09
 Oct 2023 10:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231009165741.746184-1-max.kellermann@ionos.com>
 <20231009165741.746184-2-max.kellermann@ionos.com> <2023100908-pouring-synapse-75bd@gregkh>
In-Reply-To: <2023100908-pouring-synapse-75bd@gregkh>
From:   Max Kellermann <max.kellermann@ionos.com>
Date:   Mon, 9 Oct 2023 19:34:02 +0200
Message-ID: <CAKPOu+807-eZfGff7EHcWGn4PFCJACv2mGi54jtoHCy14_s5sA@mail.gmail.com>
Subject: Re: [PATCH 2/7] drivers/hwmon: add local variable for newly allocated attribute_group**
To:     Greg KH <greg@kroah.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Oct 9, 2023 at 7:27=E2=80=AFPM Greg KH <greg@kroah.com> wrote:
>
> On Mon, Oct 09, 2023 at 06:57:35PM +0200, Max Kellermann wrote:
> > This allows the compiler to keep the pointer in a register and
>
> Maybe, maybe not, there's no guarantee for register usage.

Agree. But without this change, register usage is effectively
prevented (much of the time). With this change, there is a chance for
better code. Yeah, it's not a critical code path, and it's only a tiny
tiny optimization - but the real reason for this patch is ....

> > -             hwdev->groups =3D kcalloc(ngroups, sizeof(*groups), GFP_K=
ERNEL);
> > -             if (!hwdev->groups) {
> > +             hwdev->groups =3D new_groups =3D kcalloc(ngroups, sizeof(=
*new_groups), GFP_KERNEL);
>
> So you have a const pointer AND a non-const pointer pointing to the same
> thing?

.... so I can make "hwdev->groups" const, which wouldn't allow
modifying it. (This isn't obvious in this one patch, but a later patch
in the series does this.)

There are only few functions which allocate a new pointer-array
dynamically; all others are global variables which currently cannot be
"const". This patch set does some lifting to allow adding "const".
