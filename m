Return-Path: <SRS0=nJF0=BX=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5513EC433E1
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Aug 2020 16:30:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19F8020658
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Aug 2020 16:30:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgHMQaB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 Aug 2020 12:30:01 -0400
Received: from 7.mo177.mail-out.ovh.net ([46.105.61.149]:40528 "EHLO
        7.mo177.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgHMQaB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Aug 2020 12:30:01 -0400
X-Greylist: delayed 1177 seconds by postgrey-1.27 at vger.kernel.org; Thu, 13 Aug 2020 12:30:00 EDT
Received: from player159.ha.ovh.net (unknown [10.108.54.209])
        by mo177.mail-out.ovh.net (Postfix) with ESMTP id EF3BC13BAA1
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2020 18:23:13 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player159.ha.ovh.net (Postfix) with ESMTPSA id 54DD31538AC9B;
        Thu, 13 Aug 2020 16:23:08 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-96R001d0cd8b33-75d1-4926-8d88-7b8eb7db5b9d,
                    E10370F5499BCD549250CF93A1A6372B2A4BB833) smtp.auth=steve@sk2.org
From:   Stephen Kitt <steve@sk2.org>
To:     Guillaume Ligneul <guillaume.ligneul@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH] drivers/hwmon/lm73.c: use simple i2c probe
Date:   Thu, 13 Aug 2020 18:23:00 +0200
Message-Id: <20200813162300.1514695-1-steve@sk2.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7561825253049847130
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrleehgdejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepteegudfgleekieekteeggeetveefueefteeugfduieeitdfhhedtfeefkedvfeefnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhduheelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopehlihhnuhigqdhhfihmohhnsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This driver doesn't use the id information provided by the old i2c
probe function, so it can trivially be converted to the simple
("probe_new") form.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 drivers/hwmon/lm73.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/lm73.c b/drivers/hwmon/lm73.c
index 733c48bf6c98..beb0d61bcd82 100644
--- a/drivers/hwmon/lm73.c
+++ b/drivers/hwmon/lm73.c
@@ -190,7 +190,7 @@ ATTRIBUTE_GROUPS(lm73);
 /* device probe and removal */
 
 static int
-lm73_probe(struct i2c_client *client, const struct i2c_device_id *id)
+lm73_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct device *hwmon_dev;
@@ -277,7 +277,7 @@ static struct i2c_driver lm73_driver = {
 		.name	= "lm73",
 		.of_match_table = lm73_of_match,
 	},
-	.probe		= lm73_probe,
+	.probe_new	= lm73_probe,
 	.id_table	= lm73_ids,
 	.detect		= lm73_detect,
 	.address_list	= normal_i2c,
-- 
2.25.4

