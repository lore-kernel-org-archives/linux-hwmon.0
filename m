Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD81C0015E
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Jul 2023 12:30:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbjGGMav (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Jul 2023 08:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232151AbjGGMat (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Jul 2023 08:30:49 -0400
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5FDEC1FE6
        for <linux-hwmon@vger.kernel.org>; Fri,  7 Jul 2023 05:30:46 -0700 (PDT)
IronPort-SDR: 64a80565_92LQFesX7kbcdCy7AWv5J69SbIpLlyR9Qbpb4NThCiK5fO7
 EBpUhTU7ygLLTCzm7bYR/xHeFCEiASrYQnBvEfA==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2C5AAASBahkjPQc8jxaHQEBAQEJARIBBQUBSYE1BQELA?=
 =?us-ascii?q?YIyglG2Hw8BDwEBRAQBAYUGAoYVJjcGDgECBAEBAQEDAgMBAQEBAQEDAQEGA?=
 =?us-ascii?q?QEBAQEBBgQUAQEBAUBFhWgNhgUCAQMnCwENAQE3AQ8ZOFcGARKCfoJdqWMzg?=
 =?us-ascii?q?QGCCQEBBoJlrjGBXwmBQgGMH4EZgzt6Qj+BToEVgTyBPm+LBo4ghV0HMo0Ug?=
 =?us-ascii?q?SdvgR43Z3oCCQIRZ4EICF+Bbj4CDVQLC2OBHIEqgSQCAhE6FFNfGR0DBwOBB?=
 =?us-ascii?q?RAvBwQyJgYJGC8lBlEHFxYkCRMVQQSDWAqBCz8VDhGCVyICBzY8G02CagkXQ?=
 =?us-ascii?q?1OBARAxBBQeQAMJAwcFSUADCxgNSxEsNRQbSYEHF2OBbgokJKV/B1o0gSeBG?=
 =?us-ascii?q?JMpsWWEFYFdnyRNgUqoD5glIKNGhC8CCgcWgXmBf00fGYMiTwMZD44gGR6Bd?=
 =?us-ascii?q?5FRYzsCBwsBAQMJi0gBAQ?=
IronPort-PHdr: A9a23:ZlwPnxTrt/gup7KP6VaRaP+hItpso4vLVj580XJvo7hPbr/l9I7rI
 0LY//krgVrUG4TXrftZ2KLfqau1X2sG7N6atWwaNoZBUhgZhIAXh1kuDMLfWxLyJfK4Y3BlT
 JYbBg1u9SjjY0NeQJmWWg==
IronPort-Data: A9a23:Do/39K5tQ2kMh8ku6JqXSAxRtCzDchMFZxGqfqrLsTDasY5as4F+v
 jMXUW2Bb62CZmHxL4h1PYmx9EkFvpPcytFgHgZtqys2EiIW9JvLDoXCdR+pZXnNdZHNFEg34
 pRGOoaac51oEXT1q0b2ONANj1ElhfnSHOaU5M0om8xVbVU5IMv0oUs7w4bVuqYx3Z7jRVnlV
 era+6X3IEWi1yN/LlUa4qeCrAIHlPnpsVv0hHRnDRx2lAa2e0c9XMp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv4+lpTWhRiro/6ZWBiuFIPM0SRqkQqShgJ70oOHKF0hXG7Ktm+t4sZJ
 N1l7fRcQOqyV0HGsLx1vxJwS0mSMUDakVPKCSDXjCCd86HJW0Oz+/ItB087B6MVo8InXVtl2
 M0GET9YO3hvh8ruqF66YuNtmt9lJ9PiI40YoH0mwDTES/cqB5neK0nIzYEAmm1s3IYUTbCEO
 5ZxhTlHNXwsZzVBIF4RC7o1hu63iH7lf3tVrU/TpKZx6nW7IAlZjOW1bISIK4XULSlTtlnGn
 1L0om7bODBEEd2t0GKmy0+JwcaayEsXX6pJTOborKQ76LGJ/UQXCRsLRR67vvy+jGagVN9Fb
 U8Z4Cwjqe417kPDZt38WQCoiGSDsxUfHsdLVes39GmlyKbZ5xiQHGUsVSNaZZots8peeNAx/
 gHR2om1X3k14PjPFS7b7audsTK5fzQNIm5EbigBCwIYizX+nG0tpiqQdtEgG6C4tPP4QBWgn
 wqhgRkgvrpG2KbnyJ6H1VzAhjutoL3AQQg0+hjbUwqZAuVROd7Ni2uAtAiz0BpQEGqKZhza5
 yhbwpT2APQmVMzUznTVHo3hCZnwv5643CvgbUlHNqRJG96FwG+ve41BiN2VDB0xap5sldPBR
 kLM8ThW+YNTdESjaaJsC79d5ux0le26SY6gDKCRNIYSJINtfROG92dyfUGRmWvqlQ4ljMnT2
 Kt3k+7wUR726ow9l1JaotvxNpdymUgDKZv7H8yT8vhe+eP2iISpYbkEKkCSSesy8bmJpg7Ym
 /4GaZvalUsPCralOHKGmWL2EbzsBSVrbXwRg5EGHtNv3iI8QwnN9teLnuh4K9w190irvr6Xp
 SrtMqOn9LYPrSafclXQMCELhELHQY5w5XM9ISE2O1u0s0XPkq7xhJrzg6AfJOF9nNGPONYoF
 5Hpje3cW6oTItkGkhxBBaTAQHtKL0r13FrTYnL6PFDSvfdIHmT0xzMtRSO3nAFmM8Z9nZdWT
 2SIh1qHE6kQDR9vFtjXY/+Jxla89ypV0uFrUkeCZpEZdEzw+cI4Y2b8n90mEfEqcB/j/zq90
 xrJIBE6oeKWnZQ53uOUjo+5rqCoMdBEIGxkI0fh442bCwzm70u44IoZUO+3bTHXD2z136O5Z
 NRq9fL3MdxZvVNoq4ZcNqtaloA+64HdubRf9xlWIyySS1GvCZdlDCCn3NZOhIJJ1LR2qQu7Y
 WPR29h4aJGiGtLpL04VHyUhNt+87PAzniLAyNgIO2D41TBHx6WGWkBsIBW8sixRA79rOocDw
 +16msopxyGgqxgtaPCqszt18jmSE3k+TKkXjJEWL4v1gA4NyFsZQ5j9CDfz0a6feed3LUgmD
 T+FtpXs340G6BL5TEMyMnzR0c52p5cE4klKxWBfAWW5oIPOg/tv0SBB9TgycB9u8SxG9OBNa
 0xLLEx+IJuc8wh43PZjW3+eICAfJRm71HGo9X43ujz3c02aWFbJDlUBAseW3UVA82tjbjlRp
 76Z72D+UAfVRsL63wpseEtDus3TQdl7rS/BvMWZA8i+QoEISmfljpSPfksNkQPsWukqtX3Ep
 M5r3ed+UrL6PiguuJ8GC5GW+LATaRKcLklQaKhF0IJTOE+EYxC0+zyFC37pS/N3P/aQrHOJU
 Z1/FPxARzGV9XiorAlCIYUuPrUtvvoixORaS4PRPWRc7oeu9Gt4gqnxqBr7qnQgGeh1sMAHL
 YjUSTKOP0qQiVZQmE7PtMN0AXW5U/ZVeDzD2P2Jz8tRG6IhqO1MdWQA4omwtViRMypl+Euah
 xOcRqn0y+c5959gsbGxGYp+BiK1C+jJasK2zC6Jve9jV+j/afX1i1tNq33MHRhnAr8KatEmy
 ZWPqIHW2W3GjpYXUkfYuZuKEocS18DjTdh8b8b9HERHlBS7Rf7c3hon0EK7IKxvj9lyyJSGR
 Qy5Sc3obv8TeY5X60N0YhhkMSQ2KvrIfIL/gxiivtKOIBQ5+i7WHuONrHPGQzlSSX4VBsfYF
 ATxhceL2vlZi4Z9XDk/GPBsBs5DEm/JAKcJWYX4imiFMzOOnFiHh7rFkCgg4xHtDl2vMp7zw
 bDBdyjEWCWCgoP65/AHjNUqpTwSNmh3vscodEFE+9JWtSGzPFRbEcsja6c5GrNmuQ2s8qGha
 D/0OT5oTW23WDlfahzz7ejyRgrVVKREJt79ISdv5E+OLTu/AISbGrZ66yN8+DFMdyD+yP28Y
 8QrkpEq0sNdHrkyLQrL2sGGvA==
IronPort-HdrOrdr: A9a23:eCYTk6jwzyb1fw0Z/tlGlK6ltXBQXgAji2hC6mlwRA09TyX5ra
 qTdTogtCMc7wxhIU3J+7i7VZVoJEmxyXcb2/hzAV7PZmbbUS6TXeVfBOjZslvd8k/Fh4xgPM
 5bGsAUNDSzNykcsS+Q2mmF+rgbruVuf82T9J/jJg9WPGRXgrlbnntE4xigYzBLrdZ9dOEE/E
 v13Ls8mwad
X-Talos-CUID: =?us-ascii?q?9a23=3AXgCtT2tVMEAv7xqZswP8gbut6IsdLUXaj3zeLnW?=
 =?us-ascii?q?WBD9NGOGvYnKh5pprxp8=3D?=
X-Talos-MUID: 9a23:C7UV9wX7UQNT5c3q/CCyvQFQac1K2YXwLUE/iM0lgvShcgUlbg==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 07 Jul 2023 22:00:29 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 367CU7bK2026771
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 7 Jul 2023 22:30:21 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 367CU7bK2026771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1688733022; bh=vO9iS60rDSU0yqJU6pRxERHjUfpLe5PC2SHm5W8r7tU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UA7aE1mskWUWHjZNGEl1KBmy+LMF5ihPyc6krNX9sIaFvqb1ODrA7i3CUAo56E3vG
         YhIv6fDrBBjquvWauc1tFT48kIlMS12HUsfQ5u84avY4LdKvQ8X/iLCLlScn5IunH8
         G82OO5Ct1Cy5NOYFmNr1SpWEjbOihH8ll69HJXE2LM8UzlujQi9VpTrB/Pp1PPf5VM
         qU2PVZJfwVSBPIwEdLmeRitt3aCi72iHMQYH2l0zfS4kLV0XU2cxnB8PPSVIquadXe
         nf+j5E6F9wfwQBMI1fDLo/b0l0nuB9e6DuAXX14v4Jq5PhYFYJUBPpYwTTdTxFOpFI
         gnLlWobv//5Ng==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 1/3] hwmon: (it87) Split temperature sensor detection to separate function
Date:   Fri,  7 Jul 2023 22:29:50 +1000
Message-ID: <20230707123005.956415-2-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707123005.956415-1-frank@crawford.emu.id.au>
References: <20230707123005.956415-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Fri, 07 Jul 2023 22:30:22 +1000 (AEST)
X-Virus-Scanned: clamav-milter 1.0.1 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The temperature sensor type will need to be used in multiple places, so
split it out into its own function.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * Split single patch into multi-patch set following review.

---
 drivers/hwmon/it87.c | 43 ++++++++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 5deff5e5f693..7a1224ddc8b1 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -1159,28 +1159,45 @@ static SENSOR_DEVICE_ATTR_2(temp4_input, S_IRUGO, show_temp, NULL, 3, 0);
 static SENSOR_DEVICE_ATTR_2(temp5_input, S_IRUGO, show_temp, NULL, 4, 0);
 static SENSOR_DEVICE_ATTR_2(temp6_input, S_IRUGO, show_temp, NULL, 5, 0);
 
+static int get_temp_type(struct it87_data *data, int index)
+{
+	/*
+	 * 2 is deprecated;
+	 * 3 = thermal diode;
+	 * 4 = thermistor;
+	 * 5 = AMDTSI;
+	 * 6 = Intel PECI;
+	 * 0 = disabled
+	 */
+	u8 reg, extra;
+	int type = 0;
+
+	reg = data->sensor;	/* In case value is updated while used */
+	extra = data->extra;
+
+	if ((has_temp_peci(data, index) && (reg >> 6 == index + 1)) ||
+	    (has_temp_old_peci(data, index) && (extra & 0x80)))
+		type = 6;	/* Intel PECI */
+	else if (reg & BIT(index))
+		type = 3;	/* thermal diode */
+	else if (reg & BIT(index + 3))
+		type = 4;	/* thermistor */
+
+	return type;
+}
+
 static ssize_t show_temp_type(struct device *dev, struct device_attribute *attr,
 			      char *buf)
 {
 	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
-	int nr = sensor_attr->index;
 	struct it87_data *data = it87_update_device(dev);
-	u8 reg, extra;
+	int type;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
-	reg = data->sensor;	/* In case value is updated while used */
-	extra = data->extra;
-
-	if ((has_temp_peci(data, nr) && (reg >> 6 == nr + 1)) ||
-	    (has_temp_old_peci(data, nr) && (extra & 0x80)))
-		return sprintf(buf, "6\n");  /* Intel PECI */
-	if (reg & (1 << nr))
-		return sprintf(buf, "3\n");  /* thermal diode */
-	if (reg & (8 << nr))
-		return sprintf(buf, "4\n");  /* thermistor */
-	return sprintf(buf, "0\n");      /* disabled */
+	type = get_temp_type(data, sensor_attr->index);
+	return sprintf(buf, "%d\n", type);
 }
 
 static ssize_t set_temp_type(struct device *dev, struct device_attribute *attr,
-- 
2.41.0

