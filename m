Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F25C4332F
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Nov 2022 01:01:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbiKUBB0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 20 Nov 2022 20:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbiKUBBV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 20 Nov 2022 20:01:21 -0500
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D692B1A3;
        Sun, 20 Nov 2022 17:01:20 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-39115d17f3dso93831547b3.1;
        Sun, 20 Nov 2022 17:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEsqFHQgtetFlFFD99inb/SENw2JZPnvGo8b6UBGrNk=;
        b=IKrpZP+kCTeU5N5jrn8/TKY+dMnjk9DWiKUIWbcsbxqGirxW5HPYv0X4YNNLg97M/g
         HJWkcCNNbxkqq6WDTBHRjPFAvx+HacaWzPXL4c/ZuyVAQoRt7j7n1trno6zfCnZX/BE5
         lha10HahzyIUqL+cwhP7ME41ZLJOfjl7W9ciYTVRiWFtM45zuIL//xavX9Fc3jUzgdPY
         brRHnsutxnFQu6EV10IracGPdHNqn92ZAALb4DroVhIoR/DpnVpcmURGQP2Rlb8sDtDz
         7dUlvvqydTSYS4bB9rdQfP9urE3m4A0hdCOnpuTIIrFWMWFHHl3wdWLRtY1tyfYloOEC
         2bDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEsqFHQgtetFlFFD99inb/SENw2JZPnvGo8b6UBGrNk=;
        b=jUFOl9KfJTnBGYsrciIFsZGSxCqsPoTWOZvj4utMbf4s5YITPO4Hu6srbKNXGNe+O7
         WtkOlw0soPIxRIxuoCM6NNPDbm48Ru0uqkJbaGbJrOC6UyN7bgFC40Hpq1+xkTkGGUsi
         BDhw4HHE3kih9/WuYgxjYOTPdH3s/o57bOqnFxQlTmJv9PX678Z4hW62zYNjj2rwTxF/
         HGlDoNckSBUA2H6OaGqtDIDsi1qFRSD1+hgF1S8ufCOIuiNHG/MfIztGIMQntChRr7nq
         jxjZVF+IXoULLqI3lQqJi9OAd/5XZ1yI0xAbi+hOj8R+ifHCw2oMXMmCSPSbWwc4ftdd
         f9JA==
X-Gm-Message-State: ANoB5pm2yuTxbtMB8ioXZtD9JnTULIk6jc5G2yqvlxcSdW6p003hqGKA
        hS8YSe2I7i4Dch7+1UBZAxXgOihcIHtn4NxyMns=
X-Google-Smtp-Source: AA0mqf686asR4G2WNG7ZJjZmpLmeoT4s8K54oqMc/ajgl6/q6IHyrxOFzVVc/FiQTb+XEEKF+oNi2vXoDi3Wcbl5OlE=
X-Received: by 2002:a0d:d641:0:b0:3a0:d05c:c812 with SMTP id
 y62-20020a0dd641000000b003a0d05cc812mr3053167ywd.69.1668992480105; Sun, 20
 Nov 2022 17:01:20 -0800 (PST)
MIME-Version: 1.0
References: <20221119162347.36698-1-samsagax@gmail.com> <20221120134650.GA1787156@roeck-us.net>
In-Reply-To: <20221120134650.GA1787156@roeck-us.net>
From:   Joaquin Aramendia <samsagax@gmail.com>
Date:   Sun, 20 Nov 2022 22:01:09 -0300
Message-ID: <CABgtM3g+g9PSXaTxaywJLQ18Y7pZybeDDrvycN-KzCczZ_0UPg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (oxp-sensors) Add AOK ZOE and Mini PRO
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     w_armin@gmx.de, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, pobrn@protonmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

El dom, 20 nov 2022 a la(s) 10:46, Guenter Roeck (linux@roeck-us.net) escri=
bi=C3=B3:
>
> On Sat, Nov 19, 2022 at 01:23:48PM -0300, Joaqu=C3=ADn Ignacio Aramend=C3=
=ADa wrote:
> > Add support for the AOK ZOE A1 and OXP Mini PRO handheld devices.
> > DMI strings are added to this driver since the same EC layout is used a=
nd
> > has similar specs as the OXP mini AMD.
> >
> > The added devices are:
> > - OneXPlayer mini PRO (AMD 6800U)
> > - AOK ZOE A1 (AMD 5800U)
> >
> > Signed-off-by: Joaqu=C3=ADn Ignacio Aramend=C3=ADa <samsagax@gmail.com>
>
> Applied to hwmon-next.
>
> Thanks,
> Guenter

Oh, great! Thanks Guenter. I just realized I made a typo in the commit
message. Would you mind if I correct it and resend a v2 of the patch?
--=20
Joaqu=C3=ADn I. Aramend=C3=ADa
