Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012047.outbound.protection.outlook.com [52.101.53.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285C54E9C2F;
	Fri, 18 Sep 2026 10:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727060; cv=fail; b=DfTe4/ESOL6CenrtZs3+e/P7QgGi+Iktr8yW2se05dDz1xK7Lg4orDEFQkVY87FJKX+FdtvRmer2t5VTiyHXa2IAEU0RLY9KZAEdQ2JG7yZTJoRc1/TvRTUHA+GHIbusMLo5HsaXJnIqogjnf2AvDJRR7GNb1yUHdUYLpTo1mXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727060; c=relaxed/simple;
	bh=jITS3HQ2vQlboo3RrU2q+hByC6bxShzSWAX7zXTAWv4=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=jYKFgYCnql/3R3HppyOcmLeX3EzMgjvkL5k4FdMFpc9YRFtqEpgkebri8OzGAt9V7dRyz5tlCFeq6zGBxsSmKF4CdaqLLdU00AzzPYp0Uz3fAa0EGmyiMv3yl01TjYxwshZlfsKhlHjfJOlAHAoo4EybjfcC0DThEhxklLk1Ncs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com; dkim=pass (2048-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b=JA8eYn9K; arc=fail smtp.client-ip=52.101.53.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amdcloud.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="JA8eYn9K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjsTEDIYVy00VR/mPv7hnvra+S8wy7+llZWIFSkv55kzXARB1beUUaJwqjlNEpw+xFL7PKNVIZPpWUwoh/Muee0ihTOhTP+QBF/YCWOdh1Wcb9V02ee/qm5iV26tpVs4hFh761IgwNSCrQfZ9vx/VFh65Vvn3DYmvKrsAW9p7q2RdsimVA3AR4ROzs91+UnGL0/0luJofsP/v+uJvbiswoIoKygH0r+/vNFjfL9p+rkKkcbUvSWjwVYYn7LjGU84QyUU9ncyaWqh57r4kLatvSHfcdel5429u8oaESMBLmB0wEPPydVX3lwZ7gYJYeDPg4kmEe8EG7Z8u9GrAUjAJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmGeiOMseyKlAVvJo1QTrPzcQamdB+ryrTItSa7OyYg=;
 b=VSNAPWfJXGH1Pr53IQil2NpLvx5rtx3t/HP7RT1aW9kohZsHtNCUhFKYyQQuW3H2U64a/gM53nCM3GqEwTnoRcu2bVmNRYHJirdEwqTUOQxY/tbHzHh2Fky0MEXOAQY2xQa8+tSYf80l+CXZT1j7bptUxJZSakCASvK5FQCf64TlFMUJMA7SgM2lDBMOdK2XfFkhuqx9VNaD3uiR7IQ8KFJmtDmyQXwYf3AEhZ02a9+67OS8vqKcClWtYXOgPk//zPmBOOs4+SFrFri5ynAK7tdi2i/P7ETCPRTwpE9JHTwwfjcFfj1t79v6kKo4F2gbs5X+fMUJS/yLyQO0oHapyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmGeiOMseyKlAVvJo1QTrPzcQamdB+ryrTItSa7OyYg=;
 b=JA8eYn9K8BGBcN/zVEEUiKKNAUMHJ46tbX59QkJQ9SIrIENOUgYoemav7E/NFWpf8SgDmAj8L0oVXShAm/rDS8MIIiJ1A3y9oK0qYCZFt7Th0Q5XzCLhdTcwfEcFOou49//dRaBTTRlh9jlgqjCdd1f56SEtH0cQjtszL9yyGDpq/eYOQQuid1DzeRCRUqR18ConZI0ikOFtry6SEb78wLL/86xtkMAyZ90SkywyERtE9X7UtkfCLiIilUVKITMkOpFgq4SuaF1yszrN2fdqaim4S/oFXZE9jP1xd2OLsw3gLunzfHxbPz7lf2LKFMuz0/DoabDfQ2pDh+DO1wuJGg==
Received: from SN7PR04CA0201.namprd04.prod.outlook.com (2603:10b6:806:126::26)
 by PH6PR12MB354726.namprd12.prod.outlook.com (2603:10b6:510:3f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 10:24:15 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:126:cafe::66) by SN7PR04CA0201.outlook.office365.com
 (2603:10b6:806:126::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 10:24:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 10:24:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 05:24:14 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 18 Sep
 2026 05:24:14 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 18 Sep 2026 05:24:12 -0500
From: Colin Huang <u8813345@gmail.com>
Subject: [PATCH v6 0/2] Add driver for Infineon TDA38740/TDA38725
Date: Fri, 18 Sep 2026 18:23:53 +0800
Message-ID: <20260918-add-tda38740-and-tda38725-v6-0-a8b11018d850@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADkRrWoC/43PzYrCQAzA8VeROTtL5rvdk+8he8g0qQ5ou7RSF
 Om7bxSE4kLx+A/kF3JXIw+FR/W9uauBpzKWvpOI241qjtgdWBeSVhZshBqcRiJ9IXRV8qCxe4U
 N2tmcM9SJvGEl+78Dt+X6tPc/0scyXvrh9jw1mcf0paYVdTIaNFvKJtsQYza7wxnL6avpz+qhT
 vZjyYpkCIKh6BDhn+QWkoE1yYnkuErRJZlRfJf8x5IXiTJyajE3DPW7FJbS6ndBpNQ2po6xQkK
 /lOZ5/gORKtxV6gEAAA==
X-Change-ID: 20260903-add-tda38740-and-tda38725-32bbb097d41e
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <colin.huang2@amd.com>,
	<linux-doc@vger.kernel.org>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789727051; l=2918;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=jITS3HQ2vQlboo3RrU2q+hByC6bxShzSWAX7zXTAWv4=;
 b=1814tlyedECYEePooZBsAU6Q9AopSVrb4h/ANPR4pLRqRWb3m/dIXxIW6MIECFSgfsiFR8QKZ
 j8QUzicWuhYBEYDeix8SM+qOTRyIhSoEmLL/WeC0YU3lM+PjhV0/Vv1
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|PH6PR12MB354726:EE_
X-MS-Office365-Filtering-Correlation-Id: c6090cf7-d946-4f53-3ad8-08df156efd92
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|35950700016|48200799018|61400799027|7093399015|10067099003|11063799006|3023799007|18002099003|56012099006|16102099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	Jv9rI5FkoGecNwV52HZXEiDma6qqITI24qShWSPyhEjMqXEJTtbCPlkE7ubcaourjObXHkoF3RYdPG1AOVeBl9ZD6K4w+sEvIdhiSNoqaYeDX7DdJb4RGxr9yhzaiFQ5SlbT/ipOABKAPDl4n6kDBfJnQEWH+3gmXn3rIeHCbGMqwzsQTGEHF4Bpu57TIQ93XKrsrwT4PFbBjgKMUT4WsVx5Y+WuqFGLd6EVQqrOr+emQBXmUXizDtGpAVHNNcAkU0Kg/lzWb096dZ/UyYMVus5h7pU+L1ppjyBBGFv4c9bPyzyjBYApohf04NLjjXk3YJmPKhaYYu5XHrTXRWe69j4hJjGmIhqfUHWW+OLxx6cntPU1Dgiw9q4aSzhH82CrBbXhHiG9dND1ae08QwKSMGbS1oSO01h3NhLCaf8pml33ctUvFyKt2cTKapYM1jLuBxiGWNwM5VcPV//bmUDgmlMgQ1C60LI8BimluHIVjnUGHxtqqU+iBwT+TzOPbKqBriKjrPD9Ak2tfPSn2Qs9kXRmARYgr13hlLvgK2Z7f95O2EqMVqiNvyB1ntWI76UEvYzVDhAdInlKUACj/HbD0z2DljDgtzhGzoFgTUYyEbpZldzAEEMiaxm9be3ax26lVV9X+qzt05A0K0NP3aRJkmDp7Ltb7/wtiJgVWxLAr02NxhZawdLxC5Enn12yHhcnGZ5yasXYw+T8cz1k/so9EA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(35950700016)(48200799018)(61400799027)(7093399015)(10067099003)(11063799006)(3023799007)(18002099003)(56012099006)(16102099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	q7jtqBNZKxAcIecMZ+/LvrOsj1rIGSjyvyJ0PELXNVeKHP5MJNEMzjsRUyu4yICgqzs8OyghyNioC7od7QDzylM0Y2L9K6nbvpAKDcoacvgp/Q5uvZtg/WSjR3mnCYLeCYtj5cstz1rj13UclnhmuuZff7FfIp1ouSWcz122AnXus/l4u4Xq9VTWNeP3gH4veKySqJzR9a9FFSSh3i97mlCjxA82Qr/Ie6LoZ2Avc3sbzDRe7bRx2MRPq7pL2xX7N/zNkAlKbFVAY2mEZzE7ZoFoQQdcEd02/1Wr88712zQz1R4WqajgJxSSyV3P98pk59N1e5QDmwHwtAelp9FPrPX2RnrX9HmIgSpJCDfdo5LFgwQNHWfhi4cm2DcX4EIb5SVryjkZ06FTHNUo7mVUCQ7RrTqenTgWBz3oEYdpOR7gWhKovGAVwUaWjcR/L14q
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 10:24:15.4085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6090cf7-d946-4f53-3ad8-08df156efd92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH6PR12MB354726

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Changes in v6:
- Drop of_match_ptr() to support ACPI PRP0001 matching with CONFIG_OF disabled.
- Remove the now-unnecessary __maybe_unused annotation from the OF match table.
- Link to v5: https://lore.kernel.org/r/20260917-add-tda38740-and-tda38725-v5-0-7fc19668ada4@gmail.com

Changes in v5:
- Remove blank line in yaml header.
- Add interrupts property in yaml file.
- Uses a fallback compatible: infineon,tda38725 can be listed as a fallback for infineon,tda38740.
- Removed the driver-local identify callback and its duplicate VOUT_MODE check.
  and set format[PSC_VOLTAGE_OUT] = linear in the static driver info.
- Dropped the per-device tda38740_data allocation/copy path, since there is no longer any runtime mutation of driver info.
  Probe now passes the static tda38740_info directly to pmbus_do_probe().
- Link to v4: https://lore.kernel.org/r/20260910-add-tda38740-and-tda38725-v4-0-dbae7fabce09@gmail.com

Changes in v4:
- Fix the DT binding so that compatible only enumerates the valid
  hardware variants and does not imply a preferred or fallback
  selection policy.
- Remove the vout-scale-micro property and related code.
- Rename the example node to reflect the regulator function.
- Link to v3: https://lore.kernel.org/r/20260910-add-tda38740-and-tda38725-v3-0-3e87637da3d6@gmail.com

Changes in v3:
- Clarify that TDA38725 and TDA38740 share the same PMBus programming
  model, with infineon,tda38740 as the preferred compatible string and
  infineon,tda38725 as a compatibility alias.
- The optional VOUT scaling property with a documented default
  value of 1.0 to support devices that require output-voltage scaling.
- Update the driver to apply the scaling for READ_VOUT.
- Link to v2: https://lore.kernel.org/r/20260907-add-tda38740-and-tda38725-v2-0-1d051d63aa01@gmail.com

Changes in v2:
- Use standard http:// URIs for $id and $schema
- Add maintainers section.
- Use C99 named initializers.
- Link to v1: https://lore.kernel.org/r/20260907-add-tda38740-and-tda38725-v1-0-e2db1b2566b1@gmail.com

---
Colin Huang (2):
      dt-bindings: hwmon: pmbus: Add Infineon tda38740 and tda38725
      hwmon: (pmbus/tda38740) Add driver for Infineon TDA38740/TDA38725

 .../bindings/hwmon/pmbus/infineon,tda38740.yaml    | 55 ++++++++++++++++++
 Documentation/hwmon/index.rst                      |  1 +
 Documentation/hwmon/tda38740.rst                   | 65 ++++++++++++++++++++++
 drivers/hwmon/pmbus/Kconfig                        |  9 +++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/tda38740.c                     | 64 +++++++++++++++++++++
 6 files changed, 195 insertions(+)
---
base-commit: ba08432bda66a7889d8f3d1581dabf10f59b25eb
change-id: 20260903-add-tda38740-and-tda38725-32bbb097d41e

Best regards,
-- 
Colin Huang <u8813345@gmail.com>

