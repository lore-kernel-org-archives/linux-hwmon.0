Return-Path: <SRS0=EIaL=EM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DA0C2D0A3
	for <linux-hwmon@archiver.kernel.org>; Fri,  6 Nov 2020 23:17:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92EA3206A5
	for <linux-hwmon@archiver.kernel.org>; Fri,  6 Nov 2020 23:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YovXZXZe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728411AbgKFXRR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 6 Nov 2020 18:17:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgKFXRQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 6 Nov 2020 18:17:16 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8105FC0613CF;
        Fri,  6 Nov 2020 15:17:16 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id i21so2684931qka.12;
        Fri, 06 Nov 2020 15:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:mime-version
         :content-disposition;
        bh=gPpSIt1dr7u/yEw1A9ps6+8EjvWvm8VXL/7vqW1e/eQ=;
        b=YovXZXZe+LBzJA8tLj0CyErgyc9vSnBJ4rNVUCvF1E4U46Dxz6C//JQkpyDD0UCXrI
         XCy4xlJg2mvUctpNtOG4oYQM19fBFdLhGQB2R36T+VyfahmcHOjhMUhzxrRSntOf4Bws
         bTPlLwF1j8fVjF74eoO6GJvvRIDwigahvcej4hSQiUWDPzdU24L8yQ/0I3jvQ+qATuW3
         kHTcvprN9seaDsvPgdy/iSCtI7IRAVAaWpKWKmKhFAcPZe8T2xaG0xw1Eu18qpByB3PO
         FcjLMw7fhWDTaVvHh1jIwkEDWsAZiKHi+OthzzNyjKXavmlLxJqLnvaZ23Ft68rM6Pol
         hSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :mime-version:content-disposition;
        bh=gPpSIt1dr7u/yEw1A9ps6+8EjvWvm8VXL/7vqW1e/eQ=;
        b=BR/Dj8Y570PscfBFwyZXKCLEX5R6K8BA/26JiKGuIYA0FZij/bHO/MyHh/rPnS5F9v
         +d6joLcpiMGh9uZzm/uO/tAN90Uno2no9rogDn9bguILgRf78AfLcRZNPt5mLEE5BsMP
         JrxrbDEDWgoZvm15Swn29SQmbBHKu8k6yqctZZvZtXp4B5FIlvPaTJV4OkPrujWRTt16
         o9l7kMZhwLWjawWyV3lISb2YpQceae+Y4hdGChzMK8GVQPWFcN+IIZ5TJ7qvot1wsBjP
         v4b9doQezbkz/KpjdGjBniAunEBO9efvnGoLvW0N6TQZZ8OkLUBvvU/Fvb4Ez8mZroH8
         nHew==
X-Gm-Message-State: AOAM5326VtK5ZqkTG4fOLdCr9cBJjNLodsgBAQqSSufWoWgoANK1Cy3+
        r+eXIr/KAVZPDVCF29tY/coULe3oJNc=
X-Google-Smtp-Source: ABdhPJxTz1+UGKQxPnBHdugu6TmTCawU+wBlpe3xIX2itrnNyYP+nCQQT2G873/6SkodTzK2sjwH9w==
X-Received: by 2002:a37:6fc5:: with SMTP id k188mr4025151qkc.317.1604704635770;
        Fri, 06 Nov 2020 15:17:15 -0800 (PST)
Received: from localhost ([75.183.140.180])
        by smtp.gmail.com with ESMTPSA id h6sm648589qtm.68.2020.11.06.15.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 15:17:14 -0800 (PST)
Date:   Fri, 6 Nov 2020 18:17:10 -0500
From:   Matt Turner <mattst88@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Richard Fontana <rfontana@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] hwmon: applesmc: avoid overlong udelay()
Message-ID: <20201106231710.GA29287@macbook>
Reply-To: 20200527135207.1118624-1-arnd@arndb.de
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On my late 2013 Macbook Pro, I have a couple of scripts that set the
fans to auto or full-speed:

fan-hi:
#!/bin/sh
sudo sh -c 'echo 1 > /sys/devices/platform/applesmc.768/fan1_manual
             echo 1 > /sys/devices/platform/applesmc.768/fan2_manual
             cat /sys/devices/platform/applesmc.768/fan1_max > /sys/devices/platform/applesmc.768/fan1_output
             cat /sys/devices/platform/applesmc.768/fan2_max > /sys/devices/platform/applesmc.768/fan2_output'

fan-auto:
#!/bin/sh
sudo sh -c 'echo 0 > /sys/devices/platform/applesmc.768/fan1_manual
             echo 0 > /sys/devices/platform/applesmc.768/fan2_manual'

Running ./fan-hi and then ./fan-auto on Linux v5.6 works and doesn't
cause any problems, but after updating to v5.9 I see this in dmesg:

[Nov 6 17:24] applesmc: send_byte(0x01, 0x0300) fail: 0x40
[  +0.000005] applesmc: FS! : write data fail
[  +0.191777] applesmc: send_byte(0x30, 0x0300) fail: 0x40
[  +0.000009] applesmc: F0Tg: write data fail
[  +7.097416] applesmc: send_byte(0x00, 0x0300) fail: 0x40
[  +0.000006] applesmc: FS! : write data fail

and the fan controls don't work.

Googling turned up this [1] which looks like the same problem. They said
it began occurring between v5.7 and v5.8, so I looked and found this
commit.

After reverting commit fff2d0f701e6753591609739f8ab9be1c8e80ebb from
v5.9, I no longer see the errors in dmesg and the fan controls work
again.

Any ideas what the problem is?

Thanks,
Matt

[1] https://stackoverflow.com/questions/63505469/cant-write-data-to-applesmc-error-after-upgrade-to-arch-linux-kernel-5-8-1

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iNUEABYKAH0WIQSzlptPDvl9ch5jjr2cglpmBdQLvgUCX6XZdF8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjM5
NjlCNEYwRUY5N0Q3MjFFNjM4RUJEOUM4MjVBNjYwNUQ0MEJCRQAKCRCcglpmBdQL
vkTXAPwOlyVrZemN/MxaBAOxSwKtX4/VgdeqF+d7p43HqZ3hiAEAuax5nEL5cMOV
8YjzQAu/SHiGfHqBBT5A0qMLP03KOwA=
=WUnV
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--
