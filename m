Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED46C48BE5
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jun 2021 03:11:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B14F613E2
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jun 2021 03:11:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhFQDNb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 16 Jun 2021 23:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbhFQDNb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 16 Jun 2021 23:13:31 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03755C061574
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Jun 2021 20:11:23 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id l4so6835091ljg.0
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Jun 2021 20:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=+APJUnmyuxpPZ9ObElGcs4GnW7xS8lKGJh9eRNxOZQg=;
        b=FtnBA8aQMByoe0KA24NkZyNWRw3jk9Qq0l8d8lpzKz2MXkgDeGon2kRspUo528j9c9
         ovnx4V3RzaCIBB5kV3qTH1Xi+mh8Frk8wj7AH3/nLeWwaSOE14tPlCxmIv7ibzD3E/Um
         r4GP5XQfZqrBD43SrCG0wcpVbQpmCcX/UeNvmrRhyTugU1l2Hqig24+ayEbFGDzdnHM2
         MChmge7lyAjr4pxuPDfQiF+hmtIkhLn948A1SXZ9Rk+hZFaYaKB0lDrK79khBkN06IUM
         wfWFw6pH+g+Twkslk5ZXxZ80YaNoMrWvrH85+Nnj9/FG535Tq8thrmOaPxVbZ9GXpxeF
         KfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=+APJUnmyuxpPZ9ObElGcs4GnW7xS8lKGJh9eRNxOZQg=;
        b=ZZ7s33OX5BFZOFiozVHmehVGMa+6tFdaqsduytTd6ei2f12xbwW8+b4in+SbNnAAJ3
         iMjysAb6u9Nwcdpx/v6RPo9Nd4BXqRHqDa8+0sBbhVwLLdko1VS1TD5j/eamr9fczXYn
         TxCxOyLy1n8C7U1NX1l+LAUGAha+dUt92kulrvSvlt76Uo3E3Asvld+3khz4//gcxiRD
         yiIgcm+hQp0QVTQptp0D2sgbGQC+MbrzDDsvwAXwVEkiIjhdh9YB6UrQ0nVuHK/7oDZ/
         cdGrstJOEI0kGcPtWU0agsheobYjTDSe5LI0X+2pEyaNPF/MQ/Jm+pCxZNYP14iJxEOG
         Iw6w==
X-Gm-Message-State: AOAM531Y7v4bwR3Cz9aOD6G7CUuusMJ6Q7c0Jzm+J4Zb0jUmxI8faPZa
        HNvZDI+aRYGYBzIgJBkK/STRi5ZgmlZsFKr+gZripqeXYgo=
X-Google-Smtp-Source: ABdhPJzhXQ2cp3iSktBaDsjsri0rMK0FmzYC6xr9jIYUhfJ9pzqdYAs0Z9wvQP9M0ZhUR1UhYdAXxBKB5x2J1phXR28=
X-Received: by 2002:a2e:8016:: with SMTP id j22mr2624554ljg.175.1623899481359;
 Wed, 16 Jun 2021 20:11:21 -0700 (PDT)
MIME-Version: 1.0
From:   Aleksandr Mezin <mezin.alexander@gmail.com>
Date:   Thu, 17 Jun 2021 09:11:10 +0600
Message-ID: <CADnvcf+LhxZoZk9eRUahSWZ3xVJLkxcAt3+4dS-JCjV8gZE_0A@mail.gmail.com>
Subject: corsair-cpro and hidraw
To:     Marius Zachmann <mail@mariuszachmann.de>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello.

I've noticed that corsair-cpro communicates with the device in
request-reply pattern, and also exposes hidraw interface, so userspace
can also send requests. How does the driver figure out that the
current input report is a response to the request sent by the driver,
and not for some other request from userspace? Also if userspace reads
from hidraw, how can it be sure that the report it read is the
response to its last request, and not to some driver's request?

I do not have the hardware, I was just looking at corsair-cpro as a
reference - I'm working on a driver for a similar device (nzxt rgb &
fan controller)
