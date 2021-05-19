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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5D2C433B4
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 May 2021 13:29:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FEDF60E08
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 May 2021 13:29:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353719AbhESNbH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 May 2021 09:31:07 -0400
Received: from mout.gmx.net ([212.227.17.21]:36591 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353716AbhESNbE (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 May 2021 09:31:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1621430967;
        bh=JoDvYIsMHtx6gueKLKKW45Zj/pND9+2ajlZZg/tERBE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=TocSugbos7TPJhxC5PLUpE2fv7Kr0VghmOyfnWaXxLoiDmI8nPwaM4rwUCuIuMRKs
         0OIbeUdJhT3lCNNxYFf+1KgIqkyQiWrwvtUhat5wFYZPqPkmO99OQewwHZ0mhI+FyM
         P7YaetRWugLrQQ3E74SRjl1qC0oDwLzI0D/1eqLc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.184.149]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MHoNC-1leQZF0lMc-00Exol; Wed, 19 May 2021 15:29:27 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH 2/5] hwmon: (dell-smm-hwmon) Mark functions as __init
Date:   Wed, 19 May 2021 15:29:07 +0200
Message-Id: <20210519132910.14453-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210519132910.14453-1-W_Armin@gmx.de>
References: <20210519132910.14453-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:I/VNrHkn32WlNTltlhHPzCU2Q7r4NCjLeiAvNfSzdVwvNnUoC4j
 FrouHm5RFRwXqjaF1IONzxCIfiWg2Oj4jZf8cZ6QnTjUSJLXFeS1IL4fZT1wfkZKsQ6lXv8
 JqVt4S9SqMEESVJRqB29eCJDsymwRoXAib1Cam8d1xAlJq0OhIcB0oqJWMLEw6jcMvXKvfX
 k9jDYpsYdM0KFKibSetdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DGUayB1M4n0=:hin5EdlmCEoMYhHM2QbftE
 DDTU33fIf0D/wkXzOEtzTOsu+OUpufxqww498DJ3bY+Pfii8A3CpRMVxroU68quXkeMWu+5PP
 dgajiOj5bn4iHZFKlMrnCPpUJX5h+XCrRPdq+dxYSZhyb/KOE6Zb3gHoeDtzF4jwnlFb89jLd
 5GJ3a4XQJAv6YhprUjp0i6CFmJlzCCb0w9FkEM8tFyQyYaFs6wW12VmJXBqn8P9BYbIu6HPsl
 h6Qwit5hh8o2z2j4OxaSsXfWgsmwC6ADTa+EhXtJ8actW8F8L5kOAUJ1WnTjPsq1zHw05iz3z
 w901bIBxEn6v3eVr0LgfGq7AbPO4yW3dCxYAi76lcGzR6rHOH9/KKys3rgjeoJiNEMbz1qaeW
 MCQCauQYBvTPVPtE7YvD98xXg4mo0nZpqV2ZGozOj1EB2/oXEAJPdJRRqKk8tnF4WIffaCU64
 nPkc95j6goFB8yy7xehjD/c/zR7X2C9Oc4NGM4UxGAqXcYZ4KZpyhLPw0EbImbwKrR3cw6q2I
 cKMj0F9CoJ1HWR2ixMAVWayHu1lDcYflGVhhJYWwgMNrIZlF4efKq/HBsoXPCjjpUOGy5d7Oq
 N4H4o3gsoMKjhdM7E/atZSSb2qUQ17/0Lv+o97oeN3yDgu3wEcXMyXUTJR2+zmxXP6PZMOA3K
 fmMAJrrLXUfxw0TsAni+xWSDlcuYt5lb9/7gFTPGH5XNN3s75+uFuukHPGpmELcwlsOJJdnEU
 1qB25BoBE+EyF+wk2hIEi7I5EO3Jo5HVsLPV4nyAhfPGZJtt+tqMJgmOWnk3MI/X4xh0tcVcm
 9OBBTyGgIvufSBht9F++EInHi2yUNOjwB/LdLHIrS+LJgaNMbcYdzEXdEuknbBPafn/h2rVnL
 frHhCGkKAlsD+BYJX5gADUJSrxClQjYLYEshnD7gxN3npAQhMx6by4MX16UXakqmXA3fsD8T/
 3Glu3mgeYnRvfGm4GG4dZnWgbMSD9U+TCiV3JWC0ijz8zGd7pAHCNh4Dgm7p5te8bkWup/F38
 ASoEhP7s4BVCkyLG+dL8dpW/KDt84QmTyoQgXe/rjtbkIkk0k9ytv0DobwNPWM/1CYcWPcibH
 MaYHPIMm9lA75khYq5HT6j8gtelHFF8/3B9bHFl0BY9ufUuPxF6t0JDtVIg1wxraCegd9naiS
 wjQcaIjONu24ntetCF8Y1PCaRfrLbb3d0acV/PSFkiccYjlj0/jGccKRkUaKR/UUUWLWI=
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
index 2038f2a50e11..deba8819164d 100644
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

