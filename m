Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51BF2C433EF
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Feb 2022 09:59:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243455AbiBEJ7X (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Feb 2022 04:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236982AbiBEJ7X (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 5 Feb 2022 04:59:23 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A04C061346;
        Sat,  5 Feb 2022 01:59:22 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id q204so10426715iod.8;
        Sat, 05 Feb 2022 01:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RBLeD/NBJxubi8leudvRrXMCAHD66lE4PTd6qbSu0lc=;
        b=mg+GhqJg7GA4AeXUnFf7wp5xs9uu0IC4CWduUfBomQNB5c7qnSZwkS7K2BxipROs+k
         +b0j1vBsldv8OhFA0ESuV/NuNQPmuLVlM5U0zn5tN272rctjTda1T6auEV/iQHqCYF7g
         Cx/290ZlaNVWOH8gcULi0x2ZMipAsYhp8VJ3YEo668xfrZKB9iqhb8hXN4OxCw3h2Bb+
         QpkrmNt/hKNlZtPe9NN5D0LzWSLdm/NMJsJdK5759WjVRFFCVqqJVglI6pmKrKGOeq1Y
         i4W6pvec/2Zhg1VAiOhq8JL4PZeueLrHJUUVbq7qTj8Aa8FtyXS53J7jSzGCOLqvn2eq
         DVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RBLeD/NBJxubi8leudvRrXMCAHD66lE4PTd6qbSu0lc=;
        b=iXM/Yqa2xseCDKaAhMl6RM9DpRXZZRLm8PbBF+iDSvNdsLDAj+C1xzy13QIa1j/kBv
         eSwdQMJ5yjPBgL1minS/MealKKlbwS0409Kb+I9j8Ok0vDJ+tzYhXCaIW262IWNtd1av
         FB5nlwMSZECUd0ECUCuENjsBMsIeN4OM7vyWSMLfjf7YZSWyAzQ7H8nccwD+0ZwvWQA2
         oB6nR2DX6dWcX4XbsFPUTf7kGbv5A455hm+Zy/YpY/fPTk+ZPepdL/xv4L2p1J7EIdIg
         rEuswWRRdgeivyZnRrZbSZLRKzu4+7LaPcyy69M9PmZ7ncpgv7Ig5DUWUiO2Lg5AinZ5
         HjuA==
X-Gm-Message-State: AOAM530TJcIbuNwyjoKdmT6F/5UpUx1qTj3Ej17sFgYETRoILuBPZQf2
        H2TnMAAbvTq0BY8WCzqaR+Pu0sESGu00dENN/LITckgxq5g=
X-Google-Smtp-Source: ABdhPJygNOZWphuiQY33yiIq+K2TCMt/A8kKsixHpxEEaSsaDxBUgs5394R+pNDuIx3NjdoE9mD9VbwQg6RIrfpqju4=
X-Received: by 2002:a02:b0d8:: with SMTP id w24mr1545089jah.241.1644055161651;
 Sat, 05 Feb 2022 01:59:21 -0800 (PST)
MIME-Version: 1.0
References: <20220205092015.GA612@kili>
In-Reply-To: <20220205092015.GA612@kili>
From:   Eugene Shalygin <eugene.shalygin@gmail.com>
Date:   Sat, 5 Feb 2022 10:59:10 +0100
Message-ID: <CAB95QAS8LxMeWGFqZ3MGHBBxxBafz3w9L1GxxdP16XjZKLVAuw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) fix a typo in asus_ec_probe()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, 5 Feb 2022 at 10:20, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> There is no such struct as "asus_ec_sensors", it was supposed to be
> "ec_sensors_data".  This typo does not affect either build or runtime.

Thank you for the fix! Perhaps you could also replace the sizeof
argument below with *state to make the compiler check the declaration
type?

Eugene
