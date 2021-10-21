Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA293C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 17:55:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A007661390
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 17:55:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbhJUR5g (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 13:57:36 -0400
Received: from mout.gmx.net ([212.227.15.18]:46289 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231396AbhJUR5f (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 13:57:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634838900;
        bh=PGsDd7h3MaxU0H5Q36R2xM0srHkwlLdDk4O8le3zKrs=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=g69psvcoxcCqISlS9mrdt5QkRNGAcFkGqMy8VepipVvYgX/uvpu1Ccia5OjIY3KJP
         McmfzLRC7auLMAr5cJ7hWFMR46vFzgFLXMpOUv5oN0X7eEXNM6SrM1b52roS+ZRKeB
         ceWtfF/X/iPX7T/oRQL9nI+d+Q/CzDZAmv11En5I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MyKDe-1mu3lQ1rbQ-00yhzJ; Thu, 21 Oct 2021 19:55:00 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 0/5] hwmon: (dell-smm) Miscellaneous Improvments
Date:   Thu, 21 Oct 2021 19:54:42 +0200
Message-Id: <20211021175447.5380-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AfQ8+IaRDsB53tg3HJGP3V7Aq4fYoH9K7JosDttr6EQpvMHOcf0
 ylKFh7oVTMrtdI2LqV3i8d29n92urk7JFzRiYskxBcRwB1gQ06DxnwNRD1N1DeYPHg9SQ69
 QoAw/j5wOjBHZ1U4z49tg9NVoYWBgkKoZn9nJblccpggt4zxQ67cNGlx8HjdMPcKWIHH/GM
 ER4A+ymaORzwgG8rGvu/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lM3Wrsztabo=:DVuJlc4ONYRKiOjziBYJVY
 7FYQVLli6Jq/7PGjHd9nkSQMqGAb95P5gwyu5JMHd4gCd8UXwrxiZCBhvLHiVOUvy9dsT/fDF
 jmyn/sMFFnAywrsUvcE3aG6UYJydrI/AeMGxQZgsyXZ/clOkthyQ4o2J9p/aAmgAQdYfmWDvN
 Z4IKPJKAw83LF0N8lwS76umXtOrjoVBmKInhdrhC9fsFZpwj2vmX3ou2afeDk4/fMBFc4r/JA
 1JqQIZOJ9oEt+QRfhIsyNcfYT4ujpLpndk6+uKXlNyoiBAKY+jZwIkNPyeeXoMfWKRtcCMeVr
 j0+x/XFBJcTgBUv4/Q0eQiIp1x9nCsV82JSCatYm8/WBkReZbiH1P8mNovr1FGBYlysTfiR3X
 Y3X47uKSfC7JE5HKnvSpAIirkO/ipo831AYKEmuGFoNTArcGqbzGn6DzIHMlFJrWtDCUvv166
 puNvMuLHNLADiFE+h1JKCnViBUrdLRViGmnXm23pafxWs6ya4LifblQ3Rm8/qUnrkFCgs6pqX
 HV5fLcISFqfyro1quG/h7wAAM+OMK8v4IVLg3si5wBGObjZRoX3SRIQTljMGGyWsAXF+L93Fn
 AwCnmigrb6q2BJ4MWNaMMnbtmCtIKyYYeb9uvNYY0zrSXUvz+oExBqOuY06cV3zIaPcQnZxHm
 +Dz2ydOhv/lCzAihiIog9M3TBY/ecmTfW32IZUzy4gr+mlQchD98AEPb6BbMZEEMJYeBXqS2Q
 sztsCjVxfjQLnY1BKPDDRCeqo+1YkFVgMSv5a+B0kR+avsMbVOTy8v1gHyuW6C2GvFTL3xSg/
 jIqminZuk1sAbmIxVoyKHQ65R/8+C4PNw5dKbF7N4g0l13QE+6r07y1/iHM7LAHti3VuQtdo8
 /OZbFT7cAXTus/GEOB6AzyN0ECz7VgAvxIZVBILurKQfQ41I64c9GOanaIZTSLIROMREJOKLM
 24xlUQbrtGUXLAgc3uEDCSXoU2cxz1WC5XxH3Q8rJg0K37yYtQjcTzx/LSGwzeyordvkShYVB
 LhclCq6Qr9kmRBZzg2Xz7lcrwhLWZ+zM3WoD19Thi09f7Rui5RqtrQ9NagRU6+p2MIch7+56H
 QVvF0TlXiO9utE=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

This patch series contains various improvments to the
dell-smm-hwmon driver. The first patch is merely a cosmetic
change. The next two patches improve the ioctl handling
and have been tested with i8kutils (the only program using
this interface). The fourth patch adds some config data
for the Inspiron 3505, which has been verified with the
fan data displayed by the Dell UEFI Diag ROM. The last patch
accelerates the setting of fan speed and has been tested as well
over the legacy interface and the hwmon sysfs interface.

Tested on a Dell Inspiron 3505, the Dell Latitude C600 is
currently out-of-service.

Armin Wolf (5):
  hwmon: (dell-smm) Sort includes in alphabetical order
  hwmon: (dell-smm) Use strscpy_pad()
  hwmon: (dell-smm) Return -ENOIOCTLCMD instead of -EINVAL
  hwmon: (dell-smm) Add Dell Inspiron 3505 config data
  hwmon: (dell-smm) Speed up setting of fan speed

 drivers/hwmon/dell-smm-hwmon.c | 48 +++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 15 deletions(-)

=2D-
2.20.1

