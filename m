Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869A7C6FA82
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Sep 2022 21:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233114AbiIAV6k (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Sep 2022 17:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233034AbiIAV6h (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Sep 2022 17:58:37 -0400
Received: from vorpal.se (vorpal.se [151.236.221.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C5A179636;
        Thu,  1 Sep 2022 14:58:34 -0700 (PDT)
Received: by vorpal.se (Postfix) with ESMTPSA id 2999F142D4;
        Thu,  1 Sep 2022 21:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
        t=1662069513; bh=gNrPW0U1FSW58IPsYgYMKepiEb2EP4cQVpEuA1Qo2zo=;
        h=From:To:Cc:Subject:Date:From;
        b=OG45IhxgYcpVlsn6PheI8Prel5lw5v75tDT4/eK5jIzUzTbgC+KxsxFXXiVwwrkX0
         9VW6igeQdw+BY3kB8DbTq845NCcaa0ClEiiCQp7U183lSDQmzEumwrJe975Zni+3O7
         uSSsRvzS/PPp4ehkmUJSw2fCIsMk0+NkVM6+rclsy91K81CUILPooAEHLCIWQ/2KrM
         uKuwZDi0HhSSE3LOAsoZRSBn/0QzLAd8n9+oVyqjALxjaPHRTzOW9Nn9E//hQMQPkr
         bGWLcxRj1kE7EGxSIQHgfaTVJ50dH3vMnZF48wB3wVJCxFtTdVr+4GlfIoKha5DmoC
         GYSKawN3+rOuQ==
From:   Arvid Norlander <lkml@vorpal.se>
To:     platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>, linux-hwmon@vger.kernel.org,
        Arvid Norlander <lkml@vorpal.se>
Subject: [PATCH v2 0/2] platform/x86: toshiba_acpi: HWMON Fan RPM support
Date:   Thu,  1 Sep 2022 23:58:17 +0200
Message-Id: <20220901215819.1608723-1-lkml@vorpal.se>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Changelog
=========
v2: Fixed feedback on usage of HWMON interfaces in patch 2.

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


Arvid Norlander (2):
  platform/x86: toshiba_acpi: Add fan RPM reading (internals)
  platform/x86: toshiba_acpi: Add fan RPM reading (hwmon interface)

 drivers/platform/x86/Kconfig        |   1 +
 drivers/platform/x86/toshiba_acpi.c | 102 ++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)


base-commit: b90cb1053190353cc30f0fef0ef1f378ccc063c5
-- 
2.37.3

