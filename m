Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88910C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 May 2022 19:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358229AbiELT4X (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 May 2022 15:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358245AbiELT4J (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 May 2022 15:56:09 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCBA7140BC
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 12:56:08 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-ed8a3962f8so7990182fac.4
        for <linux-hwmon@vger.kernel.org>; Thu, 12 May 2022 12:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cd+h87gX/veAFTDZHlQQNLwWHMU8bPEDP+4w2pLzdMY=;
        b=RBKMQmeNrhQPIOWV/OfxJnKQRdqFcf8eABu0dwOy6Xi8o8EZLwyH4K/kUqrVTEJweY
         mUOzYEqxdYvQncGKstpfWUZtdfUBuCbK4Q+6U/IA+OTtAXr0q1HsqJ3mvZdh6T6xc/58
         K3cOVSURG+NPu1TPpKUsy8LclNB2JDVAq9OmCWvpIg0EuaMWW2KlgwSO9/czFIP+hxWj
         LIimgdLZQqLOqwm4/O0+PAEiqWs7oULdnyCVZoVZSb49bg44q0ZCUZlQfaEhkE21kSMM
         BZl9WGrx4eZe/XjzS2JrA6Gy8zvec6SASf3Is82QHU1rbbhhSaSb8lAe59fYJLLq5u60
         ChSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=cd+h87gX/veAFTDZHlQQNLwWHMU8bPEDP+4w2pLzdMY=;
        b=SaqVnZvJMHDklA3K77oac4XpYcNZISqkblDtBSgLrrI+COHtYy3pbJybnHevzfRWYK
         ooE8shiVcAOTLWL30x0hPJVxL4hJ5poZkZH2o2J5w9fJiih+b/P5hb5LYem7LBPxKX3K
         n1GWWqK7gYQEB2/uq3wCtAJpmmN3Es6lNjo+uMrynUTsKCov7RcqI0Gz14tBCczperLe
         p+qGTXsZMVo/GuuS4Tw4+/hq1CnLxmZPXBehF81VLr4/LOYxTjciBnGaM8hcKZDs8Bfy
         LSZm5fZfTUw2RZAbdkW6GTV1mZT4z6FMMjxa+cYwj5T2EfxfO2wCaVoXNnvK30Ronn70
         bRhQ==
X-Gm-Message-State: AOAM533c9tvCBRxA+N/WgY+SlpDpjnmddWc3Toj/IM7WAgRwzvG3xQqW
        s5YFLGFf+LiXYqwEsMoF2SQXmRWnmvXmWg==
X-Google-Smtp-Source: ABdhPJxi08YnPVMLvXr1ow0i6hz9Uvu80qsVfuzn5L15gMuMvSBYcH2xqdmBJwOjBbJRR+VMULCKsw==
X-Received: by 2002:a05:6870:418a:b0:e9:75e:1d80 with SMTP id y10-20020a056870418a00b000e9075e1d80mr820263oac.66.1652385367921;
        Thu, 12 May 2022 12:56:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f137-20020a4a588f000000b0035eb4e5a6d3sm217223oob.41.2022.05.12.12.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 12:56:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Iwona Winiarska <iwona.winiarska@intel.com>
Subject: [PATCH 5/7] hwmon: (peci/dimmtemp) Use HWMON_CHANNEL_INFO macro
Date:   Thu, 12 May 2022 12:55:54 -0700
Message-Id: <20220512195556.137741-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512195556.137741-1-linux@roeck-us.net>
References: <20220512195556.137741-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The HWMON_CHANNEL_INFO macro simplifies the code, reduces the likelihood
of errors, and makes the code easier to read.

The conversion was done automatically with coccinelle. The semantic patch
used to make this change is as follows.

@s@
identifier i,j,ty;
@@

-struct hwmon_channel_info j = {
-       .type = ty,
-       .config = i,
-};

@r@
initializer list elements;
identifier s.i;
@@

-u32 i[] = {
-  elements,
-  0
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
Julia Lawall for providing the coccinelle script.

Cc: Iwona Winiarska <iwona.winiarska@intel.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/peci/dimmtemp.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
index 96b9919db357..3c71b5546bcb 100644
--- a/drivers/hwmon/peci/dimmtemp.c
+++ b/drivers/hwmon/peci/dimmtemp.c
@@ -300,18 +300,10 @@ static int create_dimm_temp_label(struct peci_dimmtemp *priv, int chan)
 	return 0;
 }
 
-static const u32 peci_dimmtemp_temp_channel_config[] = {
-	[0 ... DIMM_NUMS_MAX - 1] = HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT,
-	0
-};
-
-static const struct hwmon_channel_info peci_dimmtemp_temp_channel = {
-	.type = hwmon_temp,
-	.config = peci_dimmtemp_temp_channel_config,
-};
-
 static const struct hwmon_channel_info *peci_dimmtemp_temp_info[] = {
-	&peci_dimmtemp_temp_channel,
+	HWMON_CHANNEL_INFO(temp,
+			   [0 ... DIMM_NUMS_MAX - 1] = HWMON_T_LABEL |
+				HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT),
 	NULL
 };
 
-- 
2.35.1

