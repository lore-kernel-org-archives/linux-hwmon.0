Return-Path: <SRS0=NIjz=DG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A14DC4346E
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Sep 2020 10:54:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C20B8207C4
	for <linux-hwmon@archiver.kernel.org>; Tue, 29 Sep 2020 10:54:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="IkfLbUNG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbgI2KyQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 29 Sep 2020 06:54:16 -0400
Received: from mail-eopbgr750044.outbound.protection.outlook.com ([40.107.75.44]:22599
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728256AbgI2KyQ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Sep 2020 06:54:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZJVoSdnjx2BXhXInQFiCEBllRbhb5vRathS6J1GHUe3CjjiOBM8dKMGoGpXqdX1cyZuqq7TxbvfkSt5nWoDTw1Zztm3M4sAgRnvxIc6zLZZIK7cEK9UQng4E5NYuaXePldjimY3m10ofcFunXAwHsds3kSbYxiXhfOLX0Gpn8+1+zxcUjXSqaHc/qlnYTDolYJnVXjvC1Cm9qM7RU1nQG0SMKYXviSXKySYj3fVGcRunCuJ/NwS0Mqq90UMXubttyKUOUPxLTdw8eq2UVej09oOrXdJcpSCsvWvOF4Ai705rZgGDfabNGPbSwRQDLusDJaZqZdyPvb4dgu9CU/YdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oa98pIiH/m09Id4Wd3AEJIfsVgLoEv4Up/2LTvyeyoc=;
 b=loBBmjaJUP9ChKmImcNatYwOhUjMns+d72avGQvs/5XM1qNFgNsKI16QcHzDaXLDtQHUMaY4vD1lwwJ/QK0GCwcKZIas1GVyIfbgRh2jh0aMXHPlzO1zEWA2l95AaMF589TKFLyBayoF126kM0Ep/WZbS6Etm/e6spHfK7gpQbxW3YiLuyVvaAmelsbgAufc0HEmmeVTEJWoDVMK2q8l5lsJC39Wpl3mCMG+Q1/k1rC6XrGzH+eduUpYS5RuKr9sJuo9sidcQLMBZw9laUFl/P1QffElIhpt77h6zgBy0U74yO5LWuauACisZzuXAoBm2vqH62k0oHU2hOXG8e9Kuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oa98pIiH/m09Id4Wd3AEJIfsVgLoEv4Up/2LTvyeyoc=;
 b=IkfLbUNGzLGX+A22lGQ/SzubBqxk0mNpC/Hc/b5i7ZlyfnSJL4biOrEVnuuAsphvwhCzxlmPs0AY/Malukfs4vkNLmiXMGZBXDRFCHN/auRJaQ/T91NFNDuogvfp2HXRZSr5nldZFAZfcS3pvXHW9SJ/iIjlDw35DiAPMMk48Ho=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4388.namprd12.prod.outlook.com (20.180.254.74) by
 DM5PR1201MB0105.namprd12.prod.outlook.com (10.174.106.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20; Tue, 29 Sep 2020 10:54:14 +0000
Received: from DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::31b8:2b7f:39bb:23af]) by DM6PR12MB4388.namprd12.prod.outlook.com
 ([fe80::31b8:2b7f:39bb:23af%6]) with mapi id 15.20.3433.032; Tue, 29 Sep 2020
 10:54:14 +0000
