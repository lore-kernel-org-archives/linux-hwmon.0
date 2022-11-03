Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A784C43217
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Nov 2022 01:15:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbiKCBPZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Nov 2022 21:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbiKCBPX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Nov 2022 21:15:23 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D828412AA2;
        Wed,  2 Nov 2022 18:15:20 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-13be3ef361dso565266fac.12;
        Wed, 02 Nov 2022 18:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AY6AoQDR7BTrmVbhOCwgnNBSjonoEQ+JzV2h3QgGQqI=;
        b=LfsouQdY/Q4YqyW3smu5w1KztEfETHIcEATZ6WFKu2MrhkexNa6qPDR2Hqne9OyJyc
         R0pTo4wfKYmRiyhxI0weayx5TyVwInhfZV4Y10yxcGeri8OFA+yWctlV0cDtPxMZgf7d
         cbq/kQVLXLSFjuwuJCdPqxmCPRSCes3k42lMx9XYX7YNuqgb3oj6E4dkvlVJs0VEGiWf
         PgyEbELRCVjHpvMYjMkkyLuUzYWwu1FjzfKiv+CN1wKfLSQUMqnXNiQnFrunKYg5gnyY
         xA+NqKqYxZwDzUp+xU2AV9zawMzPOGYKMRh7yI7rzoL0T1EEbA5nGtLdOsJ8aD4D9oSu
         Fm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AY6AoQDR7BTrmVbhOCwgnNBSjonoEQ+JzV2h3QgGQqI=;
        b=SVTj/OHQArtThMVrXz+juzd0mOrhCHNpkM+MhF6QxkDjbRkiq5tMW0iuEh7pnbjB1u
         TYJFr1yArHFFjaWpRx7lkBf077xkYusxW6Sxf4MpifFyYnMIFl0OttQotI5on022lBgX
         fugp+s6cxWewuLK1z8hJPKCoiJZWmkwjbHQtlcXZE/xTcq96dPCeHYzV4Xad8DJ/kh09
         S34zpaAs+f+AofIYuwe5ng7MnkUBS7Rqu2as39lGjniX9uz3DnTrv8jusTESViCJqgIq
         tgb+cemrzrNA6S32Sc+0Yy3brMDQs8eWfROA0USrnMHt9L7D2/RAoDgVaT9FqaKE0+zy
         f1ag==
X-Gm-Message-State: ACrzQf1koeBbAf9N0C2QTV3f/2qyuQoO0ZXNOd8TsR9ld1dx8kifB1Gu
        vACsCOP6t13Svgg1OtSeDO4=
X-Google-Smtp-Source: AMsMyM4RgFB/mzEQi9LnBkk4Vtq9wzCO7EmtUCfJPXqiGXtJ0J1bK8yQ/j8WPW5jdZ5iUsVpopk45Q==
X-Received: by 2002:a05:6870:6394:b0:13c:7d1c:8604 with SMTP id t20-20020a056870639400b0013c7d1c8604mr19456963oap.184.1667438120161;
        Wed, 02 Nov 2022 18:15:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t9-20020a4adbc9000000b004768f725b7csm5011245oou.23.2022.11.02.18.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 18:15:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Nov 2022 18:15:18 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Joaquin Aramendia <samsagax@gmail.com>
Cc:     pobrn@protonmail.com, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4] Add OneXPlayer mini AMD sensors driver
Message-ID: <20221103011518.GA2109645@roeck-us.net>
References: <20221102150440.208228-1-samsagax@gmail.com>
 <20221102180430.GC2913353@roeck-us.net>
 <CABgtM3jXVTjxEJXmCXG+z_DGaHAkFFVjZBa2bOCbeqFveesWrA@mail.gmail.com>
 <20221102204407.GA2089083@roeck-us.net>
 <CABgtM3jaV+jy3PYcCi3o1ij1igk4S7dWTF=QM=rN2acaGLQ_JA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgtM3jaV+jy3PYcCi3o1ij1igk4S7dWTF=QM=rN2acaGLQ_JA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Nov 02, 2022 at 06:10:37PM -0300, Joaquin Aramendia wrote:
> > >
> > > Oops. Is not really needed but I'll add them.
> > >
> > Technically you are correct, but we would have static analyzers scream at
> > us, and it is against kernel coding style. There is a practical reason
> > for that: Missing break statements are often the result of coding errors.
> >
> > Guenter
> 
> Great, thanks for the clarification.
> 
> As for my last statement, module_platform_driver() usage broke the
> module, don't know why, but seems like the probe function is not run?
> If you are ok with it, I'll revert to module_init/module_exit macros.
> 
Go ahead, just add a comment to the driver. Mabe someone manages
to sort it out.

Thanks,
Guenter
