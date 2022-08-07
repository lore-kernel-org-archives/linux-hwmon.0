Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95679C25B0D
	for <linux-hwmon@archiver.kernel.org>; Sun,  7 Aug 2022 16:45:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233178AbiHGQpa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 7 Aug 2022 12:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233392AbiHGQp3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 7 Aug 2022 12:45:29 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 943CB55BC
        for <linux-hwmon@vger.kernel.org>; Sun,  7 Aug 2022 09:45:27 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id t5so8777172edc.11
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Aug 2022 09:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=2PGRnV5Y4dd0AnjAyFuQDf1h6O5fn8Zc/uUHPAUm+NI=;
        b=YTdmANKJVa5XOjtTiYdXOz+UpK7W2lg+6xzggLPWy1aVGc0PSzaU0FfbggFIMoe3j3
         a4P5kaxXhGpHYCGP+FVZosVM2o5lRc6NMQmxc+yY9t/Lbi/El9cLdJs5z7+guGzRyhaL
         q3ZNdIA/KgGGoNNK4ClGkp9BO8iy4ra69yMkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=2PGRnV5Y4dd0AnjAyFuQDf1h6O5fn8Zc/uUHPAUm+NI=;
        b=NS3UHd0RnInuy1RwwFPCB6oMGVHpqLPkhQyr/DMSaTTExzJBmFAkogVtIKEOSqL8Ke
         d0Z5Gl/QWOmcZSLh/FmCallzyRhQqZyBw7rO6P/Hidi0LsoUI84TK7iedt6aCku/8FTA
         euUVauNeWPKXbqkxsE8WCf/SVVUpyQhecfklRrmyQtfdXepaGeRRiu0h8EDcrN5kpP/w
         fQb3rETMDfUORE/zcU9iD23dHvR3NDQ1XlkozLZVC2IaoieV4lJb6SK1aVQ17d/qoFCK
         HmJuly339hqrIBVjJLO2KTPEA/Tfnom90q1KxVs6pW5sYo4x3+EKwLUimOLjMZ40afRA
         sVXg==
X-Gm-Message-State: ACgBeo3ml4/QmxV+8gzmIsboeteAWvRGai8Sp6V/m9qLKEhEqEWYBQa8
        7PC7OhMu3JrMfftR5o09ws1jBbBB1fXe4LTh
X-Google-Smtp-Source: AA6agR7cEVw1O8YY/i9E8C1oGJE27Nlq65YJLXuHwg3NzgjZrU3uCzA0jw9eQqpFyovqSNUKLdUKvA==
X-Received: by 2002:a05:6402:4143:b0:43b:206d:c283 with SMTP id x3-20020a056402414300b0043b206dc283mr14736309eda.381.1659890725959;
        Sun, 07 Aug 2022 09:45:25 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id jw16-20020a170906e95000b00726298147b1sm3906801ejb.161.2022.08.07.09.45.24
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Aug 2022 09:45:25 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id v131-20020a1cac89000000b003a4bb3f786bso6300989wme.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Aug 2022 09:45:24 -0700 (PDT)
X-Received: by 2002:a1c:2582:0:b0:3a5:1453:ca55 with SMTP id
 l124-20020a1c2582000000b003a51453ca55mr9611614wml.68.1659890724521; Sun, 07
 Aug 2022 09:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220730022529.497941-1-linux@roeck-us.net> <Yu+OzWv2JDbI89mW@gmail.com>
In-Reply-To: <Yu+OzWv2JDbI89mW@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 7 Aug 2022 09:45:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiGO=pfxyW6E7HdxCnRwWOF_STL=z7yUNwZK__DrV1WmQ@mail.gmail.com>
Message-ID: <CAHk-=wiGO=pfxyW6E7HdxCnRwWOF_STL=z7yUNwZK__DrV1WmQ@mail.gmail.com>
Subject: Re: [GIT PULL] hwmon updates for v5.20
To:     Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Added Kees - this *looks* like it's a compiler bug.

On Sun, Aug 7, 2022 at 3:07 AM Ingo Molnar <mingo@kernel.org> wrote:
>
> Just a quick build regression report, i386 allmodconfig fails to build du=
e
> to a 'string overread' compiler warning in drivers/hwmon/lm90.o:

I tried to see it here with gcc-12.1, but it's not triggering, so it's
presumably compiler-dependent.

Which compiler is it?

>       inlined from =E2=80=98lm90_detect=E2=80=99 at drivers/hwmon/lm90.c:=
2550:2:
> warning: =E2=80=98__builtin_strlen=E2=80=99 reading 1 or more bytes from =
a region of size 0 [-Wstringop-overread]

Normally it's easier to see what triggers it, but here it's just that

        strlcpy(info->type, name, I2C_NAME_SIZE);

so it's either just the compiler being confused (we've seen that
before), or it's one of the

                name =3D lm90_detect_xyz(client, chip_id, config1, convrate=
);

calls in the case statement above that returns something that gcc then
thinks is bad.

However, from an admittedly quick look, all those functions simply
seem to return either NULL or a simple constant string.

Which makes me think "oh, it's gcc being confused by the fortification
code again".

Kees? Do you see anything I don't?

I get the feeling that we should just disable
-Werror=3Dstringop-overread and/or FORTIFY_SOURCE for that
compiler/architecture combination if it's just gcc causing bogus
errors.

              Linus