From:   Naveen Krishna Chatradhi <nchatrad@amd.com>
To:     linux-hwmon@vger.kernel.org
Cc:     naveenkrishna.ch@gmail.com,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: [PATCH v2 2/4] hwmon: amd_energy: optimize accumulation interval
Date:   Tue, 29 Sep 2020 16:23:20 +0530
Message-Id: <20200929105322.8919-3-nchatrad@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929105322.8919-1-nchatrad@amd.com>
References: <20200929105322.8919-1-nchatrad@amd.com>
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR0101CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::32) To DM6PR12MB4388.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from milan-ETHANOL-X.amd.com (165.204.156.251) by MA1PR0101CA0022.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:21::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Tue, 29 Sep 2020 10:54:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ed24dc8b-8ef8-43b2-4cbf-08d86466008a
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0105:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB010570524F4EADCAC2C7EF56E8320@DM5PR1201MB0105.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NxTRK8D/pcoP0ItyzTbnIRlOB5JfjIqJZSQsN+rowcUttM1/U6XsSYu7EHJ+Nhv/5io8lsOolDkV2IxNuq81b0yeL0TVSJbbaAnUCCZMvMjnJFsTufbsakfQrsZxQVeHhdnQo3TecEi72J8aXzVjXDJznKs+IT/XTzrKFXoTq8evaG/wbnmD5tmAph7eyKp3S2Bq/+PAV9dzPkfMDd45Ui1BmRsU3jr6CH5AtAhfGHYDlnxJ7sbMsedbdaLEYbAsxqEpr87B2EZpqQklJp1Plxvpc8IYrgDXEW045BlCueb7g8YqXyy/FPCMfMzNwY2DD2Uk8gkCcFo7jOUQhJhMRozXLykIMubIsblguxoHOP3GAa5NJIblDgE+GapFh3dl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4388.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(478600001)(8676002)(1076003)(316002)(83380400001)(66476007)(66556008)(66946007)(7696005)(52116002)(6666004)(36756003)(4326008)(2616005)(6916009)(8936002)(5660300002)(2906002)(6486002)(956004)(26005)(16526019)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: kwr2V3gDbnf7gkRCoPcaqozUs7XWF8QDYgMYZrc/ouR8O/nTs2/Hwmq17SX7Jh3mIYCvbsNbv5alSu1YCtlrNnOo1OYAX75GXilU0QcyVvoRNQOaLIAbW3pdku7CEJ0ZiRrPmQlx+GBQ2Z5mQOMUlh6q9WOiidRM3qclEGKySuuuMQt7QRxr5Rry2ogBvt9gRmW08P8B/1Onp4Q9k5nYbNCTlGhXRTlbp5VhjwcZkR/GiahJzec7gQ1IY532RoRljg4bbfptCjAFmQi61tR4nyCWT5qxYcz+EKQ7chASngofguYB/L8MS82RTircOuhiiuelC7TfDklZE5MLKoE2fRlnItE9ufd8gk2pp6pWhMHP3eNmE1kjRGVvj0UIPm+YValfWM9YTtAWxp4r+b6De079lQXrmbnKaSRw9nh8P4QQQgG9xjAQ8pe75e7NdcJMRqQZ1kQyxwx0jiHmLWW6KExKJBF6ItG8P3tQsQjqeHJNA4PDj+XKdXct7+rCLTiW1IWsrp9fWBlIf3WZxlCZikIrWTL67d261AEpfBQwtEJH8DXHFJdsjLjJAnAJavtTNLtDKYogTyOoFhA2WNaThl3Zb7P8u/tzHkxFDB9AuptJn/gZ2f94JHtOjdqV3SqpprxS8UOEx6Ch94YYjhmkQQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed24dc8b-8ef8-43b2-4cbf-08d86466008a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4388.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 10:54:13.6368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96ZUzhd36xrVEoZnb7IEexvipiNDXLiw3vnMpInDA1ppWvXsrK/RTsFCO2wNEF83+i5I0y68TAM8l6agPFPSaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0105
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On a system with course grain resolution of energy unit (milli J) the
accumulation thread can be executed less frequently than on the system
with fine grain resolution(micro J).

This patch sets the accumulation thread interval to an optimum value
calculated based on the (energy unit) resolution supported by the
hardware (assuming a peak wattage of 240W).

Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
---
Changes since v1:
1. Generalized formula as suggested by Guenter.
2. Use milli seconds for interval

 drivers/hwmon/amd_energy.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
index 9580a16185b8..c413adfc6a73 100644
--- a/drivers/hwmon/amd_energy.c
+++ b/drivers/hwmon/amd_energy.c
@@ -46,8 +46,9 @@ struct amd_energy_data {
 	struct mutex lock;
 	/* An accumulator for each core and socket */
 	struct sensor_accumulator *accums;
+	unsigned int timeout_ms;
 	/* Energy Status Units */
-	u64 energy_units;
+	int energy_units;
 	int nr_cpus;
 	int nr_socks;
 	int core_id;
@@ -215,6 +216,7 @@ static umode_t amd_energy_is_visible(const void *_data,
 static int energy_accumulator(void *p)
 {
 	struct amd_energy_data *data = (struct amd_energy_data *)p;
+	unsigned int timeout = data->timeout_ms;
 
 	while (!kthread_should_stop()) {
 		/*
@@ -227,14 +229,7 @@ static int energy_accumulator(void *p)
 		if (kthread_should_stop())
 			break;
 
-		/*
-		 * On a 240W system, with default resolution the
-		 * Socket Energy status register may wrap around in
-		 * 2^32*15.3 e-6/240 = 273.8041 secs (~4.5 mins)
-		 *
-		 * let us accumulate for every 100secs
-		 */
-		schedule_timeout(msecs_to_jiffies(100000));
+		schedule_timeout(msecs_to_jiffies(timeout));
 	}
 	return 0;
 }
@@ -331,6 +326,13 @@ static int amd_energy_probe(struct platform_device *pdev)
 	if (IS_ERR(hwmon_dev))
 		return PTR_ERR(hwmon_dev);
 
+	/*
+	 * On a system with peak wattage of 250W
+	 * timeout = 2 ^ 32 / 2 ^ energy_units / 250 secs
+	 */
+	data->timeout_ms = 1000 *
+			   BIT(min(28, 31 - data->energy_units)) / 250;
+
 	data->wrap_accumulate = kthread_run(energy_accumulator, data,
 					    "%s", dev_name(hwmon_dev));
 	if (IS_ERR(data->wrap_accumulate))
-- 
2.17.1

