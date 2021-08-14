Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94F0C432BE
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 14:39:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE42C60F91
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 14:39:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238659AbhHNOjk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 14 Aug 2021 10:39:40 -0400
Received: from mout.gmx.net ([212.227.17.22]:35535 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238512AbhHNOjk (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 14 Aug 2021 10:39:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1628951935;
        bh=1xBScPuxLMpHg8yHzYFitOULwdqh+zZL6/YNV+2QkIE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ZteVI1DZ3igS0Ysk3GiQDkiyQG1PJOXFzHFvCtzUR/eqfQLJL4RxZwUiClE7i/7Sz
         4iVhybDUYn7fQRcj1kvZ0t+Iz/kVSMeZb16NSWwgeNHJL4Mrzq4DtxeWisItanfoX3
         mn9FAVyR7HtfND9qxGc2L2+8exJGziTlqtLSSdaU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.96.234]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3UZG-1mEMqS3HO6-000Yz2; Sat, 14
 Aug 2021 16:38:54 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 3/4] hwmon: (dell-smm) Enable automatic fan speed control for all channels
Date:   Sat, 14 Aug 2021 16:36:36 +0200
Message-Id: <20210814143637.11922-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210814143637.11922-1-W_Armin@gmx.de>
References: <20210814143637.11922-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HU1B3gE+ruc89jiEWj7mSLLn6/bbXUN+oSkVFKvTC6v9lirAgqi
 Z3MhfjSaz3oeVBFLEFeA1AGAQrIHiqHpCLmjekUxaSljjiNOMh+FHIWSJABSZ6xtycR+qlb
 Qz4Z92Ne5TPkReDov7lvjUPjjaeY1+aHQe7kGmkvghE9rmgG2ym93YVRO7F9Yfr5RnDG6R3
 4WIJec+Ik6zBRP2jPdHCA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z1DLl04rj8I=:YNL5+aoL7z7sW8+PWSmxsw
 pzZQfoHKS0RgC9SU9oUGM5R9yGgv27l5sbjB3phJxOnBUr2gJNweBHLW3/tjzamolb4hEcl2Y
 EKF8p1K9J/fsh+07uxEYy570zOuJpWf7um/n6gR6830UsXH3U0wtK5lEvJK8lunDNxQEkQOUX
 3ui4+hfDap4FuSuxg9nfm/7+yF8Zgyp+rfmKERWHErWLY5YcQp1iFh4ivnKXRgBMYZkyt6cWw
 i6ZJyNi5GD3MsoAo9kEDSmgXPntaW75SD+m1htZnpWCQZaUhd21hqhVk41SgK4vD0fxaddgCm
 QusGobRNBrbasp3zuKfEsQqdegj0zdD7+Unf7qiC8Gp0ZOdbJun9aPPWi0T+ShaCR4jesP4HT
 71/EguUIwSlzO+p34m7xcqyXLidrZcuC+HHg0+9jDFIxSsaw86ppC1+9LIzTK4CBBUgOvxXmD
 j5EbGTiAYgkpPp9CAKUJBZHBALF4eGfswTzCIqjrAXG0fHvE8Sj6eKQ96qWYO9JAiKklCuM3r
 69qh2OzMWUHJXDJxi2Jh3T0QanSxQAkcLAqXxpWfX6V05VoE0KUC2i1Zn9Ff8FKrtS05PFG8e
 lnY7X5doxw6724ZjS+Ik0/xtfOkpORyotzocNg4u+0gv6njvg+WHPF00sbq8Pj8YkWAKHqW0A
 R7ie7w3VxqVHU+y49Pm9Uj810ufA4fFJ52OXTaAF9BG45kgfRImzeC5KCbXHNhgLyH/wE/S8H
 umfBnQcXk+E5XIfDlg/BBo0wyq6SQcSxFjc/8bKUNNM5cwLEuL7wo1ZRWtuWm+PuxheTUGBpF
 isGwtPrp8/qrTAqUh00GFEwKjqOrOX5z2kXkeohd9QpOqKAct2AyBTacc2QD2Mle97WkfNPMc
 t6+dkMRXb/RgND1IZR9HmYMl4FpIxYnpXjxiYhyk9gBIpujPdkvP0yMUQoJSoJw8rlLBZDalM
 PjRq32hL4unJSIvQyLlzrXT4UjOdYB4ejLlWKuu/+FV0MbNJnlKvG1cQojyz8F1n4UATHWl4v
 K72bIkC71QcnJzb3qlayz2dtWdcosi2IMl+vUhadx1Y0QwZoUiYAfuIs1g4sLhc3qR3TeWfau
 WmjP8mFRa2+w6haemFDTH3xd6MvHwR+Jd0p
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Add automatic fan speed control for the remaining two pwm channels
since the pwmX_enable setting affects all pwm channels.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/hwmon/dell-smm-hwmon.rst | 14 +++++++-------
 drivers/hwmon/dell-smm-hwmon.c         |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/hwmon/dell-smm-hwmon.rst b/Documentation/hwmon/=
