Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3632C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 07:08:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFBEE615E5
	for <linux-hwmon@archiver.kernel.org>; Thu, 30 Sep 2021 07:08:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348494AbhI3HKg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 30 Sep 2021 03:10:36 -0400
Received: from mail-am6eur05on2129.outbound.protection.outlook.com ([40.107.22.129]:42466
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233661AbhI3HKf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 30 Sep 2021 03:10:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQmU6SrgnrPZ2QFtx8ZIkcqO1uGO1q3Eefi+tVluznTPWpyFiGb/DEQ6LrgNix9ttS7aynEsZSLZkZA8z2NiccvooHFTQDgQ3rPP0X8TXVRVHDIzERaf0gfn3o86xfDfR1OPW33IZzDXJN5RuqRO1EsZbw9hU4PD41yCoO1v0l71VQOLg+DjSm1IbmkPnH0e1jeY1Z0u/Omsn0rOlLztt3syG9Kvh+hQ+hoqCNK7wDajOYONhqVhS/DMO+AWiAa1NZQ0C4315DfatUHlgapejV9xOQWCK5Fw/s4FCnvAM7p588EGtSEyReya2E3JF4ZrNvwMXkegrfzrne+WKFV+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0GoanC0Uo99L+xPemLXgoT8n6jbyjrk6DGKgAVYk/A=;
 b=lx6M7XRm5fr81UbDRPn/GA7y3RoQv1hlQCVdcCerpScPyIkD5oJfJHeJybGh4VH817D+hRv4slyBivg35PW5D8ZmiE/ism6zX7/M00c8GWIktuI/Bx4X+vaYPb2E0eUrfF0Tj7VZeqWkB7ki66BE8dB7lAxYcYfLGzDowIdxtSB3fixoYefFNPXFbXK7CnF6WE0yvCrq0dOrhceZjftiPlCRuMU/dB+SVGFvu/pyBWU6YjFJHswbO2ppBl2b3ynHl2MBHdUVOxv6Dh6JVygm7qVNv2RlVIwsGrSGvK2KJ3p5Kp1kPnGIMIrIctgHkc0U0bjICDkKy/aJznNmvMbUVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0GoanC0Uo99L+xPemLXgoT8n6jbyjrk6DGKgAVYk/A=;
 b=xkxNXfvchdE1OOf1r2+CHJdLZ0dK05n3WhZ1KFX/PtKZJEdjYCpRl3wSbp1mDVWnjuPPvsz8Zvj/mzSAQj+0n72rHJWS/mxHkVvjNlBvV+TbIfpFmFPt0FduUsHv9BhEGw5dBtRA6nge5sANaFIkpsgmPYWCOx0EKvtVwRknEqA=
Authentication-Results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nokia.com;
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com (2603:10a6:10:239::15)
 by DU2PR07MB8270.eurprd07.prod.outlook.com (2603:10a6:10:277::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.10; Thu, 30 Sep
 2021 07:08:49 +0000
Received: from DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb]) by DU2PR07MB8110.eurprd07.prod.outlook.com
 ([fe80::c47f:b569:ac76:9feb%7]) with mapi id 15.20.4478.014; Thu, 30 Sep 2021
 07:08:49 +0000
Date:   Thu, 30 Sep 2021 09:08:32 +0200
From:   Krzysztof Adamski <krzysztof.adamski@nokia.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 06/11] hwmon: (tmp421) support specifying n-factor via DT
Message-ID: <084b06f02eb819516e62f8d9ed5a7721a2b2b9d5.1632984254.git.krzysztof.adamski@nokia.com>
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1632984254.git.krzysztof.adamski@nokia.com>
X-ClientProxiedBy: MAXPR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::19) To DU2PR07MB8110.eurprd07.prod.outlook.com
 (2603:10a6:10:239::15)
