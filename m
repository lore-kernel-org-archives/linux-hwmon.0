Return-Path: <SRS0=38Bi=B7=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A839C433E1
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Aug 2020 18:28:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5414F22EBF
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Aug 2020 18:28:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbgHUS2B (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Aug 2020 14:28:01 -0400
Received: from 14.mo6.mail-out.ovh.net ([46.105.56.113]:57244 "EHLO
        14.mo6.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgHUS2B (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Aug 2020 14:28:01 -0400
Received: from player799.ha.ovh.net (unknown [10.110.103.41])
        by mo6.mail-out.ovh.net (Postfix) with ESMTP id 7CDF72242CE
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2020 18:00:44 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player799.ha.ovh.net (Postfix) with ESMTPSA id ABD0E156BDE9D;
        Fri, 21 Aug 2020 16:00:38 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-103G0059f190c4a-db29-4b17-b616-76cf4b1db7b5,
                    20EB7F6BE0168D07063FB82D5C23839419BBC220) smtp.auth=steve@sk2.org
From:   Stephen Kitt <steve@sk2.org>
To:     Juerg Haefliger <juergh@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH] hwmon: (dme1737) use simple i2c probe
Date:   Fri, 21 Aug 2020 18:00:35 +0200
Message-Id: <20200821160035.590142-1-steve@sk2.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17270178671746174236
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudduvddgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeetgedugfelkeeikeetgeegteevfeeufeetuefgudeiiedthfehtdeffeekvdeffeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqhhifmhhonhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

As part of the ongoing i2c transition to the simple probe
("probe_new"), this patch uses i2c_match_id to retrieve the
driver_data for the probed device. The id parameter is thus no longer
necessary and the simple probe can be used instead.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 drivers/hwmon/dme1737.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/dme1737.c b/drivers/hwmon/dme1737.c
index c3472b73fa79..c1e4cfb40c3d 100644
--- a/drivers/hwmon/dme1737.c
+++ b/drivers/hwmon/dme1737.c
@@ -2461,8 +2461,9 @@ static int dme1737_i2c_detect(struct i2c_client *client,
 	return 0;
 }
 
-static int dme1737_i2c_probe(struct i2c_client *client,
-			     const struct i2c_device_id *id)
+static const struct i2c_device_id dme1737_id[];
+
+static int dme1737_i2c_probe(struct i2c_client *client)
 {
 	struct dme1737_data *data;
 	struct device *dev = &client->dev;
@@ -2473,7 +2474,7 @@ static int dme1737_i2c_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	i2c_set_clientdata(client, data);
-	data->type = id->driver_data;
+	data->type = i2c_match_id(dme1737_id, client)->driver_data;
 	data->client = client;
 	data->name = client->name;
 	mutex_init(&data->update_lock);
@@ -2529,7 +2530,7 @@ static struct i2c_driver dme1737_i2c_driver = {
 	.driver = {
 		.name = "dme1737",
 	},
-	.probe = dme1737_i2c_probe,
+	.probe_new = dme1737_i2c_probe,
 	.remove = dme1737_i2c_remove,
 	.id_table = dme1737_id,
 	.detect = dme1737_i2c_detect,
-- 
2.25.4