dell-smm-hwmon.rst
index 3bf77a5df995..57b30fc9d03a 100644
=2D-- a/Documentation/hwmon/dell-smm-hwmon.rst
+++ b/Documentation/hwmon/dell-smm-hwmon.rst
@@ -35,7 +35,7 @@ Name				Perm	Description
 fan[1-3]_input                  RO      Fan speed in RPM.
 fan[1-3]_label                  RO      Fan label.
 pwm[1-3]                        RW      Control the fan PWM duty-cycle.
-pwm1_enable                     WO      Enable or disable automatic BIOS =
fan
+pwm[1-3]_enable                 WO      Enable or disable automatic BIOS =
fan
                                         control (not supported on all lap=
tops,
                                         see below for details).
 temp[1-10]_input                RO      Temperature reading in milli-degr=
ees
@@ -52,13 +52,13 @@ overwritten.

 There is experimental support for disabling automatic BIOS fan
 control, at least on laptops where the corresponding SMM command is
-known, by writing the value ``1`` in the attribute ``pwm1_enable``
-(writing ``2`` enables automatic BIOS control again). Even if you have
+known, by writing the value ``1`` in the attribute ``pwm[1-3]_enable``
+(writing ``2`` enables automatic BIOS control again). If you have
 more than one fan, all of them are set to either enabled or disabled
-automatic fan control at the same time and, notwithstanding the name,
-``pwm1_enable`` sets automatic control for all fans.
+automatic fan control at the same time so ``pwm[1-3]_enable``
+sets automatic fan control for **all** fans.

-If ``pwm1_enable`` is not available, then it means that SMM codes for
+If ``pwm[1-3]_enable`` is not available, then it means that SMM codes for
 enabling and disabling automatic BIOS fan control are not whitelisted
 for your hardware. It is possible that codes that work for other
 laptops actually work for yours as well, or that you have to discover
@@ -67,7 +67,7 @@ new codes.
 Check the list ``i8k_whitelist_fan_control`` in file
 ``drivers/hwmon/dell-smm-hwmon.c`` in the kernel tree: as a first
 attempt you can try to add your machine and use an already-known code
-pair. If, after recompiling the kernel, you see that ``pwm1_enable``
+pair. If, after recompiling the kernel, you see that ``pwm[1-3]_enable``
 is present and works (i.e., you can manually control the fan speed),
 then please submit your finding as a kernel patch, so that other users
 can benefit from it. Please see
diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 3aa09c1e4b1d..0e229e3dae33 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -898,8 +898,8 @@ static const struct hwmon_channel_info *dell_smm_info[=
] =3D {
 			   ),
 	HWMON_CHANNEL_INFO(pwm,
 			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
-			   HWMON_PWM_INPUT,
-			   HWMON_PWM_INPUT
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+			   HWMON_PWM_INPUT | HWMON_PWM_ENABLE
 			   ),
 	NULL
 };
=2D-
2.20.1

