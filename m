Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013035.outbound.protection.outlook.com [52.101.83.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFDA388393;
	Wed, 29 Apr 2026 06:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445117; cv=fail; b=IBuB4rPehBnT/bM/c8vwghKPRqFcmZFjRszLulZUejD7qY2AWMj+9vOws6xhiW4BVgumeCTixnv1cNBQZcRz269lp0COO3yRTUHYPpO/tEDAW8YDdmNPY1EQ8Y4NAsC1NfethQzL+bgrH7bJkyB9ykO14LmpbjWOj2+o23oDmcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445117; c=relaxed/simple;
	bh=SVPOiej+npMqqQWBI4m88zIJhRVZY4Lqrjwwy1SXR2k=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ae+mAY9FiJTNSD9qymOtFrd/m+I/wmfiOgx7eFny7aDFdKhdR78ATviEcdk1RZdipRexi5EV21MtllSmpMG6I2wQyLDBlB8/NUGXdW/utoc31CPlu3sjWiwpGA6PlegI4JIAdSGgqaNRcHic14DR+pqSCCLCx+x6tS9qkCLYSKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DHXNO8H0; arc=fail smtp.client-ip=52.101.83.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DHXNO8H0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KysPFqOHt/DrN75u6TnLqWKivgcGyUlu2SpSwhgs7es7dsjUCWc6YM6eQElfTOOERrvIstrD0lmg5909FyTUEVjS2AAKbBorx+P7mrMe1BgVUqZ+yBoqco9jmQ7vptUxiDHXY6abU2UOnLgcHDw9WsmNI0XH4fdN8a8u5Zciqn5kSlLQkN55c6brJrb+n+WlFMTMNPtD1t/T2fLf/7n0oqNJwE1dVex7g7JJ85Nfl8gPhPzW74dc7Br1W5zDrg9B1jmGAay7yI4mkrXag1XpTZr/P9J0P33pcz9Io9wtCo9EDUk+qtL38onCFlTSTUVt3pxGSGlQghzq2b0SYi77lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4UaTDNCiGjIdjRe/TGNSsjBnu97uq+tXIz1zfPYym4=;
 b=oezqemvn396h+q/CFxENtPfHNszL07+HVRWHeqRd38sVEoCasazTH3MS3MS4Ztjp8pg9d8z94oJF08nSb0n/Ypfee7Pkn83JVWBXhua64cTagZGMFXa+Mshvx67+AGIQAC9dmIYGUNjzM2O6tz0uefN7eCRW/fMHsO88jzkRxu7gjZnY5T6Zpq8WbTHKcQhTKrpG5mKhRxBohsQ2yQD4pDRsxekEIR0IBa87iC4OuIQqfbKzbid0mc8bAdixMoaxRq6yxnKg21FyBUONIZxNOMQmCn/BhCVJH9nzAlAn4RwRpasq27wxn3irhyspp5y9Oq4Ee2JrPpr5IdtKAxpTQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4UaTDNCiGjIdjRe/TGNSsjBnu97uq+tXIz1zfPYym4=;
 b=DHXNO8H0eHCs46JHAR29gQZGVu2LmLAc2PfYq2sYwKAIrI//UgoTmuMQEDyJ7lXR8j0ftew9yVlQovbr77BCdXgb1C8CKeQYZsD1BHPt0/+p+Z6KzYsus56ci8wcCg55MuONmOoXbI9YV1nGTluE7D7lzq7jRbRrilyVemJPN0KKqHPLwCFSHC5/CUwynF+chkQMuA0Y+0owUov8z2ialg240MmIGpjIVPX4KJcxtEgK9daaA7eBPSkyrVm1Uhn8zaCVlo3fJSTvh0w1GuChFgYOQUmbLwuzWSNBJD7RtWNf/kKT9RRsl5Db1ydx+aIc/caOqnuirYHsDhkZrKGF6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by AM9PR04MB8652.eurprd04.prod.outlook.com (2603:10a6:20b:43f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 06:45:11 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::93f5:4ff3:2f4c:183a%5]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 06:45:11 +0000
From: florin.leotescu@oss.nxp.com
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	festevam@gmail.com,
	Florin Leotescu <florin.leotescu@nxp.com>
Subject: [PATCH v7 0/3] Support configurable fan PWM at shutdown
Date: Wed, 29 Apr 2026 09:59:52 +0300
Message-Id: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::12) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|AM9PR04MB8652:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9e7867-27c2-4640-3e32-08dea5badbfe
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jOd7FDSKafrZ3O4Q/PFcp1GKcnw4tEMZDRbZd2ZxaQkS9wDwK58X9O47oNp2ZlNTHAzBuTv3nFw7LxJR9k/02erO5XcMwT7mHI6yscyh55L05XoToNqfawfgLpwZohbrRiQmXznST1zPl+slUYXEPcMozbMv0pwx3eX/c5xx7tYsM9gTdmv0/KR2+3jcuoNsgbNOVTjCKlABZn6+RKTHrpvbNviNHWinED5ZApQN11ACL10p2fJzt3WplQsqDCo6l8ppx+C1/mjESZjymvBo+vqA6Al0vg1JoMtIiwZ7G5yZzmBxQDoUXyNoC4wYAkWmp8p0AmHaw1Z1eHtEkQ7+oWnFIkmJrTHlTonIwxM7mw0fWLbfOf+8L3YKpSY4oSMUTUNqE+U59vRP4VTB2u20Q5bx/K1nAd6b+5KwZCpLGH12RJwKaWQwjRsRh1alb6tYi65qvJS9BFKE7c6my1OaKFstngCeawxf98G1VOO4JlKUnbXLrkF99PrA+0BVM3eD3T9a6+QEEL4gY8vivcFQHM7epbmz+un1RDOM++cgdEWJFyA2G2+OSSCqM8oW6EBgLQ5p1scExcyfgUPDUDFzlgL2djh6qrYL3V9oFi+1wcENUdsebiz5LjVh6KoCB8KjXXxZMit7RYqJ2STpNA4rVpwnQ14I7EMSaOFSJC/6PGPSt15Vy6rbBmVV1O7abo4EEmjleQfcoVn2kwES2YBt+XOJevPkrbRVrCrqvkkZVgg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?es28GGulhnCZ4akqdQMsZEjrj7lFjMuYC+2mbLOhY1He+apRlCZGVd69wz?=
 =?iso-8859-1?Q?mL0Galm4OLVtgFc+fn6n6LNeYoWYIxzBgK4k83YBHzYrN7uOWne7Sv0Vv7?=
 =?iso-8859-1?Q?YAjX+EA3C3TmYQ0Vfc/iQHlZ8s5MkwMuRiN0v1kEWEDC5hW8F0D5XanPYc?=
 =?iso-8859-1?Q?192D1nRewJ3KgqTScs781Og5a4TqJOm1qWnCeUEb2voEbFqyfD5OO9dNxE?=
 =?iso-8859-1?Q?A/91mv7VgHA9DI306hg43kEJ3hy+vzKNbXB4rBXw83lVb4gHDd/Y7QapER?=
 =?iso-8859-1?Q?bbOWZi+Ws75p/6IDAu7cL4C//ZvK/T5+Wh4oBNm2aPGh7TCLOIQWclXAoK?=
 =?iso-8859-1?Q?tMCJUhHE44rUiGaNhSZ1Ppq3VYqfDnU8elRyXBir5U/rYcRWpWtDQ6bHHd?=
 =?iso-8859-1?Q?Za+g/2tn52l4GPtBF7YQswbcmkp1HaWyV0y/buJ6OtvubZY0AXteEYemac?=
 =?iso-8859-1?Q?bpenMgpJLwOA/Cde16Y0HeD7MFtchgQAtx3/79Q9sYXjy6krQ/5qxLJB5t?=
 =?iso-8859-1?Q?YAm/M0fRK8Z5mo5Q+ou9Zsjx7cJB6eBIeSr4do9affq/Msl97pBrqxSCEC?=
 =?iso-8859-1?Q?wjLZm7X+2sFHm8U4E/rQsdTSdZyuWJRZsrKfGkdPztHdHbeWELi7CU3PeG?=
 =?iso-8859-1?Q?AfzfgW0Mz3/0d3id+TsD9WMlpxkhUDb/GXVv9mnW7FfYdG/OmalGUsCfH6?=
 =?iso-8859-1?Q?me4xGlR3anJ4cBukGBpupyQPt/lgk1wZx06PkXEzJllcP2+pTSCRII/thk?=
 =?iso-8859-1?Q?xLhFCepU490fuu/BGL1hJUY5Dx0W9sZM/wWnQHPCJYIc73JvVxk91BNmtu?=
 =?iso-8859-1?Q?2ftqsdu93fH0FSjm6pldMIrbzIz0pVUs86HmAEFkgaoTMx6q02UF/CunuG?=
 =?iso-8859-1?Q?wvUF13X0cgjZBFN/oISV0W/IVkWU0mha7NKo+2IqMPNtfzSrGdTUx4bd/K?=
 =?iso-8859-1?Q?mT/e+9BVogs1OnZLI9b8lWSI4HHo49B8Ixxkorqtl0G+1GvvUYdhHnt8DH?=
 =?iso-8859-1?Q?tE7KacGsmpGG7v/DwjwF1B1KI25gIqnSSBTZ5EMHsLlUt+/PM3cdaR3oKz?=
 =?iso-8859-1?Q?YyFweGlAKRZmU3e2YGkVMEtBSxb6U30vousNy8aCKKjkuaE5961XU7y6u+?=
 =?iso-8859-1?Q?BtZ5I9H7Q/Zq9fqXJbgy8LJJ8WyHwOK85w2qOEte2nORo8Lm2Q3NmGJDiH?=
 =?iso-8859-1?Q?rbqCBzQdOcD9+b1my3JFi4gOIxQ9HQ6FpKunHd83wOOvd9vfi/UpONnPmX?=
 =?iso-8859-1?Q?IvdSEytJd9wvXzZttoWIAdOZpruHUGc8eD5QLrk+KGbRwh0t80k61rufEL?=
 =?iso-8859-1?Q?fM3JqbS987ULe7kKULOJWDOd5TxjJ8FOGvge3oBDd1OpEZOvLQBZrmcsgJ?=
 =?iso-8859-1?Q?26b56xEGhZ1iYI9PsTTQTKOHjLQgT4z6Lfd8nk3kobI09zf4XsfT2lzZJd?=
 =?iso-8859-1?Q?G2ONA2PCsyHTnCB7BFuBN9Rk7F4QodaQITqzfVNbgPLuCM2InQuRXhBNvY?=
 =?iso-8859-1?Q?Lnx7pLPvUI4OtQRHvJutDjHcMSEd6s6eqINjnAp6RuJf8en8XfK4lo9OQz?=
 =?iso-8859-1?Q?GnRbUNJVbJM0wCAQaVzKU/K9eSAzNorz0IbNifrhEJ0C7z1cDBEDePWaW1?=
 =?iso-8859-1?Q?/1x8aDjeXqGZKdytdK6k1ZM9gZCFyJmazzBXYNs92s655kEdXcRCgNXhPH?=
 =?iso-8859-1?Q?WxGF9sfxsJBXYENZ2PLbzkLFCaC0B3oEP5q+tCfRRfJdEH1NJW6nR6YS8l?=
 =?iso-8859-1?Q?7Xcghp+mTCGKWalFh9rlIHbVOpbh84Od0V6FvAW2nJJIqnzu0hlstmR3kf?=
 =?iso-8859-1?Q?IYESbNPoPQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9e7867-27c2-4640-3e32-08dea5badbfe
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:45:11.0637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SlEzdubzm5ZLpUvB6EDTkpLzddOmyjEO8ABC2VEXqRxe6NR/9kcMkFdVSuQNTJQa7lFjQNoSJmanHj1SpkTrMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8652

