Return-Path: <SRS0=8wir=SU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66465C10F0E
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 19:54:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2DE7F20643
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 19:54:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mF9rNpQ4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389796AbfDRTyf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Apr 2019 15:54:35 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:34064 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731317AbfDRTyf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Apr 2019 15:54:35 -0400
Received: by mail-qk1-f194.google.com with SMTP id n68so1877939qka.1
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Apr 2019 12:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=/dJGjPt4m67JLDDRnv39tcbMVfdImz7cA+7oRQMy+Hs=;
        b=mF9rNpQ4c+i/j6OcE4ioi4VKVgfoq8s/01tyjoTxhscJ1h87xQIHCqrQk/t/zbBwob
         SNieejQQL53ozhy9VlYxAcJ0QsDBfcUJYs7Xg27zAt4QbyRvM1/gjDMhGHf/TqC1ydkZ
         FdHBEeNqe2WIjWLNeUV1J10M8dmo8lTahOYYtlWoRWguNnUqNc5C2NcjgP8iJZtmVvLl
         U2CArGwKAnG7Z9JrCpDkS3QFKDnI4UJtBDRseiqygg/0eyHii+FU2Slvsnim1Tz8ZRHF
         BTd8FDm9JbfdIKX06TQtpPOckOBjA4Cdr7UkBrvAc3xtH3AgE/e37X27TilFpOx7OEBe
         l9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=/dJGjPt4m67JLDDRnv39tcbMVfdImz7cA+7oRQMy+Hs=;
        b=DkkSYwxX0EV9edTF9TufFQNU9ukZR5jpptF5WI49D6Tz5mIw3gJ1Wg3Cs2k2bMjsYR
         BENn70WritN3C5PkjuPwYtoFsw+ZRzrFQmQZHukzgwa7OGgFse9XOMTfQ6OHXeoJZ5V+
         Itu+CgQa5eFgZpwRUdpLadcRwcJm9BOyP0wOKwNwktTDros+qwqhGUhDHvsWXw9PDHDG
         avoqfjZm5LfHGuqfLjhtCypDJrlKgxkBUbHqzHfTfvNg1hRayBYnyemvEWEkMSxK/cUz
         00b20pPsBRftUYXArOzL6RUhYMITbYv3gbkCDcPEuz66JraN114FhtNbMChi8TXuzbc/
         Ijfg==
X-Gm-Message-State: APjAAAVlu6mIOHkG/OT0z+E1rhoiyAkn03C9QNsd08cw7q/d0kYMugVs
        CEhDgNs1O3zBNExUqRHJcZI=
X-Google-Smtp-Source: APXvYqx5YnR0CRb1FrL6gxT9yTTTcFUdpVnh2mMHyuxzx/a4ThCyQSupwyosGgWGPuyLdqkVpd+ONg==
X-Received: by 2002:a37:5805:: with SMTP id m5mr73515163qkb.136.1555617274470;
        Thu, 18 Apr 2019 12:54:34 -0700 (PDT)
Received: from jfdmac.sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id w8sm1338371qki.54.2019.04.18.12.54.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 12:54:33 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [PATCH v2] hwmon: max6650: add thermal cooling device capability
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <20190418180623.GA18588@roeck-us.net>
Date:   Thu, 18 Apr 2019 15:54:32 -0400
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <40DEF6F9-FA5B-4537-BD02-6763D7C885A1@gmail.com>
References: <20190418164813.21053-1-jeff.dagenais@gmail.com>
 <20190418173856.GB7804@roeck-us.net>
 <55B323D8-9715-46C3-9205-38344D6FADCD@gmail.com>
 <20190418180623.GA18588@roeck-us.net>
To:     Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3445.102.3)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



> On Apr 18, 2019, at 14:06, Guenter Roeck <linux@roeck-us.net> wrote:
>=20
> On Thu, Apr 18, 2019 at 02:02:48PM -0400, Jean-Francois Dagenais =
wrote:
>>=20
>>> On Apr 18, 2019, at 13:38, Guenter Roeck <linux@roeck-us.net> wrote:
>>>=20
>>>> +#if IS_ENABLED(CONFIG_THERMAL)
>>>=20
>>> This will result in missing symbols if THERMAL is built as module
>>> and this driver is built into the kernel. You'll have to adjust
>>> Kconfig dependencies accordingly. See other drivers for examples.
>>=20
>> Right! Was not a problem for me, but I do remember seing the "funny"
>> ifdefs around.
>>=20
>=20
> I know, it is annoying. There was an effort to make THERMAL boolean
> instead of tristate, but it looks like that has stalled or was
> rejected.

Ok, so I had used pwm-fan.c as a reference and simply forgotten to copy =
over the
Kconfig bit which makes sure if the thermal is a module, then so is the =
chip
driver. I will put in v3.

>=20
>>>=20
>>>> +	data->cooling_dev =3D
>>>> +		thermal_of_cooling_device_register(client->dev.of_node,
>>>> +						   id->name, data,
>>>> +						   =
&max6650_cooling_ops);
>>>> +	if (IS_ERR(data->cooling_dev)) {
>>>> +		err =3D PTR_ERR(data->cooling_dev);
>>>> +		dev_err(&client->dev,
>>>> +			"Failed to register as cooling device (%d)\n", =
err);
>>>> +		return err;
>>>=20
>>> Why would it be fatal for the driver if this fails ? It wasn't
>>> fatal before.
>>=20
>> Mmmh, you are right. This assumes that all users of max6650 would now =
require to
>> be referred to in some thermal zone. Again, this was not a problem =
for my test
>> environment.

And about this bit... I had confused the thermal cooling register with =
the
thermal_of_sensor register. So if my static analysis of the code in
__thermal_cooling_device_register is correct, the function cannot really =
fail
unless something is terribly wrong in the kernel... like a malloc =
failure or
something.

If I am wrong, then pwm-fan.c should also be visited since my =
max6650_probe code
was copy-pasted from it.


On a related note, I am worried about everyone having to progressively =
add
thermal-zone support to each fan chip in drivers/hwmon. Would it not be =
possible
for hwmon to detect, through `enum hwmon_sensor_types` set to =
`hwmon_fan` in
`struct hwmon_channel_info` to be registered as cooling device in =
thermal ? Of
course for max665x to work, it would have to be modified to use
`devm_hwmon_device_register_with_info` instead of
`devm_hwmon_device_register_with_groups`

Another possiblity would be to create a new driver in drivers/thermal =
for
max665x as a thermal cooling device. Or even a
drivers/thermal/thermal-generic-hwmon-fan.c or something, where DTS =
would
instanciate such a cooling device which references a hwmon device's =
specific
pwm channel.

Phew! So many possibilities!=
