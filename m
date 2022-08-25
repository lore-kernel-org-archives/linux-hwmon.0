Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8052C28D13
	for <linux-hwmon@archiver.kernel.org>; Thu, 25 Aug 2022 15:08:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238665AbiHYPIC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 25 Aug 2022 11:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240437AbiHYPIB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 Aug 2022 11:08:01 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A32A8C018
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Aug 2022 08:07:57 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-11cb3c811d9so23580143fac.1
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Aug 2022 08:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=T+Absj8wDJ7ls5xDxkdfAwuouIdYDX1GOTPe01NBZ0g=;
        b=YPMYZE5LIzanTCYfvLgrXImNQuxwJN6yHc4JZLD8+TlBk5I4ZVrqA4U+EJlYWZXKU7
         A+KV/bnVI8ExLt04X6y3OBMBrMk0H0FQ35REFRj6+Fi/DupjhmzP4wRb/Oxh398pO7cF
         GDCDHfWymFxwqxselbAuLoP45JMzK0IvElU8tOKUkRUPWbEAv8Lmpghkbtjge73kvbPf
         Ky9cwCjkW7YnrP54mzmJj14Yi2e092pre7ovFJMfv0z+Ccmp7OuTLInBu8R/5IuFLHyW
         q/6wFmBlkUo40DgaME9Q3LksUuDeq2VzmLTNEkbVv3D627otkZJMXTEbVG63T0F7g//5
         bHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=T+Absj8wDJ7ls5xDxkdfAwuouIdYDX1GOTPe01NBZ0g=;
        b=VzrVee/XhlnSr0RO3LmPz2sk0CSfGhyg6heEhw3DSlNpMjidf5NJRBcTxV7EFOElTh
         X0cutsFc6x5o1bQTxYEfGzIh2uYgDWuMGWDzO66mkZgsQyc4SbwXltMDzHDwGJHmtiQX
         et7VrnguSXlODZxPT/WegxSUC6KmAkd7TLn7l/gNYFFhK920+ltrPFUVZ/3qlkr9c6kE
         5zUR9xP2AfOVWkE6JZJC7+nuB3pwPszmAb9TtyLZmcW0e3LuJY/58lV/vXL4NQv3gVQL
         G1JTeGHasX/EKQUX+q/NT7G7aUFerMp1FW1D9xxDb6Cd4RAAe645UimXCTpIvTB2gpcH
         uMeg==
X-Gm-Message-State: ACgBeo17SjS+nYGPIMjRcsAHaeSOq7YEsNhg2CNCTQNHoDc7u1x5pkbk
        86HqHJUGZFwqOVJ9UtmOqTfDOahtCqQDS/XCc/RZ1w==
X-Google-Smtp-Source: AA6agR6yZCXiFCpL69abgNHrru8XFObl2zxSCVXAqYoZsmmClhVrrkmXYSSbjwy2HqXz2fmW8AHWPpeHGQLRf+Q93A8=
X-Received: by 2002:a05:6870:9a22:b0:11d:bb4:490e with SMTP id
 fo34-20020a0568709a2200b0011d0bb4490emr6381060oab.8.1661440076703; Thu, 25
 Aug 2022 08:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220825143737.77732-1-dev@aboehler.at> <20220825150236.GB240395@roeck-us.net>
In-Reply-To: <20220825150236.GB240395@roeck-us.net>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Thu, 25 Aug 2022 17:07:45 +0200
Message-ID: <CA+HBbNEEvyn7a-CXzbFHywvHBky-Kwu8O3POrqo=huOJf-n2pQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] Documentation: devicetree: update bindings for tps23861
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     =?UTF-8?Q?Andreas_B=C3=B6hler?= <dev@aboehler.at>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Aug 25, 2022 at 5:02 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Thu, Aug 25, 2022 at 04:37:36PM +0200, Andreas B=C3=B6hler wrote:
> > The tps23861 driver does not initialize the chip and relies on it being
> > in auto-mode by default. On some devices, these controllers default to
> > OFF-Mode and hence cannot be used at all.
> >
> > This brings minimal support for initializing the controller in a user-
> > defined mode.
> >
> > Signed-off-by: Andreas B=C3=B6hler <dev@aboehler.at>
>
> nack for the series, sorry. The suggested properties are not hardware
> monitoring but phy properties. There should be a separate phy driver
> to manage those.
>
> Also, as mentioned, the hwmon 'enable' attribute is abused to control
> port functionality and should be removed.

Hi Guenter,
Are you referring to an ethernet PHY driver or the generic PHY framework?

Regards,
Robert
>
> Guenter



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