MIME-Version: 1.0
Received: from localhost.localdomain (131.228.2.20) by MAXPR01CA0101.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 07:08:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f40d24d2-75e3-47d9-9290-08d983e126eb
X-MS-TrafficTypeDiagnostic: DU2PR07MB8270:
X-Microsoft-Antispam-PRVS: <DU2PR07MB8270560BB382BC1406F0D13EEFAA9@DU2PR07MB8270.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2o86y/yVgJ67cHovWilBzAO4v5w+j86V0PRGSm8MtWgznbQsKcWVA4CSB/l+VrWMNt6YZrNzoUmmlhPv9EtrDnLatQ7Zo8XVQ5N4/t68LBegHVlhHIRN0aZ6QU7dk7MzyyIfApjHjyYinWwWhPXCuPupxeS3bfYIcGprAOJtGP2+Fy4YwODlBT9uhzEaDfqzF8uiMHBgq31PrDHJXL6x+hrZL+8WvjFxS5KbA4aM+6mV+nxgQawYEP8sU96juapw/2VsV6a3pDGVvt6tdMzz014Iv6h8ngH0YbrJiflmZVWy/SAtJ3FVGbtTNfcWpQIwipG+RS3i4mFLhuIh0kmAqmiN87XLjCx/PN+j/OinHCbLL0I4Aj6eKpSpHzMUckDfwuX+ASDnn3xdK5+FD2ehaOUykoKQel1tMvssm0JFUpMPCCpvobAtfrRNmqNFEuo5TAc/cZhYCqAKGoEwkjQ6YKqO0IcgOKqhIZYD1p2Rj8x/jb3WBDZ6Cd8qddqeANJilXQNYUuU33vDWp0koyzbvIMbRGXOW52bIazF0Hh3LE2SCBV3N4Clj9iKY0GbtwmfQVRff0GRIFty8PIp+daJZlM19DKV0zPQe4w6NPd3ZGNxKD119FZstt7+gzpm3anWCDQNIqvkRU6mFxMsR7O7mrPrOV0jVkf/PuXzt1tNdovFjqiuHr8yEWa861Kwcq8LndwwOZcAB644SkG9j3ujpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR07MB8110.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(2906002)(26005)(8676002)(956004)(2616005)(52116002)(5660300002)(110136005)(6666004)(8936002)(36756003)(6486002)(4326008)(6506007)(66556008)(44832011)(316002)(6512007)(66476007)(38100700002)(66946007)(38350700002)(186003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2iJ9NT/6rCbECj7WShYbPOmPEnoVsOwytuqt1N6Z7yKC3pKQfGJc3NefqxT0?=
 =?us-ascii?Q?HD9mNztUc7qssMvIkL6VwUDHEGqfdtACuht/Hu8hr63pzFY2aYfvPKzD66WG?=
 =?us-ascii?Q?0dR1Gg2R+elTPg+zDObYElyAch9nFLrag/A3O13NiGGbT9cPz0/2vz0sOOhU?=
 =?us-ascii?Q?IvzAWM7gN/IQ/qS2llYyZ+7hj6kP9Uy2gAKvRCRJx9LdMArkZKdpyxCuUZYb?=
 =?us-ascii?Q?EshcOobnKzO0d4KA/mw3y/pDZYp1R0agaHWzhC6RqHLbKDFOOQSEiWl0lV8t?=
 =?us-ascii?Q?p7qQu3wiRSzeNt30KMDIW3XgA/c4BLQfKic6LIckxS2n6D31K1Cc8D4yLSPE?=
 =?us-ascii?Q?Ntxyz3sLo3h36m49RSg1naOeMeBhIbcukmjXMibCRcdSE7FElMu8svoBbkC9?=
 =?us-ascii?Q?eWy1yflDDZAvimbeXz0hHYWzIu9B0BaYqbXCJn9rb7zkDO7zdwnf5wGm7ZkP?=
 =?us-ascii?Q?skWkK/XrxAHeF9eZGOBLTMa5VO6qnLj3pbz/wcXZMWljcoUjqbkdnZl6zjv7?=
 =?us-ascii?Q?5LnRqQjJRNitc60yv5wdYfUs7IuB+urpsskOHgILDy6wzBJn9xsnwFP5znui?=
 =?us-ascii?Q?mrV1qmLKio0chMksyJunffIGVlWWWjwFPQjjRyRLEAC1w0o9gC0FXC+eSoTz?=
 =?us-ascii?Q?mpDUHjOKj2i1kb4rELYZH6Zin3xJz43hJ7Fm/o5g83WxWrLOoKIUPjEI0J14?=
 =?us-ascii?Q?vNV2w43R+5zSqBC00hOfsxss21mGv4+Z6lBxGEhj1hvjlrfvcpsmbsPOyhoJ?=
 =?us-ascii?Q?IMhFlKrhngisxYczOl8Rh1ma9vdbw6j4CS53xVCEv+9xgiX2gq7rpB90GSEA?=
 =?us-ascii?Q?ConuNR/wM4DjzhERK7xiuNCNqegU0mP7KTvyI57bTV4VbLKzpwawXJUAId4N?=
 =?us-ascii?Q?N6R0lGX8JaQ+aIJol+5SPueqZQtmOGlh2YYIrlKeF61CRHWCM0/bRkFH8CX1?=
 =?us-ascii?Q?hvJpvmb7IVYHqkJbbS3Guer2AbcpH8oqwm7KWF1AiUEjcWDdu8rEJjHewCNV?=
 =?us-ascii?Q?pat4StZIoai7+483uqLKiLyHCvzTLwJPi++9D5I7YV+4jyS75Aq5iUccZgVv?=
 =?us-ascii?Q?xOrFVLtiSXdgniEGhwZgb6FJ/Ft1/w1pczmR4zmqYrocVt+Fo26FnoDUyBB2?=
 =?us-ascii?Q?eh0PrLPffgZGXY4sWpbNtl/ZcLUneTL0Oln1s1BDoJK8eJe1pk2JAg01O8sw?=
 =?us-ascii?Q?xiAx8ieixSKOStjNKN187QGaIdXjxcAZYXKlU0c+RHx3PMrlQfv6rysHYvlA?=
 =?us-ascii?Q?4VR1DJAWT9OqkkzlGFkQwuFxdCx26wSMtGk2fICeC5GouAMMU+Jb2YsshAhA?=
 =?us-ascii?Q?FkPKy3RcPnNQos3J3wEOCh73?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f40d24d2-75e3-47d9-9290-08d983e126eb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR07MB8110.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 07:08:49.6475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2EH31fakGTjIgInx6qmVWfabhhWeaMgb9i17AP2F9FHtQIY4jkYneMiubEkAgBwpKCVUPePF7Ac9FCd5hJJIbqFVU9y5Lf4Am3RTRQKWvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8270
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Previous patches added a way to specify some channel specific parameters
in DT and n-factor is definitely one of them. This calibration mechanism
is board specific as its value depends on the diodes/transistors being
connected to the sensor and thus the DT seems like a right fit for that
information. It is very similar to the value of shunt resistor that some
drivers allows specifying in DT.

This patch adds a possibility to set n-factor for each channel via
"n-factor" DT property in each channel subnode.

Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
---
 drivers/hwmon/tmp421.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
index 30b601c157fe..b32fd2b6ed07 100644
--- a/drivers/hwmon/tmp421.c
+++ b/drivers/hwmon/tmp421.c
@@ -34,6 +34,7 @@ enum chips { tmp421, tmp422, tmp423, tmp441, tmp442 };
 #define TMP421_STATUS_REG			0x08
 #define TMP421_CONFIG_REG_1			0x09
 #define TMP421_CONVERSION_RATE_REG		0x0B
+#define TMP421_N_FACTOR_REG_1			0x21
 #define TMP421_MANUFACTURER_ID_REG		0xFE
 #define TMP421_DEVICE_ID_REG			0xFF
 
@@ -310,6 +311,7 @@ static int tmp421_probe_child_from_dt(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	u32 i;
+	s32 val;
 	int err;
 
 	err = of_property_read_u32(child, "reg", &i);
@@ -329,6 +331,20 @@ static int tmp421_probe_child_from_dt(struct i2c_client *client,
 
 	data->channel[i].enabled = of_device_is_available(child);
 
+	if (i == 0)
+		return 0; /* input 0 is internal channel */
+
+	err = of_property_read_s32(child, "n-factor", &val);
+	if (!err) {
+		if (val > 127 || val < -128) {
+			dev_err(dev, "n-factor for channel %d invalid (%d)\n",
+				i, val);
+			return -EINVAL;
+		}
+		i2c_smbus_write_byte_data(client, TMP421_N_FACTOR_REG_1 + i - 1,
+						  val);
+	}
+
 	return 0;
 }
 
-- 
2.31.1

