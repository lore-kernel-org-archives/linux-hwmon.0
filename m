Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F06C4361B
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Dec 2020 13:49:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64DFC2255F
	for <linux-hwmon@archiver.kernel.org>; Wed, 16 Dec 2020 13:49:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgLPNss (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 16 Dec 2020 08:48:48 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]:38977 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbgLPNsr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 Dec 2020 08:48:47 -0500
Received: by mail-oi1-f171.google.com with SMTP id w124so24392832oia.6;
        Wed, 16 Dec 2020 05:48:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1aJt+uK8IXa2MEy4a+4D7ocSuQCiL0op/j6Lfuqhewk=;
        b=NytQClV7hktI0RARjJBwkXe00FZAq74jVSXEgZZiRmlpxCRuOTxxrUzokTd6g6g5AU
         KKB0ThMICUVTWHsZOPhkI34vDOvsTXIAekarp9HKXUI/32dTqrBtW9vcvj6XZFlmyS7c
         8d+nnOAzMTvwq7+Gw2JJnvr/Tst0dxtjS7HJhkfAXEJ5qSY44+kNHMmPd68BFhdW4xq5
         AvJiQgJ0ieY1s+e64MNbNV1xw17WQ0vLEG9m2dmobj72RfJxvM2YlpoisfKmJjZNj9qe
         6c+nZM3OFbAg93vfh/f/BXNltRKXdocLmwcuv8H7vvKLmwIbJFo/Lgn6ks6FdbrU6oEo
         55vg==
X-Gm-Message-State: AOAM531gPfrTz9RBz6Zz5MA9L55qYv+mWo+XiqUxNnzjcJohGLpZfODy
        3DK1/UofIGVmjD4k3aEzOwEJanTBjQ61vX93FYU=
X-Google-Smtp-Source: ABdhPJw/4S1xC9TWpBiJmWLzeo4io/CgmzlZZ9pFLpIoKY81x2UCCDYGc+cabQ0ItvM8vFMkf2hIFmtXkzDVSc2RNgA=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr1960776oih.153.1608126487037;
 Wed, 16 Dec 2020 05:48:07 -0800 (PST)
MIME-Version: 1.0
References: <20201216134626.1323224-1-geert@linux-m68k.org>
In-Reply-To: <20201216134626.1323224-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Dec 2020 14:47:55 +0100
Message-ID: <CAMuHMdUR7d9-CqnPCm77UAeKVQOoR4RbOed1BZJqScPF4NMU+Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] ARM: uncompress: Fix dbgadtb size parameter name
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, Kun Yi <kunyi@google.com>
Cc:     linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Dec 16, 2020 at 2:46 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
>
> The dbgadtb macro is passed the size of the appended DTB, not the end
> address.
>
> Fixes: c03e41470e901123 ("ARM: 9010/1: uncompress: Print the location of appended DTB")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please ignore. I screwed up some scripting. Sorry for the mess.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
