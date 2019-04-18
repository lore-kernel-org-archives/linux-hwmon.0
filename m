Return-Path: <SRS0=8wir=SU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C12C10F0E
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 18:29:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0CB6217D7
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 18:29:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oEX4bx7Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390367AbfDRSCw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Apr 2019 14:02:52 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46805 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390824AbfDRSCv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Apr 2019 14:02:51 -0400
Received: by mail-qt1-f195.google.com with SMTP id z17so3086343qts.13
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Apr 2019 11:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=4rK9KARS+2qW4FDV6EwmR8O9F725yNpaqAdp1reHL1k=;
        b=oEX4bx7Y1568xXOR9yyFTpa4AAFShUhjaoymZfGCHp6+kagZvEJkzrTw4nKNu8+ppI
         G504wnGvBeTfI9W8I2TpBVf2t/L4bb9PsxLph4HHvxPxAlmmtjE/1C3bYjYHF0wStKap
         jWw2/KbCEIV1+5zGupXYi9w8Ki1U40K5aBn9Lofc1q0Ok1Ztnox5We/Aa0Zi4J8LY10D
         nLv8sE6WygEfvAzbCNwDMUZz2bBnTUxE53gmiNElZ3M9k5SiAtqk8DMFAvznUEnC8XgJ
         KrlBmdCOO9W0VYChmfCBQnJ0d33JtZUqPvu/NDzZqwCDOc6OAW/XeA0gkho4s54BxnX0
         ELvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=4rK9KARS+2qW4FDV6EwmR8O9F725yNpaqAdp1reHL1k=;
        b=JWcGuYm4PiZ/o7o9IfPyy+hAqwRkm+BG5jXFFHatmc+V+U2EhPANskFxOrjuEMBLvn
         DOgzs4MTnyu6o08ISv+6dhwzqdy2cvCYpJUYbomIB47MAqMzgxa9IXIb6gfz9GLGuAxi
         pxD9b6aLpjjL7O5wcqiBhbQQEenjg4/NkZxHmnGpTgny2ckdTdeBtEwIk5ZOMD3Ib1N0
         /gq+G6zFhf2k45dTWEnSoUsRwor0ja8DYbc80umns/R0xp/m1RsTvzM8+Zzq83cCkSzj
         CE+Mkxjv86UOB85wOF10KHF2HC3v/aAsQ5Uxs/tWFNX7G/qQ8x+cV6r4IEy4cm+j9WYI
         gFbg==
X-Gm-Message-State: APjAAAW9KWU8W0NTKpnNTmajxCYydMSM7Kiv3Pl4AJyutFOxSgdpM4dn
        bL3+ZQhbmDvlNusdeZz2cJE=
X-Google-Smtp-Source: APXvYqx1KfPJrKbVhCOSehspMRx9GaE/M5oGow+0C5spzsrHcuHkGlCajddooXUsqpZGbynyw5paCA==
X-Received: by 2002:ac8:3f26:: with SMTP id c35mr74657852qtk.252.1555610570514;
        Thu, 18 Apr 2019 11:02:50 -0700 (PDT)
Received: from jfdmac.sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id p52sm1975178qta.37.2019.04.18.11.02.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 11:02:49 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [PATCH v2] hwmon: max6650: add thermal cooling device capability
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <20190418173856.GB7804@roeck-us.net>
Date:   Thu, 18 Apr 2019 14:02:48 -0400
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <55B323D8-9715-46C3-9205-38344D6FADCD@gmail.com>
References: <20190418164813.21053-1-jeff.dagenais@gmail.com>
 <20190418173856.GB7804@roeck-us.net>
To:     Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3445.102.3)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


> On Apr 18, 2019, at 13:38, Guenter Roeck <linux@roeck-us.net> wrote:
>=20
>> +#if IS_ENABLED(CONFIG_THERMAL)
>=20
> This will result in missing symbols if THERMAL is built as module
> and this driver is built into the kernel. You'll have to adjust
> Kconfig dependencies accordingly. See other drivers for examples.

Right! Was not a problem for me, but I do remember seing the "funny"
ifdefs around.

>=20
>> +	data->cooling_dev =3D
>> +		thermal_of_cooling_device_register(client->dev.of_node,
>> +						   id->name, data,
>> +						   =
&max6650_cooling_ops);
>> +	if (IS_ERR(data->cooling_dev)) {
>> +		err =3D PTR_ERR(data->cooling_dev);
>> +		dev_err(&client->dev,
>> +			"Failed to register as cooling device (%d)\n", =
err);
>> +		return err;
>=20
> Why would it be fatal for the driver if this fails ? It wasn't
> fatal before.

Mmmh, you are right. This assumes that all users of max6650 would now =
require to
be referred to in some thermal zone. Again, this was not a problem for =
my test
environment.

Wow, two very egocentric issues. Will fix and send V3, thanks for the =
review!=
