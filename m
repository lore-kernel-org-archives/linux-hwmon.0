Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BB3C4743E
	for <linux-hwmon@archiver.kernel.org>; Sun,  6 Jun 2021 19:18:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F32186124B
	for <linux-hwmon@archiver.kernel.org>; Sun,  6 Jun 2021 19:18:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbhFFTTt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 6 Jun 2021 15:19:49 -0400
Received: from mout.gmx.net ([212.227.17.21]:37631 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230251AbhFFTTV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 6 Jun 2021 15:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1623007030;
        bh=g/CNk6tfaV5TNse14DFmMzoJ4bXvH/VQV0v91eB/B3A=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=GfrgxlT7GhmDEZkVasDjyrE8dwgAY24oToBIaivVxH9lfwgtbjMrQcTzpt6C1K8zo
         g7UrGb3VFMDTQuWkmB9+bq/LRP21139JexNTr9vGG/IuGPcwLtd+myGcPoThi+epjn
         6k9EFn40+6JC7+8GIM0kRRK7vKXbvXVzZnSPiAso=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.217.164]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M4JmT-1lph9b0QEr-000IGF; Sun, 06 Jun 2021 21:17:10 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v4 0/6] hwmon: (dell-smm-hwmon) Convert to new hwmon registration api
Date:   Sun,  6 Jun 2021 21:16:24 +0200
Message-Id: <20210606191629.32245-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:G+rEJkh3jxKNaJVFz8oXndU3+okmktjuiYVji3GF4E0TziRRLgd
 1VtCw/vUVpnv6mSfJREIXa1SIiiMlx7+AZnIteWf8GU28q1UlaHWaqszPU2PQYBjmWtbenY
 lZjcDVH8Q0SEkX6oqY3r4f9fu4yPZx9YPXUfPtjb1PEG9Q/nmPCFAZ99ITOfH6R8xoDl2FE
 RiIoIu24T+RVcu+5RqEdg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FD1Cu0d7U/Q=:OBMO+zu21Ds5JbbjEr/4Vq
 2AGY5E12voxy2KKElovvGhxgs8ge/eIWzvQoXe5vSFnRsK9fNudO6auS12fW9zUHevI31rVP5
 th6g33CAE6kFE9O0ryENhGvN3l9W0IS6He3QqraujocO8NJISaVYRBwIOeYsveX1yu75cjVvZ
 TMvXbmUxlM0qUpqclsil9bxmFwlrvGSaDZlOMUT64RSsXXXTgiipbffTZqCSqka9/zjy4/i9G
 s3aMd8nZfPOvkpSuh9zF9xCuJZ8sDxsLpYhjPPrXkhdjLzDu6YJKRQNUFb7JWeXmVQC3zT2gv
 uU79Dbq7z3xZWZBJ399anHcCTvH+oFtkYkCI0Db37yWCbr0HctQkoP1hd20vF8krOzuGulpCk
 2A8bC/mFJs72ftCdhIkxgMx8I70GtuBlhRehhBLUcOJy1ZFw8FQAVaytJFYkRpuHyywa/g5eI
 f4fD6fJvdmdx2nKe+wJxkJM0H8p4e6xSQlPhicdSzRcbSQxboaTDM+u8bKCHN7sWcSXJZHVMM
 RcjA+DnnPw/mTF3QZXw+su8AoxtA1af4k0WSN9j7iO43zqF/a3QaM7qWOFVK6BHlm2Evw4nmV
 VEYqRZZQj1BCCWXXa+fbcb3XV25zMljN17fXp+cS8oEaASSPoVp2I9uWdC/1I2/whAyK0/aMU
 2pNKQOFbHjDD8ugJW5krFUjz8k7acIVmovWVm+eupAkhwwygzS+V9ErKrhSvlab3lFBJwmOqZ
 U3lwodiZqzLXQIuOVz78tXFo052OEeD/7RP4QLAU1q4kGwnkwREXEBbTcj+Gwmz1S1xysdIKd
 wdC4+fyXBS2cA6hpe5stmMcigkM/kHbnc4c9S/Xbji5TzkjxghyhdsTVu8dJCv9T/3lAjwPbR
 jp6rIYCM1HbEiU/b4slxrsSWojRAz3pFCWC3X0G2Paa2gGz1rBQbayZdMu+bfpqu+7I6dmF8m
 y+F+BiYfxSzhiq+A3nJcMCe0AR13Glg5ghWIqN1ZPRstTuDX5CGq5+xks1cEvtEdPWiZdNPJj
 OsUa5ixk733kJkRYqlM5vrnfRbTp1HM0FWkZBgqY4aPSNa6rPcC3gu5FoQT2TNktqhqqzqUY6
 lo406/qNFeoLpKpcyBPue4PNXR5tPd50w0M
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

This patch series is converting the dell-smm-hwmon driver
to the new hwmon registration API. In order to do so,
it introduces a platform device in the first patch, and
applies some optimisations in the next three patches.
The switch to the new hwmon registration API is done in
the next patch. The last patch is fixing a small bug.

The caching of the fan/temp values was modified to better fit
the new hwmon API.

The patches work fine for my Dell Latitude C600, but i whould
appreciate someone testing the code on another model too.

Changes in v4:
- Make fan detection behave like before patch 5/6
- Update coverletter title

Changes in v3:
- Update description of patch 1/6 and remove empty change
- Let pwm1_enable remain write-only
- Include a small bugfix

Changes in v2:
- Fix coverletter title
- Update docs regarding pwm1_enable

Armin Wolf (6):
  hwmon: (dell-smm-hwmon) Use platform device
  hwmon: (dell-smm-hwmon) Mark functions as __init
  hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
  hwmon: (dell-smm-hwmon) Move variables into a driver private data
    structure
  hwmon: (dell-smm-hwmon) Convert to
    devm_hwmon_device_register_with_info()
  hwmon: (dell-smm-hwmon) Fix fan mutliplier detection for 3rd fan

 drivers/hwmon/dell-smm-hwmon.c | 846 ++++++++++++++++-----------------
 1 file changed, 419 insertions(+), 427 deletions(-)

=2D-
2.20.1

