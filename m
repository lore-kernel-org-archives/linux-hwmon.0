Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F93DC77B61
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Apr 2023 04:25:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbjDPEZn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Apr 2023 00:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbjDPEZm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Apr 2023 00:25:42 -0400
Received: from ipmail03.adl2.internode.on.net (ipmail03.adl2.internode.on.net [150.101.137.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 023542D4C
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Apr 2023 21:25:40 -0700 (PDT)
IronPort-SDR: 643b78c3_2F9B1D0oTPNsjasTbE69YPfHHiXBniVAFLCyukcUH1a9Hs/
 Uvfx1xio4ETL28FP604p5JRRcM8PfHznr9+1HLA==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2ArAACkdztkjPQc8jxaHAEBAQEBAQcBARIBAQQEAQFJg?=
 =?us-ascii?q?TMGAQELAYItgk+zYYF+DwEPAQFEBAEBhQYChTwmNQgOAQIEAQEBAQMCAwEBA?=
 =?us-ascii?q?QEBAQMBAQYBAQEBAQEGBBQBAQEBQEWFaA2GBAIBAzIBDQEBNwEPGThXBgESg?=
 =?us-ascii?q?n6CXa83gQGCCAEBBoJimmqBXgmBQQGLdIEWgzZ6Qj+BToR+gQWKAZpWgTR2g?=
 =?us-ascii?q?SAOSnKBBAIJAhFrgRAIaoF5QAINZAsOb4FJgyoEAhREDlQDCQMHBUlAAwsYD?=
 =?us-ascii?q?RY6Eyw1FCBcbC0SEgUDCxUqRwQIOAYbNBECCA8SDyxEDEI3MxMGXAEpCw4RA?=
 =?us-ascii?q?05CGWwEggoGASYknx8BWTWkSqIehAiBWZ8UTYFGp3yXdyCiEoEYhCwCCgcWg?=
 =?us-ascii?q?WQBghNNHxmDIk8DGQ+OIBcCghORUWM9AgcLAQEDCYtFAQE?=
IronPort-PHdr: A9a23:bAiebxLiQmneXPO+JdmcuVEyDhhOgF28FgQU9oFhgKhHbaqk5ZikM
 UnCo/RhylbUDs3S8fkRje3Qvuj7XHAYp4yMtXcefdlNT0oLhclMzVMpCcLXBRGkfKyzPX4xF
 p0aBlRupy7TDA==
IronPort-Data: A9a23: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
 cpU70iY0sJdGX21bb17CiSHvNpa
IronPort-HdrOrdr: A9a23:Kd6lCa4RueerDBX71gPXwBLXdLJyesId70hD6qkQc3ZomwKj9v
 xG+85rrCMd6l4qNU3I/OrtBEDuewK+yXcY2+Ys1PKZLW3bUQiTXedfBPXZsl/d8kTFn4Y36U
 4jSdkYNDSaNzhHZKjBjjVRnLsbsaG6GdiT9ILjJm9WPH1Xgr9bnnpE49mgYzZLrNgvP+tCKK
 ah
X-Talos-CUID: =?us-ascii?q?9a23=3A6q2himi3i4lfbjzxSRoOWT2/lDJuWXPZ91jacl2?=
 =?us-ascii?q?DDjhKZeGZGWDXof5Eqp87?=
X-Talos-MUID: 9a23:KZWxMQX7fR+MuADq/AHmujJ/F8E42IuvORoGwJcW58OKKBUlbg==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl2.internode.on.net with ESMTP; 16 Apr 2023 13:55:40 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 33G4PCj53415316
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 16 Apr 2023 14:25:36 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 33G4PCj53415316
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1681619136; bh=U6BktsoWzMH67w/TwPnlaIRCOv4RVUAHhIuHtUPVPf0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CZwPdFm98aEvH2ToOjyYBSYfC7fZfdKNp+JYSkb+24UMmKF33WohszdAfzuUPB7e9
         YsuoIF9uPGcS8vppAsVeHkJ7mTlPxfJOdgF+9s/8FiGezGyG/B7cinvY1yPFUdAetL
         TuNAMcxJZprr+VPG6CDodMu+DQo3cpjbD9eH42q2GDGwulI8TZGna9H38lJV5BCe0i
         PdFSM09yiYQxgmdIqJqHrnrXAiRHdjAhmivBBIQS1BAldmvmPMKm8n6nbMBYqf/HkC
         FH0NBuJ13tuW9G2Lfsnccmb8gH8hGzMuwhHMoL6646T6xwEEpOPFR3Aw9zvUUH9XuC
         7I99mSyN73J+g==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 4/4] hwmon: (it87) Disable/enable SMBus access for IT8622E chipset
Date:   Sun, 16 Apr 2023 14:25:10 +1000
Message-Id: <20230416042510.1929077-5-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230416042510.1929077-1-frank@crawford.emu.id.au>
References: <20230416042510.1929077-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 16 Apr 2023 14:25:36 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Configure the IT8622E chip to disable/re-enable access via an SMBus when
reading or writing the chip's registers.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * No change.

---
 drivers/hwmon/it87.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 2922f551b717..9b7628b2a678 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -474,6 +474,7 @@ static const struct it87_devices it87_devices[] = {
 		  | FEAT_FIVE_PWM | FEAT_IN7_INTERNAL | FEAT_PWM_FREQ2
 		  | FEAT_AVCC3 | FEAT_VIN3_5V,
 		.peci_mask = 0x07,
+		.smbus_bitmap = BIT(1) | BIT(2),
 	},
 	[it8628] = {
 		.name = "it8628",
-- 
2.39.2

