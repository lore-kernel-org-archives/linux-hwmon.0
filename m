Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0D4C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Jan 2022 01:45:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347094AbiALBpM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 11 Jan 2022 20:45:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346754AbiALBpM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 11 Jan 2022 20:45:12 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13E8AC06173F
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 17:45:12 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id e3so121459lfc.9
        for <linux-hwmon@vger.kernel.org>; Tue, 11 Jan 2022 17:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KB/SFaZ7iubyi9mxarNbq8YwKUpj87d0f7Dml4Gr/Ek=;
        b=oLAlJhZC0gilyo/a2kkbcOmNAqD/WNcja6OkDxVJDmBRQaaAZFCIjiETSRbUfY8TIA
         Gwc1GGnAt9DD6fuYe1Pi6FEDppYIO1kqBfKN0GTt3O59I7hfx5S72DvSxdpE9BmAK+u7
         USETNjzJWBVEeQ6CdjQ/ZmEQtmZL2p+Y/Fl6bpFhsOs+hgJ8Hxt1Ef+kbd6F56qjOAAQ
         ITPfckiIDndQjP88WvaUME6X8iDW8MtUaIcknECaUkiQ7hJr+x46THfWuMFl6lVFxzRo
         dh27EGy7p0v4jwTAMxJsvcskou658FRGl6y8FgzikamE9aPf9IJCvGtfD+EloJMRllLg
         JVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KB/SFaZ7iubyi9mxarNbq8YwKUpj87d0f7Dml4Gr/Ek=;
        b=KEQoUNXUfnRhJGu53354zZFhr+Xh9apX176uyrcUekiqeTMIqCdPr6j/o5wYNTv4Ci
         A9KL1Gnmp2eU8QvzgVf8Z1J27yU01DEfx/U1DUO5Rh2Jum8PReI2KQc4yBI3keVT7tMG
         bXJ6gXNvIEUlRh/tT5A6Y1QUt0KvgGUJahKlO+5XefCKfmX2pSglMaeXOdO/ig3g4bHN
         f76ebfcbWSbHzq+HnHj1HHZaWdYw1fBX7XepVnEOoYTdvv5Ppah5A9PJze3/Pdpyw7z/
         cKLke9Q4UqunZCIAVllsOgGdzPdkSjAfIolngO/JZqB+fag+LwgUNR5C13cfMeVSOrd7
         OApQ==
X-Gm-Message-State: AOAM532/yFHtGMNA9jXCHz51Nkpvi2/szvV63vI9x/6OL/sNu1tZ7EWS
        +iNBoLrQjYlidRzynRooj3ssGUvLZ14f5nVBhjA=
X-Google-Smtp-Source: ABdhPJwDG0Cwh8r6gH9zWCviMuDv9dAUG1qFLnTM/iYk2VgaP1F23nlORYqu3XotIeFpDaOnXwVR8oG8oMTqb1aJxMk=
X-Received: by 2002:a05:6512:398b:: with SMTP id j11mr3171506lfu.94.1641951910493;
 Tue, 11 Jan 2022 17:45:10 -0800 (PST)
MIME-Version: 1.0
References: <20220111051842.25634-1-ajderossi@gmail.com> <CAB95QASkWK6Qaqnx57WUOWB6gjXnp3S8zt=9kCRK2vs0yr=isA@mail.gmail.com>
In-Reply-To: <CAB95QASkWK6Qaqnx57WUOWB6gjXnp3S8zt=9kCRK2vs0yr=isA@mail.gmail.com>
From:   Anthony DeRossi <ajderossi@gmail.com>
Date:   Tue, 11 Jan 2022 17:44:58 -0800
Message-ID: <CAKkLME0onNGrWcvHvfEMBBTb_yKQyL2qRXjMmyrPdOLTUxWGjw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus_wmi_ec_sensors) Support T_Sensor on Prime X570-Pro
To:     Eugene Shalygin <eugene.shalygin@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Denis Pauk <pauk.denis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jan 11, 2022 at 9:24 AM Eugene Shalygin
<eugene.shalygin@gmail.com> wrote:
>
> Thank you, Anthony, for the fix. It was also included in the v3 patch
> for a new EC sensors driver that should replace this one. Perhaps I
> can enable the T_Sensor for each B550/X570 ASUS model that provides
> this connector? Seems like it's always found in the EC registers.
> Before you submitted this patch another user provided information for
> this board with no T_Sensor, and I thought this board was the
> exception.

If the header is present on a B550/X570 board I assume the sensor is
in the EC registers, but I don't have any other models to test.

Anthony
