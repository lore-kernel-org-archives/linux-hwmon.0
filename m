Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE8BC4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Nov 2022 20:32:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiKJUc1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Nov 2022 15:32:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiKJUc1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Nov 2022 15:32:27 -0500
X-Greylist: delayed 3908 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Nov 2022 12:32:25 PST
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com [67.231.152.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA6C41CFFC
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Nov 2022 12:32:25 -0800 (PST)
Received: from pps.filterd (m0075793.ppops.net [127.0.0.1])
        by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 2AAIaE42022207;
        Thu, 10 Nov 2022 19:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=POD051818;
 bh=GGNpyjey7trgrQrtboqiWpP39Y6gjOTAcCo75T6Gt2k=;
 b=fVUQEqtPmxG82mcL4X6Gn0czU/hc60Poj34kZw4aXKPBut7bTLbY8OsgXpeQFvtfzxr4
 BS1K9ZdCqX+I5F4qVAytiVfPH1DTL8wf/TVTLxLQgPh0kQYscyPmhBofJAuJJevw7v8F
 tHv8JIeRGyF67++ZVZEePGgnA+DZB9tk6NojE0v2LcRAVGwqoPLHKoxMqrINqrmjPtvP
 XzzMHxMqUyyUMOjZZENcYrEslzSsX33+xwds8dUk0Be0/WtdS0bux4stgpqver1paneD
 3LwM5y5zAvkLYj/wbhJglPohR38TG5Cf+jDiVzN3lWAEymS0h+WW4D22xfGPEyyd5MKv PA== 
Received: from xnwpv38.utc.com ([167.17.239.18])
        by mx0b-00105401.pphosted.com with ESMTP id 3krqv43yn3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Nov 2022 19:26:57 +0000
Received: from qusnwadv.utcapp.com (QUSNWADV.utcapp.com [10.161.48.86])
        by xnwpv38.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2AAJQtvj140471
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Nov 2022 19:26:56 GMT
Received: from ciulimr02.rockwellcollins.com ([10.172.224.19])
        by qusnwadv.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2AAJMD5G028817
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 10 Nov 2022 19:22:13 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab [10.148.204.208])
        by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 65D30200FE;
        Thu, 10 Nov 2022 13:22:13 -0600 (CST)
From:   Brandon Maier <brandon.maier@collins.com>
To:     linux-hwmon@vger.kernel.org
Cc:     =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Derek Nguyen <derek.nguyen@collins.com>,
        Brandon Maier <brandon.maier@collins.com>
Subject: [PATCH] hwmon: (ltc2947) fix temperature scaling
Date:   Thu, 10 Nov 2022 13:21:08 -0600
Message-Id: <20221110192108.20624-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6KJ4_19aywknhCNuw7nl_w0-IoTIOYs5
X-Proofpoint-ORIG-GUID: 6KJ4_19aywknhCNuw7nl_w0-IoTIOYs5
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1011 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211100010
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Derek Nguyen <derek.nguyen@collins.com>

The LTC2947 datasheet (Rev. B) calls out in the section "Register
Description: Non-Accumulated Result Registers" (pg. 30) that "To
calculate temperature, multiply the TEMP register value by 0.204°C
and add 5.5°C". Fix to add 5.5C and not 0.55C.

Signed-off-by: Derek Nguyen <derek.nguyen@collins.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 drivers/hwmon/ltc2947-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ltc2947-core.c b/drivers/hwmon/ltc2947-core.c
index 7404e974762fd..2dbbbac9de093 100644
--- a/drivers/hwmon/ltc2947-core.c
+++ b/drivers/hwmon/ltc2947-core.c
@@ -396,7 +396,7 @@ static int ltc2947_read_temp(struct device *dev, const u32 attr, long *val,
 		return ret;
 
 	/* in milidegrees celcius, temp is given by: */
-	*val = (__val * 204) + 550;
+	*val = (__val * 204) + 5500;
 
 	return 0;
 }
-- 
2.38.1

