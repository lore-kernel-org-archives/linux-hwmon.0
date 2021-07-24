Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF36CC4338F
	for <linux-hwmon@archiver.kernel.org>; Sat, 24 Jul 2021 15:48:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B19A860E8E
	for <linux-hwmon@archiver.kernel.org>; Sat, 24 Jul 2021 15:48:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbhGXPIS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 24 Jul 2021 11:08:18 -0400
Received: from mout.gmx.net ([212.227.17.22]:43233 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229545AbhGXPIS (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 24 Jul 2021 11:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627141715;
        bh=rdiEGAiCxODFyndwGnt071tqh3DLNwLoJ4wo1Hk+vkg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=MzwUaGZm1k4nCi266ElmRhyVysufwWvDEWeD/HtwdjpMdB33tX8BlFLMjz40Ans3L
         C2LHmSUupde1mR+E1rDlb6eIwkBnyk8uFBIOW8/icbZEethon3mMTllh9pMdWbjHgv
         t6DBSci2XElmHLUMX+An1UlWQJB/s2x2VGM4MLAI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.103.117]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXp5Q-1lZF9D1Tjg-00Y9T0; Sat, 24
 Jul 2021 17:48:35 +0200
From:   W_Armin@gmx.de
To:     linux@roeck-us.net
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (w83627ehf) Make DEVICE_ATTR_RO static
Date:   Sat, 24 Jul 2021 17:48:17 +0200
Message-Id: <20210724154817.18796-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZsG0fMJG+hStbfV5g9W559/+NtCK04VTdozlAdmRZ3EOYPz3Op7
 y68KtFcYV+z1HqcgqOjvUDnVtW8hB8f9M3ARGDYaQSvW225q1C2YdeM4/ISICoERm1srzp7
 eVncKwDBPJHCPZmN3rSmwA5swi8AGGMLENJIX095hAiMJCtsK5LGiZ3me0XJDqjHo87scfX
 W8+BHbeXJUpgLxRxI+W6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mtrQs7hPM/8=:BumPYA76IX8e+9bIDurWS6
 dox57tPT+Hio55vMCXDZTQGhZM8QRyz7J9dytxWdH9hPU7ogbaW2k2U9+ynSWkuyR75r3oStx
 VuZp0W69HJq/IctLfb1L/19wI1HtS00hblbMIzZlWPhjHDHK00s4u9KfrNEQtseiteBKS/pgN
 3P/udMhjP/IE8cauRaDLjTzjPCZ+14B3nTvdyxNjGHpNjTnaazSWJz5gbkR8UTSdWnL7VkqqO
 CW3c/x/zomSd8p+Gzy42zjVD4AUt4LFTmXDEIt/wI7FpE9FIhEp62XMHUeYJW5FKMU7svQrpV
 ytyZGklreJ19GTwRWGiP03/oXbtP6G60LmWY5YpUg5WPMDL2wyLFytIwyAePs0q1PkbC50U2O
 HZXJ089Of2pWrv+zmS7IT0O5BdUdTD6jF5my21GhimeapVbWkp4+QpqCH8+J94slw2bR+zgk5
 g3eNp3TSdr6s4ZNkeFScu4XoO5OFtjxj96i9/z1fidRzfIDiC1Eldm6UR42FQ4WWD5mHvsbND
 EMytrMUthMLB48zp/xKen+00bGdJnLjSH/fC00E5oDNeyq6bzTS2+bVsW4Y6YNgAKeAW+1QXC
 Q2zgJn/CKCGt9Qy8dnFTtuhFn3JjPDMULveh0FATfcrwJM0W3GsPuGUCpKY5g0qCfobIM3RPD
 hQpYMJF1yeYlwiUiPlQL/ZeXOpWbIjOvS3bqcjkIZK5/kwmCY5Y4W7/mLmRk+MGIbcKe66RqY
 SCIY7TQtJX7D0sb2NUpie2WO9b/0rwjmKlCOGgqeUi/niKPobJ+KELZs5n5qvk//mn7vMY7k1
 8ZjBtlAB+MC3K5i7WNShK90kDbw+SVkID4qYAejjQgsDN9TwDTrjM123phoAsHcspcHMAifBA
 5dC6tCSP+4nYb/bCe4ofTKnyp4BWtheIhkBkcK3kBWfChk1wMOeFdh9M5U2C3evEfFLIwE/J0
 lAdV4jHoY4BfGUz62YN6Ksm36EWDs0kRUNsIkz4TcKxbd6Fp2adaWAhhME1MISSqdy/tpBG+8
 gwGCxaasmahJ8jCNxBc39JpGvLVRYpklXQli7w8tVuu/UL1jbnZYvlvoN6f+nSWi8Fz99IgY1
 9whuwdzPMknkB+oSBTDFNWSXZ1XHtacAFQc
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Make DEVICE_ATTR_RO static to fix sparse warning:
warning: symbol 'dev_attr_cpu0_vid' was not declared. Should it be static?

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/w83627ehf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index 3cea66c58c25..705a59663d42 100644
=2D-- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -1081,7 +1081,7 @@ cpu0_vid_show(struct device *dev, struct device_attr=
ibute *attr, char *buf)
 	struct w83627ehf_data *data =3D dev_get_drvdata(dev);
 	return sprintf(buf, "%d\n", vid_from_reg(data->vid, data->vrm));
 }
-DEVICE_ATTR_RO(cpu0_vid);
+static DEVICE_ATTR_RO(cpu0_vid);


 /* Case open detection */
=2D-
2.20.1

