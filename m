Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995F3C433FE
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 19:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 789FD60FE8
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 19:05:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhJUTIL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 15:08:11 -0400
Received: from mout.gmx.net ([212.227.15.15]:52123 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230441AbhJUTIK (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 15:08:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634843137;
        bh=xh+0y61AKC9kcs7CHjSiGAI/3dEEHsF36lazThS7Ybw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Mgw4Ew1oeet2nsZl7t7nwylVQaSl3eKr8zj5MpyOd5JMrP9KXEdKsH93SulAPpDYe
         5q95zTOCTQ77SxcX14qBNawwWQQZcRm1XtaJFE6O8F0Umo8wBsFJIFM8x0FU2XuaqE
         z290KbGYqt5zVHV4A3WsEOHFYRJffNyV1B8z9ZS4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MxUs7-1msfKi0ioD-00xsYE; Thu, 21 Oct 2021 21:05:37 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 1/5] hwmon: (dell-smm) Sort includes in alphabetical order
Date:   Thu, 21 Oct 2021 21:05:27 +0200
Message-Id: <20211021190531.17379-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211021190531.17379-1-W_Armin@gmx.de>
References: <20211021190531.17379-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UsOdVn3T3TPbLPwlVDk0HFtlC5Xh11gujslhrInQZzM3ALWTwB1
 ZDCbOjDkWgPDpmsJj/OQP0YqO+t+/yO8cagThKw9+nO4quI7hR84xUhMyrBdTSviBAMigpj
 MQy/QOERm1bkQZYmV2w17EeqxdLpWR8aIees+vd4jHI4vLS5gcUcPULfC67ylsl+OsT+lw2
 srbXNwcU4VE5mpbK/pJPQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uo9HmMpKil0=:0qG1iugsn5t9QsLgouKzTg
 3wyeJevkSNHwxmvqBY0JSI85zEKYvzRBr/brB7w9Sxomd+0CLQrvja7pvt0/GEV1/MvdBbjO4
 mZPVIhl+NPe7DbdY1pB13EiaqadGeFA+pM6LY+oBC+sMqKdmZxAaeV2Hrmp2lO/8OpVM1tptP
 pDaPTflB89MPWyrGsnFWffI67NtVzUG/Vjuu2T4yr3/kTLQ9/SLTfkbHBAxOhlswJKwtAyUXC
 tCq1zys+Y2MIr5kTrSZbfF+CPfpnZSQvALExpfNNjUe3Fm75izjK8NL4bBUJ2Y9B+9coDZgKI
 +yZ/BoFIPDsWNZ06v4YA1FiXJX65GOTj0iaGjqubkbRKe49uNCdUysKDxM5RP+ZS7v8JtfP3+
 uEodti0RptkBbUUfcNQF1w5YiBYdmpkpMyxpxONHojc841tp11k5qUvIu7Tgv51spPqUeC+/T
 xv+pjYq+RduBn2QmhqSmrBz09P9u8ULlodZpTFJ80uwbWo8o+Rxf80QSme9+FC0Y3E5rwU7gk
 GP1lZQbO7My4/hg9TINCoMvVdPUYC2QnRN8ZRirh1VkhSECGfMrD0kisBiXIdWv/eCKBwDMNE
 /ZPiArvwVMxFutlogHGT05+sMkiuElTPPAGYyty+mfIXcTmw9cwxdriPKlU1Cu8Ouc5uyPEcm
 d1dr7XAmy4GqbBRead0EETE4uD7qqMJnzVGl71hih3UVtQbwVc11GzrJiJcHs3FpW0UkST9lW
 egb9ZFOtD2uonM8MKrZMGlM4Pp6WhRmii6AqP2WNx9vX0PDfsVWtpsQOKWNtlTtEQ7CiHmIfL
 9Ou4OSqlEV6zXu3ecK4H0vvhNJ7NSVq5p93bV2N/xZ/H5lI/AqxLb6qOwUqNuxEWfCWnE7K41
 MPKH4IWupTp0B9PLEAcGeg1jauVJooa0ziCQsDWOTbyI6vmK9h4z5jjHCdalgwh6eAlXQ7so4
 QoCi/lP/JcaGUUf3WveWKsmQETJ4/e8KnO7VQZxiyfTNYWTOvcr4YK4ApT2dHtembREq5uW6K
 a7T+NWwlgY39cn+NGeLfBB70MNStOWHUd97T4ajsH2LLcjR0BeZLTJO1PvUYOgxk27PKm4vBA
 D9wsUbPfJN4m/w=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Sort includes for better overview.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Acked-by: Pali Roh=C3=A1r <pali@kernel.org>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index af0d0d2b6e99..9773d6c0477a 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -12,22 +12,22 @@

 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

+#include <linux/capability.h>
 #include <linux/cpu.h>
+#include <linux/ctype.h>
 #include <linux/delay.h>
+#include <linux/dmi.h>
 #include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/init.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include <linux/types.h>
-#include <linux/init.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
-#include <linux/dmi.h>
-#include <linux/capability.h>
-#include <linux/mutex.h>
-#include <linux/hwmon.h>
-#include <linux/uaccess.h>
-#include <linux/ctype.h>
 #include <linux/smp.h>
+#include <linux/types.h>
+#include <linux/uaccess.h>

 #include <linux/i8k.h>

=2D-
2.20.1

