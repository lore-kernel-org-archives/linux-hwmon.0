Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0607C77B7F
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Apr 2023 11:52:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjD2Lwj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Apr 2023 07:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjD2Lwh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Apr 2023 07:52:37 -0400
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C20B21BFE
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Apr 2023 04:52:35 -0700 (PDT)
IronPort-SDR: 644d04fc_o0lfV1zJOpiWGh59bvyvKWLwB6F2qzzH6PYUHi41ZHG3t91
 Re4/m99W2hYtEsE40ze8PKWI7kRnrVUrIYugX+g==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AYAgBQBE1kjPQc8jxaHAEBAQEBAQcBARIBAQQEAQFJg?=
 =?us-ascii?q?UaCLoJPlgefXg8BDwEBRAQBAYUGAoVAJjgTAQIEAQEBAQMCAwEBAQEBAQMBA?=
 =?us-ascii?q?QYBAQEBAQEGBBQBAQEBQEWFaA2GBAIBAycLAQ0BATcBDxk4VwYBEoJ+gl2xO?=
 =?us-ascii?q?DOBAYIIAQEGgmSaaoFeCYFBjA6BFoM3ekI/gU6ED2+LBpc0gTN0gSc/b4EEA?=
 =?us-ascii?q?gkCEWuBEAhogXNAAg1kCwttgUSBRIFQBAIUQgwUXQJrGwYIFQEYAwcHAgFpA?=
 =?us-ascii?q?wkDBwVJQAMLGA0WOhEsNRQfS4ELGGMEggIGASUkmDlzAYENgXF4kkkusRWEC?=
 =?us-ascii?q?IFZnxNNgUanfZd7IKMshC0CCgcWgXqBfk0fGYMiTwMZD44gDA0JggqRUWM9A?=
 =?us-ascii?q?gcLAQEDCYtFAQE?=
IronPort-PHdr: A9a23:CYIW7BWbFxHA+cQ0V5/4ZUc+Z8jV8K3KAWYlg6HPw5pEc7i4uZ/4N
 VPR4u9hylLMQMPa57RNlrmeurrrDGoH55vJq3UeaNpWWhoClchTnhR1DsKJUx+kJffmPSBmQ
 5QQDQ039HviaRpeE56hD2A=
