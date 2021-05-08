Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511DEC433ED
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 13:15:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 260726140F
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 13:15:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhEHNQb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 8 May 2021 09:16:31 -0400
Received: from mout.gmx.net ([212.227.15.15]:47733 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230438AbhEHNQb (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 8 May 2021 09:16:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620479713;
        bh=WvSOhgDccPlLoq21ur86tLWDnO7bGvfh6lwcuGqfPkw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=eEKegIXG64tjdeBIqU/ZcDV5JjnUCGsy2+Z6739PcGOCELFQGZk6PBP0k9xg9UArr
         X+7lYWB/HXlzEDKgJ7D3/XDvWJJ4rJ+vVdSvZabBJ6tlD32IoUhj8sqo5/80Q+9KRz
         xDP955M/BkiyLlxfj402p80454iQ5UJod9aM6Hos=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.223.76]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M2wL0-1lgSCK34Ky-003Pxp; Sat, 08 May 2021 15:15:12 +0200
From:   W_Armin@gmx.de
To:     hdegoede@redhat.com
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
Subject: [PATCH v2 0/4] hwmon: (sch56xx) Use devres for watchdog and platform_device_register_simple()
Date:   Sat,  8 May 2021 15:14:53 +0200
Message-Id: <20210508131457.12780-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DSX1q36vdNm2fpmQj06iClz7HCerpelPtCduoscHgla2Oe7zSGo
 e+Hukl+3zxlomGO648x51IaCTRHPcBzuaYilgeX03A4uidDK3TT//yf8ZydroH/0/gsAqtv
 +pZaKc8eAzWFy33Su+LvXQRQ15/ypHZAEeq2koT3SMb1Dm5GtAsVoSInEP+gqvc5I52u1mt
 HYo9PX5Toj9i7ZThsjW/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VvWDvWlQATg=:WrVdU+J4FgmZJUvcpqsNWb
 eSc9blaj0D4rKsel9zQDwAd4nlfiluPgT1qFv/wdkn0AGWxM5aC4j3YHPUUuCueAfE09BL5Ej
 gPZhBTDBcdHxO+yUbtZrkloGZxeTACU0MBXOcQm6S/GtjFQd9nU2yyCnSi2qIsj3+r4G3jJW0
 mt+9HkKfXJmsZJkGeopIq0y2HDMzGCyIiHaadLtBMcy0kZmkbPPC2hSNGTIMmzNgQSIWGapFM
 1L3IjafglMxMej73o1voYBF0p+RzZn7SQIWauGzXM4/pls5UhblLMFHIs4E+U8xRBo6QWFZC6
 rhR7y+saMHXjZKwjlLVPxWsiUq8lxiGwVgjkBOjbF5YSHQocnzBXmbfnw/a/u1XdCittnf3Iu
 YD3c1k9pFjICdOSlroQDUesEr+dtVwBq4+L2+G4N8iupV8uoYHDKKUY+xQ+V0Mhql6JWuqFZ4
 WXaoLPkQbquMqI+VrD2iAnFlgnQfR/zQsL7FmRSdf0Lnf5PhBZT+a/n28LreJndlN3quGNCoc
 R7UDLomx5nbVQLTgdqeX1Tkjv3RmfBmmqcw4BbqZODpc5qew/OtVC6ss1smJo54hytS16Es4y
 d635yUpA/BoP8PL4JCEhowHV7rOPSvi0K3i4lX+5fh5EoasV5qmaxSSTGyTQoX6HH7seLxsNl
 bBrg5N7tn9R9Lssb6XV5j+01IK45zy3YG9EqOT75uMhigxtAaCVYlmJTOEKg5xr42phXQzgx7
 pgNGLxOSWqo05sEsl/3tgEWJjzfaVlW/ViQ1L0FBh5DmURPCz+70tFkfcQtRAEMhDb6VPDHwI
 Nt8KysGSSDMuRZM+QGT99HVynCRYeqffyiKs2TIEs/ITBmvmL5FNqVCjkm3s3ddmPhzNBLcLI
 zSKf0bsBgKf4ipht5xOgDDYtUZZTBy1nWiJe5BPVGAt9Fi+QTV+q/gkgde+VDf5UFCcBOhS5F
 3PRY0CBJ2/N6lepQmkba/bAP43Et7SASnMqUp334+HLOQfftUpN6pF3nA4MyzNtcbmlY64n7T
 80QHSBgDuYmUMXOG1CgyuAk5EdrT+gQbKfkF40reuhi91Y4VJRT95PvkSbONnob0u1004+kcO
 9Xq1b1/BZGxgFJmYTwv6Bu8ku3f5FA6SbG4zLok3/Sh0fW9rlGBRo/SmsEFZKh0XUNgNJiqoI
 dNcXYmmGe8Z+eKb+DeO9DKqMn2cSwoIMDz2CDQioI9asNJ5kyLGjpBnT+iHHAsUUTtXPQ=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Since it was requested to use devres for the watchdog device,
use devm_watchdog_register() for watchdog registration and do
some small cleanups.

Also use platform_device_register_simple() in sch56xx_device_add().

Tested on a Fujitsu Esprimo P720.

v2:
- drop sch5627_remove()
- make sch56xx_watchdog_register() return void

Armin Wolf (4):
  hwmon: (sch56xx) Use devres functions for watchdog
  hwmon: (sch56xx-common) Use strscpy
  hwmon: (sch56xx-common) Use helper function
  hwmon: (sch56xx-common) Simplify sch56xx_device_add

 drivers/hwmon/sch5627.c        | 18 ++--------
 drivers/hwmon/sch5636.c        |  9 ++---
 drivers/hwmon/sch56xx-common.c | 65 ++++++++++------------------------
 drivers/hwmon/sch56xx-common.h |  4 +--
 4 files changed, 25 insertions(+), 71 deletions(-)

=2D-
2.20.1

