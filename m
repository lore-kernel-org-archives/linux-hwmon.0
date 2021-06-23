Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04700C48BC2
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Jun 2021 21:21:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D84976128C
	for <linux-hwmon@archiver.kernel.org>; Wed, 23 Jun 2021 21:21:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhFWVXc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 23 Jun 2021 17:23:32 -0400
Received: from mout.gmx.net ([212.227.17.21]:46595 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229688AbhFWVXb (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 23 Jun 2021 17:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1624483249;
        bh=avI25Ip/3T0h3kgU/y1mydqeWiW1WUv/QS8mQCjAsGk=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=M1OEzu6pjLtJhDj0VXSksnFq+SiBngq1JPGdDo57WNTUk+Aqrvna6GahcoB0qvQu1
         kg6ahKOwe0H4GfcZsVuOxRr/1cVhGyyHZwVFwotjaxU14+dqbaJAkgrf3PMkwoiPIj
         g5SK1nj34ve6byDbRhluwJXTEvZ0duEIi2L6cQJo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.184.178]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MEV3C-1m2Cy313wg-00FzfH; Wed, 23 Jun 2021 23:20:49 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v5 0/6] hwmon: (dell-smm-hwmon) Convert to new hwmon registration api
Date:   Wed, 23 Jun 2021 23:20:20 +0200
Message-Id: <20210623212026.30799-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2wR2pWOAuIlZSDCr/VflNwp0mihuCu89ipTG+LRADmSejzxy3/a
 iLMtgXypyZB0G8TPfg4ZFT4pREuqVZ6DQmxHZjqIXFFH/vdsP4ffNv4jNOpu/UjKE5mTiPR
 rs1fpXMtGmjzvUgIyIfEoXez4tYGDpwXVexABpn+stH3YiGGeI35rBTrWvhSuwiNr1oPxkc
 Q9aSZNdGcVmFRqou3VtEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ajNt19Q/V7Y=:C57L6yhf4iDnHQmGv5uuBf
 vYRM565QxPdsLTqAB48OfIvoNaSiARoGzYqhxF8HL2k15H3osteAlo0qv9zd8NLoWEu5pDxpG
 pVBls3WpcYRlitrc5EfZdltTprjP1wjpshJj3v7hM1cpuWEBUAD5ilFxDtIx0izO9kJQSzIR8
 GsxObUoW72zJTrTQ8+tif9OQKKZx5xtnW2+SwvPsKtjZEMi68Qvh4I86Q4vSNsofg05rmp3fI
 yh/YsbfszLa7M3rzgNlIYfKmcFd112+a3z1XUcoHTIqTqL3yyb3IxUkiQlnnu9Mm5cPp5DBFN
 dZVJB6gHssFczJdSEYK+KwaZPn85DdTadkx39PQF6qEXmRdN7EvieLmyyWLFoSKT1DATwLk2T
 f7sihQ96UuxbYCEPjAQ3GMJxVCLdN74UQBB9a4jISY8DVtlqVgunMg3AIdWpsdtmZ5Rf2d82I
 CIRX/K7kR8s9dDwzZsYquwHK2jnr8TeEYSytKtWFhHbqblrILSGU9gW9dimZlL0JhwbbeKCUE
 vuWLN6cKw4lKVVmqrjH9abKF2bU7oHRECcoo6MdbxsghVPV8icp274CsRAVQZSZJUZ/h6MGD6
 ZJsN2dbu2GnhZfM0TR0pyCZV2HN0M3CtaUloOEUPQs2FcVXb6buPqnbfQd2xt+OYzv433VNhz
 E7NsMJSEFzQT4UsIW1SD5wbKeWSFWvm7XuXMBeyU3QpeeRNb7xB3MKZz9ttalbt86h7GrJfaz
 mhZ3Qvhx6hL4/ppYQLwqYsPnHu7SzmacK54xutQa9JYEtxmpJu9Vn4V0YfuKl4dZQxrQGn/hx
 yIorlOUgGcLv1zoH35Xmxznyk1R7MF1lwT1l/mQMOnu6pVJ06C9KnMpO+XEAHzoVGE1iTih/u
 1u34JupISb+DhIeA8/1Glbj8G0Sgj6FEvB4L2k8+qHLUNyfDySQep2CRdVBvy5Yan12Uv6l3T
 HppGUpEn4KvbPpm3SUynInKhRu+Rze+5zeY/qmr53dRMTuqjQsuVeMLQVjoLOkHl1A0lMrZsG
 r8kwCNBavUPBwX/zrBBwY+OJ4nkU2lhCw5GdadzKDIPfxZX/OHTnv4nGU6SLDVyHK4W8lUlM1
 vh1/d3sCVpM3x9dqCgI3VftwWXj6NJG4qel
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

