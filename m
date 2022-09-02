Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AE3C6FA81
	for <linux-hwmon@archiver.kernel.org>; Fri,  2 Sep 2022 17:40:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235961AbiIBRkc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 2 Sep 2022 13:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235565AbiIBRkb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Sep 2022 13:40:31 -0400
Received: from vorpal.se (vorpal.se [IPv6:2a01:7e00::f03c:91ff:fe73:398e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C236AA3B;
        Fri,  2 Sep 2022 10:40:29 -0700 (PDT)
Received: by vorpal.se (Postfix) with ESMTPSA id 368C1142D4;
        Fri,  2 Sep 2022 17:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
        t=1662140428; bh=tEAkV/SXGDo9A/xmGs4W4D5XUlHNsGenpzuj3VNo+yA=;
        h=From:To:Cc:Subject:Date:From;
        b=WRqyLaMeM39oQmFNAXfFnu4T9Pn/alfHkXlawF0KYIt0GZiip+LeTCKD1OOnDMG/7
         TldE8z70O8ohYEnLXhBv+sF+VwafkS9f6zY6FxLLO/Om+NK+ijDDd9kCWrZH5oxCkg
         AZQnDeL1uXKTr5/+XQTHFlaertLcBZxi+vtLPxYu/9iUaG+3ekU52k1KPk3PI/IKUq
         TRIB6hWqZgSZDKWKAdYHfq89hLZ9A4SrtG+CtV9I5SWA16iup2DPMHV06fLl4Nium/
         GTc5bHfJthhS4YB+ytMoRhcAnRlpe5TmjalIkl+6HUfgjWUEYPHqFmAv3B/7OiRQyF
         TczUjKTSIA8+A==
From:   Arvid Norlander <lkml@vorpal.se>
To:     platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>, linux-hwmon@vger.kernel.org,
        Arvid Norlander <lkml@vorpal.se>
Subject: [PATCH v3 0/2] platform/x86: toshiba_acpi: HWMON Fan RPM support
Date:   Fri,  2 Sep 2022 19:40:16 +0200
Message-Id: <20220902174018.1720029-1-lkml@vorpal.se>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

Lets hope for third time being the charm!

Changelog
=========
v2: Fixed feedback on usage of HWMON interfaces in patch 2.
v3: Fixed #ifdef handling in patch 2.

Fan
===

Currently /sys/bus/acpi/devices/TOS6208:00/fan allows controlling the fan
by writing 0 (off) or 1 (on at low speed). However when reading I have
observed values up to 64 (fan at full speed during prime95 stress test).

Removing the check for "zero or one" shows that on the Z830 at least 64
levels do indeed seem possible. In fact higher values can be written.

But anything above ~50 seems to max out the RPM.

I don't know how to detect the supported range, so I have not created a
patch for this. Advice is welcome.


Fan RPM
=======

There is a way to read Fan RPM:

#define HCI_FAN_RPM 0x45

This one is weird. On windows I have observed the cooling self test program
(which supposedly verifies that the cooling is working correctly) calling
this a few different ways. Here is a summary of what I managed to figure
out:

HCI_SET, 0x45, 0, 1, 0, 0: This sets the fan to run at max speed, but it
will not be visible when reading /sys/bus/acpi/devices/TOS6208:00/fan.
I will refer to this operation as "set-max-fan" below.

The only way I found to stop it running at max RPM is to use HCI_FAN
(e.g. 0 > /sys/bus/acpi/devices/TOS6208:00/fan or call the ACPI method
directly).

However the get method is more interesting:

HCI_GET, 0x45, 0, 1, 0, 0 returns: {0x0, 0x45, fan_rpm, 0x1db0, 0x0, 0x0}

I believe fan_rpm is accurate, without any scaling factors needed:
* It behaves properly (higher value when fan is louder/faster/higher
  pitched, 0 when fan is off).
* It matches the value range reported by HwInfo64 on Windows (which seems
  to be able to read this, I have not looked into how it does that).
* Unfortunately there is no tool by Toshiba that exposes the numerical
  value that I can find (that would have been ideal). Nor is it shown in
  BIOS. The Windows tools "Toshiba PC Health Monitor" reports everything in
  percentages. Yes even the temperatures!
* It is definitely a loud and whiny fan, even by laptop standards, so the
  high reported RPM range of 3540-7600 RPM could make sense. Though it did
  seem a bit high.
* Finally, to be sure, I borrowed a tachometer from work. Yes, the fan
  really spins that fast. Byt it is only 30 mm, so I guess that makes
  sense.

HCI_GET 0x45, 0, 0, 0, 0 returns: {0x0, 0x45, fan_rpm, 0x0, 0x0, 0x0}

The Windows software does *not* use this variant as far as I have observed.
It appears to work the same except that it doesn't return 0x1db0 in index 3.

I'm not sure, but I strongly suspect 0x1db0 could be the max RPM (7600).
The most I have observed when using "set-max-fan" is 0x1da6 (7590 RPM),
which is very close. Note that this is significantly more than I can get
using just HCI_FAN, which seems to max out at 0x17ac (6060 RPM).


Patches
=======

I'm not personally particularly interested in user space control of fan
speed, plus the fact that there is a way to make the fan go faster than
the *other* max speed makes me wonder about the safety of running the fan
at that speed for prolonged periods of time. Thus, I have only added a
read-only hwmon interface for reading the fan RPM.

I elected to use the same call that the Windows code does, which fetches
what I believe is the max RPM. I think it is safer to stay as close as
possible to that code. However I don't currently make use of this value,
suggestions for where to use it are welcome.

Note! I assume that if the FAN RPM call do not result in an error, that
it is in fact supported. This may not be true. I would welcome testing by
anyone who owns a Toshiba laptop!

Best regards,
Arvid Norlander

Arvid Norlander (2):
  platform/x86: toshiba_acpi: Add fan RPM reading (internals)
  platform/x86: toshiba_acpi: Add fan RPM reading (hwmon interface)

 drivers/platform/x86/Kconfig        |   1 +
 drivers/platform/x86/toshiba_acpi.c | 100 ++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)


base-commit: b90cb1053190353cc30f0fef0ef1f378ccc063c5
-- 
2.37.3

