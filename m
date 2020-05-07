Return-Path: <SRS0=IuZw=6V=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE08C54E49
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 May 2020 20:55:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC86520661
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 May 2020 20:55:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTgpmony"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgEGUzP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 7 May 2020 16:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726268AbgEGUzP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 7 May 2020 16:55:15 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE30AC05BD43
        for <linux-hwmon@vger.kernel.org>; Thu,  7 May 2020 13:55:14 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id u10so2560504pls.8
        for <linux-hwmon@vger.kernel.org>; Thu, 07 May 2020 13:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IAzbW1hixQU41PmgXYjFFIT/kT9F7hLfIGQLY4bTdgk=;
        b=WTgpmonygEHZvcOwLITBE26OvwlAV0FLBv25WDEPAv+2YF9KEaqnai5OoBiLdw0TEH
         xYaTQE35Rem+2uiI/knn7xl8oEV21arAR6cEjALt1d6KWLaYu8SnQhuHM2snCpvfktZI
         uJ5W+3nv0zfVjD8cY31YZ5DfWqElfl0uFzDWW5rMhoO33V0IMUPxF0RhAiIF6/7K8H41
         GCTKt4M5BQcZHx+XwE59eY9niKlxDcE3DvrDDxWJivhmGD9jEvtomvo5mQSa+VB/WPV9
         MvL6g7dvxyIMUCJ3y7maKqpD9yMteONxseAOUmgU2Fkp65uD3Umh1TTJRKO8edK0JK6Q
         7XOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=IAzbW1hixQU41PmgXYjFFIT/kT9F7hLfIGQLY4bTdgk=;
        b=n68B9sKoZtPBXbyh/w2SY4SIv7n9JOAjCBuKkDhSjq2x5l95wpIb2jXlqbz2MhKvbX
         9JL5ENM/bxWBv7VQS2ugxeUsW+wNC9V5lpjb1qg4/t3GAx++SCy/qNzmUCaBTg41MXCS
         MjVl9mDMXly2EBVoz1sypAn6TtNwTSVVcPslFX+hdonawSSOO5TfVgvOy89jWp1QDoBN
         /w2k1if/tcWl3GpMICr8QXh9I4uvHP2HpapnnyhdIi1kX18Zub3zh4BT+q4F+p2rvNd2
         rRmCMzDhkjFAceyXBnX9erY58JjkmkF7HRvtg+7T8ojC9URUJatQWuTWz7TuB+eUB7qa
         k1fQ==
X-Gm-Message-State: AGi0Pubn25jYk3oST+R0pF8FCFLyhJwyihfOI1OFGVHhrSQR9qu5ynaP
        pa4jgV4PukRwglTTzpRcuMw=
X-Google-Smtp-Source: APiQypJ/O3DNR8Kc0PcqUKY9TNGG/v4EUkLTSbHLxPtLZtvS4bt0nN4Wdit1N3j6ayZVtJ71DIjUrA==
X-Received: by 2002:a17:902:b401:: with SMTP id x1mr15020420plr.334.1588884914448;
        Thu, 07 May 2020 13:55:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m7sm5929023pfb.48.2020.05.07.13.55.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 13:55:14 -0700 (PDT)
Date:   Thu, 7 May 2020 13:55:13 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Alex Qiu <xqiu@google.com>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (pmbus) Improve initialization of 'currpage' and
 'currphase'
Message-ID: <20200507205513.GB215120@roeck-us.net>
References: <20200507174407.36576-1-linux@roeck-us.net>
 <CAA_a9x+HokYr+kTVfE-tqpztwJRF78bD-YA9TDAak41V81oPoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA_a9x+HokYr+kTVfE-tqpztwJRF78bD-YA9TDAak41V81oPoA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, May 07, 2020 at 01:19:58PM -0700, Alex Qiu wrote:
> Hi Guenter,
> 
> LGTM; minor nits:
> 
> On Thu, May 7, 2020 at 10:44 AM Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > The 'currpage' and 'currphase' variables in struct pmbus_data are used by
> > the PMBus core to determine if the phase or page value has changed. Both
> > are initialized with values which are never expected to be set in the code
> > to ensure that the first page/phase write operation is actually performed.
> >
> > This is not well explained and occasionally causes confusion. Change the
> > type of both variables to s16 and initialize with -1 to ensure that the
> > initial value never matches a requested value, and clarify that this
> > value means "unknown/unset".
> >
> > Cc: Alex Qiu <xqiu@google.com>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >  drivers/hwmon/pmbus/pmbus_core.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> > index 8d321bf7d15b..a420877ba533 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -109,8 +109,8 @@ struct pmbus_data {
> >         bool has_status_word;           /* device uses STATUS_WORD register */
> >         int (*read_status)(struct i2c_client *client, int page);
> >
> > -       u8 currpage;
> > -       u8 currphase;   /* current phase, 0xff for all */
> > +       s16 currpage;   /* current page, -1 for unknown/unset */
> > +       s16 currphase;  /* current phase, 0xff for all, -1 for unknown/unset */
> I'm not sure if assigning macros for -1 and 0xff would be a good idea?

The driver uses hardcoded 0xff in various places. We could replace it
with defines, but that should be a separate patch.

Thanks,
Guenter