From: Florin Leotescu <florin.leotescu@nxp.com>

Hi,

This series adds support for configuring the fan shutdown PWM value
via Device Tree and improves the robustness of the emc2305 driver.

Some platforms require fans to transition to a predefined safe state
during shutdown or reboot handoff until firmware or the next boot stage
reconfigures the controller.

The new optional Device Tree property "fan-shutdown-percent" allows the
shutdown PWM duty cycle to be configured per fan output.

Thanks for the review and apologies for the delay.

Changes in v7:
- Use the DT "reg" property when registering thermal cooling devices
  instead of a sequential child index
- Validate the "reg" value against the number of available PWM channels
  in both DT parsing and probe paths
- Address feedback from Guenter Roeck regarding channel index handling

Changes in v6:
- Split fan channel index validation into a separate patch.
  Validate fan channel index agains the number of available channels.
- Refine dt-binding commit message to refer to PWM duty cycle
  instead of fan speed.
Changes in v5:
- Add fan channel index bound check after reg property read 
  to prevent out-of-bounds access.
- Refine fan-shutdown-percent description.
Changes in v4:
- Initialize pwm_shudown array to EMC2305_PWM_SHUTDOWN_UNSET in probe,
  to avoid treating unconfigured channels as valid and written 0
  during shutdown
Changes in v3:
- Rebased on current upstream
- Dropped already upstreamed of_node_put(child) fix
Changes in v2:
- Address feedback from Guenter Roeck
- Make shutdown behavior configurable via Device Tree
- Add optional fan-shutdown-percent property
- Apply shutdown PWM only for channels defining the property

Florin Leotescu (3):
  hwmon: emc2305: Fix fan channel index handling
  dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
  hwmon: emc2305: Support configurable fan PWM at shutdown

 .../bindings/hwmon/microchip,emc2305.yaml     |  8 +++
 drivers/hwmon/emc2305.c                       | 54 +++++++++++++++++--
 2 files changed, 59 insertions(+), 3 deletions(-)

-- 
2.34.1

