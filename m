Return-Path: <SRS0=RJFc=36=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADECC352A4
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Feb 2020 17:53:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0551420715
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Feb 2020 17:53:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkrNvI5F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgBJRxU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 Feb 2020 12:53:20 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42782 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726831AbgBJRxU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Feb 2020 12:53:20 -0500
Received: by mail-pg1-f193.google.com with SMTP id w21so4275646pgl.9
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Feb 2020 09:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qNep3xjIr/sVD7YYSCwzph0Jb0cUne8ku2hqEFamgrw=;
        b=SkrNvI5FERELV8PZrNocJBZVLgkZNDfEvyBjctincw3HYJRKXUctvZdNn38QdK7AjB
         gOlbGrGxhO3BuSt8J7dWEg8wv7b6b0tyIkx+8vYPFIp88By60xNkNbmdq03kCzfP4sZ3
         FOzcmmYhY5sz3zEFERs55lDKTsIYPTF6vvhLXtTSFs7x8fsrWuYbQeILNwRwJJ13amHp
         gKOdW8uNsHa+dki7zuRv4pgPpa3xP0IwMrRBouzMORvb/XSpdCFbioN2Bm25KAKaOppe
         tEArcd7WPJ/9jqqoA6iiud2JbAvaFa8+aJ2nfiS1JBXJKYzV5cYI1DycJgsaWnvs/zaQ
         WNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=qNep3xjIr/sVD7YYSCwzph0Jb0cUne8ku2hqEFamgrw=;
        b=nsq8dwnUjsypxMIdWX+EuRziqJDBPo5pTe4TpcfghXpLVhT3L86GezF2vPuZvPC9fc
         waV5hX6bg4fyPzXmTZtp/ZOlQsnYbf1ETlD0J/9HsPRRFUfm9H7OmW0pIuwbusNOPoC6
         XX8NBEujx3TYeItX6RNe6gQBK/eRZ5rGn2I8Jb1ZocAgAEdLM9t8E59/znuqP76XWZsO
         /xRHXZv9DAq37OuxyRxkbkWUe1ZmVt+/bYtWY98HlfWXvSg1PrHljEwiWNJwBvIOo26T
         jw5ePwg5RJGLArg6dHP3JD7QdVGda5UwtMiiAz8bfc2yRuiWyJ+4MCSKQptk4sUx7wjk
         JbhA==
X-Gm-Message-State: APjAAAUsvFvohhmkJ55se0OH6evZHlJURAaRv6oDhEhIvW8yTk9UtBoo
        PKlUd/kqxJY0MDQoy4IDTdtqa2EL
X-Google-Smtp-Source: APXvYqzjgr86X+ydgquhg63wnBvvs4EQqHPdvaCtyfkN1A1vysOofshN/QiDySwB6VoIHF0LD24eMw==
X-Received: by 2002:aa7:8ec1:: with SMTP id b1mr2184634pfr.95.1581357199719;
        Mon, 10 Feb 2020 09:53:19 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 76sm1067461pfx.97.2020.02.10.09.53.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 09:53:19 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/3] hwmon: (k10temp) Reorganize and simplify temperature support detection
Date:   Mon, 10 Feb 2020 09:53:13 -0800
Message-Id: <20200210175314.32643-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210175314.32643-1-linux@roeck-us.net>
References: <20200210175314.32643-1-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Use a bit map to describe if temperature channels are supported,
and use it for all temperature channels. Use a separate flag,
independent of Tdie support, to indicate if the system is running
on a Ryzen CPU.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/k10temp.c | 50 +++++++++++++++--------------------------
 1 file changed, 18 insertions(+), 32 deletions(-)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index b38547cd7ba3..3f37d5d81fe4 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -96,13 +96,20 @@ struct k10temp_data {
 	void (*read_tempreg)(struct pci_dev *pdev, u32 *regval);
 	int temp_offset;
 	u32 temp_adjust_mask;
-	bool show_tdie;
-	u32 show_tccd;
+	u32 show_temp;
 	u32 svi_addr[2];
+	bool is_zen;
 	bool show_current;
 	int cfactor[2];
 };
 
