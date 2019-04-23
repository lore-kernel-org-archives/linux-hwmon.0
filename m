Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF9CC10F03
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 15:23:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 69A31206BA
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 15:23:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPyoNJVK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfDWPXF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 11:23:05 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:43210 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbfDWPXF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 11:23:05 -0400
Received: by mail-qt1-f193.google.com with SMTP id i14so16489244qtr.10
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 08:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=tHRWEflEgHOk/GS+3Q7rz1Ch+qINEAQ2YdTcLiYTMXc=;
        b=HPyoNJVKnaWtqxUizun57o5LwSvjUscs28zpciTdHHQJ/t0RTurul9TqfKnvaM5kT0
         GPfDpjEl/wuitbQyf2Z3LYNqB2E1Y/kbgxpvm2VYvPzqfvovqzCWPHJhpJ6pLFOSEIp5
         GDcfoOOEU6cit5X+Z/TfiVpYZAHlJHmHsm2OOOoQpI4SoZPhk40HwYFJTLaJ3Kh5O9YK
         zWX4CuW0yrm+yFZUwWeM3EZL/nmkalfQYJf3RW/S1K+yOE/WIO/eZuLvU/GuFHz/3AnV
         lzjQOlAwjErcjh2NrEsmbXsWfv+1wm3zqxTCayrSJk9/Lf078sP5na3KK0dbNad63NNQ
         BnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=tHRWEflEgHOk/GS+3Q7rz1Ch+qINEAQ2YdTcLiYTMXc=;
        b=Lb1HKd2S2w6NNmzv8fyJLZyWpw2PeOvoOwaotdiHgo4ysf/Kt7D7NIipF5XZfevbYL
         yYDeDre/aySyQ0pggIbkjS/v6D4wBDs4HiVdhtRZxx8MkxNqUNO5YfGFwdH2BnsW46QD
         7mQ92FXd4N+XM1G0+SIXtrErmXsl+aVqJvhbw/dbgekcFefEHLCGMaS1KwHXA3uYjQ6R
         o/0mlki3g/GVpXVBINc2oZnutrEq8R5HD9+Zp6qXIRVk2AqsUe+apNwM0v4KGNe3HMRG
         LnWmI30Q2hSdT9gIbEyDQ2EX2rNIBaDAB8WGXqpzOF4xfhgH5OnDz6Ttzy3K/KMKsAjQ
         1/LQ==
X-Gm-Message-State: APjAAAUk8aW/Y8xfYcVOxtJvvr1Hozwj1PECxnk712HkBU/RvX5KsEsz
        ikvtl70+AWUc8eg53HsKHY4Bkjdnnxs=
X-Google-Smtp-Source: APXvYqx71r7GXbKfJf7tejZc4CqvomsjSUJBUIP011KZJzQEzbZIMX+EhixhHugh3SMhDCgjeAUiSw==
X-Received: by 2002:ac8:704e:: with SMTP id y14mr21219073qtm.125.1556032983847;
        Tue, 23 Apr 2019 08:23:03 -0700 (PDT)
Received: from jfdmac.sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id l59sm9544861qte.6.2019.04.23.08.23.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 08:23:03 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: [PATCH 02/11] hwmon: (max6650) Introduce pwm_to_dac and
 dac_to_pwm
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <1556026391-15360-2-git-send-email-linux@roeck-us.net>
Date:   Tue, 23 Apr 2019 11:23:00 -0400
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EACD4EC3-370C-4369-93A4-364008A04AE5@gmail.com>
References: <1556026391-15360-1-git-send-email-linux@roeck-us.net>
 <1556026391-15360-2-git-send-email-linux@roeck-us.net>
To:     Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3445.104.8)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



> On Apr 23, 2019, at 09:33, Guenter Roeck <linux@roeck-us.net> wrote:
>=20
> -
> +	dac =3D pwm_to_dac(pwm, data->config & MAX6650_CFG_V12);
> +	err =3D i2c_smbus_write_byte_data(client, MAX6650_REG_DAC, dac);
> +	if (!err)
> +		data->dac =3D dac;
> 	mutex_unlock(&data->update_lock);
>=20
> 	return err < 0 ? err : count;

When I created max6650_set_cur_state, I copied over the pwm1_store code. =
I ended
up with a "return err < 0 ? ..." which I adjusted. However, as my =
colleague
pointed out, the set_cur_state return style matches that of
i2c_smbus_write_byte_data so we should simply "return err;" in
max6650_set_cur_state. Since the driver is in great flux state right =
now, I
cannot make a patch only for that and you should probably just include =
that in
your series. Or I can submit it later when your series is applied?


