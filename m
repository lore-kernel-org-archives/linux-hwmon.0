Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBE6C46CA1
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 19:04:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbjIRTEL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 15:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbjIRTEJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 15:04:09 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CADE11BCD
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 12:01:50 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-34fdfa6af55so4815295ab.3
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 12:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695063706; x=1695668506; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ge6lyKsi2lWx8PE0ToiAjRfNHbAEHMk2qCpWodPDW0=;
        b=OoY9gsOpFr5xyjTvwT7rGEEqfoJ1SugwRvkz7QkEZuidaNPJcHetYqbQhATAJcvioZ
         rGa4MnpzMy4DSxcmSzqhwvHcDsYdFOeOk1AX+xtyaKQlO5SbIR0XTN0AmcCGkMMpA4ew
         M3yyTmhL9JVq+83szT4+bhQC3kqFvcGEEEUjdujjL8GNJETotdwJqgJTqLJwhM3exU3O
         jFv1aawn6UUSQjA2tF8ULFpclj/icxkc4R6xxwlafZJDPrgZzPidghSZ51JYbyLg9ano
         pemoDRJbKHQecNlTFgZ2YnvqtkKdIvXG68jUVcIFhmZFkAeouqud77a6+XhSEq+POoGG
         wSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695063706; x=1695668506;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ge6lyKsi2lWx8PE0ToiAjRfNHbAEHMk2qCpWodPDW0=;
        b=NjEYZZZ/7My2V5GZvApVE33aoULuGTRKc/bBka4TzDLprh117BEPaSQpVlryTExbPp
         Obrw96nVcNqwlyd2y29IWNqselGDIyxNMuBauLjmr0yGnI7Iuwlrt9+Sgvml3CwvxoeQ
         UQ/D+MYQJ1dPNSuTDgQtFXbl4GDIuNY9jdWh+cJgQPIbmbuckW4/981z/g4Wef1vqUMz
         CDpAeyaqAuZIKc3q9oQ9Pze1h5HkyAxsrZum3RdEDFvNuizZs4tscH7VUFKnCqRiy49V
         JgVZlZ2m6UiWXtDZwOLCsThMuYOZPvcmcvxMV4mtyWMXC+5c2ofXBB4e1TpxWLoxxoss
         CRyA==
X-Gm-Message-State: AOJu0Yw4W//JFYzeLkyRKc/735FQGxebGKEXEidBGvVqxqITpOwci211
        p84UzISK8ujiXfsQOmcHqzI=
X-Google-Smtp-Source: AGHT+IFpyuvKe0rLUfD5vzW0JVFFDgebnAqbQrabC12gtem75Tw1Zbg5sRcfEWRYt2Du09T6O/ZeNg==
X-Received: by 2002:a05:6e02:152:b0:34c:e4c6:c522 with SMTP id j18-20020a056e02015200b0034ce4c6c522mr11127125ilr.27.1695063706438;
        Mon, 18 Sep 2023 12:01:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y5-20020a92d805000000b00348ab9bd829sm3183708ilm.53.2023.09.18.12.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 12:01:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 18 Sep 2023 12:01:44 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Alistair John Strachan <alistair@devzero.co.uk>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-hwmon@vger.kernel.org, kernel@pengutronix.de,
        Support Opensource <support.opensource@diasemi.com>,
        Juerg Haefliger <juergh@proton.me>,
        Eddie James <eajames@linux.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Jim Cromie <jim.cromie@gmail.com>,
        Roger Lucas <vt8231@hiddenengine.co.uk>
Subject: Re: [PATCH 00/24] hwmon: Convert to platform remove callback
 returning void
Message-ID: <1b2bf631-1253-4bf9-89d6-ef98306aaf1b@roeck-us.net>
References: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230918085951.1234172-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Sep 18, 2023 at 10:59:27AM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> the first patch allows to compile test two drivers on !X86. The
> remainder of the series converts all platform drivers below
> drivers/hwmon to use remove_new. The motivation is to get rid of an
> integer return code that is (mostly) ignored by the platform driver core
> and error prone on the driver side.
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 
> There are no interdependencies between the patches. As there are still
> quite a few drivers to convert, I'm happy about every patch that makes
> it in. So even if there is a merge conflict with one patch until you
> apply (or in case you don't like the COMPILE_TEST one), please apply the
> remainder of this series anyhow.
> 
Series applied to hwmon-next. No conflicts observed.

Thanks,
Guenter
