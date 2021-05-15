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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D475C43460
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 May 2021 18:34:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F45061369
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 May 2021 18:34:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234129AbhEOSfx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 May 2021 14:35:53 -0400
Received: from mout.gmx.net ([212.227.17.22]:54295 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231558AbhEOSfw (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 May 2021 14:35:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1621103662;
        bh=LCPbuxPfoo/X8OzcRiHQd+iDxgWjqCjOolPjT/aWUNY=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Q4vvkFz2Il4Mka9Gp71SjVCiA019SrjFQwkEVF2u2ZPLBLPsanPD3SiVmoAml5XKY
         sbiCJlMBdC7wxyFT/2oNZmheSLY6prm68Eu5aaB42pBm+RVHEvujdlKaM8OeNyWCc3
         DrYugHrC01FXeeWjV3FHTLFuJzfLdAJCzixv/L1M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.0.97.49]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm27-1lgdfB2pAJ-00GDxG; Sat, 15
 May 2021 20:34:22 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [RFC 2/3] hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
Date:   Sat, 15 May 2021 20:34:08 +0200
Message-Id: <20210515183409.682-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210515183409.682-1-W_Armin@gmx.de>
References: <20210515183409.682-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:08lpIZGLDJ6CvsP3i3ZEMISs7i0oC3sns7xMLq0xCzwJayCvxKe
 hQB/tX1bi/lb45z8BPW85Enmwp4yCgWSKdgZMpXXtww3v4nH63gXcuo+hs3AaKJBo1Gmfji
 IIY31npOlOnPOlriEL3RViKfeQGeXCLduc+ZSSrIYgHACNovu/twhYayk4ivoxjbNRrfNHv
 bgzPqhwO9IH4HEZXw1pFQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bjEF+YKwNFg=:PcfSh+M2BySZIujU5sgxch
 A5/b2DGwPyor9ia1DST0erFD0ILuuv1P7JC2xnLPgZZaWMR7WAd4vb6XKAEnTyWSP5b3UTvfu
 bED6bsMsQQMkyc3wPHUs1P3PdrwlBX3kXhdqb/M8FWuyed6KZfT2Y/r48sJGIDtsz1bpn+HFQ
 lR7gh+ak31BRh4KRw3QhfTrDlItp5lTy0Aeuw6PqqK9lf634xEgR4BsFsckkwi/8M/afQJtqC
 p9KF65sa8W1axUPiZoDiuMYSSSPgitCww9t4SNyefM8Ii13HS7wNmbQtGKqDve7r2i3SqRFUr
 +/QEh4nf5EsNJbmwZKjOhnq8kKDsD94iP81v4fkKvn/hMpLL2UH289y6k5cBpzQIFlmhzsCZm
 vCiV8P1iF/ZxxIcYDStb2wVpat5urP0cFd7NtIIPAyQ6D1vQ4FIZW3QFCw6wyMhIza7rlyyCt
 zXpSwTYOxUigkbx8wOPBNpAT47QeOFOI/d0WA+RGiqumZNCzo7YXPcadb+54WBOerNOuRJLxa
 gjgj6R8750JoEbFzv6aSQS4VT17BrFdAgOgi+Oqbxwvdoqk+w+02TGrtkIrxlsDiEActRLkS5
 UX5XDfNJmN5P6dz+HjsqfwQ1+vDg3Jj1bWDFvOfIzN3IwevU9lgNKTRIP7kp80UgGnY/kmpCW
 xuTaDj55/p5UpOvyjSzbAFyr9CqCkQ+9+uSHaYGp9IH8FqNvUolymdHUJwVMs2wF7+NGKMpGM
 wIFjqhknAb9Nr9HBb5k3FAttn85D4e2TirkHA/8pPE465T8x0UIbEQavY4PQLbgfJpk+EEXoZ
 WOFCZXFkkcv50lP+j95+S3sKPQ2E+dUIYaISW5x70rtmHd8tQk3rgxs9tzTKqgKuSvG2PJdwY
 AAHvjACEa/WkmjKipbqClnsVGvtgD8EEm3uHGucYwPpBeOaJzEVqEVU4ga81uikzjW1Ck2O5C
 rjr9AMETgIHpSY+lYOj5J23nhpiwicSDUS5b3dToGx0OohtuTB7gsYin0IlTwwas1iOHl82fy
 Xq8w+sAAEwbVx1G2ERZhVxC/n75R4APNyHmXlWnEXmlqV8WmX0L7v6jt+xafAzoYcpKemmLtH
 LwF7cPlwPsj27wJByDJi+H/SXesNC5Okk/+rQI4/gEw5jd+mU8wbjUGMBth0ggFMHGDSnkWhI
 i95rx09pyuK5HdMjAbqFXq3lwNTuIMbjfIajP9xI9pFxujILu8y/nLip/bNk+/XaiyjXY=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Use devm_add_action_or_reset() for calling i8k_exit_procfs()
for omitting the remove() function in dell_smm_driver.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 006d435a6e78..6f9bc2691491 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -605,24 +605,22 @@ static const struct proc_ops i8k_proc_ops =3D {
 	.proc_ioctl	=3D i8k_ioctl,
 };

-static void __init i8k_init_procfs(void)
+static void i8k_exit_procfs(void *param)
 {
-	/* Register the proc entry */
-	proc_create("i8k", 0, NULL, &i8k_proc_ops);
+	remove_proc_entry("i8k", NULL);
 }

-static void __exit i8k_exit_procfs(void)
+static void __init i8k_init_procfs(struct device *dev)
 {
-	remove_proc_entry("i8k", NULL);
+	/* Register the proc entry */
+	proc_create("i8k", 0, NULL, &i8k_proc_ops);
+
+	devm_add_action_or_reset(dev, i8k_exit_procfs, NULL);
 }

 #else

-static inline void __init i8k_init_procfs(void)
-{
-}
-
-static inline void __exit i8k_exit_procfs(void)
+static void __init i8k_init_procfs(struct device *dev)
 {
 }

@@ -1225,14 +1223,7 @@ static int __init dell_smm_probe(struct platform_de=
vice *pdev)
 	if (err)
 		return err;

-	i8k_init_procfs();
-
-	return 0;
-}
-
-static int dell_smm_remove(struct platform_device *pdev)
-{
-	i8k_exit_procfs();
+	i8k_init_procfs(&pdev->dev);

 	return 0;
 }
@@ -1241,7 +1232,6 @@ static struct platform_driver dell_smm_driver =3D {
 	.driver		=3D {
 		.name	=3D KBUILD_MODNAME,
 	},
-	.remove		=3D dell_smm_remove,
 };

 static struct platform_device *dell_smm_device;
=2D-
2.20.1

