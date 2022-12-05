Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B13C47089
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Dec 2022 19:34:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234309AbiLETeC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Dec 2022 14:34:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234129AbiLETdq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Dec 2022 14:33:46 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3773628726
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Dec 2022 11:28:36 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id q71so11363881pgq.8
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Dec 2022 11:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMgJpPVGFf2CTmBqfB8Ron+eiO7KrRxZmO2QtEp2lsM=;
        b=KKxbsFBFUBlxl1NFHn1WxO6k25Y6zUU02b5x8BJLQyCE1gOD8tqr9eLsGLLm4dD5J4
         Dk208kvxuVyK0E5gWtbPHygqwlqVckRknMeMMp0R3KsFgv7M7++oFTixt/G8rjAVSDhG
         2PsCAn5MeBiYZwy1T4pK/dVPyvMWo6K4rcWI8fjdpbV5Yn6DApjHUMQW8ab98H7D9yWO
         iVmenHiMWpWlduoJayRDnVMMsR/3QiFTwDP1ybi4IVPwzz+5fFGVxTX8ipaujq4URhrs
         nd6LJx4xnR4Rk65Vz9cQVquBK8OYddNTODSP+eW8KxHZ/8aHuftGBr3djzvt0HycKBjK
         T6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMgJpPVGFf2CTmBqfB8Ron+eiO7KrRxZmO2QtEp2lsM=;
        b=IfdMWtKoHzFr29a8EbJAbnXlG/1mTv9d95nz9fz6H+laJl1vUGrHXM5qCstCSgYNiN
         /9pHgfeaLkUKfQtMyLLzN1z2BwwHlS4jR0FBTi9F+Jt+4LotwR3cuvITR7EX8xloSUXH
         yf9kSGTiTp0sgl2nBsPDdZ+it1MRrmjRGhBTiPcc+jLzTNXM/jDd1P+81CMXqQ8W+dT9
         eumef3J7EJ33KH4ARTXIUnmHi18zztUEJ9J6JDqfQ7UUPu0i7r/6rWJ+R7Aiyiiu7cFy
         6Rtlej1TiKiZtHhnGAd0/jfaDESD2zyIIfYW7vIevJ4c2gCkIXJMQZ/fUviE83MPRI6i
         85Fg==
X-Gm-Message-State: ANoB5pmQfJq4Kv2dgPUOH/91N0XYJs+4FdZLkOf3tOygqtjG7vCa9Eym
        YLiadqy8C/7hLYLtZEnY6peGPM3UT+ekvtYkkWQ=
X-Google-Smtp-Source: AA0mqf5hB1K85GHRxWS3DJj18gs7YP8L5r2g77hmMSGPl3S7GFCLH5EEv+nuVrfKDV9901+2ad0Ayw==
X-Received: by 2002:a63:1f63:0:b0:460:ec46:3645 with SMTP id q35-20020a631f63000000b00460ec463645mr77906532pgm.92.1670268515498;
        Mon, 05 Dec 2022 11:28:35 -0800 (PST)
Received: from localhost.localdomain ([193.122.98.110])
        by smtp.gmail.com with ESMTPSA id a10-20020a1709027e4a00b001898aa48d17sm10896614pln.185.2022.12.05.11.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 11:28:35 -0800 (PST)
From:   Xingjiang Qiao <nanpuyue@gmail.com>
To:     michaelsh@nvidia.com, Jean Delvare <jdelvare@suse.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Xingjiang Qiao <nanpuyue@gmail.com>,
        linux-hwmon@vger.kernel.org
Subject: RE: [PATCH 2/2] hwmon: (emc2305) fix pwm never being able to set lower
Date:   Tue,  6 Dec 2022 03:28:25 +0800
Message-Id: <20221205192825.155209-1-nanpuyue@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <DM6PR12MB40742D85F5F8932F81C8C34DD4189@DM6PR12MB4074.namprd12.prod.outlook.com>
References: <DM6PR12MB40742D85F5F8932F81C8C34DD4189@DM6PR12MB4074.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Even when the cooling state is not set by the thermal subsystem, no lower state can be set by hwmon.



> On Tue, Dec 6, 2022 at 2:27 AM Michael Shych <michaelsh@nvidia.com> wrote:
> Hi,
> 
> This is intention - to set low limit through 'hwmon'.
> Thus, if it is set through 'hwom', cooling state is limited and not allowed to be set to a lower value.
> If user doesn't want this feature, he is not supposed to use 'hwmon' for fan speed setting.
> 
> Regards,
>    Michael.
> 
> > -----Original Message-----
> > From: Xingjiang Qiao <nanpuyue@gmail.com>
> > Sent: Monday, December 5, 2022 7:36 PM
> > To: Guenter Roeck <linux@roeck-us.net>; Jean Delvare
> > <jdelvare@suse.com>
> > Cc: Michael Shych <michaelsh@nvidia.com>; Xingjiang Qiao
> > <nanpuyue@gmail.com>; linux-hwmon@vger.kernel.org
> > Subject: [PATCH 2/2] hwmon: (emc2305) fix pwm never being able to set
> > lower
> >
> > There are fields 'last_hwmon_state' and 'last_thermal_state' in the structure
> > 'emc2305_cdev_data', which respectively store the cooling state set by the
> > 'hwmon' and 'thermal' subsystem, and the driver author hopes that if the
> > state set by 'hwmon' is lower than the value set by 'thermal', the driver will
> > just save it without actually setting the pwm. Currently, the
> > 'last_thermal_state' also be updated by 'hwmon', which will cause the
> > cooling state to never be set to a lower value. This patch fixes that.
> >
> > Signed-off-by: Xingjiang Qiao <nanpuyue@gmail.com>
> > ---
> >  drivers/hwmon/emc2305.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c index
> > 4df84065cbfb..f51760f8aa85 100644
> > --- a/drivers/hwmon/emc2305.c
> > +++ b/drivers/hwmon/emc2305.c
> > @@ -398,11 +398,9 @@ emc2305_write(struct device *dev, enum
> > hwmon_sensor_types type, u32 attr, int ch
> >                                * Update PWM only in case requested state
> > is not less than the
> >                                * last thermal state.
> >                                */
> > -                             if (data-
> > >cdev_data[cdev_idx].last_hwmon_state >=
> > +                             if (data-
> > >cdev_data[cdev_idx].last_hwmon_state <
> >                                   data-
> > >cdev_data[cdev_idx].last_thermal_state)
> > -                                     return emc2305_set_cur_state(data-
> > >cdev_data[cdev_idx].cdev,
> > -                                                     data-
> > >cdev_data[cdev_idx].last_hwmon_state);
> > -                             return 0;
> > +                                     return 0;
> >                       }
> >                       return emc2305_set_pwm(dev, val, channel);
> >               default:
> > --
> > 2.38.1