+#define TCTL_BIT	0
+#define TDIE_BIT	1
+#define TCCD_BIT(x)	((x) + 2)
+
+#define HAVE_TEMP(d, channel)	((d)->show_temp & BIT(channel))
+#define HAVE_TDIE(d)		HAVE_TEMP(d, TDIE_BIT)
+
 struct tctl_offset {
 	u8 model;
 	char const *id;
@@ -333,23 +340,11 @@ static umode_t k10temp_is_visible(const void *_data,
 	case hwmon_temp:
 		switch (attr) {
 		case hwmon_temp_input:
-			switch (channel) {
-			case 0:		/* Tctl */
-				break;
-			case 1:		/* Tdie */
-				if (!data->show_tdie)
-					return 0;
-				break;
-			case 2 ... 9:		/* Tccd{1-8} */
-				if (!(data->show_tccd & BIT(channel - 2)))
-					return 0;
-				break;
-			default:
+			if (!HAVE_TEMP(data, channel))
 				return 0;
-			}
 			break;
 		case hwmon_temp_max:
-			if (channel || data->show_tdie)
+			if (channel || data->is_zen)
 				return 0;
 			break;
 		case hwmon_temp_crit:
@@ -368,20 +363,9 @@ static umode_t k10temp_is_visible(const void *_data,
 				return 0;
 			break;
 		case hwmon_temp_label:
-			/* No labels if we don't show the die temperature */
-			if (!data->show_tdie)
-				return 0;
-			switch (channel) {
-			case 0:		/* Tctl */
-			case 1:		/* Tdie */
-				break;
-			case 2 ... 9:		/* Tccd{1-8} */
-				if (!(data->show_tccd & BIT(channel - 2)))
-					return 0;
-				break;
-			default:
+			/* Show temperature labels only on Zen CPUs */
+			if (!data->is_zen || !HAVE_TEMP(data, channel))
 				return 0;
-			}
 			break;
 		default:
 			return 0;
@@ -480,7 +464,7 @@ static void k10temp_init_debugfs(struct k10temp_data *data)
 	char name[32];
 
 	/* Only show debugfs data for Family 17h/18h CPUs */
-	if (!data->show_tdie)
+	if (!data->is_zen)
 		return;
 
 	scnprintf(name, sizeof(name), "k10temp-%s", pci_name(data->pdev));
@@ -546,7 +530,7 @@ static void k10temp_get_ccd_support(struct pci_dev *pdev,
 		amd_smn_read(amd_pci_dev_to_node_id(pdev),
 			     F17H_M70H_CCD_TEMP(i), &regval);
 		if (regval & F17H_M70H_CCD_TEMP_VALID)
-			data->show_tccd |= BIT(i);
+			data->show_temp |= BIT(TCCD_BIT(i));
 	}
 }
 
@@ -573,6 +557,7 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return -ENOMEM;
 
 	data->pdev = pdev;
+	data->show_temp |= BIT(TCTL_BIT);	/* Always show Tctl */
 
 	if (boot_cpu_data.x86 == 0x15 &&
 	    ((boot_cpu_data.x86_model & 0xf0) == 0x60 ||
@@ -582,7 +567,8 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	} else if (boot_cpu_data.x86 == 0x17 || boot_cpu_data.x86 == 0x18) {
 		data->temp_adjust_mask = CUR_TEMP_RANGE_SEL_MASK;
 		data->read_tempreg = read_tempreg_nb_f17;
-		data->show_tdie = true;
+		data->show_temp |= BIT(TDIE_BIT);	/* show Tdie */
+		data->is_zen = true;
 
 		switch (boot_cpu_data.x86_model) {
 		case 0x1:	/* Zen */
-- 
2.17.1

