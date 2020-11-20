Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2BDC6379D
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 Nov 2020 01:03:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B6D1221FC
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 Nov 2020 01:03:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdFSbcbx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgKTBDc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 19 Nov 2020 20:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgKTBDb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 19 Nov 2020 20:03:31 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E889FC0613CF;
        Thu, 19 Nov 2020 17:03:31 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id 18so3934765pli.13;
        Thu, 19 Nov 2020 17:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bPCMPJxJWTMvBrVkME/ryiL/OXocxj1MZvKWXxVItBY=;
        b=RdFSbcbxkLQtLxjILInvToXaswIDLhPnbN+w0IuneXnRSeJNOgABy8GWbRNutWwOaN
         jl96fb5Lrwu6/u/jeqvCTZvJUFbvSsDPD3FnqeDushbW8G4IRpT5CzoBSI03fHdvaISL
         krnLtdFm+CoNyTOH7eFso8g3riJ0HWkJ6aPzrIxe3pjeg4wtPoy88IHQdlv2eQK8/Yu9
         fkyR+A/2LILxQQw0vvItnQpWlpHiGdXQKE+tIAH7ib4tbl4YGOCIeJzOyzRKd0Nu3BD7
         BmCtLxM8YduwEvD6ItrBpXL5V61ulAls5MTpJYD4fBHpoeBnAklize24HQrwrMxfuPRk
         HOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=bPCMPJxJWTMvBrVkME/ryiL/OXocxj1MZvKWXxVItBY=;
        b=VjDSf4JeoDxhqzLPDaNZhB3W1CUC+Y8tCv2EouCKbmQ4HiDHBKkYVlEupBH/q35vxi
         3GurVxqnYaNr3ciNwFEl9IDNLNiDiIgh2r/hsNbAt6ru7OSnE/TLl35SzFghdQxO3Dzo
         u9Rlbc/bpEAbscytG8mAnEEA20ZWA79DnpBwBqKMGUlQGF4byqF+kMlCPKRDrLtGrvCm
         d/DOONH+HdjFzVNBbzlwxct/sCnblUOT253VBVk0JI6n05t6H5ZkxyWY1c5Ldp7592eM
         687b2MPuAMNvGOKQzSfRURo9ekXBjvepNBsuEt10j9s+RlAenjNwNiYHoUREuyFg7s1+
         0ahA==
X-Gm-Message-State: AOAM530LIDLLjBYnlcvmJhi/n6WpFfkszkaHL2TRbM8l1JljYPRztZKr
        zTJ7uhJmwiHtHEqYR8uyNr0=
X-Google-Smtp-Source: ABdhPJyoGVfH+08lztkdXxxHdwG9qeOlbCbfTxIP+RscewcyF2RcFftxTzk6mw/Z/c/AX4fOUVCgyQ==
X-Received: by 2002:a17:902:e9c4:b029:d6:d5d6:c288 with SMTP id 4-20020a170902e9c4b02900d6d5d6c288mr11446039plk.22.1605834211452;
        Thu, 19 Nov 2020 17:03:31 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id q14sm1205273pfl.163.2020.11.19.17.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 17:03:30 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Rob Herring <robh+dt@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-fsi@lists.ozlabs.org
Subject: [PATCH v2 1/3] dt-bindings: fsi: Add P10 OCC device documentation
Date:   Fri, 20 Nov 2020 11:33:13 +1030
Message-Id: <20201120010315.190737-2-joel@jms.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120010315.190737-1-joel@jms.id.au>
References: <20201120010315.190737-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Eddie James <eajames@linux.ibm.com>

Add the P10 compatible string.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
index 99ca9862a586..e73358075a90 100644
--- a/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
+++ b/Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt
@@ -1,13 +1,13 @@
-Device-tree bindings for FSI-attached POWER9 On-Chip Controller (OCC)
----------------------------------------------------------------------
+Device-tree bindings for FSI-attached POWER9/POWER10 On-Chip Controller (OCC)
+-----------------------------------------------------------------------------
 
-This is the binding for the P9 On-Chip Controller accessed over FSI from a
-service processor. See fsi.txt for details on bindings for FSI slave and CFAM
+This is the binding for the P9 or P10 On-Chip Controller accessed over FSI from
+a service processor. See fsi.txt for details on bindings for FSI slave and CFAM
 nodes. The OCC is not an FSI slave device itself, rather it is accessed
-through the SBE fifo.
+through the SBE FIFO.
 
 Required properties:
- - compatible = "ibm,p9-occ"
+ - compatible = "ibm,p9-occ" or "ibm,p10-occ"
 
 Examples:
 
-- 
2.29.2

