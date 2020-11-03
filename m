Return-Path: <SRS0=Pxzt=EJ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BB3C388F7
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Nov 2020 21:58:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B3EA2242B
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Nov 2020 21:58:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="viMeBAcf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728567AbgKCV6y (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Nov 2020 16:58:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730673AbgKCV61 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Nov 2020 16:58:27 -0500
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF8D6C0613D1
        for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2020 13:58:26 -0800 (PST)
Received: by mail-ot1-x342.google.com with SMTP id k3so5579974otp.12
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Nov 2020 13:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DDLMBeLzJPjE1qW72nl5DKUtiULzN1MQv6Lr1ynJPU0=;
        b=viMeBAcfIKBbzTeFdyHXIy0xEd4yas7rpzelu7HGwxQO+mFiMMee7CujkuNe2QB4nr
         UwgyvuHWULmMmMUzEZgN2c8iqKL/Vqgx69DkZ2/yA9u/q30HANOiAzNTSlsHDD1KulLx
         hcl9Bc+FzCpOMz6Cyp90Hc/rtFpwjaHktmHu5sscFcrxzMncrYEmapL9C6lB8/PaLSVn
         WOFOFxovoaWqvS8TOeH9kq47jzQRfIdH17OqZypBh0lbw4kiIp0ahO5AKN9QU+mVIOTo
         PtmXgUpTeQ7sjkSPhIO5V3oR9qD7ENh6jWmt0LTu2pVhSSfEgUC6tFBEeO/6zsOR05b0
         77Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DDLMBeLzJPjE1qW72nl5DKUtiULzN1MQv6Lr1ynJPU0=;
        b=cvxMMQrmj7FRgTdp/02IcCMNgdeUWsrwvhQBkf8ZX6YNcr/+rNJPd2nxU50SA2W7XA
         KXdWniLpD/4MoRBvTIicwoZ2bHyfm/4HWbwc0is9+eg5rjfz4w4BhA2jypaPtCWTr0Kt
         /M9UzFGG2dZzMfQfYpNMTlgv/Tj7f/KL5J4D2Q3GrgaNibWMxz2kmGqFIctiXFZX1d8k
         aiDzNsJP9Z9IMR7BY1sZNjSFHtLGWbQZdBZqWQ2rpmae6AiQhMGUEcsItn+cetJZPB+G
         5qRYJ+Eun4SWEO5U+j0VChy4jor514BOVCzJOrceOgm8jJPWdsOfIttWacwRVVK3gh9K
         XmGQ==
X-Gm-Message-State: AOAM533mH9iFehEgddWcnw8ZufIZKO2qvsLzzcjkB9lQZarCPiYALw5V
        w60u/oZkThdHr5frghRfWoaVXIfqpYGBAeFw7xlJpgl8HaNqkA==
X-Google-Smtp-Source: ABdhPJzKheNobIRDuD1HM6mKU+Ey7ftkORRj3zmEzzzpeTV+Bgn1Cr2o0wP+AUgcCvDUgov0Cd+g7H2aamwWnaqxmaM=
X-Received: by 2002:a9d:dc8:: with SMTP id 66mr12507330ots.302.1604440705781;
 Tue, 03 Nov 2020 13:58:25 -0800 (PST)
MIME-Version: 1.0
References: <20201103193315.3011800-1-robert.hancock@calian.com>
In-Reply-To: <20201103193315.3011800-1-robert.hancock@calian.com>
From:   Alex Qiu <xqiu@google.com>
Date:   Tue, 3 Nov 2020 13:58:14 -0800
Message-ID: <CAA_a9xLGi814mrsTCwieVscypyApx3-K_QRZLKTyji8gC+Mpyw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus) Add mutex locking for sysfs reads
To:     Robert Hancock <robert.hancock@calian.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Nov 3, 2020 at 11:33 AM Robert Hancock
<robert.hancock@calian.com> wrote:
>
> As part of commit a919ba06979a7 ("hwmon: (pmbus) Stop caching register
> values"), the update of the sensor value is now triggered directly by the
> sensor attribute value being read from sysfs. This created (or at least
> made much more likely) a locking issue, since nothing protected the device
> page selection from being unexpectedly modified by concurrent reads. If
> sensor values on different pages on the same device were being concurrently
> read by multiple threads, this could cause spurious read errors due to the
> page register not reading back the same value last written, or sensor
> values being read from the incorrect page.
>
> Add locking of the update_lock mutex in pmbus_show_sensor and
> pmbus_show_samples so that these cannot result in concurrent reads from the
> underlying device.
>
> Fixes: a919ba06979a7 ("hwmon: (pmbus) Stop caching register values")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
Reviewed-by: Alex Qiu <xqiu@google.com>

Hi Robert,

Thanks for raising this issue up!

- Alex Qiu
