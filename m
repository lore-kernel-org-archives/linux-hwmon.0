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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF90C4743D
	for <linux-hwmon@archiver.kernel.org>; Sun,  6 Jun 2021 19:18:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 586696124B
	for <linux-hwmon@archiver.kernel.org>; Sun,  6 Jun 2021 19:18:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhFFTTx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 6 Jun 2021 15:19:53 -0400
Received: from mout.gmx.net ([212.227.17.20]:37091 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230458AbhFFTTn (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 6 Jun 2021 15:19:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1623007055;
        bh=ks7SmG+pm/Pb4UpItq4fO+F6eI/FufhRAhv90C0rA5w=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ABCECDNsAtymrilVjGvZHjdk6LGknSOKSb5CBdEz0hEyntXQ/mbehHI4U11H3ZNYf
         MwuuTXAIgpnr0AJMvpyZQ0qy/jMWLj76LkgtfCzxz7K7WhjR36j+GlgXeUyFvp931P
         p6aeSVSqDM5Xa0tJ0fw6ZjW3g6snK2Q9lB4YZIKU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.217.164]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MBm1U-1ldtSd1cyK-00CAHJ; Sun, 06 Jun 2021 21:17:35 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v4 6/6] hwmon: (dell-smm-hwmon) Fix fan mutliplier detection for 3rd fan
Date:   Sun,  6 Jun 2021 21:16:30 +0200
Message-Id: <20210606191629.32245-7-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210606191629.32245-1-W_Armin@gmx.de>
References: <20210606191629.32245-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ElHNgZtTAlCdlAINBa6Tuepq+4UQUX2LB8VaBaUkOBZZQMOUz1Q
 PVDatmCbNJle+sWTpfd8A8OLC8vBxu47QbegFLC2pV5t0yegXiSNavIsj8UtFGlnkPw+mR6
 eldAmGTC4xqHYOxQ1+toJRroA7OZKqQEW8pCZ1LIQvOcR9db6dBoeTjjnk5XISyL9KkIzmL
 5jJsPj3RZ54gjCPPhUz3A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CpKplL/mFg8=:HEwBjNaSA4EfwXhDI5767R
 waqMdxf6zlqvFOSR31u7eDEIfVz8UPd9/7cKa5Ya+o819SabESB1ORY4gAjcE/vGr2aEvOamm
 XHzCa4Jj5+5/OGlkHpypHVzVl1a9K7y4SSFkjsObX/WeXK2bYE0WlNgzo5q7lLq2pP+ajS/CM
 cx6eSnEGIbPWgyYLRWO+u6PjUSOw0XjsOueG2k9V91r13kl2KkMfDJR73efP8OIGc6S8dpwa1
 jj14MDgPSshneO3o/CGHFCHiz/xaRxoh3ILLfvIqXKD5OgTdw3NOvEpcc1kAPiDDlWZLU3zfx
 mi7sfFEOkH8Tsjm399V+8Fx45q0QwvixAoL4U9PH5bRZuYmV6RrsrDGMzbmXkGocwp4erXIeS
 kj910BT9ecqikpWbx6DwTTJ2bt2r903KLKujz3QBHYXD3aVm7SOpqlNjfAI1drnW12DDsAo8F
 jO1bTaDj5R9dw4g+U+I5CnTXvQ+xuseMXxN9kxlR1GgrgqnURZOFqElVl3Evsg3uPHQbwGeNc
 /QFJwyTcOpvrGypBTeZEobkNQb2/o/CrAjxmBjmm5AU0WlqKJ3hTru6h4/CPbHVAoayvsBJbg
 dLjlijBFERCPm9BzEXjUyx1yzzaI137PxChWs3JYxLHJqm17jjfUHkAivqrRFldlLGEoy/SCo
 YOBZPf1fTkhOlfZSX071u3YY6t/zEJVJSp+Ah56n/gaAFWr//kOnvGyl0mpzsTauSZ7/mshIw
 o8fbgyGCEtV5pRnZQBmLz5mbcC75KujMx9AK++YcQVzS/QMp/d7YCd//8d4bxdyhK+Vz/uUiC
 PUamAhbEW1LlvLebJ5S3uv/ZINTDNUJ/HSJre46ngquI7OczF3qXFTrNzxejLj+BmD9xYRDqF
 KiwpKTvGzo4SesNNzJ/2P2XxIuWW8lAz5TYj0MIWTw9yXAIZwUz9P6oVls+9f5ZpUm2thAbyV
 npikPYnVq/dV1JJt14ZR1gQQ/5S2I6T9ewycPnTQqsVF1GZ9xNE2H14OHGvLX5juiejSKDmkK
 lInez96zapNwrEYorLcI6DjCgSc1sDJ/OZpjxeGb3SuMnU5NnrphI6hAnxhcQUMn7Rc+afkp7
 vKxFMmh3h0rqD7DAcbvgnRi7DDm7aYWBRrH
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

There are up to three fans, but the detection omits the 3rd one.
Fix that by using DELL_SMM_NO_FANS.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index cb2bc27ec410..5a29cbf8f164 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1258,7 +1258,7 @@ static int __init dell_smm_probe(struct platform_dev=
ice *pdev)
 		 * Autodetect fan multiplier based on nominal rpm
 		 * If fan reports rpm value too high then set multiplier to 1
 		 */
-		for (fan =3D 0; fan < 2; ++fan) {
+		for (fan =3D 0; fan < DELL_SMM_NO_FANS; ++fan) {
 			ret =3D i8k_get_fan_nominal_speed(data, fan, data->i8k_fan_max);
 			if (ret < 0)
 				continue;
=2D-
2.20.1

