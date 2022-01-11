Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A41C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 11 Jan 2022 17:24:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241629AbiAKRYa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jan 2022 12:24:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238268AbiAKRYa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jan 2022 12:24:30 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48741C06173F
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 09:24:30 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id w9so10293331iol.13
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 09:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RIBP8Y2lpGvpuowpkpG3qp0AX2sTvJkfaVlUruJN7Ko=;
        b=nuTXOAvTKRJ57+q0Qp+QsvdVJxHPWoaIFxXDWzQ33dmg9Dv0rbAgGrnh4iDpz6Te9M
         y8jRopu0MdM71ourX5dq5rsQAyAM4kbWx+k4d7yznSrnVlrfbY/vc69fK0FiiONkpmCf
         +PzPVU953MpfWsW3F8M5/x7cgyvEyUOBjKflhadFkeMTcS4vaqNOsCppaQRbTm5xl7fw
         1DLnUE8uIWiSgKWtdoQPzLHRylcYsp8TpOJXdjUkzN2NZP9rG3rLcl6fKWola3rw93WJ
         kYFKJBBjfjNtyVAPN69BalA3/iWhl+kIRUnB0dIwtiQiKL2JzPPAJpJGe7V6Xr5EvqXR
         WQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RIBP8Y2lpGvpuowpkpG3qp0AX2sTvJkfaVlUruJN7Ko=;
        b=vuHnQwhOBRT15j7GV+g47JuL9BeQyL86hrf5I0iEqa1IKZ4B/ny+PYtgoBeVzplowh
         HCP/3eIHGKG+yPlygrBDb4AOgbx9kMnluqwlpSsFIo5tbfLxcagXqHJwuvOKBYsz4MJH
         /pvQrb8qZlLYDE3xrwZVTm9LH494kpeY1Fw9gmx6wRJdhoC6JPW5VRWE0gqAAm8Zbsz9
         e08bWcy5vg+PQXx6xaJRxGTsyt3BRC5TXP38HvQA/WTZFrHhMKHqW1QAVNN0ScePC3gr
         oC/M1NwLVT/c1dWGkfPU7EbT3WjfsXQUSktSdEpP++Uu5eqNc9fR05hyAg72zVt99O0i
         2bCw==
X-Gm-Message-State: AOAM5323qvqQ5TBnQZaSDtAQC6SU9GVhbaxbo6oxVMTO77D4eq0UZ5+S
        yslVTPLAlMIL8d+7TKQcyXfi/aJ3VKbTviCSAVg=
X-Google-Smtp-Source: ABdhPJy3nDxQetX/ZLPiiGQyvUrVPTJwMXuFxWvLxikrPwSnjcjw/v6Hqj8k0ETTuLbQbVVI067kwIKrz2gDcAdkL2o=
X-Received: by 2002:a02:c734:: with SMTP id h20mr2871589jao.256.1641921869757;
 Tue, 11 Jan 2022 09:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20220111051842.25634-1-ajderossi@gmail.com>
In-Reply-To: <20220111051842.25634-1-ajderossi@gmail.com>
From:   Eugene Shalygin <eugene.shalygin@gmail.com>
Date:   Tue, 11 Jan 2022 18:24:18 +0100
Message-ID: <CAB95QASkWK6Qaqnx57WUOWB6gjXnp3S8zt=9kCRK2vs0yr=isA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus_wmi_ec_sensors) Support T_Sensor on Prime X570-Pro
To:     Anthony DeRossi <ajderossi@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Denis Pauk <pauk.denis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Thank you, Anthony, for the fix. It was also included in the v3 patch
for a new EC sensors driver that should replace this one. Perhaps I
can enable the T_Sensor for each B550/X570 ASUS model that provides
this connector? Seems like it's always found in the EC registers.
Before you submitted this patch another user provided information for
this board with no T_Sensor, and I thought this board was the
exception.

Best regards,
Eugene
