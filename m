Return-Path: <SRS0=CoSo=SD=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38FAC4360F
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C0ABB2133D
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Apr 2019 16:19:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qg4hJJxs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728359AbfDAQTs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Apr 2019 12:19:48 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45051 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726854AbfDAQTs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Apr 2019 12:19:48 -0400
Received: by mail-pg1-f194.google.com with SMTP id i2so5005112pgj.11
        for <linux-hwmon@vger.kernel.org>; Mon, 01 Apr 2019 09:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=drLO5uVWcb+ywgpBK5n9qgEDkhgSyQmoetIy0hFNmlY=;
        b=Qg4hJJxsQFOz6eZcoSYQzL+oKXrCg7EqRT5T1qgTu/x7HE17VXENi05/c1Bt7LDKj7
         //lHJPm4mn6KjL20RjGLOoJ565Qan8bMBDOZF9UL9ElSDPtDx0ZcBJZYxKa4+96cYQhU
         E/y4TfhJRmMICLkSMS10vDnMSrP3U5ceB92LxI0Sirc2DK0FNn26CtUlY1i6ZUfUb8xc
         avt6wNZ35n0VUS72pawBiWr4FOGlub3wJKJJTL670y+6fqR/mXiFVMp8wV15FsRGlOUf
         vyC6ky75QvMvNMrXVH0L2tiSWjhcQVUlX4D3XPUDwC3FecrEo2+HEDLj/jvuzztTNEnj
         Fq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=drLO5uVWcb+ywgpBK5n9qgEDkhgSyQmoetIy0hFNmlY=;
        b=KUeMyNYi6/4s4DtOC+9nCDe8OEWbiUZjK9LAOTeZuDoJ93Uw8MSzIRjJN+5Wh3ii9M
         HKUGWjTeoD4J7QDXifj8rpXQhHWd0iaDXJrNBtMy4OQxjupvUgrY57svhY+5KmcAeuwl
         L/YhgxNBIfzPs2u6wmaf0dDVJtA06zk2/ir7BctgbOVz5YoXMbpjenj4hTEKMUwhgTd8
         Nhz3F2o8oYX54VD/UQuy7O0dMqABgLf7u78MH10vvELYwk/v9iGbg4yPIiBA6/Ctvu3i
         cmyWn0iLMLjobTRJPh2sg/PY9L0JUvWscUiVH/CV++KdPY+ygaGjxjqP7EOu6RRjQnl6
         Q7Uw==
X-Gm-Message-State: APjAAAXdZNb+3EmrRv3JSNzEpssQgc9x/wLlPYjN31uf+ZWiWudlRMPe
        Bv6egBo4Xs8ojztgC2cAVMFFG0Ji
X-Google-Smtp-Source: APXvYqz9FyGcpmGDmTiESNZsTHGEBCyT9HGlCv4wHMePsOXfM7BzRxFF1+fRTN+hHLr6FzKk2v9aYA==
X-Received: by 2002:a63:751d:: with SMTP id q29mr25670996pgc.215.1554135587533;
        Mon, 01 Apr 2019 09:19:47 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q87sm17969101pfa.133.2019.04.01.09.19.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2019 09:19:46 -0700 (PDT)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 03/17] hwmon: (jc42) Use HWMON_CHANNEL_INFO macro
Date:   Mon,  1 Apr 2019 09:19:23 -0700
Message-Id: <1554135577-11889-4-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554135577-11889-1-git-send-email-linux@roeck-us.net>
References: <1554135577-11889-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The HWMON_CHANNEL_INFO macro simplifies the code, reduces the likelihood
of errors, and makes the code easier to read.

The conversion was done automatically with coccinelle. The semantic patch
used to make this change is as follows.

@r@
initializer list elements;
identifier i;
@@

-u32 i[] = {
-  elements,
-  0
-};

@s@
identifier r.i,j,ty;
@@

-struct hwmon_channel_info j = {
-       .type = ty,
-       .config = i,
-};

@script:ocaml t@
ty << s.ty;
elements << r.elements;
shorter;
elems;
@@

shorter :=
   make_ident (List.hd(List.rev (Str.split (Str.regexp "_") ty)));
elems :=
   make_ident
    (String.concat ","
     (List.map (fun x -> Printf.sprintf "\n\t\t\t   %s" x)
       (Str.split (Str.regexp " , ") elements)))

@@
identifier s.j,t.shorter;
identifier t.elems;
@@

- &j
+ HWMON_CHANNEL_INFO(shorter,elems)

This patch does not introduce functional changes. Many thanks to
Julia Lawall for providing the semantic patch.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/jc42.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
index 4fa482ae0eb5..6b57a6d4e626 100644
--- a/drivers/hwmon/jc42.c
+++ b/drivers/hwmon/jc42.c
@@ -451,20 +451,12 @@ static int jc42_detect(struct i2c_client *client, struct i2c_board_info *info)
 	return -ENODEV;
 }
 
-static const u32 jc42_temp_config[] = {
-	HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX | HWMON_T_CRIT |
-	HWMON_T_MAX_HYST | HWMON_T_CRIT_HYST |
-	HWMON_T_MIN_ALARM | HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM,
-	0
-};
-
-static const struct hwmon_channel_info jc42_temp = {
-	.type = hwmon_temp,
-	.config = jc42_temp_config,
-};
-
 static const struct hwmon_channel_info *jc42_info[] = {
-	&jc42_temp,
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_MIN | HWMON_T_MAX |
+			   HWMON_T_CRIT | HWMON_T_MAX_HYST |
+			   HWMON_T_CRIT_HYST | HWMON_T_MIN_ALARM |
+			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM),
 	NULL
 };
 
-- 
2.7.4

