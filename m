Return-Path: <SRS0=8wir=SU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29396C10F0E
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 20:39:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC3C520693
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 20:39:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8f4u+lt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729198AbfDRUji (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Apr 2019 16:39:38 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42912 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728531AbfDRUji (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Apr 2019 16:39:38 -0400
Received: by mail-qt1-f193.google.com with SMTP id p20so3619433qtc.9
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Apr 2019 13:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=rmRfZ+JWni6EAeh2aMpoDG3e7kgtMtMiAEvhThb3jWo=;
        b=m8f4u+ltDnedwv/sxCRJPfgiwSslWWo2jsieFSXdBIZHQNF8Ve9Oxg94ao+s3oIdLC
         jSX0CI5Yak2mbi0BbKeyokExMWegywpOwLxJ9KvIHDn4YAjRRhVGy3od/jbLOsUflEq4
         S6/5ACY6jhLC/crp14ONW+LaKLQA7VUFE+eo8nMpWho7qce6EbhfO3ZrMTyKxTJD7IFj
         5m3Mgai07+vIkJlyuLtckJK1Iwp8SVpjBgEf0ZNSAX6DSlBySaaQp4FrX2edh6bIek8p
         IbYOnoByKpKPZHikTzL8KZ810BVAjwmZM5HLV9TFS/83xkQOfmL1fSjnG0dAtZ1E8rCD
         L7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=rmRfZ+JWni6EAeh2aMpoDG3e7kgtMtMiAEvhThb3jWo=;
        b=OOanhRsEJ/BuunqxeM9+Z8KvNJW3Clpz2sHSlLVEFsPpUCZxwghUz7E74YzcNiYgYh
         +J4ucIkvVmUcnGBNmPpeYsItg6j3qMSSLthW8cWwD+ffnAc3B4dJzA50g1NLCDGu0YwU
         Wv1Wrl4vS7Fog8kHEgetANSRY+lnSKwXD1yurLKG99d1uezx/7yNxXVnZ8MynlFwBDQD
         M9NIOkyO1gVsY+0DsmKuPcXTJFKKRESapO/L0nCcFStR31tzxKpv+o+V+YprHtxBuu+g
         yXC6N2aTFtJKyinylYKGQzD5BiZuA26oMIhK+KmwHni5vCsYm7gz/sm5kCZeYCWeOfav
         gcqg==
X-Gm-Message-State: APjAAAUcU6ii+iRyiTCnsQ8sShzk25/df5RsuyKDgAb/a5B1GrVBMkvv
        OosRIuxvK3teEo7N5MaQPGQ=
X-Google-Smtp-Source: APXvYqyWSXOLND2a0hiUFqqDtSNhYmTNwZMoblxKWs/qIHzw5pX9bAoJdahswdCeqBF8TfQGKPCesw==
X-Received: by 2002:aed:23b4:: with SMTP id j49mr23856qtc.175.1555619977419;
        Thu, 18 Apr 2019 13:39:37 -0700 (PDT)
Received: from jfdmac.sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id t2sm1734353qkd.57.2019.04.18.13.39.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 13:39:36 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [PATCH v2] hwmon: max6650: add thermal cooling device capability
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <20190418201208.GA10459@roeck-us.net>
Date:   Thu, 18 Apr 2019 16:39:35 -0400
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <A7D38D52-8643-481D-AE6F-5F61DBE04108@gmail.com>
References: <20190418164813.21053-1-jeff.dagenais@gmail.com>
 <20190418173856.GB7804@roeck-us.net>
 <55B323D8-9715-46C3-9205-38344D6FADCD@gmail.com>
 <20190418180623.GA18588@roeck-us.net>
 <40DEF6F9-FA5B-4537-BD02-6763D7C885A1@gmail.com>
 <20190418201208.GA10459@roeck-us.net>
To:     Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3445.102.3)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



> On Apr 18, 2019, at 16:12, Guenter Roeck <linux@roeck-us.net> wrote:
>=20
> That explains why the other drivers don't generate an error message.
> You might want to reconsider the dev_err() above; it appears it adds =
zero
> value.
>=20
>> If I am wrong, then pwm-fan.c should also be visited since my =
max6650_probe code
>> was copy-pasted from it.
>>=20
>=20
> You are correct, that should not fail either. But two wrongs don't =
make it right.

So you think any fan chip driver probe function in hwmon should succeed =
even if
(devm_)thermal_of_cooling_device_register fails?. Mmmh... perhaps I am =
missing
something, but I tend to disagree. That means that for example my system =
boots
normally without any errors, yet the thermal-zone I defined, which is =
there to
prevent my system from burning out, would remain incomplete (without =
required
cooling device) and yet no errors came out of the kernel.

I just tested it and that's exactly what's happening! Yikes.

>=20
>>=20
>> On a related note, I am worried about everyone having to =
progressively add
>> thermal-zone support to each fan chip in drivers/hwmon. Would it not =
be possible
>> for hwmon to detect, through `enum hwmon_sensor_types` set to =
`hwmon_fan` in
>> `struct hwmon_channel_info` to be registered as cooling device in =
thermal ? Of
>> course for max665x to work, it would have to be modified to use
>> `devm_hwmon_device_register_with_info` instead of
>> `devm_hwmon_device_register_with_groups`
>>=20
>=20
> Yes, that would be desirable. Patches welcome. And, yes, the driver =
would have
> to be reworked to use the new API.
>=20
>> Another possiblity would be to create a new driver in drivers/thermal =
for
>> max665x as a thermal cooling device. Or even a
>=20
> Only if we also drop the existing driver from hwmon. Fine with me if =
others
> agree and let you do it (one less hwmon driver to maintain).
>=20
> Note that I just submitted a patch series to introduce
> devm_thermal_of_cooling_device_register(). We'll see if the thermal =
maintainers
> accept it.

Saw that. For a minute I really thought you pulled out a series which =
did exactly
what I was talking about (i.e. auto-registering fans in thermal =
cooling)!!

Since my problem is fixed in the short term, and am very stretched for =
time with
our project, I will not have time to do this now. Perhaps one day... ;)=
