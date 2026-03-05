Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazhn15010019.outbound.protection.outlook.com [52.102.139.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B9839E17A;
	Thu,  5 Mar 2026 19:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.102.139.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740615; cv=fail; b=GHkMRrsc0A6kjvPkPwUWzLV3Jz6nQg2UhelgMyZ85mdMWT3/y4Teq3HrGxL72J2FiRQTOXatQgEG6ixxX+ZDa8JVp3dkfvwiq4o1Dy7vIBiwPjqv+c17djomuDAJSyhC+YRnIJLKvafZuKA7RAxZSpHCEqp/xiOFKNSOu/sQHuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740615; c=relaxed/simple;
	bh=UmpOfaj5wRLrwN9iK1M0DfWX/OFQsZVrUes97eP7Guk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ubzb1Pq2+fUH/79veAH5KCDlnYz6FNJYt6gZ1ZY2bjh6qXxp1GuJn5d1J8M8/PhKNx/uBrE8Htf65w8X/TRQDUwY5dq3gYNtCXcK2yGWVJcj23yF9bKFX2K50jy5s4lwZFlqDV59r9JoOPZrzGFOnNsjFlE9ciZpzZ3PMutL4bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=p5lQm23R; arc=fail smtp.client-ip=52.102.139.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="p5lQm23R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvm2/fGmJyHo+cA4wsTAIDJ0ZbzOuMUo0ObDv7yQnEYV30b90X4q0v08EcFdQL2Y/wsCMVCnGjgZkQE1O7UBisHKHckIMi4bM6L410UPo2n0GVUrIPFEDBUqmw9sl+WUa18hOeUth8DPiOkB4Y/XR60pYh3OCZFvdNxBGU+BcSmfrXod1yr+fGihCogu9dumnLrkhovW6VOE+evJC7ARNcm5uR2i4Gl6rQ1/uCOnbBS8LrZNomvg8WCWy/indp/EZeUdZ03HgX5U7SDvCgto/23VACTMlmDwj34UrYS3rf+cwjiFkzZKBZpmqLOGCMEcDjqVGLhES81OiQClDKpIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WQpH35TEhVa4H4KkSp7oPaB2ywpmxPp5i0BjorE5O4=;
 b=TIiU+lxX4ttwTcNdAJmfvkdrvvX3xifPa8a4SRjXDfM4bGkmulm++2AQZEIpS23v/++UvYMkU0II44QZShgXQ0hGTZlYKTSmrz8fBJUIM5r7Qer6CN5dAq787lDaEqHwc/r4tltjgFoqjfKdAWrXeQrZHSiGiXnm31HxXhI1RaKesAG6tkcaKIuUVDLPwZ0A1U9OmHuwJPjkqVJKaFWah+alS/17wvCKykVBg1uvuqa9jyRPk2ot3JMIcgNjYOfI5XlyR0WICN3scLyugen7N9IIjWIYNKv1nl2jf+XN5MVuNVlp890lx4C0ZZSiJRBtJpHXJYFK6nDPI0CkaaNshg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WQpH35TEhVa4H4KkSp7oPaB2ywpmxPp5i0BjorE5O4=;
 b=p5lQm23RccnBt5G/PjH/0sFQzbVwz/lWe0LbzVug5Maa96DUOZXOx0Uv5spXCkjr5cPGuxtZOuTDlij71wKHnG3mL7+xri9+vKQTY8wjRksdG70tLJddJqupysj9hYexf9T8YBk6LsH6VcrttR/H4yFQpGREi9NzgUjzW7wg9kE=
Received: from PH1PEPF00013314.namprd07.prod.outlook.com (2603:10b6:518:1::6)
 by CH3PR10MB7905.namprd10.prod.outlook.com (2603:10b6:610:1be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:56:49 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2a01:111:f403:f90f::3) by PH1PEPF00013314.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 19:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 19:56:48 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:47 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 13:56:47 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 13:56:47 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625Juign2456638;
	Thu, 5 Mar 2026 13:56:47 -0600
From: Andrew Davis <afd@ti.com>
To: Guenter Roeck <linux@roeck-us.net>, Chiang Brian
	<chiang.brian@inventec.com>, Erick Karanja <karanja99erick@gmail.com>, "Grant
 Peltier" <grantpeltier93@gmail.com>, Jeff Lin <jefflin994697@gmail.com>,
	Cherrence Sarip <cherrence.sarip@analog.com>, Kim Seer Paller
	<kimseer.paller@analog.com>, Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH 07/11] hwmon: (pmbus/q54sj108a2) Remove use of i2c_match_id()
