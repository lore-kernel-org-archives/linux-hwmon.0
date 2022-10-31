Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6A0FA3743
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Oct 2022 15:58:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbiJaP6M (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Oct 2022 11:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232174AbiJaP6D (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Oct 2022 11:58:03 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBF7F1261E;
        Mon, 31 Oct 2022 08:57:34 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-368edbc2c18so111571847b3.13;
        Mon, 31 Oct 2022 08:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYGTI16dQ2sIa9N1iO32E4mk98TH5tOynZC1YGDx/tA=;
        b=kRsvqys2FZzkvPI/2Eh1vpwg55QEvW0hU0fHPTZ0bslrC7P5sk0bgrsIpC9bPbQVmG
         r2AxRvyMDWGZvSNrU+CJfLCD1d6gNsEdjr5QBmiIE0xCcsdSMpGjZMWdKG9EJ5ijhAkV
         zj2ae4NYTZS7ULtdk0OcuBEwr7/Qic/B3WzAOvQk0SmXyX0ORjpSWA8Lc/IE0eRLSysz
         AWgaGsNp7Wsbu4+izD3EcqfUOlPluOLywzzWK5oXl/fRuFSIJ11wRKYIBaW8fgCUjR2H
         T2bRCt8WIZ169wqiN9YKthyScks122QCqmcFfqjgyFGNBGeWEJT4zkOWbuRGRKhJ4fU1
         ZCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HYGTI16dQ2sIa9N1iO32E4mk98TH5tOynZC1YGDx/tA=;
        b=f8HQA+dGUSri6DndjbBmO+9glQAiVwjcLo4Rdg4q5LXKn1ZPihHUfNiKkDGWrxr6UY
         hj9NQJvnOE4VsxHWJRVVSDlMOx8RWSJTXwE886CMYdeGxk7HN85rW6EpgGOwq/h6pfTZ
         +nrulcigBV9iFsg2M9/FZBmBQ8n11FEXMt9Te8kKGJ2WmKwDydJCU8Mgp1ZH/mKSrinq
         UvuginXlDEaRvDGQE1d8mYFG5FkH6P3tpfID7o/iKkzg2jFsFHxvA2ihWyRORPonMZXV
         HhOaM6sqt27wcGNH7QELZMp88dWYM295/JArb/LiNOUMC/jtJfd7VG0rhFc9t0Mt6PSk
         wbjQ==
X-Gm-Message-State: ACrzQf29Uxt7jpaCcBB1IFzeA2nAF+AfxlHY8UbEl2JzL66kW1NZfj5f
        Qtd3CtPd6c7mmX6v8LJlI/EYFSAmo3aB2Uo9kcQ9gPBCXxo=
X-Google-Smtp-Source: AMsMyM7OFhs6y3dAIl7BImyKb9Jn7ZvxtykUljGpzSDLwwMsV21NaswVersWiWlrNtgL/+aGv+Ykxuew+0d5mmTXn2E=
X-Received: by 2002:a0d:f841:0:b0:349:f274:a0f with SMTP id
 i62-20020a0df841000000b00349f2740a0fmr12863676ywf.13.1667231854239; Mon, 31
 Oct 2022 08:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <2FNQOCFdvTS7N-ylJhxGWzZjeji-nVCF09tbDr7lt80R8c8_pyp9hbK0iJHTFPevJ4la-YDd3lW5CZK85kYF1_dDZo6h1akO0f8jFTzIScA=@protonmail.com>
 <20221031145308.341776-1-samsagax@gmail.com> <20221031153450.GA2462187@roeck-us.net>
In-Reply-To: <20221031153450.GA2462187@roeck-us.net>
From:   Joaquin Aramendia <samsagax@gmail.com>
Date:   Mon, 31 Oct 2022 12:57:23 -0300
Message-ID: <CABgtM3jX+5-7zfsnQY6VEBdWD0vUuYXMKfys_UDyVEpFOpB=gA@mail.gmail.com>
Subject: Re: [PATCH v3] Add OneXPlayer mini AMD sensors driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     pobrn@protonmail.com, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

El lun, 31 oct 2022 a la(s) 12:34, Guenter Roeck (linux@roeck-us.net) escri=
bi=C3=B3:
>
> I didn't have time to look at your patch, but _pease_ stop sending new
> versions of your patches in response to previous versions.
>
> Guenter

Sorry, new to this, not entirely sure about the etiquette of new
versions. The v3 is the last one and hopefully the definitive one.

--=20
Joaqu=C3=ADn I. Aramend=C3=ADa
