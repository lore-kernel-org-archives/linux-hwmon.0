Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66F0C2B9F7
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 17:37:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A892F613F1
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 17:37:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbhE1RjW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 May 2021 13:39:22 -0400
Received: from mout.gmx.net ([212.227.17.21]:40159 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229463AbhE1RjV (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 May 2021 13:39:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622223450;
        bh=4/ljCOdE+I1VICQb1TLHMJkok/Dqbw0P8Sqj81hRNDg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=NzOx+GAcQjlOu69drMWRCbNagtKuJwnDc74IOCjEHXS3rtrZVIE7FPs9/sDkAMhS7
         QZjjCmhIja7ecX+wNh3WDncVhsvjy0M6NcltwWtk50VrducYpk/Hi3Lj1kG8MN9NPO
         M+MsPCDV9pLWE8cnReOfZBOSLd6xjRYf1rM5uFvM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.180.99]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MQv8x-1m1LWY45p9-00NzsR; Fri, 28 May 2021 19:37:30 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 3/6] hwmon: (dell-smm-hwmon) Use devm_add_action_or_reset()
Date:   Fri, 28 May 2021 19:37:13 +0200
Message-Id: <20210528173716.10975-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210528173716.10975-1-W_Armin@gmx.de>
References: <20210528173716.10975-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:izCOAJ5h1vsdQIgVM/GdEngdOCFENq/IdTzldPAt08xvbSaeQV4
 vnGrFMf9f4vBDrU7kgxZIIs349le+0/ToGiZomhsJmZo9GnOaOYZ8fTBEzZEwtZISvUEABh
 W2CpLLr/xmyFxsUrBmS8UWranYi6YiJ78Zv4kE6uRCMdOypLLi96JSB2ckslDSlQPIBh77k
 73iybRmHA7WOOLSvGwxWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lQTgS1wVgqo=:V9AvRzqzYrX6yQ4pVHbZxu
 9eHkkP53HQdbCjYk01gSTFE3mzy3PwHyTpXxxgYEzp6E6dPeogtr/dVvndOAOApV3THXS1iyv
 /wWYs12qm8SdggJKclRawf5Qdx/BrKx6k1sdWS1O9jkA3SDB/+oO9L1+fvzzeFJqPji3kL7tQ
 ZfWdmReB0tYpo1jbSIr96Yztxw25POa0Z4yEAY+meP4mJ/k5FH8DQbXl5dgF4o6A3vWQ2dgjM
 J8gpajA5buIM4j3N20UnhXXKT9clxsx52of2euaD6GRGYae4e7IoStK6gf13qphkg7ekpPHtq
 +BhW5NLUR42cRwT4gikOrIBcgg1atsj50AuY4F8YcfM413o5heG8ncJ3FFWSDVz9JAPicFNh1
 hsfJIJNYMDqUf7iD9WHG2pgvh/GMlTVspWuVWh6npMD8j2ATbII3h/syJIDu5UFH3UFKrzmLY
 DjfR8/zoLrUGO0bAc+s2t+vAI5x4Q7KSMpCZ9k1dpQsFLqkisFx1HbHKlF4sCsyNiugaLqJG6
 cWAxXR/KbVW0en3vbGMDJWA8uJr///OaS28A08AXzbzIQFhb8MWXOWSpkh2syehSfL2OhyXuD
 BfWMXq0WU7hfMPmfW8no5LE+w0RfVsad54bEjYiAnKOIDoJUujddnZTjNeuufbBf0lOY4wvFG
 F6wkBMu7c8oU44ScqE4mjourhwH5YUzJFopsnGjTTDufBG5y31dM7qTYNs1J1rsk0g9F+moxq
 s1UC2S1Lc1SCqzjaCO+a+G2JEQknJp70csDnaN0IrKeh5xeqimX3KGfg7SWM600XUsm8P+XEs
 uJM0EF/+3gaAEG5QCxB1fHDvgPR8ePdnD02gZZVckkHxjL8gnsxHBtXqQoPDfNGN95Nc6xYgq
 TZhcOFpnlH2kOi7M8ZvO+2pcww411RsDRfm2fSLxu9C9G7y+sMHk6of16aib7LqMuH3DFILet
 Iz2pgTKVMtL9dg6+YtdLkAdqH2Pqjf4u7+drnD2OWDc93MmGrB+aLLgXZ5otxwS4OjTpOKhmm
 wTJpuzBIvc+eqByRNwJdAKIpsIhVLCv0hs/OHnCD2bcT2CjrS4JBHPbHiCEHcz+OELN5pV4dP
 8KSxvq0bmawlgvZ/PHxWUjZ0Z62CUfxMfgLxxauX52aXV8ih/R9MtYMB6A8sVsWBeeg/j2Ku/
 LNz7XJC/iEh9o39k4wJPBkkCkHPzmgMktuwzfksv+aKhAxm3ptX3kZzSBmnt40joaGSG8=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Use devm_add_action_or_reset() for calling i8k_exit_procfs()
so the remove() function in dell_smm_driver can be omitted.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index deba8819164d..ed2c42badf1a 100644
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

@@ -1287,14 +1285,7 @@ static int __init dell_smm_probe(struct platform_de=
vice *pdev)
 	if (ret)
 		return ret;

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
@@ -1303,7 +1294,6 @@ static struct platform_driver dell_smm_driver =3D {
 	.driver		=3D {
 		.name	=3D KBUILD_MODNAME,
 	},
-	.remove		=3D dell_smm_remove,
 };

 static struct platform_device *dell_smm_device;
=2D-
2.20.1