IronPort-Data: A9a23:O2OevK4cYnm41dKeW6klOwxRtCzDchMFZxGqfqrLsTDasY5as4F+v
 mJOWzyFPvbYNmvyfo90bo3i/RxTuJPUztBlHAprqH9jEysboMbJXouUcxqrZ3jIIpObFxpus
 csXMofNd81lHif1q0b2ONANj1ElhfnSHOaU5M0om8xVbVU5IMv0oUs7w4bVuqYx3Z7jRVnlV
 era+6X3IEWi1yN/LlUa4qeCrAIHlPnpsVv0hHRnDRx2lAa2e0c9XMp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv4+lpTWhRiro/6ZWBiuFIPM0SRqkQqShgJ70oOHKF0hXG7Ktm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVPKCSDXjCCd86HJW0TizegtDx45BtZboPlHHUBH7
 dkpBAlYO3hvh8ruqF66YuNtmt9lJ9PiI40YoH0mwDTES/cqB5neK0nIzYEAmm1s3IYUTbCEO
 5ZxhTlHNXwsZzVBIF4RC7o1hu63iH7lf3tVrU/TpKZx6nW7IAlZium8boqJJYPRLSlTtn68v
 iGZwVXUOUwxO867imad4mj2tsaayEsXX6pJTOborKQ76LGJ/UQXCRsLRR67vvy+jGagVN9Fb
 U8Z4Cwjqe417kPDZt38WQCoiGSDsxUfHsdLVes39GmlyKbZ5xiQHGUsVSNaZZots8peeNAx/
 gHR2om1X3k14PjPFS7b7audsTK5fzQNIm5EbigBCwIYizX+nG0tpi3BQMsgE/G6tYa2Qy7A3
 xGDtA0Pq4xG2KbnyJ6H1VzAhjutoL3AQQg0+hjbUwqZAuVROdDNi2uAtAiz0BpQEGqKZhza5
 yhbwpT2APQmVMzUznTVHo3hCZnzv5643CvgbUlHNqRJG96FwG+ve41BiN2VDB0xap5sldPBR
 kLM8ThW+YNTdESjaaJsC79d5ux0le26SY6gDKCRNIYSJINtfROG92dyfUGRmWvqlQ4ljMnT2
 Kt3k+7wUB726ow9l1JaotvxNpdymUgDKZv7H8yT8vhe+eP2iISpYbkEKkCSSesy8bmJpg7Ym
 /4GaZvQlE0BDrevOHSOmWL2EbzsBSVkbXwRg5EHHtNv3iI8QgnN9teLnulwKtw190irvr6Zo
 yngMqOn9LYPrSafclXQMCELhELHQY5w5XM9ISE2O1u0s0XPkq7xhJrzg6AfJOF9nNGPONYoF
 5Hpje3cW6oTItkGkhxBBaTAQHtKL0z221neYXP/MFDSvfdIHmT0xzMtRSO3nAFmM8Z9nZFWT
 2SIh1qHE6kQDR9vFtjXY/+Jxla89ypV0uFrUkeCZpEZdEzw+cI4Y2b8n90mEfEqcB/j/zq90
 xrJIBE6oeKWnZQ53uOUjo+5rqCoMdBEIGxkI0fh442bDxLqpliY/dcYUcKjXyzsa2fvyaDzO
 cRX167dNdMErnZrsq19MbRgyIxl1d6+to1xkwBuLEjWZmuSF4JQH3ii9utMv51r2bV2l1aXW
 EWO298CIpSPGprvP2AwLTofTNao9K8riBzNy88qMWP4ziNT15iWY3V4ZhWjpnRUE+poDdkD3
 +wkhv8z1yW+rRgbavC9kSFe8jW3HEwqCqkImMkTP972t1AN1FpHXJ37Dx326rGpb/FnEBEjA
 h2QtZr4q4Vs/GjwWFttKiGVxstYv4oEhz5SxlxbJ1ippMvMtsVq4DJvqwYIXiZn5TQZ9dIrI
 WV6FVxHFYPX9RdSucVzdWSNGQZAOR6nxnLM22Y5zG33c2T4V0jmDnEMBuKWzUVIr0NeZmd6+
 Z+b+kbEUBHrXsD47hEgfUtDus3TQdl7rS/BvMWZA8i+QoEISmfljpSPfksNkQPsWukqtX3Ep
 M5r3ed+UrL6PiguuJ8GC5GW+LATaRKcLklQaKhF0IJTOE+EYxC0+zyFC37pS/N3P/aQrHOJU
 Z1/FPxARzGV9XiorAlCIYUuPrUtvvoixORaS4PRPWRc7oeu9Gt4gqnxqBr7qnQgGeh1sMAHL
 YjUSTKOP0qQiVZQmE7PtMN0AXW5U/ZVeDzD2P2Jz8tRG6IhqO1MdWQA4omwtViRMypl+Euah
 xOcRqn0y+c5959gsbGxGYp+BiK1C+jJasK2zC6Jve5zMOz/afX1i1tNq33MHRhnAr8KatEmy
 ZWPqIHW2W3GjpYXUkfYuZuKEocS18DjTdh8b8b9HERHlBS7Rf7c3hon0EK7IKxvj9lyyJSGR
 Qy5Sc3obv8TeY5X60N0YhhkMSQ2KvrIfIL/gxiivtKOIBQ5+i7WHuONrHPGQzlSSX4VBsfYF
 ATxhceL2vlZi4Z9XDk/GPBsBs5DEm/JAKcJWYX4imiFMzOOnFiHh7rFkCgg4xHtDl2vMp7zw
 bDBdyjEWCWCgoP65/AHjNUqpTwSNmh3vscodEFE+9JWtSGzPFRbEcsja6c5GrNmuQ2s8qGha
 D/0OT5oTW23WDlfahzz7ejyRgrVVKREJt79ISdv5E+OLTu/AISbGrZ66yN8+DFMdyD+yP28Y
 8QrkpEq0sNdHrkyLQrL2sGGvA==
IronPort-HdrOrdr: A9a23:YEqTMa9u2+behhOH/Dduk+ACI+orL9Y04lQ7vn2ZKSY+TiVXra
 GTdZMgpGbJYFR4YhwdcLW7VJVoLkmslqKdjbN/AV7mZniDhILKFvAF0WKd+UyDJ8SWzIc0vp
 uIMZIOb+EYZmIbsS+V2meF+1lM+qj+zEnRv5a68550d3AXV0h/1XYFNu9FKDwMeOGWbaBJbq
 ah2g==
