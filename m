Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE37C10F14
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 12:42:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ECA24206A3
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 12:42:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kus9pS0x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbfDWMmk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 08:42:40 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:46955 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbfDWMmk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 08:42:40 -0400
Received: by mail-qt1-f196.google.com with SMTP id w26so9040664qto.13
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 05:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=2rfj8AdDw7aE91FxTw6Uw3KA3i2ICGx23JNdeJSCRJs=;
        b=kus9pS0x34bKY+GGX6/6aVBiWPFJhEeVTw3+3DU9BbLIzSfh3jhHz5EQGOsBqZXyER
         MoUEnzertlJJfxqCqpq0E+wZeodvazo3nxXRcdLk0SF68rmpJWZ924NhetJYah5iBCeF
         K+G7d+163h9tGHZMbmyXGhPHctvCDXRaQAnkB2qn1jliB+XdR+LXNZDV2e9oVVIPgGeB
         txJmyEGwReL60kfaikJV9tyAVVwNcZfTWhZwquH4yGTJHAs0lYYBaxb6rpC/uZ6iJGpk
         NQedzHWEK8hri9JusecQ79+ARUU1Nm4G6uJ8wTdSeeF1moLA/AuKX06wxjrExaPWGen7
         wrqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=2rfj8AdDw7aE91FxTw6Uw3KA3i2ICGx23JNdeJSCRJs=;
        b=EW/vFMNG+zAH7CDU8VWrAkiptksMIbQZdTPY/DwA9WAxyKy3/DsSfaDa/jE5OzoxRn
         EvHO67fzohN043ALG4gME5yiZXJceijK0ntuEa0A89P+GAshD2qXLlsnLdHMtJjhDADf
         FxjxbbEM7ZbVWdA6g3NLoIE0tTHQtp9VqzQaQIYqm4+uDCZAx3EWSKHvjMyAkye0RXhS
         FhOzR0WLYPN4Jo/YPdftkiaHBv7Xb0pMKtw8SSMn8Hr7XblVGyGeyj1vtj5857pQUVdU
         SO7oc7kC/BTNfNOT9IaIHiaaYoM+GzV3wtcsoiPdt1k+MU7SGDnCelvTtHpHTVdIp7EK
         K+sQ==
X-Gm-Message-State: APjAAAUW+O0lGsMN3TH51CFhzEX3q7x/pGB0UOXmjZh4JuZeTsrf5Dfs
        wmrpZireuzcFSFryyQ7Cp78=
X-Google-Smtp-Source: APXvYqzD1iuQxyHO5FD4d+ACJJ1Qx0EQUGPHowjcGmMhg7KjF0ULfh8LQqst0MSU7A/CTi/UwKbH2w==
X-Received: by 2002:ac8:84a:: with SMTP id x10mr21127172qth.273.1556023359460;
        Tue, 23 Apr 2019 05:42:39 -0700 (PDT)
Received: from jfdmac.sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id l199sm2977592qke.54.2019.04.23.05.42.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 05:42:38 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: [PATCH] hwmon: (max6650) Drop call to thermal_cdev_update
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <1556023014-6159-1-git-send-email-linux@roeck-us.net>
Date:   Tue, 23 Apr 2019 08:42:37 -0400
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <76F84515-0A8D-4792-A2E1-7144CDCD999A@gmail.com>
References: <1556023014-6159-1-git-send-email-linux@roeck-us.net>
To:     Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3445.104.8)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


> On Apr 23, 2019, at 08:36, Guenter Roeck <linux@roeck-us.net> wrote:
>=20
> The call to thermal_cdev_update() causes any fan connected to the chip
> to stop immediately. If the thermal subsystem is not set up to =
actually
> handle the chip as cooling device, the remains stopped until is is
> restarted manually with a write to a sysfs attribute.
>=20
> There is evidence that thermal_cdev_update() should only be called =
from
> thermal governors, not from thermal cooling device drivers. Drop the =
call.
>=20
> Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
>=20
> ---
> drivers/hwmon/max6650.c | 2 --
> 1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
> index e977c2f2d74a..939953240827 100644
> --- a/drivers/hwmon/max6650.c
> +++ b/drivers/hwmon/max6650.c
> @@ -801,8 +801,6 @@ static int max6650_probe(struct i2c_client =
*client,
> 		dev_warn(&client->dev,
> 			 "thermal cooling device register failed: =
%ld\n",
> 			 PTR_ERR(data->cooling_dev));
> -	else
> -		thermal_cdev_update(data->cooling_dev);
> #endif
> 	return 0;
> }
> --=20
> 2.7.4
>=20

I was just testing exactly this, and coming to the same conclusion and =
about to
send a v6! ;) No need now.=
