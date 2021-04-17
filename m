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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CDBC43460
	for <linux-hwmon@archiver.kernel.org>; Sat, 17 Apr 2021 21:09:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D26A261248
	for <linux-hwmon@archiver.kernel.org>; Sat, 17 Apr 2021 21:09:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbhDQVKZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 17 Apr 2021 17:10:25 -0400
Received: from mout.gmx.net ([212.227.15.15]:47403 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237013AbhDQVKY (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 17 Apr 2021 17:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1618693777;
        bh=ojGOTwiZ0TAqFyV94PloAmr0A5htvtdqD89L/ZaTIC4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=NJ367+l7wWmhZmPiU/MTg1WOeWqjNCJy1ojPnWUsX8AvWx5ykpcaHHIN4VyXe3T04
         4inRW6cAPmfNMRq4yJLDHu3m9ti/eJy73zaGt2bN07rNRmSAhfrclKU+oNr38kyymj
         N1VYJ0u6S+DJEu6xF63ZvaKVwdGwwOOzKgR3YxQQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.212.143]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M2wL0-1lWlCe3VyW-003Pum; Sat, 17 Apr 2021 23:09:36 +0200
From:   W_Armin@gmx.de
To:     hdegoede@redhat.com
Cc:     jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org
Subject: [PATCH 0/2] hwmon: (sch5627) Use devres function
Date:   Sat, 17 Apr 2021 23:09:18 +0200
Message-Id: <20210417210920.15496-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qXiDdRLcVazLeBsk//kOnIA4JJ+7orW9mzxIxc6m2rTjGWgsSzX
 wA0RAMveKsqXLm/gfScJ/w01AFvJbM5/U+BC9BD/XQTNpLgZZ+Yt1Ujb9R/SsMqaAdsHGXX
 f8DtKB1p4wjEjB6itw9O2cCzHKoTTWTqZlLTIsKRhdM3RpJLIVqC2dqrzHYWMLI+fnIad8Z
 ALR2OqtgjkROAP+oPVLqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6AqpbzXXSMs=:rT5pKasQ2RFWgX7pDpAG4W
 hJseA07FPQzMLzHndDfxdR7BrYiILB+ZsGc8u9LHm7C1ZBYCobWWX1Nt4Reqbo4xjnWRdB3I2
 RHAjZqsKLOKa2NIYlbmnR1X0iolURxiFqZBMUJjk3HUOfG/qX231PEcTuEq78Ns92+8cL58pa
 BBc8hi007OyqBdMOeb3qWMatziAFtBIro46/7QOb+Jld8+RmCsbXRiGbd9pHQMWLMUIZjlJcj
 uhX0gvceR61W3xcCjZepX1K6pyAcVE6VjcFGSI4vlvo8JZ6TW16JJBO1bfQslW4b/GbWoMEQe
 NO+XwdwB3u6dS23nkfK0O4bkgfeqvfrrDHDEFI9DSknWJHqCGdH3rup2OYIeKevIXC9ZlVm3b
 WrVmBFPaQ94m3BpQcs6QB/lr+SgnfYWNCIckaic3RESAZxnNfCnkJqt8Tx22oJP/ZTj87zrkX
 PSyzKIQlrWBq4dTy8nhD1flP2qrK8Bo8Dazu8wh3rA6kYH91MlrTPi8rxIIkjLcc6qdW5Dy6b
 c+tGTp82mH+r857HqCdzRgHMj/FZyQnZcfVCOYyZgtm5r+o6UQphOseFqXti/mmZJ3AvB61m4
 +J0el5fPGPXql0+9AxdzJRCoqfsU4x/bhrsSg1OVIS0JJwmwjNumoh0bRlARMZPgDqUdscBWR
 ZFplWuNc3dBZ5ycjVkh9N2lLIQREq/rJJWsE/cOIls940I1nj3HMmQpslFmcrOhs6WhoPC6zL
 htwv/I9i7wYOR1FtDUMDG6u8+V3jxlLsXlhDx5YYL2AdVfVjeKq+Xi7/gmmPKlGco/nqlzQ4G
 g6jRZ3rzRxMwx/Ka1NWaZLYvpjN5zQsU50cC5xPedO7KQoI4HkHpX4rs/63zXBqtmCcdvX0Lk
 wgnWYNdDhev1CBz+vmO8dNkdNo0mZTiHiKqRDWfCVpzr/WATx/kU+hZYuFD1g4g+F5ZSl6JPZ
 ANAPaYRkKAU2BMZanuPCBneTbEYSvW2iSGeefV7IhrBdFEA/ICA/aPKpYft3gPZhkgsTb7fLp
 +Nzlp+/LWwTJo0bfWhsJ/5e4HEqYWzjjHf5i8/jnNAw7xyf3B+CXt6QxkoL4Zy6M7+q66CrqN
 pgK6KBtEzPIYlpI93H7p3qntKlL9fUgoBG10t/q41hW0A0G1QDh0ly9+vH3qA5PpHZz11Aghf
 ekhySDv+4n2q/YFd6UWNboMM77p04Ccq3Z4nBfCkczE+UxJDB8BXwi7nMEVbxfxXXAz14=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Use devm_hwmon_device_register_with_info() to simplify
the source code and remove an unnecessary error path
in sch5627_probe as it performs nothing useful when
using the devres function.

Tested on a Fujitsu Esprimo P720.

Armin Wolf (2):
  hwmon: (sch5627) Use devres function
  hwmon: (sch5627) Remove unnecessary error path

 drivers/hwmon/sch5627.c | 81 ++++++++++++++---------------------------
 1 file changed, 28 insertions(+), 53 deletions(-)

=2D-
2.20.1

