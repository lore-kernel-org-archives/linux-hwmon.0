Return-Path: <SRS0=8wir=SU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8153FC10F0E
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 20:45:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D484214DA
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Apr 2019 20:45:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvf3zJAI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731565AbfDRUpD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Apr 2019 16:45:03 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:39496 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfDRUpC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Apr 2019 16:45:02 -0400
Received: by mail-qt1-f196.google.com with SMTP id f13so3287116qto.6
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Apr 2019 13:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Ris8JrMUqJj/59vK8X4kgUzUBmB9YCFHaaba153D6xM=;
        b=mvf3zJAIwKowEfgximCL3zUG/FYl/s32ZmFS2yNc6kOubwIr0DwiUpdKUXS7oljUbM
         5YCP9LpM8CfnnVV0nQPyL7e4L8F4U6VMLDHRmIG3Zy+fFxRDyCsf/kepLsz0CJPrKbG3
         nTVdrPlotS/iqhAGVYIODBZcxSPG99Vnf9+OTvRLRw1bMJBNitn5fC6/NtIjF7qVxsQk
         taF/M4kmoPOyJTDejXEQe9Uwxz9jhl7OkitaDwA6pgCsNjCZWAHTsh0mDLKzVUA+t0HD
         omSi5zKdXIkx7yBu986RNv3Z68Ape4fr6YCmorX7KMO3joniLKThB8uyUoqnXOuvI7Jw
         DCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=Ris8JrMUqJj/59vK8X4kgUzUBmB9YCFHaaba153D6xM=;
        b=kCUGalqr8ZdphJLHphE3qAvdKwcZS3bsPpxOsHVhiOVIlbBwABoNqZY8TE400qNkCc
         4I3fG0Yo6CLS3kW8hWSZwgtkr+emwCdpu3f8baavEJhH7lIlanYYesbynZskp5cAlb0z
         f9J3F19rxmunyPwWVNW5JBOhcmVu3Z3/9BklBDUhRmbu8/m4GecHEWuKfNIHwOvgsGNu
         dc5IIBVx1tbB4Ab2XpHqZ5tQLKuYeAcGpO2ahBhiuCfJolXqqRYNoqplfKDy8bM7OLVI
         J/NN0n1VROwqwCBNjKcHhL1uEtgoSPzcyi4n9MiX/ulOrmsSFRNCDkRLOnOaIpjhvXLB
         1msw==
X-Gm-Message-State: APjAAAUrq0gI7H52PrlEBo020bMno3c0+rGpjGPib8KZGeKExjfvSdXZ
        hdr1tnMBzFMZ01a1WGaS2Do=
X-Google-Smtp-Source: APXvYqyZd4RrtXx9fCKBai9TpOcpN/FISoFDfCAbeWCHxdxf44mweeb7UuwXjgBo1yFU/9lMdNnhZQ==
X-Received: by 2002:a0c:924b:: with SMTP id 11mr163600qvz.228.1555620301973;
        Thu, 18 Apr 2019 13:45:01 -0700 (PDT)
Received: from jfdmac.sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id a7sm1262878qkk.65.2019.04.18.13.45.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2019 13:45:01 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: [PATCH v3] hwmon: max6650: add thermal cooling device capability
From:   Jean-Francois Dagenais <jeff.dagenais@gmail.com>
In-Reply-To: <20190418201327.GA11385@roeck-us.net>
Date:   Thu, 18 Apr 2019 16:45:00 -0400
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <386CEABE-23A4-4BB6-968A-738B8D84DE4E@gmail.com>
References: <40DEF6F9-FA5B-4537-BD02-6763D7C885A1@gmail.com>
 <20190418200452.5703-1-jeff.dagenais@gmail.com>
 <20190418201327.GA11385@roeck-us.net>
To:     Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3445.102.3)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


> On Apr 18, 2019, at 16:13, Guenter Roeck <linux@roeck-us.net> wrote:
>=20
>> +	if (IS_ERR(data->cooling_dev)) {
>> +		err =3D PTR_ERR(data->cooling_dev);
>> +		dev_err(&client->dev,
>> +			"Failed to register as cooling device (%d)\n", =
err);
>=20
> As mentioned in my other mail, this message adds zero value. Please =
drop.

How does one distinguish the different failures which can occur within a =
probe
function then. I know it is only useful for system integrators while =
debugging
DTS for example. But I find my self always having to insert these kind =
of messages
at each "return" statements of a failing probe implementation. I just =
think it's
nice for developers which can use the info to quickly troubleshoot the =
problem.

I won't fight this though. You are maintainer of this subsys so...

>=20
>> +		return err;
>=20
> Sorry, I won't accept this.

You mean, you won't accept v3, but a v4 without the dev_err?

Perhaps also, we should wait a v4 which would use your new =
devm_register... ?=
