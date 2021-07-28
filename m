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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADC7C432BE
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 22:16:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0A916103C
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 22:16:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232116AbhG1WQ1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 18:16:27 -0400
Received: from mout.gmx.net ([212.227.15.18]:49531 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231998AbhG1WQ1 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 18:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627510568;
        bh=LtZsPMcj7ebFG5x1WMxNoobZwimgVbI1Y2Sss1Wjxa8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=GwKQ3NkUMlRL8M2hqwRYmP3RyoBh9KKqwAVZwSoTe4FPnR4Gis1bd5wTPhe2eKMPp
         ADX2pFIfIWwXamimQQtE2VrIXjRXZUVC7vnDbpEIye0XJdT8QtHpOqYlnQSVVexYl9
         dqitIaAO9P3Qmj+bAyxBcYlNLN6KXICgdrlswSTY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.190.212]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mi2Nv-1mm2Dh2wmP-00e2pS; Thu, 29 Jul 2021 00:16:08 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v7 6/6] hwmon: (dell-smm-hwmon) Fix fan mutliplier detection for 3rd fan
Date:   Thu, 29 Jul 2021 00:15:57 +0200
Message-Id: <20210728221557.8891-7-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728221557.8891-1-W_Armin@gmx.de>
References: <20210728221557.8891-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vggO6C1f3Y+VTrjRBtPuQOh2VPHjN8auJ+5JSzgRmh5UlxBH0Aa
 E8hk5ZW1EGGOoj4v80hOKsLrE1BIpWAObal+uBVu3mR1PQO7iDHFmb8TyNnH8x9+3ReD3wQ
 wVbr2kWPGYNOAY5g/sJr7k4Qia/z+1bfYzjKGrX+We+THjcaw4L8GpYz5OlVAh3am734uSs
 h90Q9VmKeOIn99gNiXN5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J8eouMIV8As=:Wi1sEHQdhx/bCpweM5Vyna
 j0NBxP9aZD5vww7QyUpXjG83+1iiIcYwDOlV7Y0QGI+RxWomWXcI6zRFbcu8iLvKDGDjjzzhv
 0y3+Stgfoo+28um3AdY3PzefjNAYZ0DiBg9q++catIYtMFrCtXUQvDU9PXgVTXK3YiXeVvgbi
 l8BLFpl3gvRsJGNbckyfxkw56qLyhL+PQjVKCVY9LOVHv/AlyNyIWEqthcePVP+Xpo7UM//EU
 ycKcp7pIqueFEtm2GlbIjtn+1YrYNiA/6FuP8oFdhpYiLFy5YF8KtcaNL2z3oPdV9GiNVKXnB
 FLGc2/JgvkqTlpxOrPpHzv4CLYX6H/0sLQwVQYY/VEqQr7X5idbefuBGjgNiiPqqhV4GcHUaR
 /X6W5/ll4JR76X15pxnkj+GfaLmtnC8UStURL51HrnlBk1VkvWsgrcYLMymYQeeqN99alRYon
 wheexDUL2gBAoqbSHdHHfpYIg9ub7Wzbl4zJmEdYNNjt2iFcZJsa0jtDOp7df5WaY32Q/7C3o
 VoBuk34n89XhoxOwjw2wI20t5HoBh81QvAq8Snjg2zSwPSUlKBRQIONvjCLwkjXtWgs8wF6uk
 Rp83UmUDGXAvePtHPs2sZx0WmnfMRxB8Bi5uUbqjDnR/qji4X/FdZ47+M48UAr78qa2sXgOTl
 wi1ZI4ldp+QIl2NSnx9iSMu7qzpr3fUtDY131AuF7M3cZJlaxYhSyZVcBy56/AwxGg2Btafso
 qVtQwTuBdy6gTW6VaNbSMKHVnvRlAGl90m4t1bulJ2TYDsCraJBAn25aFmmrMKQrta35nDZ+C
 LsSEowR7rO537X9icC/hkPCp/Wt0wUkEN0UF20yi8R91fOkg3vqv1iJUmhwYb8PFDrY1guhpV
 gd4H5F3bKxDqrLadJEjJ8NYsPRiIKq4ZoYTZjDgWusfcgW4Bd5i8+8gnpwG57QKtY3myVgHFE
 HhrSik9d8GXdz1kk0RbDrCHx4mZ9bWTjsnIWKzoxQrsyGtAhbC776f2XyRyVYdZhf2X0rdHfd
 +elGzfbu1bam4XHXCkMiSF6laNOy9lt7gndDQYjC0bj9Z9Wo2D5BvBUn3/HQXuXgaPC4DnnUY
 elEAU3cEBEd7hDAmuMGrguzpspFfQyWnYG4
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

There are up to three fans, but the detection omits the 3rd one.
Fix that by using DELL_SMM_NO_FANS.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Fixes: 747bc8b063ae (hwmon: (dell-smm) Detect fan with index=3D2)
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index aaf864dbe53a..206418405440 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1263,7 +1263,7 @@ static int __init dell_smm_probe(struct platform_dev=
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

