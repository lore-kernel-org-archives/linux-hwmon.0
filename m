Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D078C2B9F4
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jun 2021 04:33:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6536E613CE
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jun 2021 04:33:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbhFQEgB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jun 2021 00:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhFQEgA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jun 2021 00:36:00 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5283C061574
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Jun 2021 21:33:52 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id b37so6900996ljr.13
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Jun 2021 21:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=1kfBuAN/ijHZAiV70qH1LJgS1b3E/pmKA6fcTnMDxYE=;
        b=MvET3lJod7FqFowOhq8+4J3P6twg/j8lBKFeA6HcbQoqqkM8H1H0BdmzYdTOhHiw11
         sUC+yyKZpPMJnLM1DUz4SfnXAy3+LtgobWyTM8+j+e8kmYAlbOBha2iui38kaTw+1kU3
         97fOm8rr7xlMF/GepILExRenkfEA5f0VS/8X7E8go6h7GOjA2fqdHqrKI7TtMzcMMz/X
         pidvoeHhOPp8Q0Wr4ZB1RSHbSQVgQxrpE+/9PxD2o+F9q/SkiKTfEKSvXEP7bz3Dkhg2
         N+fmzEobMiqBILw0S+09LILGZqc0yDZz+EDZWwDzXjsBw/xZ9qvw5fkgraDMPrgBxTJr
         mqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=1kfBuAN/ijHZAiV70qH1LJgS1b3E/pmKA6fcTnMDxYE=;
        b=NFRWBTagCuU6Nc1abDi/urOrrefxaVfVB0/9qNC/aKm1nlQ+JkI/XUT4MBAhv4yfes
         3cQ01EGH4Eu0qcHPzIjeTGg/Xe9OfweIneiAz7ebOwCW4T5E7NCW6vqYZeXda+lIGRMJ
         yzZfFpxKUDSfFzeRhnHV6SeQ5pMiZ3s1PJAkSCzCgZkJgpKZptUYNe6wW2i/gc/dwHbb
         Iz+BbSvtYYPl2f1u6U8MCVYXAC81Up2phGDDGl0F/Npfz7CLTQE49gtuHhPMQgzhqtYq
         h2eB3f068/wD3CA+p4f8rq0So4bmRv3KpJiglsGrv+1746Fh+zH5expp9TeWx1ZMCmDH
         G65A==
X-Gm-Message-State: AOAM5305twxEfh8DTXwZjOTTc16moBaFWrh2zP4tZgWaOiXc7V8b+HB+
        0gs3s6D4LRcXm09+3+7WEy7WynMkfz2C5bDH/4k=
X-Google-Smtp-Source: ABdhPJxvwGEckpP1T7096Q8Hrv1SlIYsvg5n/VpOR/tKihY/nHIciUH4MzJW8rdGkLKGSaBLvdo76beOZWyFtPIgqIA=
X-Received: by 2002:a2e:2a43:: with SMTP id q64mr2778808ljq.375.1623904431131;
 Wed, 16 Jun 2021 21:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <CADnvcf+LhxZoZk9eRUahSWZ3xVJLkxcAt3+4dS-JCjV8gZE_0A@mail.gmail.com>
In-Reply-To: <CADnvcf+LhxZoZk9eRUahSWZ3xVJLkxcAt3+4dS-JCjV8gZE_0A@mail.gmail.com>
From:   Aleksandr Mezin <mezin.alexander@gmail.com>
Date:   Thu, 17 Jun 2021 10:33:40 +0600
Message-ID: <CADnvcfJnaco7_+2TgM-Pqo3Jpm-h6MdotF1jBNOqLMqAjOt_-g@mail.gmail.com>
Subject: Re: corsair-cpro and hidraw
To:     Marius Zachmann <mail@mariuszachmann.de>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jun 17, 2021 at 9:11 AM Aleksandr Mezin
<mezin.alexander@gmail.com> wrote:
>
> Hello.
>
> I've noticed that corsair-cpro communicates with the device in
> request-reply pattern, and also exposes hidraw interface, so userspace
> can also send requests. How does the driver figure out that the
> current input report is a response to the request sent by the driver,
> and not for some other request from userspace? Also if userspace reads
> from hidraw, how can it be sure that the report it read is the
> response to its last request, and not to some driver's request?
>
> I do not have the hardware, I was just looking at corsair-cpro as a
> reference - I'm working on a driver for a similar device (nzxt rgb &
> fan controller)

Oops, there's a comment about this exact issue at the beginning of the
file, and I missed it somehow. Sorry for the noise.

I wonder if the driver can synchronize the access through hidraw
somehow, i. e. make hidraw read/write block while mutex is locked.
