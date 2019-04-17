Return-Path: <SRS0=hA7Y=ST=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF727C282DC
	for <linux-hwmon@archiver.kernel.org>; Wed, 17 Apr 2019 18:03:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7AE4A20663
	for <linux-hwmon@archiver.kernel.org>; Wed, 17 Apr 2019 18:03:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=yadro.com header.i=@yadro.com header.b="TEOTUb93"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbfDQSDw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 17 Apr 2019 14:03:52 -0400
Received: from mta-01.yadro.com ([89.207.88.251]:39430 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728677AbfDQSDw (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 17 Apr 2019 14:03:52 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id A911941908;
        Wed, 17 Apr 2019 18:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-type:content-type:mime-version:references:in-reply-to
        :x-mailer:message-id:date:date:subject:subject:from:from
        :received:received:received; s=mta-01; t=1555524228; x=
        1557338629; bh=BCcjVkQZyJ1iL3Octrz1ZKodOFLa8aZ965FyOmOrgzk=; b=T
        EOTUb93eNbdpcyoNTuAxNKZphs9PzHtozboFayuGnDLHIcWouUpl/ZmrlmBCY3eV
        k+1dEkTdDvrU4i1O4kzXtv99dG+ZHNtc8w7zyLQHRieJaXHdaNcQIlCB4qPHMwbS
        uVq0b8Rw7qLYiY6JVZZ8whHZs48jg47C23a5g2wUCU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id PBu066Gvh7oJ; Wed, 17 Apr 2019 21:03:48 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id 268B2418FC;
        Wed, 17 Apr 2019 21:03:48 +0300 (MSK)
Received: from cinnamon.dev.yadro.com (172.17.14.197) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 17 Apr 2019 21:03:47 +0300
From:   Alexander Amelkin <a.amelkin@yadro.com>
To:     <linux-hwmon@vger.kernel.org>
CC:     <openbmc@lists.ozlabs.org>,
        Alexander Soldatov <a.soldatov@yadro.com>,
        Alexander Amelkin <a.amelkin@yadro.com>,
        "Edward A . James" <eajames@us.ibm.com>,
        Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 1/1] hwmon (occ): Add temp sensor value check
Date:   Wed, 17 Apr 2019 21:03:29 +0300
Message-ID: <1555524209-26997-1-git-send-email-a.amelkin@yadro.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <6a6dd936-9f97-dcfe-65a1-d724a7c20297@yadro.com>
References: <6a6dd936-9f97-dcfe-65a1-d724a7c20297@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Alexander Soldatov <a.soldatov@yadro.com>

The occ driver supports two formats for the temp sensor value.

The OCC firmware for P8 supports only the first format, for which
no range checking or error processing is performed in the driver.
Inspecting the OCC sources for P8 reveals that OCC may send
a special value 0xFFFF to indicate that a sensor read timeout
has occurred, see

https://github.com/open-power/occ/blob/master_p8/src/occ/cmdh/cmdh_fsp_cmds.c#L395

That situation wasn't handled in the driver. This patch adds invalid
temp value check for the sensor data format 1 and handles it the same
way as it is done for the format 2, where EREMOTEIO is reported for
this case.

Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
Signed-off-by: Alexander Amelkin <a.amelkin@yadro.com>
Reviewed-by: Alexander Amelkin <a.amelkin@yadro.com>
Cc: Edward A. James <eajames@us.ibm.com>
Cc: Joel Stanley <joel@jms.id.au>
---
 drivers/hwmon/occ/common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 4679acb..825631c 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -235,6 +235,12 @@ static ssize_t occ_show_temp_1(struct device *dev,
 		val = get_unaligned_be16(&temp->sensor_id);
 		break;
 	case 1:
+		/*
+		 * If a sensor reading has expired and couldn't be refreshed,
+		 * OCC returns 0xFFFF for that sensor.
+		 */
+		if (temp->value == 0xFFFF)
+			return -EREMOTEIO;
 		val = get_unaligned_be16(&temp->value) * 1000;
 		break;
 	default:
-- 
2.7.4

