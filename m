Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB6FC433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Nov 2022 22:54:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233015AbiKKWyM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Nov 2022 17:54:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234473AbiKKWyL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Nov 2022 17:54:11 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D825BD7D;
        Fri, 11 Nov 2022 14:54:10 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id r3so7350287yba.5;
        Fri, 11 Nov 2022 14:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOg8bS37pm9ha6dkRAHGCNhC+k2Jf5zDp3gc5cqvlzU=;
        b=Ee/pgTPBR07TT2H9ETQwkIDRF1YP1IuVyQTtgNQVuBo6LPDuH1Js1GUjd5OAlVf7Yp
         8Uk0Gz3vQTeNHJSdHvSP/oJPBkb2ly5V5vIQFveaD4plR9i26rFYudFOYE+jLK6nb0t6
         k9NgQc8fantVFErcosnB3cTJgpv6CW/ISg//FFm2euRTamQYjo6u/PLfFnofD0pVs9kC
         2hV7DR6CJ+z476jgDRCnOAC/GwW82bHyHyOMF1nbAz48muB4SfmABwvuW3ygc9SDcvxi
         T2YkDR5jmcWl/YmcK6iR5wCJYqG1D0H9dQtN56oa5ZYKRC6eYCIVrWyKgvSjLXDoA7ET
         TN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOg8bS37pm9ha6dkRAHGCNhC+k2Jf5zDp3gc5cqvlzU=;
        b=H4wdg/MwzGfoUJY2rlJ7Q19QduHeMzH6vNKub+Eo0AkXb2imj6gpuad/V0bm+N4oYq
         1y3zKPFWc6CMw3cmKmKYmD1VrNdjOOVPBYcUK+wGgapPah4GmE3XrwpX8Kkk3qUhvBFp
         JC/eyzXI53CjjRlPm5DZo+2tqx0WV42RBztNP98lJT6upVIqoL780C36QRS45WNE6wXn
         N8V/EF32dV8ya+ARaBPHzZL+OKfaDIcLW2L5Dag5JhI+75yfFKIf+58jJUN26cP99gXe
         U8JwNyVgkXvi+nrU0qW7iM/bQwigYlwUwWhlq+WCHL2AcdnvxMu/72qQVRYoQIrfcyDV
         yMog==
X-Gm-Message-State: ANoB5pn7GqtFcSZK2SgxwBxfxV415wfT1Y5r3xsMneDDXJ22M/zrKcQI
        rYap70MZ4p6VXLLDQzoQdOJWP38Xiws1WJf7dvY=
X-Google-Smtp-Source: AA0mqf6+JoojvIynhsVgEM5gm4TmvnyyxEN6bjnok3z+gOGLciZyohShHaU09BT98rB6zIBU+gc9BDuUDFuMoV0cAJM=
X-Received: by 2002:a25:da85:0:b0:6dd:15b7:7a35 with SMTP id
 n127-20020a25da85000000b006dd15b77a35mr3792184ybf.180.1668207249325; Fri, 11
 Nov 2022 14:54:09 -0800 (PST)
MIME-Version: 1.0
References: <20221104140659.593608-1-samsagax@gmail.com> <20221111162454.GA232204@roeck-us.net>
In-Reply-To: <20221111162454.GA232204@roeck-us.net>
From:   Joaquin Aramendia <samsagax@gmail.com>
Date:   Fri, 11 Nov 2022 19:53:58 -0300
Message-ID: <CABgtM3jWOcgw7gZjX7KuzC+QXY9g6bwrgGDZgi_rNSj5ipp2Sw@mail.gmail.com>
Subject: Re: [PATCH v6] hwmon: add OneXPlayer mini AMD sensors driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     pobrn@protonmail.com, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> Applied to hwmon-next.
>
> Thanks,
> Guenter

Thank you :)
--=20
Joaqu=C3=ADn I. Aramend=C3=ADa
