Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4B6C77B7E
	for <linux-hwmon@archiver.kernel.org>; Wed, 26 Apr 2023 20:27:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235048AbjDZU1o (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 26 Apr 2023 16:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232651AbjDZU1n (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 26 Apr 2023 16:27:43 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5130A184
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Apr 2023 13:27:42 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-506b8c6bc07so12780299a12.2
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Apr 2023 13:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682540861; x=1685132861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSqK2wJN/6F2J+UJocB6WHE3pbLeSmOjGYSDXavfKiU=;
        b=jEYpVtnahDvaTnDmr5WyjrNX32ani3gKeNPbAdLdpiQUyEgoSUk5SZk2kWn8ymVg6b
         BktXSXeg6EXBpjnDcoxOK1I9QpG+2faFoGNm4k4SQKPLdVtWTYGR/dcoqm+Teu5UP5dF
         5nkp5nsM0u31Q3p4+hZPttChSGFmJuYF+alTmOzqo0WfZa90dMU6p/HKEdiP1wC+WVUy
         v1tZhBICV5AssNPPGIzbse2fr1TDDBLgfPyK15epc5SHNXjRDjlKMBobi4qCN68IxANG
         5/PI4rrGmXTu5OIRhPPA38vkkmyClBcE3WFG42nFDvMlJD889e30EmE6z+7UxfZ77Zre
         zf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682540861; x=1685132861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSqK2wJN/6F2J+UJocB6WHE3pbLeSmOjGYSDXavfKiU=;
        b=fO3IfSBY+wHqhD0jgmDdKr1ehqXG3uys/Js3dXYh+IEffXEQ2VuThZHhD5PKk4J2O+
         VALvfCcadAxTKkl9t9eWzvuycTMv9BHOnd5wHKiso3OBJLEilmSk+Uz4a5lwCO9L76w4
         WNzwK0kN9k/O81A1SvzSZd+ELnFFiPuG9vR56TbBELAVafTsktb9JUHL5w4U5c57jO8g
         s8n4BuISRQnVNM8clyuwrLfyVIe+quoZ6AL5fQNWXTT4519lRiMtbfVNhnjfxvSACxx0
         QqgwgS1mghUCnjloCF1qChZRCxgvGut3k/oHoTAMsaX7LXIyFFupx9inuAg2GWuEgooy
         rvGw==
X-Gm-Message-State: AAQBX9cMw0LNeZxz3N9CxbqCNZkf9D4GxFWl6/aLxOvAkK/GBchhrFZK
        PNlZS3aoi0m3g9QJodpTYL+KW4sgNVg=
X-Google-Smtp-Source: AKy350ZSCkBVPNlOOfb5T8eD564TiSvnPgWuTio+ui5kIGIXrKBgZNbAg5El4vo9AN5q5ikw+ZSc1A==
X-Received: by 2002:a17:906:3549:b0:94a:6c0a:63e7 with SMTP id s9-20020a170906354900b0094a6c0a63e7mr20245114eja.54.1682540860671;
        Wed, 26 Apr 2023 13:27:40 -0700 (PDT)
Received: from localhost ([46.211.17.96])
        by smtp.gmail.com with ESMTPSA id f22-20020a170906c09600b0094f7cc13a69sm8539695ejz.181.2023.04.26.13.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 13:27:40 -0700 (PDT)
Date:   Wed, 26 Apr 2023 23:27:30 +0300
From:   Denis Pauk <pauk.denis@gmail.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Renaud Lepage <root@cybikbase.com>, linux-hwmon@vger.kernel.org
Subject: Re: hwmon patch
Message-ID: <20230426232730.638fd30c@gmail.com>
In-Reply-To: <638be9f0-4258-4418-834d-4f8123fefa26@roeck-us.net>
References: <SJ0PR12MB5673DC1F156198075B347F90BF659@SJ0PR12MB5673.namprd12.prod.outlook.com>
        <638be9f0-4258-4418-834d-4f8123fefa26@roeck-us.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On Wed, 26 Apr 2023 11:50:46 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On Wed, Apr 26, 2023 at 04:38:53PM +0000, Renaud Lepage wrote:
> > Hello! Sorry for reaching out at random.
> >  =20
>=20
> In the future, please use the linux-hwmon@vger.kernel.org mailing list
> to reach out.
>=20
> > nct6775-platform.c lists support for a NUMBER of motherboards, of which
> > mine isn't listed. Is there any specific reason why the Strix B360-*,
> > H370-* and Z390-* are listed, but the Z370-* are (conspicuously) not
> > present?=20
>=20
> Presumably because no one submitted a patch adding support for it,
> or maybe because it doesn't work. Denis, any comments / feedback ?
>=20
I suppose that such boards does not have an implementation of required WMI
method or dumps that I have does not provide such methods. I have used UEFI
capsules and dumps from linux hardware database.=20
Sometime version provided on ASUS support site can't be unpacked by
uefi-firmware-parser or does not have WMI method required for sensor suppor=
t.=20
Or linux hardware database does not have dumps for such boards.=20

As result - script can't detect that such board has support of WMI method
for sure.

Currently, I have information about 19 boards based on such chipset, where
sensor region defined in unknown way or partially for two boards:
* ROG STRIX Z370-H GAMING
* ROG MAXIMUS X HERO.
Other bios dumps for boards or can't be downloaded or can't be unpacked.

So mostly its question when someone test code on a real board
or DSDT dumps will uploaded to https://github.com/linuxhw/ACPI or
https://bugzilla.kernel.org/show_bug.cgi?id=3D204807 with known region
definitions and WMI methods.
=20
Boards could have a different way of define region for sensor or a
different WMI method for access to sensor in the theory. Or a sensor could =
be
accessed without ACPI conflicts that sometime happens for different board
revision.

Look to https://github.com/asus-wmi-boards-sensors/asus-board-dsdt for more
information.

> On a side note, please never use all-capitals for words.
> That is equivalent to shouting.
>=20
> Thanks,
> Guenter
>=20
> > If it's lack of testing, I volunteer as tribute. I'm running a
> > https://www.amazon.com/gp/product/B075RHWCBT/ right now.
> >=20
Could you please add your board dump as an issue to github or to
https://bugzilla.kernel.org/show_bug.cgi?id=3D204807 by `acpidump -b`?=20
If you can build kernel, could you please build kernel with additional "ROG
STRIX Z370-G GAMING" line to `asus_wmi_boards` list?

> > --
> > Renaud Lepage
> > BScA Informatique et G=C3=A9nie Logiciel
> > BAsc CompSci & Software Eng
> >  =20

I hope it will help. Thank you!

Best regards,
                  Denis.
