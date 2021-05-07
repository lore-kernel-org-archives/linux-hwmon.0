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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA6DC433ED
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 21:24:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74176613ED
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 21:24:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbhEGVZf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 May 2021 17:25:35 -0400
Received: from mout.gmx.net ([212.227.15.18]:40087 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229482AbhEGVZe (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 7 May 2021 17:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620422658;
        bh=mnTRkffOdwUO2jthGy+op7tnc959UWPmk51qJ3JHpX4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=B5hmllqpACN8McYJoT8dYRaM0Sn33VuSGC4w7Db08xIslTYMx92aCqiffoJpnpbjH
         NpZrinxDt1p/De3NgiJLYFThaBGN+NvPLPnqXxQ7yvoWWPlsunCbaan26gF/8ten1Y
         pVCM4DTMuejw/oDn+sfC5ds3MTLOsCx/KRujwXLw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.209.175]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MirjS-1l0HQs0CQO-00eqcV; Fri, 07 May 2021 23:24:18 +0200
From:   W_Armin@gmx.de
To:     hdegoede@redhat.com
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
Subject: [PATCH 0/4] hwmon: (sch56xx) Use devres for watchdog and platform_device_register_simple()
Date:   Fri,  7 May 2021 23:24:00 +0200
Message-Id: <20210507212404.6781-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NuhC384WECYvOmPYwq5mtkBbXvoh+HEcsO02+Oo9Fr+FMePtz/Y
 8WFpj0nCAwUOI38LL1Ou6BxH+quATjlIOSP6SiKqM/C7TNdJzv1mx2VdZfNqJpimZiIBPVU
 3r1cr0aRgFsizWlz7fqZVi5K3QW4bExlp4aIVNt7obLLwbjVppUfqqInGSUfTgeFL5JbGxO
 20WOpMM79wB6ewQp6MP0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wbaMaxw9WAA=:co98A2ORHM2j8fFsGFRQjm
 j2+nOIb6ryZYPP6xqfa4y+XGHTfTQHxl/ahjW2FkgDR4CEe+YDlMienUskpaehQp6zwbDx8jo
 T0ulW4jENHQCln7ph8nDRKniLTDdrpAH4CzU1+3hrXL8eGqIN4+7/rwXp6Ljq6TnQ+qFJy0mg
 dOAhh2ZsygsKnP6s9WH8CD7dzmA4bc2uEtyr4/x+y83XheMwWI3Xz/X17Wv3v2bJ4lavAqzyv
 2/Okm9L7YWhVj+FULKlPoLiTcdO9IBI/gm3++CfNzJw6zXMI3ERGCuAZq9z9PFbxCh38Fjx1b
 KwO44jKUS6fMeCvrvQASS4FklEN4yt1NI85+RDYW++i+vZ9DC1qQLeeqgoTTfEwHkfkmCXRTL
 lV2+jGddon5hkopvphEQ/Y/60MBb6M65H4paNeb9v44c/bZjpKWm5a33UYaeTro61drQahCtJ
 SGa8GA5lxywLqwxmR1Ee4/MT0KyrfsQbLZ64v0eIQVckDbL/q7f0OhhgRnGFcvi/tqMeWxqVJ
 diSAdEVVIklLLrgbNgbq5xHWfol3C76lW00gM7EsRm33vTpOKCA5r0ALZy3MNPmJQ8w/5E/QD
 wMLb39kmXlzDmAn8qzBOOBE5/zWFs+3m2DDkTxE2KEIyp/I1endxJTMyt5iT4uwQmdJpngjxi
 3UoiuFCZOL9dUmKwmw/EJB1Lmh/FCWcsDCZ8bUUWLVcoXfJgDJVeGsXUJVgiOjk6JSVcxVHcw
 OHYY4O6id250135tqbNlQ169CUe1S1DPuXu8RX9rJgXUwfB43bNjpoJqpGQgQOYr83LZ5zKeT
 jwKYJSilDHkYOvFZi+SIYhdFIDJVMSqk6owNip0OVv/b1WGTWrv51KvSjiZ+rNCrDKFShY3bJ
 x+BEa0WM6GwESBCX5hbAoC3QmA35p3HYDzz4NOUA25I4vWoFggBq9cvPRRT6lmkG+rldImd+Y
 UQiNBeOnmLP+kIZQocscxJVhKISn+kN/j20oQ4feN+qx8D5kYXj/ft7M04Qd3U66HAb7m69n9
 o1/owMqTpFKRUnZbvRGPOUBqOKi7HHffApuUgj/MG3VFbJk9IboMTc5s4017VjEDskcD99Cvm
 bianblkkae76W7iTfN3d69x8ixCqCnLwtA53L+aux11TfI9jif86F9yGjMCzz0TqrxuZv+LYp
 9PYZAyPBqnWOip036jVIN+xl2KnyYiO94d9eS2NflKpj0yKaAj79pF6XRljOzRB7frCD0=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Since it was requested to use devres for the watchdog device,
use devm_watchdog_register() for watchdog registration and do
some small cleanups.

Also use platform_device_register_simple() in sch56xx_device_add().

Tested on a Fujitsu Esprimo P720.

Armin Wolf (4):
  hwmon: (sch56xx) Use devres functions for watchdog
  hwmon: (sch56xx-common) Use strscpy
  hwmon: (sch56xx-common) Use helper function
  hwmon: (sch56xx-common) Simplify sch56xx_device_add

 drivers/hwmon/sch5627.c        | 12 ++------
 drivers/hwmon/sch5636.c        |  9 ++----
 drivers/hwmon/sch56xx-common.c | 50 ++++++++--------------------------
 3 files changed, 16 insertions(+), 55 deletions(-)

=2D-
2.20.1

