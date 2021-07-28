Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD2CC4338F
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 20:52:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9416D6023D
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 20:52:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbhG1UwH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 16:52:07 -0400
Received: from mout.gmx.net ([212.227.17.20]:56511 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231697AbhG1UwG (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 16:52:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627505507;
        bh=1Go/ZObbJjxOggfYfM18fsoxrqGDVNO6oBRZBx3brt8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=e6pkWcAb1sj3ewNS6V58TvoNeA+ruXI6aaFIgpdJ0PGyAnVgbMhHJ0/tFy7/UsUcp
         pFnkRCmya3/blQMDrU3qccMQTyuxmGtssh0QA7zl8J38MJR/oDUHkyO8Cjh9eK2ptG
         oHNtuKLUW9cLaiXoSfaQ4OrLmNKfvcGH85Yj0sjs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.190.212]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mj8qj-1mn9Us1hC9-00fEQi; Wed, 28 Jul 2021 22:51:47 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v6 0/6] hwmon: (dell-smm-hwmon) Convert to new hwmon registration api
Date:   Wed, 28 Jul 2021 22:51:36 +0200
Message-Id: <20210728205142.8959-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+LGzEG5mKZ+WepfveZe1x+luLSqi+9oBqrTA7/+v734q2DBbgb9
 G4xPZ2PvSh6cmyPdubdj7u7vP3yjZrmA4Po2lfGmQiNJ6Gdsc492eyshLMMz/62wEq68Bvp
 frt62G9oAE4NitwQl9FMTz+HN2NfIRgfDsVqkOR4TAWBqLUg4WPj+jskKYT7kwRlDDdMucQ
 0feoFtYY6q2H4MrTvYdPA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uY1E/1Ep2Uk=:1smJ46F6SBVw88ZfAbC+6S
 ZJCC8OUxF3WssTYI9pzyxfpb7O1oGUnF9axGOS1lWsLBpOqTF7rFdXDNhofKTj/jKsCUFtGbR
 Be4/Zd1yBORX/EyrUFwys+6RO8qdLTfmAEM+71tGJOl2z7LSGE7nwHkAwVUNItvtGqDwbhYpT
 8gNWogzimkKaUkz3foSjhoxbbZ8xb1HD99QZeqXTjSZ6ivYtlAiXaiOGoxf3lrSZRK6biL6BB
 oJo9b31xeOAiVhP4eBOjXwA2XmFtyuoIHuEbDNZzMuvbyz+8OQtVFdV8StKOd/Jb/s914CTG1
 ti4HV8G4tKOsvPO74nc3lzd/sv2eQnrJD7Bc3X4667FF27hT6x2YxFwiAub8f/GlAD+l+pBPr
 8IflZd9Q/o4v0JUreXbz5DNTgMnwSCP+3IvwT4XLio8bJkmkI3dRu8kykPBBWjNhdGJe5xZ5k
 eTs1B5raVp//5y9P75lxReWOY3etegzmsGlKdcROujtAhYaXmOkcz5omXvlQEfg6UGpOKPPPn
 ruX5+5tzIOML71UksXEP4ik42dfKnIHSxlwsb17zpdsywqjAM9GKYRgcXr8Y4p+l68zJnB6kW
 5o4Y+esVuu2DscbFevOiyt0My3XFrF8L+XPQBrYgzDNpbrIah0OcpHEi/6fj5sQkRPSeLYTK3
 nU6fgpdPZbcVRC4Z/huN2TJ5AaZyjjEwhcxsOHU1v/nLvlx9DVaQloehy+f3mw+/kb4Oqsbya
 KPQIy4CMxm22vuPJX2oxiUWw+oGGPxzd5rz8Tof+UMFHmTcEaT6SdOz06ZUUjhwljM9QPwrOa
 tYntrNUzTqxFlmhoomXncWAC440WG3BeOCwhZuU2E+l+Rm1KEyMakRYyAUbVufZZTsR0wJGE1
 kiaxXe+gXZiq/wSQDjW5UvQVkgoD++88hqS2++/e5GXnJsVScVXuSIaSfa4P+LGzrTHW6caPi
 Ww6ZQdiJZascfqL7XQsEyZAHgYQ5cJa64Zp618bIuiqky8r0QXNuJ+b1MsdJSPT8LQWlsZn9k
 e8xAlsvNhDuiFze4YBHSaAKxrkYMpz6IL2dcBA/mwICadNQy95fbIYbrpeGARZncmgAY8fwYq
 DAVWs235Wop7dWTJeALZLWX4Bvj81SMidSj
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

Changes in v6:
- Make pwm1_enable permissions write-only
- Do not test fan speed in dell_smm_is_visible()

Changes in v5:
- Fix checkpatch warning after patch 5/6
- Hide fanX_label if fan type calls are disallowed

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

 drivers/hwmon/dell-smm-hwmon.c | 847 ++++++++++++++++-----------------
 1 file changed, 419 insertions(+), 428 deletions(-)

=2D-
2.20.1

