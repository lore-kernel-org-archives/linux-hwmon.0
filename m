Return-Path: <SRS0=S2uc=R4=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D0AC43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Mar 2019 08:21:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4875D20879
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Mar 2019 08:21:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9Dmioff"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729920AbfCYIV4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Mar 2019 04:21:56 -0400
Received: from mail-it1-f181.google.com ([209.85.166.181]:40326 "EHLO
        mail-it1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729914AbfCYIVz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Mar 2019 04:21:55 -0400
Received: by mail-it1-f181.google.com with SMTP id y63so923246itb.5
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Mar 2019 01:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=vgGl87P/sqNer9f1dVkOnqtIHUfnC6TIVzAuAr/kn7Q=;
        b=s9DmioffIU5p/geJY4T8PViCkiAcRWXMeozgecD7pqv/KpdjSH6H2TQRvqfihMdTq9
         N/zcbZjc1Ml3gGEpiR9TZLkh4XpKyApjrvXQKeThaN32H0XTzWu4mLtCxfgOuSVNf6Uy
         bvyEUx7hWz3XlrSd3ILWRkxmd5Gx5SmbZYgsh+Y1P0qFit6MO7aZNiA1TN5lW6Xz6NWx
         ZZONRtsn/K2WIvCRvuJOeoWu5gclKy4B9trYCknCK//RQsHuq/w52hZShGJ5jHHq3Zfj
         Dts0h3Fvrt2iUn4fAbS3V/annQEZBSL0wH2Go584sokVijivkdwzucdhZXcrTX3ZWpds
         DB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=vgGl87P/sqNer9f1dVkOnqtIHUfnC6TIVzAuAr/kn7Q=;
        b=E20ErF1MKn6cX1Z1DxIKezOBXng2RYRBFDHLyFRvLSB0vGKvyWisfdzNeSDAizBFVY
         sZtkO1l1yV8L7wac2nvL/JZiu6nsdSYwczEm92HKN5ZfdlhRqalMwv/K/Jix1h5kPdsQ
         PgwbX3PF9IskJyiHyaiw/86todlpo+mIMYQnYtOTJ7SCsTkpgqvxuhB8I/E2dOIOWaaX
         yaKZoY+DZeXg1Pj5cDfgrZDkW01BLWkPsBVK/Mixc6hjnG6yPkC12Nw7d9w+CE6C1A0F
         bdSwV/seV7wRwCgx2X6hCDhR0gDBlli1DH40XFAcOl65e1Kn3Xgubv5G83ELccYPMKtj
         nWKA==
X-Gm-Message-State: APjAAAVoN+9HMM0QrXc5oWaiD9gc0F0JMbSIXDIAU4380a//xNULBv4G
        lcZC6u8PQhJKz2BXd9wGHcERZgeFqDU7L4VpUYcJTrurMOQ=
X-Google-Smtp-Source: APXvYqzzbeAYWViUND68cLeOqc2zdTCFdcCubN+zmMXk10hdlxag+iYVYR3E7lt4GuGJD707Qq3rWbF94JSYNZvmxgk=
X-Received: by 2002:a24:df87:: with SMTP id r129mr9952503itg.178.1553502114691;
 Mon, 25 Mar 2019 01:21:54 -0700 (PDT)
MIME-Version: 1.0
From:   Lei YU <mine260309@gmail.com>
Date:   Mon, 25 Mar 2019 16:21:42 +0800
Message-ID: <CAARXrtmNL+Px7vk4mA++yzO22nUWqmBnL3hn6oedB8d9516pvg@mail.gmail.com>
Subject: Userspace matching of hwmon devices to hardware
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc:     Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This email is to ask/discuss if there is a stable path/name (or whatever) for
hwmon devices in the different versions of kernels.

In OpenBMC, the service phosphor-hwmon reads the sensors' value and expose to
DBus, depending on a configure file that matches the device tree path.

The service is started by udev rule, called with the DEVPATH and OF_FULLNAME,
so it knows where to find the configure file depending on DEVPATH or
OF_FULLNAME.

E.g. on Romulus BMC, the w83773 sensor has OF_FULLNAME at
   /ahb/apb/i2c@1e78a000/i2c-bus@440/w83773g@4c,
and the service knows the config is matched from path
   /etc/default/obmc/hwmon/ahb/apb/i2c@1e78a000/i2c-bus@440/w83773g@4c.conf

However, the DEVPATH or OF_FULLNAME is not stable in different kernels:
* In 4.1x kernel, the path is as above.
* In 5.0 kernel, "i2c@1e78a000" is changed to "bus@1e78a000" in the path.

This breaks the userspace's phosphor-hwmon.
If we fix the issue by updating the configure files' path in userspace, it
means the userspace only with the new 5.x kernel.

So the question here is, it there a stable way for userspace to match a hwmon
device?

Thanks!

--
BRs,
Lei YU
