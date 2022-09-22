Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1027ECAAD8
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Sep 2022 20:38:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiIVUiN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Sep 2022 16:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiIVUiL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Sep 2022 16:38:11 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FC410FE36
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 13:38:10 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id sb3so23626492ejb.9
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 13:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=fl9qRiFG4vREnd5XP4QYakNrHksvwSJkdzlL1KQG3+E=;
        b=dVpz622qOSIq++vZTcneNgEXJrTfY5ouJ5PppN8h2GMv7uzZv3SobVnN57IiEvYypn
         IxguYsjgA5+tPutR6DhhNqHmR/tbzHRS39AX2Kq+AXen4l95Cq520h/BKMZn9Bx90i2P
         DbTzVG5u4/LuG+5YsR2ScrHmLxv8JWLi2AbZoXQpb0YkzYkayHRN5NDEDf5BxZumWyyO
         i+5iKfbErafMvssCKs5IgHKJNKD5JuIlCZE+xtTdlTEun7oGwyPG+xFqKS2Ha8e8NEiO
         zjdm+G+u40UGJUp1TiUDgQPj/KoipX5+jVmsW/q7BAaDmB6s3VejuJ2gNBh3qV9VI3gl
         biIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=fl9qRiFG4vREnd5XP4QYakNrHksvwSJkdzlL1KQG3+E=;
        b=tROxJrZ7FmLyLAu1sd2nG4tSsnUc7fUP6Eh1fK691TSIAjA21dO96wzdj0EueLKnKE
         eZqenk+YsTMirMk1r5sg61nVwuYyC/PHFnehV2HnAHKRVk7F8lZ7gL+BEliE1DhD6w3+
         vwhx8uLwA22yA76DLY3plBEu90UrmDKyVPqNoVwaEDuHKnRucwBZWa0mu5PoQ+69F6St
         JcRCCGKNF7GbPjG7IH5Ja68Sv05Jr/cVbw/d+v76E/wtnfovdfAUeaf9MjyII2KLD7qI
         +kWCeg4f+wdo4zO0JACu+WEMyuhdOER8AF8wSHVyu2r0CNFiAfdPJrRXKcB59AEsO1UP
         PZrw==
X-Gm-Message-State: ACrzQf0HPetcVDxSTIIwn/wKTHOm1rX3s7CbpaMlZCirOvmBw6WFOp7r
        KI1eFiuYCliAUyB1rLCnMpOtyqy6vb9TOtaYyudDe36VrnP/3Q==
X-Google-Smtp-Source: AMsMyM5WIMRSihdcgX2ScH+jYq9y5mJFvZdjS4LpicYW+W3wFKjcp8O9owzhN8YA5gqbLrK6S79MAKVmwV4TcgXMdAk=
X-Received: by 2002:a17:907:1c93:b0:77e:f9a2:6fca with SMTP id
 nb19-20020a1709071c9300b0077ef9a26fcamr4530178ejc.320.1663879089290; Thu, 22
 Sep 2022 13:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220921233109.1672345-1-floridsleeves@gmail.com> <99ea1416-46dc-9712-271a-9e3daaa43e05@roeck-us.net>
In-Reply-To: <99ea1416-46dc-9712-271a-9e3daaa43e05@roeck-us.net>
From:   Li Zhong <floridsleeves@gmail.com>
Date:   Thu, 22 Sep 2022 13:37:59 -0700
Message-ID: <CAMEuxRprFMU8RZmZw8A53ND3iLkgcgGUWg4D77ii8EWnm3kvnA@mail.gmail.com>
Subject: Re: [BUG] drivers: adm9240: possible data race bug in adm9240_fan_read()
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Sep 21, 2022 at 8:16 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 9/21/22 16:31, Li Zhong wrote:
> > Hello,
> >
> > My static analysis tool reports a possible bug in the adm9240 driver in Linux
> > v6.0:
> >
> > drivers/hwmon/adm9240.c:
> >
> > adm9240_read()
> >      adm9240_fan_read() --> Line 509
> >          adm9240_write_fan_div()
> >
> > adm9240_write_fan_div() says 'callers must hold
> > data->update_lock'. However, it seems like the context does
> > not hold the lock it requires. So it may cause data race when
> > setting new fan div.
> >
> > I am not quite sure whether this is a real bug. Any feedback would be
> > appreciated!
> >
>
> You are correct, the code in adm9240_fan_read() should acquire
> the mutex before calling adm9240_write_fan_div() and while
> manipulating data->fan_div[channel].
>
> Guenter

Thanks for your patient reply! Can I submit a patch on this? The draft will
be something like:

+  mutex_lock(&data->update_lock)
    err = adm9240_write_fan_div(data, channel, ++data->fan_div[channel]);
    if (err)
        return err;
+  mutex_unlock(&data->update_lock);

Let me know if you have any suggestions!
