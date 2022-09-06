Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5161EECAAA1
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Sep 2022 20:23:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbiIFUXW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Sep 2022 16:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiIFUXV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Sep 2022 16:23:21 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3FD25C2
        for <linux-hwmon@vger.kernel.org>; Tue,  6 Sep 2022 13:23:20 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id b17so6596971ilh.0
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Sep 2022 13:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=dFUtGD2CYSZCPlkfNLuOvYXYPqX89V5HFliBFkygvhw=;
        b=IJMZ0ssNnxQMP4S9bMps8AveY/BpJyiQTTtJCLZgfQmxK2Joxpl83mMrw8qwM3GfML
         I8UHTcDnG4R/bmhlIVbv/fQEHcx2/qe/4tnxKHQtTWSOVWNEMiT7tV4Kx5yyst6K1m1W
         lBSCR/4tlBTewGLQwxbd5/cZOJ1UjUdDetiVjAao9HfD5YFvpydBzpzx5rK2/EMg35Ic
         4QuXon4nO0zTIzMbTDw6jeQvL1QPhIojr+mrfrK5t73pcL3Cy9tIARsNZnJQY8SJipPN
         MnMHs4lt175pS7pyun+MLy1rTlg8e8ZA1YirvTwoyOXRTLSJ37tNJqqgC3R5xG2P3aIa
         XLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dFUtGD2CYSZCPlkfNLuOvYXYPqX89V5HFliBFkygvhw=;
        b=flV/0Y4+IAUlycZlrhoO8hw+T77HmW2uwnJDj7hjwYHDXixnGIWh9yHGnxvV+iktKS
         LK0TSKcYtCNuVkea0jd7jfKRSmAgrcSj/2TC1TKcjp+iJxxgX/trxbQBQtJETYetcnIv
         h7Vj0Sxn+wkLk23yFMXL3ctMlBaNLPsmpL/ilDaUKyb76YbkwnEHF9TiTbDyuYo2mWR8
         71o8eG6Sedox0TAsPdHtU0Rb467bnCIjEAwg4v/4fbrI5hIPyPj51knoTdfQP+/QKliM
         tGlVsGKTOfMttcAxMjrxRLy/geYrOZYXey6NcdVfMGsuuwAdaF6GrI7OdM+jqYkRDxdA
         f0hQ==
X-Gm-Message-State: ACgBeo3Qk6rfHCeYT4WO1O8PW25eBhBatuxE2cfmFJpKGvnC0zPwTO+b
        dAo2Qtuc/2EmVnee9cSmqIDbDpQsqI1N+tr2YvVPkNwr9Tv2GA==
X-Google-Smtp-Source: AA6agR7Vb4ipPmzyR9ULsjjEpzV4TmM/HpiMiHikkCKNEoBfZGjbHsYMM1JBK9rPo8CijSdjKQXyO2SwJkYn5LW+6V4=
X-Received: by 2002:a05:6e02:1bc9:b0:2f1:9ee8:246d with SMTP id
 x9-20020a056e021bc900b002f19ee8246dmr146712ilv.246.1662495799666; Tue, 06 Sep
 2022 13:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de> <20220906201035.GA3453623@roeck-us.net>
In-Reply-To: <20220906201035.GA3453623@roeck-us.net>
From:   Eugene Shalygin <eugene.shalygin@gmail.com>
Date:   Tue, 6 Sep 2022 22:23:08 +0200
Message-ID: <CAB95QAQRT5p5k=0D781aOra9uF3vw-92+T_CePd_7tzJDDH0Yg@mail.gmail.com>
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other distributions
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Christopher Klooz <py0xc3@my.mail.de>, linux-hwmon@vger.kernel.org,
        regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 6 Sept 2022 at 22:10, Guenter Roeck <linux@roeck-us.net> wrote:
> Are we getting any closer to fixing this problem ? If not, I'll have to start
> reverting patches or even declare the driver as BROKEN.

Out of a few workarounds I've tried, none worked. I rework the module
autoloading back to plain dmi data. Sorry, I'm totally busy until this
Friday and can't prepare a patch until the end of the week. If that is
too late, removing just the module autoloading
(MODULE_DEVICE_TABLE(acpi, ...)) will fix the problem.

Regards,
Eugene