X-Talos-CUID: 9a23:cfO4oWyqTS/nLVVIiI0YBgUrFM44MX6Cw0yLYBWnOXpIQaWweHOprfY=
X-Talos-MUID: 9a23:sX2YaQiIlhuJ+x1yUa6bfcMpDONwoPuQOW02zL4Jqe3HaTRgIW2tpWHi
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 29 Apr 2023 21:22:29 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 33TBq71G3093879
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 29 Apr 2023 21:52:22 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 33TBq71G3093879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1682769143; bh=ld54a3dnRE0d4ymq1ttpoiuT3UQaVnk8L6QFCH9fTHo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XGHQlfugCZJBbxCMfNkenn3+5p4opBEuRdlE2Lz8uGo5L3A4rLh8M4fRFsZm4bnmh
         080lB32Sb8A/Irkj1znrrw4GeKKJMyj16zQ4VAZODTCneTJ0CX49CChaRVDpDDa4HA
         Z/Bg/v9U0b6av3ZbI926V7WB2DR7+C3pZzcPHaZ4dfXhWzrIOFhXJtESgf50pP2Wa1
         jVIuUwe6M/N47gpuBroMcHDqE45zFk3w3umJtM0CWjvW5jkKvTTraru3RlcMzTjCFf
         LA83BkRaDZefUpbS6jGuVt8tPhvl/+UdzP972ArquvNkxP4QSvTsdmYBYmTY0OgMKq
         u7mwsa6oCFiHA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 1/3] hwmon: (it87) Add controls for chips with only 4 fans
Date:   Sat, 29 Apr 2023 21:52:03 +1000
Message-Id: <20230429115205.1547251-2-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230429115205.1547251-1-frank@crawford.emu.id.au>
References: <20230429115205.1547251-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 29 Apr 2023 21:52:23 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add feature and support for chips with only 4 fans.

Reorder macro definitions to bring all fan definitions together.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index eb38f54ebeb6..bd9a24942e70 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -317,6 +317,7 @@ struct it87_devices {
  * chips to avoid the problem.
  */
 #define FEAT_CONF_NOEXIT	BIT(19)	/* Chip should not exit conf mode */
+#define FEAT_FOUR_FANS		BIT(20)	/* Supports four fans */
 
 static const struct it87_devices it87_devices[] = {
 	[it87] = {
@@ -508,11 +509,14 @@ static const struct it87_devices it87_devices[] = {
 				(((data)->features & FEAT_TEMP_OLD_PECI) && \
 				 ((data)->old_peci_mask & BIT(nr)))
 #define has_fan16_config(data)	((data)->features & FEAT_FAN16_CONFIG)
+#define has_four_fans(data)	((data)->features & (FEAT_FOUR_FANS | \
+						     FEAT_FIVE_FANS | \
+						     FEAT_SIX_FANS))
 #define has_five_fans(data)	((data)->features & (FEAT_FIVE_FANS | \
 						     FEAT_SIX_FANS))
+#define has_six_fans(data)	((data)->features & FEAT_SIX_FANS)
 #define has_vid(data)		((data)->features & FEAT_VID)
 #define has_in7_internal(data)	((data)->features & FEAT_IN7_INTERNAL)
-#define has_six_fans(data)	((data)->features & FEAT_SIX_FANS)
 #define has_avcc3(data)		((data)->features & FEAT_AVCC3)
 #define has_five_pwm(data)	((data)->features & (FEAT_FIVE_PWM \
 						     | FEAT_SIX_PWM))
@@ -3169,16 +3173,14 @@ static void it87_init_device(struct platform_device *pdev)
 	it87_check_tachometers_16bit_mode(pdev);
 
 	/* Check for additional fans */
-	if (has_five_fans(data)) {
-		tmp = it87_read_value(data, IT87_REG_FAN_16BIT);
-
-		if (tmp & BIT(4))
-			data->has_fan |= BIT(3); /* fan4 enabled */
-		if (tmp & BIT(5))
-			data->has_fan |= BIT(4); /* fan5 enabled */
-		if (has_six_fans(data) && (tmp & BIT(2)))
-			data->has_fan |= BIT(5); /* fan6 enabled */
-	}
+	tmp = it87_read_value(data, IT87_REG_FAN_16BIT);
+
+	if (has_four_fans(data) && (tmp & BIT(4)))
+		data->has_fan |= BIT(3); /* fan4 enabled */
+	if (has_five_fans(data) && (tmp & BIT(5)))
+		data->has_fan |= BIT(4); /* fan5 enabled */
+	if (has_six_fans(data) && (tmp & BIT(2)))
+		data->has_fan |= BIT(5); /* fan6 enabled */
 
 	/* Fan input pins may be used for alternative functions */
 	data->has_fan &= ~sio_data->skip_fan;
-- 
2.40.0

