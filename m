Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F05EB64DC
	for <linux-hwmon@archiver.kernel.org>; Thu, 20 Jul 2023 15:13:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbjGTPNA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 20 Jul 2023 11:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232469AbjGTPMw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Jul 2023 11:12:52 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E55B726BF
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Jul 2023 08:12:49 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b703cbfaf5so13488951fa.1
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Jul 2023 08:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689865968; x=1690470768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OR4CnZp6F7D4KAQ0BL845tbrVz9ugD0EX7S7dGF5yAU=;
        b=pO+ADtc6up0M6npJq2D7M9CPM5XSRbEjmN5kw5Y4sDaVIw4SufxISznRG33rqAeTsh
         ftacbyqghje6LEWXp/IKmIU5EhuTv/MbhZQw3VPCCGNJ2m/0ZQAoIGltOSrSgCQI6g27
         0Wqb8CBXCVZplCfldJV3FFKjzhU8nTv4mtH+2H7aoytnEvu/51SwQqU9aOLWvHAgMAGc
         HOEN7wicYJsN1vEIANEbT5zGlCt6Ps6tbvH9wTddAGSrC31GU/XjkCKDCfTORxnPRMa3
         tYVsOkmdnpL+HYvFzx7IIbN5fBXbjpVVfLpV/PiplICvCcPuc0ErMi69HFGzT5QpHEt6
         PpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689865968; x=1690470768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OR4CnZp6F7D4KAQ0BL845tbrVz9ugD0EX7S7dGF5yAU=;
        b=JCN6upADVuzMDUJoXiw16TjI/5TUBfkt11Db6DpdqsGqEXuUYR9/PzfV4uSMdDx3Li
         8Fh1he3wZcFkBx0Jmu3RBflhlakyleNwCkLcRjD4Aq/arkLo/ZfMFQWdRvvSFG/Glq7J
         08MdhA+z62MxnwHJouGeMfX288IM7CiGprDZio5DagCtBK16S8EK0eoQEYGMW5NpuXqQ
         m7sOrPFEZi7qnxb3p6lZB7Xb1OkiPmQkXi0IAC8b2u3V1UtifTdOloy64RhXixwlmP8Q
         knhmfGt1xxKN8loBLIKhD3nEQ5O3xgQVcLpAYFGOJG9GeRIEy7JHkizB1N8L3RfVf1NO
         Z3dQ==
X-Gm-Message-State: ABy/qLapL1yJF31gYaTqZVedBrxqzviqFk3B7gOjbtOIkiGqyM2wdIQf
        EsmTeHN3BTRqOwPEqpp2s+RxHjnS4jbRkZXIcgtzWpwIksDPvPJEYrI=
X-Google-Smtp-Source: APBJJlGGvCyKQ0is6wgjsQg1NXCvU3HK0pcsuXhP+KW9UwSvuyAY7ouvvwRHKVbH8WSa7H+UhgqxHSJYFfpzCfSMQNU=
X-Received: by 2002:a2e:870d:0:b0:2b5:8bb9:4dd6 with SMTP id
 m13-20020a2e870d000000b002b58bb94dd6mr2539937lji.12.1689865968242; Thu, 20
 Jul 2023 08:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230705194544.100370-1-nick.hawkins@hpe.com> <20230705194544.100370-3-nick.hawkins@hpe.com>
In-Reply-To: <20230705194544.100370-3-nick.hawkins@hpe.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 20 Jul 2023 17:12:36 +0200
Message-ID: <CAMRc=MfaEfaZ7yYrFtc+XChzPX1C1AV1xAZPRZyJKA+z7D6-vw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] gpio: gxp: Add HPE GXP GPIO PL
To:     nick.hawkins@hpe.com
Cc:     verdun@hpe.com, linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jdelvare@suse.com,
        linux@roeck-us.net, andy.shevchenko@gmail.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jul 5, 2023 at 9:49=E2=80=AFPM <nick.hawkins@hpe.com> wrote:
>
> From: Nick Hawkins <nick.hawkins@hpe.com>
>
> The GXP SoC supports GPIO on multiple interfaces. The interfaces are
> CPLD and Host. The gpio-gxp-pl driver covers the CPLD which takes
> physical I/O from the board and shares it with GXP via a proprietary
> interface that maps the I/O onto a specific register area of the GXP.
> This driver supports interrupts from the CPLD.
>
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
>

[snip]

> +
> +/*
> + * When an interrupt fires for a PSU config change
> + * there is a need to know the previous PSU configuration
> + * so that the appropriate gpio line is interrupted for
> + * the correct PSU. In order to keep this variable up to
> + * date it is global so that it can be set at init and
> + * each time the interrupt fires.
> + */
> +u8 psu_presence;

I'm not buying it. There's no user of this variable outside of this
compilation unit, is there? If there was - the name should have some
prefix but even then, I don't see a need for this to be global. Why
don't you put it in struct gxp_gpio_drvdata?

Bart

[snip]
