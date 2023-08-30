Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E919BC71153
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Aug 2023 01:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241618AbjH3Br1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Aug 2023 21:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241616AbjH3BrA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Aug 2023 21:47:00 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6278C1BC
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Aug 2023 18:46:58 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-7a50a1d1246so534821241.3
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Aug 2023 18:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693360016; x=1693964816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWd+bu1LrxI+H+jJgxvp8d+ARmmKEujCGmCIoUgNvb4=;
        b=qZWUwZl4huHyF5o6PF5elDwvVXuUCE63IJJqC9s0cWez66rJGSgL4MG+wXoJsATIks
         b5rwiRCzH2e3NkVUT7M5RCi5MLOhwZGTt+XwxLst93KaEKvPE5bvt91OpgmTGvFuAElG
         j3r4MOYUSCq7rQX1Cmcryw7lsnwiXUOTZ9GV5S0HyONUuYP01RerUeo7GjnACxoEkt+2
         g4bnqGbIMwdUm+NwiNyKklUoluHwOpq3RQiX7Dq3d/y211LllULrl7ED2gz5FHFyoJHp
         +94qB9FbCGwuEFbstdpCh3ORVb6q5EmhC04DCtsHrjDY70Ll9YqjqCNG9YQawibUcw0B
         yMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693360016; x=1693964816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWd+bu1LrxI+H+jJgxvp8d+ARmmKEujCGmCIoUgNvb4=;
        b=iqsS9+O89NyKCB4y4YFuKZqHSAuuwMZqM8paBP1Wgznnpdrr1NxKr/Ufwq+XhUM9uC
         gRDSmvfMKgqBQuqdE7JHcYuWPlG0y0KI/iamYTJIhtbJg/QI7FN4GuTc4gOendVfYXSu
         zQy0PiIsTBlqx0Yc76H6Cg3YR08AC9Jc4Ty/7uwvN1poEky2G3vn51nH61m4LwM3YA+F
         bUutAONYoBoNeH4V7VTaDbHdokCl8vMg0v/3CSlN082qpJ2HCT1fW/ESj/flazKpDaZs
         62pGBsJgmpI1ntPcuzHGC+FjZYhMeXpGgjlcJ0N6kuL5Tyt69oR6UiCd8saDImWFn5uj
         rUEg==
X-Gm-Message-State: AOJu0YzM/1p0neG2Cw7Cs2VvjHLUur0wFVuBUlayXt1tmFrVBxeAqsIa
        Ho04wKx26ZJNqwS2RHW3sJtVQT9TTnH1+qcsjoI2/hJ/
X-Google-Smtp-Source: AGHT+IHC8zx/l+LwzjN/Nk1H2vrr3rrRO+7g6prTT+ZheHoLo1HiDIIR3yObaOQ5q/HwWRtbC9ZfO4wWexS9aV1GzXQ=
X-Received: by 2002:a67:ef94:0:b0:44e:dece:6b38 with SMTP id
 r20-20020a67ef94000000b0044edece6b38mr898317vsp.23.1693360016409; Tue, 29 Aug
 2023 18:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAOdCjQtTzQpsko+vqkF9zW5RPe1520r4B5kFsJzHjSkK+KxvMw@mail.gmail.com>
In-Reply-To: <CAOdCjQtTzQpsko+vqkF9zW5RPe1520r4B5kFsJzHjSkK+KxvMw@mail.gmail.com>
From:   Pankaj Pandey <pankaj.embedded@gmail.com>
Date:   Wed, 30 Aug 2023 07:16:46 +0530
Message-ID: <CAOdCjQv-dCsd_EDnmWN786H57=cN2U8GBZLS96gXme6hfYpC4A@mail.gmail.com>
Subject: Fwd: Regarding pmbus_core.c
To:     linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

---------- Forwarded message ---------
From: Pankaj Pandey <pankaj.embedded@gmail.com>
Date: Wed, Aug 30, 2023 at 4:42=E2=80=AFAM
Subject: Regarding pmbus_core.c
To: <linux@roeck-us.net>


Hi Guenter Roeck,

I am facing an issue at drivers/hwmon/pmbus/pmbus_core.c of linux-5.10 kern=
el.
I am using the bm454 driver from drivers/hwmon/pmbus/pmbus.c.
Observed sometimes my Powepc based target board called for reset from
inside int pmbus_write_byte_data(struct i2c_client *client, int page,
u8 reg, u8 value)  function.  It is not consistent, sometimes not
observed any reset and bmr454 initialized fine.  Please suggest any
pointers to debug this issue.

Regards,
Pankaj Pandey
