Return-Path: <SRS0=43Pj=4X=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7EAC10DCE
	for <linux-hwmon@archiver.kernel.org>; Fri,  6 Mar 2020 16:08:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6FC82073B
	for <linux-hwmon@archiver.kernel.org>; Fri,  6 Mar 2020 16:08:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com header.i=@gateworks-com.20150623.gappssmtp.com header.b="Em4FnE3P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgCFQIG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 6 Mar 2020 11:08:06 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39589 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgCFQIG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 6 Mar 2020 11:08:06 -0500
Received: by mail-ot1-f66.google.com with SMTP id x97so2901164ota.6
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Mar 2020 08:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LC6fYzrXvQrjxYDrnEIkTo21CADYi8sV2Co7PyB612o=;
        b=Em4FnE3PMcg/WJr4+ZZxzWpxxSoKfbxuzSM5MUfpkLsbTVlEXeYbbYwoUnxXmVz69j
         Iqb7SraT2u9Q6F8bMg2vRFiX/HmlLM5dgTUpWL5od1AFfc2p9mnuscx1OFecr72ABli/
         0hpiyenMdchTPAxl5tdGTjAKLT82q1DvF2Z4n92MPD6OKEUlCIAowJxgyot3mwEO3Ale
         9zIoRQiRzK4TID3SuMIB/U3VyxPvgP6ovn23L/Y291FSZGvM0lDYFN/zBLVMH5iTq4Vp
         KChUM1kPuRflNvko9QQg7hFH0gnXCoRVOUAXu5Ww215JsyK/05x5wSaTmFPiac0a80/K
         tCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LC6fYzrXvQrjxYDrnEIkTo21CADYi8sV2Co7PyB612o=;
        b=ma7WSzPeTn7t7ATgYa3JeoAd6QMZhx3ctREaCxITfEjwzvaFd2myCjvYtLYEJMck0q
         EIjTmSlVSibqlhQQVoTf3+lnhHFYyCVCLLF3MAvM/zzlfY99ur7o6FfyH4vjhoZwMTE1
         VD5QlsAN4vLRtID0HkyYa88VqkuM7SGzhTUdl018/aT1gD1BDrIBOM8sa0ci4QVtF1b+
         fJMs+oG3gC5kYJl5y6RQfTgMACtQrfLrOioRiJq+MUEcK1QMFOxODsFfEE+Ld9VrH3ba
         3O+IurS+8S+Y8z/rLMRRbitwBeSWlzT1AEoHi4hbEyxv7TbbU6Q4C6oqzy6ouwbqBrzQ
         OU1g==
X-Gm-Message-State: ANhLgQ3OhZvWof3d7hTUmYfOTYHTxPlmMChyAhu6kMifTkWRvDQeje/y
        P+6+08LeGpgjWOVWntToYr5aJFbhbYMEphP4Msrcpw==
X-Google-Smtp-Source: ADFU+vsNOqF1Gnn9gVAlK3MDDr9UJefA8cNJowONg8rgYvH5SxZps7BFriCK6uP0ehSTEA8IezBvGKF2Ku8ePhgAtxw=
X-Received: by 2002:a9d:5cc4:: with SMTP id r4mr3190223oti.33.1583510885541;
 Fri, 06 Mar 2020 08:08:05 -0800 (PST)
MIME-Version: 1.0
References: <1582577665-13554-1-git-send-email-tharvey@gateworks.com>
 <1582577665-13554-4-git-send-email-tharvey@gateworks.com> <20200303205408.GA19757@roeck-us.net>
In-Reply-To: <20200303205408.GA19757@roeck-us.net>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 6 Mar 2020 08:07:54 -0800
Message-ID: <CAJ+vNU359PicGLtFr-s+arf210LtBH5OpBsbnbDd7otC1WBkhw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] hwmon: add Gateworks System Controller support
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Lee Jones <lee.jones@linaro.org>, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Robert Jones <rjones@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Mar 3, 2020 at 12:54 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Mon, Feb 24, 2020 at 12:54:25PM -0800, Tim Harvey wrote:
> > The Gateworks System Controller has a hwmon sub-component that exposes
> > up to 16 ADC's, some of which are temperature sensors, others which are
> > voltage inputs. The ADC configuration (register mapping and name) is
> > configured via device-tree and varies board to board.
> >
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Tim Harvey <tharvey@gateworks.com>
>
> Couple of minor comments, otherwise looks good from my perspective.
>

Guenter,

Thank you for the review! I will post a v6 as soon as I get the dt
bindings worked through.

Tim
