Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AF1C3DA7A
	for <linux-hwmon@archiver.kernel.org>; Thu,  5 Jan 2023 07:49:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbjAEHtT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 5 Jan 2023 02:49:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbjAEHtS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 5 Jan 2023 02:49:18 -0500
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 770B339F9D
        for <linux-hwmon@vger.kernel.org>; Wed,  4 Jan 2023 23:49:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFCa3M2q99MYo17ZyEDAnJug1GSj/tQPd1AsAjNuzRMX5VizJmRFKTVw0+uYVFjZIydO+RIAEfexG5HmD/YpjgaPb4jC+2tA2XdBH9TIc1CQdAgjAKhVhkcg2jAix3oi17PlbK9KcjtxZkx7GKdrXD4UX+OFeM+8dQc6fVg9fH9GoDZ28pH2Y7CkP/6HbwFopWSJcSgIQwEjWRFM4l8YuRwcXagDtsixqR/v73v74LEhquG2yaitCrnx0f4R0IANKFsE77JWRtEvRxywV8OdSkX5m1LWctEY/VZnwwtydkF8p4bP7VlJFTUwXGvAmmN683BV0lMjKYNlyrCmnfsezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhGQY/DAvEpIoP1ziBFObJAbc5u9bX5bxeNkJHUIrQY=;
 b=EpV8+HhHsKSc1gO8tLp0+Y7gvvUuq1YgqmlO81QhHFua4dK8VD8gy0qVv3iIbG9OC/CQHd7RislH5pik/ulCtHKzu+f11tLXCwLvmW03bBXa0VrBL7CrcRXawfuqpVL+qyPIAFj2r6UIvQnB7VKV4aImbT+b1J5oqVFOKAJz5+CumNM4CAx+OB5uIDTagCijVR78nNz8Y+gcmbOYip9t0bttsnagtlXkZmN9cgjrMs5T1bXdwlZmn6e2aVYaoapDGUae0wq4tQAggZriEDwrnhgLS5M17MFz91ZoPRBDkalhwpIczNl2X4rTKa7QYfYStSENv+sH34XMvpd244+Pjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.201) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=etas.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=etas.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etas.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhGQY/DAvEpIoP1ziBFObJAbc5u9bX5bxeNkJHUIrQY=;
 b=IMGfpTDFa4uiI7N5jCSHgRyRWe97ndZRY8Zqu2xWn2Fp7t2leTxIf/HXN1GcYbHT8DAD4xOjLT8yUQSxvMrUAq9XmB3a+1p+g6waI8Pg+DL4tZzlP+G3xvE12D3VOD6KOaRbkq6Fv+y05Dcm7B8AEzTw+Rfhv0GbLPAXN0L9NGA=
Received: from DB6P193CA0022.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::32) by
 DU0PR10MB7237.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:44b::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Thu, 5 Jan 2023 07:49:14 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::41) by DB6P193CA0022.outlook.office365.com
 (2603:10a6:6:29::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Thu, 5 Jan 2023 07:49:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.201)
 smtp.mailfrom=etas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=etas.com;
Received-SPF: Pass (protection.outlook.com: domain of etas.com designates
 139.15.153.201 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.201; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.201) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5966.18 via Frontend Transport; Thu, 5 Jan 2023 07:49:14 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.34; Thu, 5 Jan
 2023 08:49:10 +0100
Received: from getk-dev.de.bosch.com (10.139.217.196) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.34; Thu, 5 Jan 2023 08:49:10 +0100
From:   Felix Nieuwenhuizen <Felix.Nieuwenhuizen@etas.com>
To:     <linux-hwmon@vger.kernel.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        "Rob Herring" <robh@kernel.org>,
        Felix Nieuwenhuizen <Felix.Nieuwenhuizen@etas.com>
Subject: [PATCH] hwmon: (pmbus/ltc2978) add support for LTC7132 - docs
Date:   Thu, 5 Jan 2023 08:49:00 +0100
Message-ID: <20230105074900.5730-1-Felix.Nieuwenhuizen@etas.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221208021303.GA3373033-robh@kernel.org>
References: <20221208021303.GA3373033-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBAEUR03FT052:EE_|DU0PR10MB7237:EE_
X-MS-Office365-Filtering-Correlation-Id: 23744e2b-87f9-4a2c-1c66-08daeef15717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MEX4+lp3gVSAyh2Dkl5IcPaNiLgPLS1n2N7vyuDHTPNgkU0H6Lninq9VgLUlTqx7FgFNs9UXSayWN0lutYUMjhxukZp8ia3iHeTrACzgpWtgze5QkXfTwgHqQMTFjkfrBpIJWUdWm6a4CkOnKM/RXiBGZ4pWkkgzxr5pKe+gwl4yZoTD4pvz6n7jCSEoRxm5OVVuNvUF1my3l6gGVvUSRd6IjXXwiPlJ+/Yh7/whq27E9L0VOxux7WNyjCGhn21XkBsqK/fzgnofvOzC8ZWxIGHlaGq2d9wi6yGLZMWMCDF3mT8Dhg+nxx09mrsKMJdfysc69fgAP8XaSH+FZfVTiAVRS8elQr2XR8JyaifcIA6fhVhEJJ15GiB4fst/b9cQZfHpO82q7aaXBmJ3qGseAjexI+FJJHWZo02biqFeWzXlIPTAuVRs573sugStZ/g5KRQGxCtQpWaI7mho+DxqCQ5HP/vbYIoAeBkKXccxyeAe0dntv0hfr+H1pzpof1ugeD7oCJqH5HXHSRs9+wIjilte01fTfWtzdl2OyPso/599uXffgycr3G3Dc8hqngiS5csimzrqZS7D4shYwKOcrKQ0hWQ4B0XTBCrculd+/HCrgaf9JRPdbOQ6u+mVyzyuxtgbu7Kd7MGo5ur181A/UvflQPV4HNpPOnS1MA8+RL+R4dFynxMF4YAWPB5WcOxGNlxLGUPWxOQOwVchf5VGz5lPmDdMV6XQKDxQ5ILozK0=
X-Forefront-Antispam-Report: CIP:139.15.153.201;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(346002)(451199015)(36840700001)(46966006)(40470700004)(47076005)(1076003)(26005)(16526019)(6666004)(107886003)(336012)(82310400005)(40480700001)(86362001)(40460700003)(36756003)(36860700001)(356005)(82740400003)(82960400001)(2616005)(81166007)(186003)(316002)(4326008)(41300700001)(478600001)(8676002)(2906002)(5660300002)(8936002)(4744005)(54906003)(70206006)(70586007)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: etas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 07:49:14.0602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23744e2b-87f9-4a2c-1c66-08daeef15717
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.201];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7237
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add missing compatible string "lltc,ltc7132" to the bindings documentation.

Signed-off-by: Felix Nieuwenhuizen <Felix.Nieuwenhuizen@etas.com>
---
 Documentation/devicetree/bindings/hwmon/ltc2978.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ltc2978.txt b/Documentation/devicetree/bindings/hwmon/ltc2978.txt
index 4e7f6215a453..61783b3819bf 100644
--- a/Documentation/devicetree/bindings/hwmon/ltc2978.txt
+++ b/Documentation/devicetree/bindings/hwmon/ltc2978.txt
@@ -16,6 +16,7 @@ Required properties:
   * "lltc,ltc3886"
   * "lltc,ltc3887"
   * "lltc,ltc3889"
+  * "lltc,ltc7132"
   * "lltc,ltc7880"
   * "lltc,ltm2987"
   * "lltc,ltm4664"
-- 
2.30.2

