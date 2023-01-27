Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076CFC54EAA
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Jan 2023 04:41:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjA0Elt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Jan 2023 23:41:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjA0Els (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Jan 2023 23:41:48 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 76A034FAE0
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2023 20:41:47 -0800 (PST)
IronPort-SDR: fQD5KurEoNn8pqXkbKe8GiN4T0WwIRuefuSTvDfCy+vogfsVeY1d97pWtuvZAvBsLghArrDRG2
 9A+422hK2XUrfi9lNYPcPx7L9NPqQ3EWxdZElT4PKaR35Ka5JqjZ8fm8iqAI/V69te+ucVjHe0
 GEX+i1AnZh7wcLXNhmSDEOQJVTT+4jkTz1vu1ma9uKtYUWOp8iZkNlamsTLGKzsZWgmKyDtqAU
 C5jjVRe88bHZWxbLsrgzB9R+L+NIWTJX0StgNmm3vq+YtIWCdnK/qhzhXWnmw5XMAG8zN0fzk+
 igGVI6L6u/3cE1/Sj/jP8bHs
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2B2AACKVdNj//Qc8jxaHAEBAQEBAQcBARIBAQQEAQFJg?=
 =?us-ascii?q?TMGAQELAYIsgmCzLYF+DwEPAQFEBAEBhQcChSMmNQgOAQIEAQEBAQMCAwEBA?=
 =?us-ascii?q?QEBAQMBAQYBAQEBAQEGBIEqBwtSBwtYBweBQQuBYRMLAzENhlYCAQMnCwENA?=
 =?us-ascii?q?QE3AQ8ZOFcGARKCfoMjq2kzgQGCCAEBBoJimmeBXgmBQAGLYIEUgzd6Qz+BT?=
 =?us-ascii?q?oR9iwObXgqBOXiBJQ5MeoEPAgkCEXRZAwkDBwVJQAMLGA0WMgoTLDULC0oQG?=
 =?us-ascii?q?xobB4EGKigVAwQEAwIGEwMiAg0oMRQEKRMNJyZpCQIDImIDAwQoLQk/ByYkP?=
 =?us-ascii?q?AdWNwYCDx83BgMJAwIfT3EvEhIFAwsVKkcECDYFBhw2EgIIDxIPLEQOQjc0E?=
 =?us-ascii?q?wZcASkLDhEDUEcZbgSCEQYpJp4xCHKBDoEngRjDWIN8gVKefUyBRKdmLZcgI?=
 =?us-ascii?q?KMchCsCCgcWgWQBghJNHxmDIk8BAgEBAQ0BAgEBAwECAQEBCQEBAQGOHYIsk?=
 =?us-ascii?q?UthOwIHCwEBAwmMIwEB?=
IronPort-PHdr: A9a23:oI+OqhE35+lu+7mCaCKPGZ1GfhYY04WdBeZdwpAml6kIeb6q4JrlJ
 kCZ6PBwyl7FG4zGuLpNkeGDtafmVCQb5IqZ9moPdZtQWloEkZAYkwB6UpGMAEGpIKK1P35jT
 pZJXgY9rXqwaRc9JQ==
IronPort-Data: A9a23:yA1+x69cewy+dLlseBZ5DrUDpHiTJUtcMsCJ2f8bNWPcYEJGY0x3x
 zAYD2/QPfrZZ2ryLt9zaYW/9h8EvcDRnIBiQQtqrygwRCMTp5DMDImQcBmrZ33NfpafHEhqs
 csUY9WZfJw4FFbR90ynWlTDhSAsjfvSGtIQKwJl1gRZH1IMpPIJ0Eo78wIBqtc0x4D/WWthg
 PuqyyHlEAbNNwNcawr41YrT8HuDg9yq0N8olgRWiSdj4TcyP1FMZH4uDfnZw0nQG+G4LcbmL
 wr394xVy0uCl/sb5nJJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwZG8P4whlkeydx
 /0Xv82PGAwDJZTBlbswURB9M2JRN79vreqvzXiX6aR/zmXMcmf3hf50BV44OpcUvOtyHCdP+
 boRNVjhbDjd36TsnOj9ELkq3Jh/RCXoFNp3VnVIwyvQC/UOSorKXKvN/9Me0TItwMFCW//DD
 yYcQWYzNEWdPkIUaj/7DrphnsKDhHX0NAEIgwOWgJFwxzHRzlxYhe2F3N39IYTRFZ8Pzy50v
 Fnu+2X/HwFfNMOazjyt7H2hnKnMkDn9VYZUE6e3ntZugVuO1kQJDxAdVh6mur+/h1LWc9BTJ
 kgK8zAjhbMv70HtRd74NyBUu1ba5ltGB4AVSb1/sl3RjLHI6hqYDS4YVjFALtchsYk/WFTGy
 2NlgfuzD21Q4ba/UkuQ++i5rzqXGWs6J30rMHpsoRQ+3/Hvp4Q6jxTqR9llEbKogtCdJd0W6
 23axMTZr+tO5fPnx5lX7niC2Gn8+cGVJuIhzlyKBzj9tl0RiJuNPdTA1LTN0RpXBK+kJrVrl
 EMVl86T/Yji5rnXzHTVKAnhNJek+L6+NyDAgRZQFp0s7FyQF5OLI9gVum0kYR05d5xYJXnyf
 EbPuAgX+IdcPT2haqoxap/Z5yUWIUrISYiNuhP8NIEmjn1NmOivpn8GWKJo9zqx+HXAaIlmU
 XpbGO71ZZrgNYxpzSCtW8AW2qIxyyY1yAv7HM6kk0v6jurFPCXNFd/p1WdiiMhkvMtoRy2Lr
 r5i2zeikUQ3vBDWOHaMqNVLfTjm01BmVMus8KS7idJv0iI9QDpxUaWAqV/QU5B9kOxUkPvF5
 HewRidlJKnX2xX6xMTjQi4LVY4Dqr4m9S9hYnN2YAjxs5XhCK72hJoim1IMVeFP3IReITRcF
 pHpou2MXaZCTCrp4TMYYcWvpYBubk371wmUNjWrZyIzOZNlWkrI9pntY1K3piUJCyO2s+o4o
 qGhj12EG8BbHVk6UsuGOuiyy16RvGQGnLwgVUX/Iu5VJBfm/r91en74gfIAKs0RLQnOm2mB3
 AGMDBZG+eTA+tdn8NTAia2egZ2uFu9yQhhTE2XBtObkPjPT4WSk24MGXeOVOzHREmrpof3wa
 eJQxvD6EfsGgFcT7dUmSe4xkPpg6oK29bFAzwliEHHaVHiRC+ttciucwM1ClqxR3bsH6wG4b
 UK4/IUIM7u+J5K3GVEcEwMpc+Cf2KxGgTLV9/k0fhn36SIrrrqKVUJeY0uFhCBHduAnOoI52
 qEqoscJ5QulhlwnN8vAjywS/nnVdi4MVKAut5c7Bo73i1N1lQsYOcaBUnH7sMOVdtFBEkg2O
 TvK1qDMsLRrwBaQeXQECimf1OVQsp0CpRRWwQJQPF+OgNfE2KM60UED6zgxVQgJnBxL3/goY
 Do1bwgvef/LpWct3pQfGXuwEh1AD1uF4kPwjVAOkSvQUhDwBGDKKWQ8P8eL/VwYqjwDJGIDp
 uzAlmu1Ayz3eMzR3zcpXRI3ofLUS40j/wLPr8mrAsCZEsRoejHimKKvOzYFphaP7RndX6EbS
 TSGJNpNVJA=
IronPort-HdrOrdr: A9a23:J3k5vKMB7pZR7MBcThujsMiBIKoaSvp037BK7SpMoNJuE/Bw8P
 re5cjyt3fP5Qr5PUtNpTnuAtjifZqxz/FICMwqTNOftWrdyQ2Vxf9ZnOnfKlTbckWUygce79
 YGT0EUMr3N5DZB4/oTb2SDYq4dKaG8gcWVbP/lvgtQpB9RGtxdBthCe32m+pwffng9OaYE
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 27 Jan 2023 15:11:46 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30R4fIgh2462776
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 27 Jan 2023 15:41:42 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30R4fIgh2462776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674794502; bh=tHTaC3/BOiYHzi0C4LYaHzvtV14rs05GmxHMecgape8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eyhUIfhMtjcYl1vDhEAX/T1i0gGgJksMaiyN8fi5W7EqwBqrEm5ejMBLABDOQo21N
         q2nk68RLP9upQHf7Ydlcv4W0P7n34XdOZp/6xaSF5mpkRTYbdIZa5+z2o3OlKGV1Tp
         awupadvmi01BJTdCoGZhuChs9/NUIHbLFAyqcefF5FOfinuVnSQlSrQdrHE+iTDRqg
         Z7bkqtkey7uCwzIX/tNZMWx3Hfsem0EJM2lo9RPTQ6xYgR0P+BF9ARgGVfT9vifOOa
         +5RLGFu+FPE0lWGSaAReF576suCQ9edgHfb0thtYEQ25/MIDwTx5QCQtfIbeckrQQc
         zKhozeaMYUk8g==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 4/7] hwmon: (it87) Add chip_id in some info message
Date:   Fri, 27 Jan 2023 15:41:13 +1100
Message-Id: <20230127044116.1257799-5-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127044116.1257799-1-frank@crawford.emu.id.au>
References: <20230127044116.1257799-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Fri, 27 Jan 2023 15:41:42 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

In cases where there are multiple chips, print out which chip is
referred to, in the informational message.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * Improved chip description following review.

---
 drivers/hwmon/it87.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 9295391e4c55..61a1a2c643ed 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -2503,13 +2503,15 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 
 	superio_select(sioaddr, PME);
 	if (!(superio_inb(sioaddr, IT87_ACT_REG) & 0x01)) {
-		pr_info("Device not activated, skipping\n");
+		pr_info("Device (chip %s ioreg 0x%x) not activated, skipping\n",
+			config->model, sioaddr);
 		goto exit;
 	}
 
 	*address = superio_inw(sioaddr, IT87_BASE_REG) & ~(IT87_EXTENT - 1);
 	if (*address == 0) {
-		pr_info("Base address not set, skipping\n");
+		pr_info("Base address not set (chip %s ioreg 0x%x), skipping\n",
+			config->model, sioaddr);
 		goto exit;
 	}
 
-- 
2.39.1

