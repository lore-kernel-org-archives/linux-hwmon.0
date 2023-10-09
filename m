Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC388CD6114
	for <linux-hwmon@archiver.kernel.org>; Mon,  9 Oct 2023 17:28:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377307AbjJIR2V (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 9 Oct 2023 13:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377402AbjJIR2S (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 Oct 2023 13:28:18 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A724E9D
        for <linux-hwmon@vger.kernel.org>; Mon,  9 Oct 2023 10:28:16 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2bff936e10fso69723971fa.1
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Oct 2023 10:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1696872495; x=1697477295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0y/IaJ8Wt/BoETbVcw3q6QBPp8dcU4xvdRHj9nAw1wc=;
        b=JVRxkyor86+pRUcKAPC22lAcDzcg3Hu2/A2psvixq8NgWnygjCalTlXMyIyYKr3ty0
         bd0qR1gpD8jLYU8Vkwiprn5/8qptvkLO2nEn780tLqQec4jk04gflPcJhQtdCZ5chVOb
         FwbIAz/7ehr2YkgnMWGd47FtRatlKchtQIDMZvZ51AIW/+zsd7JJ0ez6jogOk7H7J3jO
         xm1d1v/GFBRESBpwGZZ/LzMXOhGvsz1Ezbw1tLrtWsDE9gD2IosY1cnf/dKJqZQy2pnA
         bAem4JekfuRt+cgerfB0LMLcp4Oe5k7HvTcr+m2+yN04lGh1LwviuF6wXdzKWLoQCT/K
         LnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696872495; x=1697477295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0y/IaJ8Wt/BoETbVcw3q6QBPp8dcU4xvdRHj9nAw1wc=;
        b=BXOphbwFk6E/hbBiua5td2a0TQPy24AnaH2Sfi/cL/jhFQrE67kgXfcxEt8WSsisvg
         tXR0ACIsSqh/WwK3u4QlzOzXAXjogy0EwpI1A9ATuZeLF/s18ZMC+UKY6gzsh0YN8NR8
         DSSPuSx4t4hBoAJFkUCUIZuu5iT5SP0aDYephQDmwroTLpQD/tzYb6vkvuM1m5L97gfW
         un3UHCaTVfBhXHQXbeFp3bnquimBLhcbZOS2G3wx5iIcGabcD2/mKIf4letzXtsaNAYj
         Gcnmp/Ph6LG0HIwZWzGCDCkYBijuUaSCmJlBS2uBNVYd/c5f48b+q+DTGyGv3h6cIp11
         A0CQ==
X-Gm-Message-State: AOJu0YxBTnEEe7XCWYuMdbYM/k1SUPFMxRPLLTOAJh+AhgOF1C1MO+V7
        70FX5avHMfNdu9OpkNP1Z+tGEKeiFu/Y0Garbsr/dg==
X-Google-Smtp-Source: AGHT+IHfw9B83xTJpU+Gb39EemaPekWoNVLTxtbtT75ta92PN3fGfWHNYEfy4a9i/JCEpJzrLuDXDOgE+31Y6VKiQV8=
X-Received: by 2002:a2e:9b88:0:b0:2bc:bc6f:e296 with SMTP id
 z8-20020a2e9b88000000b002bcbc6fe296mr11161379lji.13.1696872494865; Mon, 09
 Oct 2023 10:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231009165741.746184-1-max.kellermann@ionos.com>
 <20231009165741.746184-2-max.kellermann@ionos.com> <bab3c83c-2ba8-4d23-b3cb-2f233898f7f2@roeck-us.net>
In-Reply-To: <bab3c83c-2ba8-4d23-b3cb-2f233898f7f2@roeck-us.net>
From:   Max Kellermann <max.kellermann@ionos.com>
Date:   Mon, 9 Oct 2023 19:28:03 +0200
Message-ID: <CAKPOu+8Uk4GNpZ3DfWhNWXR1bQ60LxcaK9nKs+kRKuq3BOJtmA@mail.gmail.com>
Subject: Re: [PATCH 2/7] drivers/hwmon: add local variable for newly allocated attribute_group**
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Oct 9, 2023 at 7:19=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
> I have no idea what this is about, and I don't see how that would
> improve anything, but ...

Later, we can make lots of global variables "const", which puts them
in ".rodata" (write-protected at runtime). This is some
micro-hardening.

> CHECK: multiple assignments should be avoided
> #101: FILE: drivers/hwmon/hwmon.c:794:
> +               hwdev->groups =3D new_groups =3D kcalloc(ngroups, sizeof(=
*new_groups), GFP_KERNEL);

What program emitted this warning? checkpatch.pl had no error. I'll
change it in all patches.

> either case, this change is not acceptable.

Because of the multi-assignment, or is there something else?
