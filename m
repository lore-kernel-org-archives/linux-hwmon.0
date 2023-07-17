Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC36C0015E
	for <linux-hwmon@archiver.kernel.org>; Mon, 17 Jul 2023 17:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbjGQRYz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 17 Jul 2023 13:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbjGQRYy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Jul 2023 13:24:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10FBD10E0;
        Mon, 17 Jul 2023 10:24:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 827E6611AB;
        Mon, 17 Jul 2023 17:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D02C433AD;
        Mon, 17 Jul 2023 17:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689614686;
        bh=7K1NrqOEnIsov6LNPMbWxEcmOTQ8DoOSUXf5nazDWnY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=d87713swd+8flnDOEBdwYxJh+zPcc7RahC04ehtpicfiWxmDmyXavKTgMxupa9u60
         uE518sCiopXnFJ5xCs8ps7AxbLJpCW4AptGYKBTNIiQidXwSpvzEB5cKMRJ/MBlDoP
         opnSkxxGtXA14auVA+sh/vudr8u275YmFGfUA91zf1AAcmAnxNFFf4fGJAdedgjWnV
         ZSPzv/UMDBMpnzH2k96dEQ49n2MCVBSEQXB7YPqF3SeCNKY52z3KHOXEeRgekW2mOH
         tDzxWE8RyIllj4sJeBybKdla3Urx8w4VbLFEfAhwfym2dc21ty7k7xWjwKiODqmKZK
         phjNQroLqJXQg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b73564e98dso71283361fa.3;
        Mon, 17 Jul 2023 10:24:46 -0700 (PDT)
X-Gm-Message-State: ABy/qLaVSJKbwmzxBEVN4XOnzoEk7OnHeIzGYorUmotJIRl4kXFh5PKs
        HjkeUKtxkKACACYw5E1v7OqzWCZ6Q/4tWuz2og==
X-Google-Smtp-Source: APBJJlG8mEK4npwacHnkZf+THmzcOFSnKgn7HaAY1ey1gKBCNN6LRJvR5ho/gv5Qa7cQ6Y9pK6LCgVvVrpJDCMni1K8=
X-Received: by 2002:a2e:9f17:0:b0:2b6:cb0d:56ae with SMTP id
 u23-20020a2e9f17000000b002b6cb0d56aemr8218837ljk.11.1689614684790; Mon, 17
 Jul 2023 10:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174607.4057185-1-robh@kernel.org> <e0e1b465-8419-419e-90ae-4b72f5189469@roeck-us.net>
In-Reply-To: <e0e1b465-8419-419e-90ae-4b72f5189469@roeck-us.net>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 17 Jul 2023 11:24:32 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJZcxoQEhaGr34Mk1P_8vc8wctcfzswWc8VbRrsv0S7zg@mail.gmail.com>
Message-ID: <CAL_JsqJZcxoQEhaGr34Mk1P_8vc8wctcfzswWc8VbRrsv0S7zg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: Explicitly include correct DT includes
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Robert Marko <robert.marko@sartura.hr>,
        Saravanan Sekar <sravanhome@gmail.com>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Jul 15, 2023 at 10:55=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On Fri, Jul 14, 2023 at 11:46:04AM -0600, Rob Herring wrote:
> > The DT of_device.h and of_platform.h date back to the separate
> > of_platform_bus_type before it as merged into the regular platform bus.
> > As part of that merge prepping Arm DT support 13 years ago, they
> > "temporarily" include each other. They also include platform_device.h
> > and of.h. As a result, there's a pretty much random mix of those includ=
e
> > files used throughout the tree. In order to detangle these headers and
> > replace the implicit includes with struct declarations, users need to
> > explicitly include the correct includes.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Applied to hwmon-next.

I found there's a double include of of.h in lm75.c. Can you fix that
up or do you want me to send a fix?

Rob
