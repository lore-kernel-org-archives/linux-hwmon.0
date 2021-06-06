Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512F9C4743F
	for <linux-hwmon@archiver.kernel.org>; Sun,  6 Jun 2021 19:18:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 370CB60232
	for <linux-hwmon@archiver.kernel.org>; Sun,  6 Jun 2021 19:18:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhFFTTv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 6 Jun 2021 15:19:51 -0400
Received: from mout.gmx.net ([212.227.17.21]:32769 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230331AbhFFTT0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 6 Jun 2021 15:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1623007040;
        bh=jdfwKwpeNA/9hNZjIvtHq2No8hgps/zPFFXtKwxaAlA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=eo7eWONt4cBSDDlZ9rkEv7zc28WW6elKiP/mb5atnzVxdyeDPGtxzQxu94CqChk/B
         mbkFUR9B2MjBeB3k/VQz1E4+Rf2DNVGdLtYzaaKZXUwQXvmOEA4AkIUBYe2wYyrlvY
         qVt5rjozwYeMr5ywqeipun4vfSgOfEVYO9n2d5K8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.217.164]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1McpNy-1lHSXC22Ec-00ZuCf; Sun, 06 Jun 2021 21:17:20 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v4 2/6] hwmon: (dell-smm-hwmon) Mark functions as __init
Date:   Sun,  6 Jun 2021 21:16:26 +0200
Message-Id: <20210606191629.32245-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210606191629.32245-1-W_Armin@gmx.de>
References: <20210606191629.32245-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:h8lgxGpIILyk7VGiTMvgul8RwoOcHZve4AiUky3U4xZrP1dHzTO
 PMXZHoJ9rzwYswKhs8ZWDR9xk6qVVbJceI+yt97xcJPzAS3v7bbRWsKwgGT0hmhz9miQmes
 0UFPH/5HXbvnCtWFU0T8Vsr2aHRzjuEQ1UC6HBVL8uulASrx76BHWXCs8bXYyQO+mRrrYpj
 Tk85j7Ubs9TkYZIy4zIfg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JOy94fFtdAE=:puagdtOmVrx9gsspoUqOBm
 Ul0gsYyk+D+1NSwM8dHXJQof0XwdEm0RCVuV0USRhz7WaB0PCwxWHWpnUMKmxs+NXyLOHr8fR
 TfRPhKI9GefY3FI0o0MwjycDb7jBtPfXhXFQNqKGPtEqz5401Bmg6OOySgcN84ffa+P1022TV
 3ylRa/5wU7O5uJAS/FWxULUC1LiB6X+IY6bxhZcB53Yw1a94WkcZ9TthuOXpwD0tQfNkgTKio
 nA7w9RW6BMfDk+h8Te76fwvEHZwr7B+ceieZbG3Xz5Qdlv6VgO0QV6dVbroSZIL4pwQG0offj
 km2J7lM8Thtb3OY1I/6lzRcHTIZyzO6hFhdeLwQwTGKs0pyH4Qpncu67kOYGSrIKhgLoxTjIN
 tVO8EfhMOD/+cKuOxlNhHSKJMSvxLXxmtN5KAZ/XMW4k/RvGld0BftvykGVRljD7bPEFlf2Ym
 crwf3iAKMz5rNrm0eq3e1HvXevl2OeouRm5AsmfrWNv/PHPIr9Kp45orO1mrlhiZarA5EuM1+
 PE0sRmNcUr8k3yvuKMoi/2gOn/eRQVFsRTtNroOLFT/o9QxXgEokpi+OMjqLBi3HbKOcnBzlr
 lS3aPPQuLrWKxTgraXHvwSn615WNyAicE63FYDqTKIy11TbyYkMwmeCuvb1ySj5ExP1RZz5Qc
 OUsldrrH6F5kkmV8ihkY1zOh8pi+a4LJG+9gu6x3hHjpdNxCvZVsPTb8eh2yRYGruB4asjp/f
 veOSeLe5vkaCvVjoDgxI+2aZLFOL5DR0UBgxqpooej1ihsuBBOXR9Jean+FzbSFzFgtXqlYwZ
 zpWysa2DbRjwOtrDQmezfcmGT/R50gh3tkruh/qTtjNVkndXrgx5CzQ0V5xyW0QLAY+3gwgj9
 oII5SIB5ZWqxLvbmyt/ILZoduVeTVBo73ovNV2qq0jYqZ6FloCaMDCDwUXkofsPuOWgs33eur
 rkjRxw8hMN8/oWI+ViFhnERhgKBysjqAmxyl7OaFJ6JMoZcs2qsZFlbas/vTteLtHAgJUL2MQ
 OJsqd4M6wCKFNaO0z/TAYiZnQsZURNwpCrvFZP6hvQZ+UuoTo0O/RRJFkSF29jRuXcmrk+vGv
 pnzBhMUCm0dZsAzc/bfrwvWG/NxG5UKxGbL
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

i8k_get_dmi_data() and i8k_get_dell_signature() are
only called during module init and probe, which both
are marked as __init.
Also mark these function as __init to lower the runtime
memory footprint.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index f06873413aea..c898d6bd6a18 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -128,7 +128,7 @@ struct smm_regs {
 	unsigned int edi __packed;
 };

-static inline const char *i8k_get_dmi_data(int field)
+static inline const char __init *i8k_get_dmi_data(int field)
 {
 	const char *dmi_data =3D dmi_get_system_info(field);

@@ -384,7 +384,7 @@ static int i8k_get_temp(int sensor)
 	return temp;
 }

-static int i8k_get_dell_signature(int req_fn)
+static int __init i8k_get_dell_signature(int req_fn)
 {
 	struct smm_regs regs =3D { .eax =3D req_fn, };
 	int rc;
=2D-
2.20.1

