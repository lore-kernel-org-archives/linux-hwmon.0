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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B820C4338F
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 14:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 034F560F9F
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Aug 2021 14:39:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238660AbhHNOjr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 14 Aug 2021 10:39:47 -0400
Received: from mout.gmx.net ([212.227.17.22]:53931 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234690AbhHNOjr (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 14 Aug 2021 10:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1628951941;
        bh=cuCSb+tpEK10weKqPO7OXjgau9kK+RABqUj4pTOTMRc=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=eAs9//CZWfsNRPqMVGJVvrRz6q8R5W429GNYeZ/ynfxZu0E4DfmI8NzGecTUmoEW7
         HYAKFTj6IieQmT+N6PZ6aljzzO69k5yqUgvpjNQ4KKHhxBw5RB88DiBREcRanamR5+
         1xKfqsZpqOLQ8QAZr3XasShps8oM3o5eoq1i5+r4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.96.234]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUowb-1mf0Hk0eiP-00QgQc; Sat, 14
 Aug 2021 16:39:01 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 4/4] hwmon: (dell-smm) Mark i8k_get_fan_nominal_speed as __init
Date:   Sat, 14 Aug 2021 16:36:37 +0200
Message-Id: <20210814143637.11922-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210814143637.11922-1-W_Armin@gmx.de>
References: <20210814143637.11922-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zq8B4jtIWIvgXceuJ10xcEbmViT55qzIzJTUkt5YTw5/oM0mi4R
 Ms2YyT0safU0gMQxjbHGp88Drrf45LOqonKXGAJUeHF2SmH644zfIOjVNblJ0sSgreZEZKi
 XvAJnRQcWoxCuIklv+9lRLdurrl2dl134tfXVkPGgwjIY9xN2tym3bxLY/TXlomdVYQcpuG
 +WvHCZFvc03PNsY2FGyDA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XSIWupGOA7U=:TG22tDmZDkNpoO7jUnB0Jl
 CR7xReHKm7WoXnEBaSzpA6bonzNa9YQJQzWznrBVRNKIp31TpjXW//SUlYkZ/dcVM4Hpw2yns
 xYNk/Jz7VrMv0DMkWOfSyNiwhxmwjdV/hzJ0gK9MmNyTzhWFltpFzHgbuWrMVex14A6EZV14p
 blJhJLtUQUQt610lK42jQ77TqKc5bj3tnR5yJwDAfEqnyxuJFv138XATX+NphvTq2oCio88ea
 yb14jCIbdBU4ikcydUxj9jYbTrAwJFmL9RGNFQrf9HVTAMAGy7aQwfAIRNwiQCuxUTVkHrkyl
 z0D938JHalfrn39aPWvZGREBL1YbszBGl/RIW12JkUSXc4NcAOPVd2NywHSuIDzEal/xyg59k
 vlLEPwx9j01zm5xO+CXyZH9C2zn3BvrAsEfQycKjmyRPg8wVEVlT9NmQu5T920GU4k4sgkipN
 aIt1CuTj2S62nYYuV5BY96CBcP3fd12GqBGKOINDSaVWhZf9fIsx0eNciLB/oLw7QKN/jR68G
 XDquQTIzsHwFsz4FtbW+qzcPDo53J61L0CGkt/MCr1doLqw8/CqmCmzevN5WdstvtjiE2Q7pk
 M5ro23KRQT2SNVBnheRBy4kvBO7fT3e4jW5gnIXTutgkk9Vr1n4aSNYWZisIKcyseGqEnh0MO
 BRLy7clhECJbbRJuYgkSsTOTUXdLk67sOEvXnelGJBlF3zmhd0/eLvndqfU0ahHVVm1NQ3+rR
 0DHMF1JqS9sj9avLt4YuAWHr9hwlNFeCFdBfIkjB2lNCoaaLqnrNB9RqOYn6HYXy9stNDJb+c
 zEZId97CwrOyIgetDzCnQH8GoFqCG8gcJgck0pyGQ+//miA5MV/n8z2Thj3tgxFQ3BLa4zb5Y
 6gYNdg++6y0pI+QcvDTPLa/vrNecPcM6czNnesH38YoWCiO2vwQRvCKDwLaER0V62yK7u9Jk3
 60vsL3terRkLmlCLrxWe8d53f0unpYbSjTv9FehC9f3AACQt3yy7S2GLQe+cMW9YxLDH5hPTt
 tbFNSoqDf+5Ubf+t5SXdBqApxN+3jUjattq6By/2FZDdqtVt8uedomJp3wjxfdXFtPF2V0HKm
 SIiSE9Zolb8XgwI35i/VcQTHrLoCFWrx6X+ZnmcItIr+I3rC3szxJni9Q==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Mark function i8k_get_fan_nominal_speed() as __init since
it is only used in code also marked as __init.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 0e229e3dae33..8bbeeda13faf 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -303,7 +303,7 @@ static int i8k_get_fan_type(struct dell_smm_data *data=
, int fan)
 /*
  * Read the fan nominal rpm for specific fan speed.
  */
-static int i8k_get_fan_nominal_speed(const struct dell_smm_data *data, in=
t fan, int speed)
+static int __init i8k_get_fan_nominal_speed(const struct dell_smm_data *d=
ata, int fan, int speed)
 {
 	struct smm_regs regs =3D { .eax =3D I8K_SMM_GET_NOM_SPEED, };

=2D-
2.20.1