Date: Thu, 5 Mar 2026 13:56:38 -0600
Message-ID: <20260305195642.830695-8-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260305195642.830695-1-afd@ti.com>
References: <20260305195642.830695-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|CH3PR10MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d7b4899-645e-4287-0804-08de7af15602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|34020700016|36860700016|82310400026|7416014|1800799024|12100799066;
X-Microsoft-Antispam-Message-Info:
	+YfafO6QG5J4B/2wesORHh42lIlFoD8/Zn3M53qtcdAbRstwcjiEFt7ipmp6fbWPxNopg8KB/To/3oW5t9EyWg73u7Ruzu97UNwxauqRGPboxTHEMItl2eQ3Qi8hCiPKkxIvYS0ko+ntjRfFsuftCjGz2kkEMdJdfguGYtn1OkSW6RypONqxOILijk/GokkGBTicxqs8mElw6hd3+x4uopn+kIWkI25TFTAkPBCGNnU3c00N6qK12XTrqNoZwcx7MhBheAQo7/X+0gkkHroh5TcbMbckgb05TwntyGWeWNIQM4A3JmAryTjFtIIpaJlhUB9GCDFAwejH0hnn6Y5TXXDan6iAzkey3kkO/zUUNBLlQAS8Y9KEfaajz3F86FA5QT89/8mvWhd3ZSgiadrddPoPStFg8BEsT/OTPAYwqUg3XGnBwhyXC61GXxHNZqMrEQ6QNx56X07hER7iN8Ta5Sd6XEoU/aQGVx2KADaX/7juUOzzZ8qF5+unyBoCt+uZkJoj+qd4ekCkpYRxgjaFaKELqZij0qjBMwzAo9SNUegymb1IqKe8xqqOAol8RUgPj4es7jmoALFpG9UUDF0ML3H4Zqk9oOI2WhBQ0zlJL0K4N7bP8FD7WCU7qwAdaDSKRQF5WfNwoyQCKamMmUBzq2q5e117Jm+nuJvVMD9LPr+kbEbPgBDkcy3IlLsRkLqd6oN1dgsrW5ktuUPXiIKUbkoCPi9ebnVDtZG7DmpbSYNHN6hDggy9XPKGIE4LlnwaefgnOz5w31VAkyJur/FLeA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700016)(82310400026)(7416014)(1800799024)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bmISOS4aAKYI6fledlTRgIsQv0yMWBc+vLkRskgCCa+Q2pbCRQM2eLhWz7vXuQ23gVqxorMkcsoUn5KiU8aOV+Kym3PLcudaziUhhVedjq248v8o85i6zCpZTuZWnq5lgZq2GULh7iXl5Xap0Ec710WNqFVYVGSBApUNwZbxqUR/U/VqSsC47dMbyySfiOlNfJh3A76uUdwZRX8mED9Kw+PcIUxX+Wfv4V34QK2C5jVZWWDY+k+0QtD0nXMCO9Ya47iqdLftkckFwzbfJLyOA6lKRDw5tX8nP9nL7O/MPA+hVfHN+lnaIfkZ7p4EfAQch2uabO3fLH+jTepGzqipJbDkKC30Sx9K51dCC2PoP62xrM5ir6fDAGOqpR2PF9bJMUTOYfPpeSYxAbi8u0Zik9bFkIzYYU0ipmptqfsDXyTKfxVBeTVUCEb20JXS6yvE
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:56:48.1071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7b4899-645e-4287-0804-08de7af15602
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7905

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This is often used to then retrieve the
matching driver_data. This can be done in one step with the helper
i2c_get_match_data().

This helper has a couple other benefits:
 * It doesn't need the i2c_device_id passed in so we do not need
   to have that forward declared, allowing us to remove those or
   move the i2c_device_id table down to its more natural spot
   with the other module info.
 * It also checks for device match data, which allows for OF and
   ACPI based probing. That means we do not have to manually check
   those first and can remove those checks.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/hwmon/pmbus/q54sj108a2.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index fc030ca34480c..88c25290ffce1 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -291,10 +291,7 @@ static int q54sj108a2_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_BLOCK_DATA))
 		return -ENODEV;
 
-	if (client->dev.of_node)
-		chip_id = (enum chips)(unsigned long)of_device_get_match_data(dev);
-	else
-		chip_id = i2c_match_id(q54sj108a2_id, client)->driver_data;
+	chip_id = (enum chips)(uintptr_t)i2c_get_match_data(client);
 
 	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
 	if (ret < 0) {
-- 
2.39.2

